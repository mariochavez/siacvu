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
    public class DistincionController : BaseController<Distincion, DistincionForm>
    {
        readonly IAmbitoMapper ambitoMapper;
        readonly ICatalogoService catalogoService;
        readonly IDistincionMapper distincionMapper;
        readonly IDistincionService distincionService;
        readonly IEstadoPaisMapper estadoPaisMapper;
        readonly IInstitucionMapper institucionMapper;
        readonly IPaisMapper paisMapper;
        readonly ITipoDistincionMapper tipoDistincionMapper;


        public DistincionController(IDistincionService distincionService, IDistincionMapper distincionMapper,
                                    ICatalogoService catalogoService, IUsuarioService usuarioService,
                                    ITipoDistincionMapper tipoDistincionMapper, IInstitucionMapper institucionMapper,
                                    IAmbitoMapper ambitoMapper, IPaisMapper paisMapper,
                                    IEstadoPaisMapper estadoPaisMapper, ISearchService searchService)
            : base(usuarioService, searchService)
        {
            this.catalogoService = catalogoService;
            this.distincionService = distincionService;
            this.distincionMapper = distincionMapper;
            this.tipoDistincionMapper = tipoDistincionMapper;
            this.institucionMapper = institucionMapper;
            this.ambitoMapper = ambitoMapper;
            this.paisMapper = paisMapper;
            this.estadoPaisMapper = estadoPaisMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var distincions = distincionService.GetAllDistinciones();
            data.List = distincionMapper.Map(distincions);

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

            var distincion = distincionService.GetDistincionById(id);

            if (distincion == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (distincion.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var distincionForm = distincionMapper.Map(distincion);

            data.Form = SetupNewForm(distincionForm);
            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var distincion = distincionService.GetDistincionById(id);
            data.Form = distincionMapper.Map(distincion);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(DistincionForm form)
        {
            var distincion = distincionMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(distincion, form, Title.New, "Distincion"))
            {
                ((GenericViewData<DistincionForm>) ViewData.Model).Form = SetupNewForm();
                return ViewNew();
            }

            distincionService.SaveDistincion(distincion);

            return RedirectToIndex(String.Format("{0} ha sido creado", distincion.Descripcion));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(DistincionForm form)
        {
            var distincion = distincionMapper.Map(form, CurrentUser(), CurrentInvestigador());

            distincion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(distincion, form, Title.Edit))
            {
                var distincionForm = distincionMapper.Map(distincion);
                ((GenericViewData<DistincionForm>) ViewData.Model).Form = SetupNewForm(distincionForm);
                FormSetCombos(distincionForm);
                return ViewEdit();
            }

            distincionService.SaveDistincion(distincion);

            return RedirectToIndex(String.Format("{0} ha sido modificado", distincion.Descripcion));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var distincion = distincionService.GetDistincionById(id);

            if (distincion.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            distincion.Activo = true;
            distincion.ModificadoPor = CurrentUser();
            distincionService.SaveDistincion(distincion);

            var form = distincionMapper.Map(distincion);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var distincion = distincionService.GetDistincionById(id);

            if (distincion.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            distincion.Activo = false;
            distincion.ModificadoPor = CurrentUser();
            distincionService.SaveDistincion(distincion);

            var form = distincionMapper.Map(distincion);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Distincion>(x => x.Descripcion, q);
            return Content(data);
        }

        DistincionForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        DistincionForm SetupNewForm(DistincionForm form)
        {
            form = form ?? new DistincionForm();

            form.TiposDistinciones = tipoDistincionMapper.Map(catalogoService.GetActiveTipoDistinciones());
            form.Instituciones = institucionMapper.Map(catalogoService.GetActiveInstituciones());
            form.Ambitos = ambitoMapper.Map(catalogoService.GetActiveAmbitos());
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            form.EstadosPaises = estadoPaisMapper.Map(catalogoService.GetActiveEstadoPaises());

            return form;
        }

        void FormSetCombos(DistincionForm form)
        {
            ViewData["TipoDistincion"] = form.TipoDistincionId;
            ViewData["Institucion"] = form.InstitucionId;
            ViewData["Ambito"] = form.AmbitoId;
            ViewData["Pais"] = form.PaisId;
            ViewData["EstadoPais"] = form.EstadoPaisId;
        }
    }
}