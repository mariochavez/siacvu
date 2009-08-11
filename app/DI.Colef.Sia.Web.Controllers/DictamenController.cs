using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class DictamenController : BaseController<Dictamen, DictamenForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IDictamenMapper dictamenMapper;
        readonly IDictamenService dictamenService;
        readonly IInstitucionMapper institucionMapper;
        readonly IPeriodoReferenciaMapper periodoReferenciaMapper;
        readonly ITipoDictamenMapper tipoDictamenMapper;
        readonly ITipoParticipacionMapper tipoParticipacionMapper;

        public DictamenController(IDictamenService dictamenService,
                                  IDictamenMapper dictamenMapper,
                                  ICatalogoService catalogoService,
                                  IUsuarioService usuarioService,
                                  ITipoDictamenMapper tipoDictamenMapper,
                                  ITipoParticipacionMapper tipoParticipacionMapper,
                                  IInstitucionMapper institucionMapper,
                                  IPeriodoReferenciaMapper periodoReferenciaMapper, ISearchService searchService)
            : base(usuarioService, searchService)
        {
            this.catalogoService = catalogoService;
            this.dictamenService = dictamenService;
            this.dictamenMapper = dictamenMapper;
            this.tipoDictamenMapper = tipoDictamenMapper;
            this.tipoParticipacionMapper = tipoParticipacionMapper;
            this.institucionMapper = institucionMapper;
            this.periodoReferenciaMapper = periodoReferenciaMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var dictamens = dictamenService.GetAllDictamens();
            data.List = dictamenMapper.Map(dictamens);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var dictamen = dictamenService.GetDictamenById(id);

            if (dictamen == null)
                return RedirectToIndex("no ha sido encontrado", true);

            if (dictamen.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var dictamenForm = dictamenMapper.Map(dictamen);

            data.Form = SetupNewForm(dictamenForm);
            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var dictamen = dictamenService.GetDictamenById(id);
            data.Form = dictamenMapper.Map(dictamen);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(DictamenForm form)
        {
            var dictamen = dictamenMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(dictamen, form, Title.New, "Dictamen"))
            {
                ((GenericViewData<DictamenForm>) ViewData.Model).Form = SetupNewForm();
                return ViewNew();
            }

            dictamenService.SaveDictamen(dictamen);

            return RedirectToIndex(String.Format("{0} ha sido creado", dictamen.Nombre));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(DictamenForm form)
        {
            var dictamen = dictamenMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(dictamen, form, Title.Edit))
            {
                var dictamenForm = dictamenMapper.Map(dictamen);

                ((GenericViewData<DictamenForm>) ViewData.Model).Form = SetupNewForm(dictamenForm);
                FormSetCombos(dictamenForm);
                return ViewEdit();
            }

            dictamenService.SaveDictamen(dictamen);

            return RedirectToIndex(String.Format("{0} ha sido modificado", dictamen.Nombre));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var dictamen = dictamenService.GetDictamenById(id);

            if (dictamen.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            dictamen.Activo = true;
            dictamen.ModificadoPor = CurrentUser();
            dictamenService.SaveDictamen(dictamen);

            var form = dictamenMapper.Map(dictamen);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var dictamen = dictamenService.GetDictamenById(id);

            if (dictamen.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            dictamen.Activo = false;
            dictamen.ModificadoPor = CurrentUser();
            dictamenService.SaveDictamen(dictamen);

            var form = dictamenMapper.Map(dictamen);

            return Rjs("Activate", form);
        }

        DictamenForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        DictamenForm SetupNewForm(DictamenForm form)
        {
            form = form ?? new DictamenForm();

            form.TiposDictamenes = tipoDictamenMapper.Map(catalogoService.GetActiveTipoDictamenes());
            form.TiposParticipaciones = tipoParticipacionMapper.Map(catalogoService.GetActiveTipoParticipaciones());
            form.Instituciones = institucionMapper.Map(catalogoService.GetActiveInstituciones());
            form.PeriodosReferencias = periodoReferenciaMapper.Map(catalogoService.GetActivePeriodoReferencias());

            return form;
        }

        void FormSetCombos(DictamenForm form)
        {
            ViewData["TipoParticipacion"] = form.TipoParticipacionId;
            ViewData["TipoDictamen"] = form.TipoDictamenId;
            ViewData["PeriodoReferencia"] = form.PeriodoReferenciaId;
            ViewData["Institucion"] = form.InstitucionId;
        }
    }
}