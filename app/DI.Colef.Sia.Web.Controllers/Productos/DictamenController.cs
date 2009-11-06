using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos
{
    [HandleError]
    public class DictamenController : BaseController<Dictamen, DictamenForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IDictamenMapper dictamenMapper;
        readonly IDictamenService dictamenService;
        readonly ITipoDictamenMapper tipoDictamenMapper;
        readonly IFondoConacytMapper fondoConacytMapper;
        readonly IEditorialMapper editorialMapper;
        readonly IRevistaPublicacionMapper revistaPublicacionMapper;

        public DictamenController(IDictamenService dictamenService,
                                  IDictamenMapper dictamenMapper,
                                  ICatalogoService catalogoService,
                                  IUsuarioService usuarioService,
                                  ITipoDictamenMapper tipoDictamenMapper,
                                  IFondoConacytMapper fondoConacytMapper,
                                  IRevistaPublicacionMapper revistaPublicacionMapper,
                                  IEditorialMapper editorialMapper,
                                  ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.dictamenService = dictamenService;
            this.dictamenMapper = dictamenMapper;
            this.fondoConacytMapper = fondoConacytMapper;
            this.revistaPublicacionMapper = revistaPublicacionMapper;
            this.editorialMapper = editorialMapper;
            this.tipoDictamenMapper = tipoDictamenMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var dictamens = new Dictamen[] { };

            if (User.IsInRole("Investigadores"))
                dictamens = dictamenService.GetAllDictamenes(CurrentUser());
            if (User.IsInRole("DGAA"))
                dictamens = dictamenService.GetAllDictamenes();

            data.List = dictamenMapper.Map(dictamens);

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            if (CurrentInvestigador() == null)
                return NoInvestigadorProfile("Por tal motivo no puede crear nuevos productos.");

            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
            
            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var dictamen = dictamenService.GetDictamenById(id);

            if (dictamen == null)
                return RedirectToIndex("no ha sido encontrado", true);

            if (dictamen.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var dictamenForm = dictamenMapper.Map(dictamen);

            data.Form = SetupNewForm(dictamenForm);
            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var dictamen = dictamenService.GetDictamenById(id);
            data.Form = dictamenMapper.Map(dictamen);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(DictamenForm form)
        {
            var dictamen = dictamenMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(dictamen, form, Title.New, "Dictamen"))
            {
                var dictamenForm = dictamenMapper.Map(dictamen);

                ((GenericViewData<DictamenForm>)ViewData.Model).Form = SetupNewForm(dictamenForm);
                return ViewNew();
            }

            dictamenService.SaveDictamen(dictamen);

            return RedirectToIndex(String.Format("Dictamen {0} ha sido creado", dictamen.TipoDictamen.Nombre));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
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

            return RedirectToIndex(String.Format("Dictamen {0} ha sido modificado", dictamen.TipoDictamen.Nombre));
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Dictamen>(x => x.TipoDictamen, q);
            return Content(data);
        }

        DictamenForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        DictamenForm SetupNewForm(DictamenForm form)
        {
            form = form ?? new DictamenForm();

            form.TiposDictamenes = tipoDictamenMapper.Map(catalogoService.GetActiveTipoDictamenes());
            form.FondosConacyt = fondoConacytMapper.Map(catalogoService.GetActiveFondoConacyts());
            form.Editoriales = editorialMapper.Map(catalogoService.GetActiveEditorials());
            
            return form;
        }

        void FormSetCombos(DictamenForm form)
        {
            ViewData["TipoDictamen"] = form.TipoDictamenId;
            ViewData["FondoConacyt"] = form.FondoConacytId;
            ViewData["Editorial"] = form.EditorialId;
        }
    }
}