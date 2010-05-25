using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    public class DependenciaController : BaseController<Dependencia, DependenciaForm>
    {
        //readonly ICatalogoService catalogoService;
        readonly IDependenciaMapper dependenciaMapper;

        public DependenciaController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                     IDependenciaMapper dependenciaMapper, ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.dependenciaMapper = dependenciaMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<DependenciaForm>();

            var dependencias = catalogoService.GetAllDependencias();
            data.List = dependenciaMapper.Map(dependencias);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = new GenericViewData<DependenciaForm> {Form = new DependenciaForm()};

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<DependenciaForm>();

            var dependencia = catalogoService.GetDependenciaById(id);
            data.Form = dependenciaMapper.Map(dependencia);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(DependenciaForm form)
        {
            var dependencia = dependenciaMapper.Map(form);

            dependencia.CreadoPor = CurrentUser();
            dependencia.ModificadoPor = CurrentUser();

            if (!IsValidateModel(dependencia, form, Title.New))
                return ViewNew();

            catalogoService.SaveDependencia(dependencia);

            return RedirectToIndex(String.Format("Dependencia {0} ha sido creada", dependencia.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(DependenciaForm form)
        {
            var dependencia = dependenciaMapper.Map(form);

            dependencia.ModificadoPor = CurrentUser();

            if (!IsValidateModel(dependencia, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveDependencia(dependencia);

            return RedirectToIndex(String.Format("Dependencia {0} ha sido modificada", dependencia.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var dependencia = catalogoService.GetDependenciaById(id);
            dependencia.Activo = true;
            dependencia.ModificadoPor = CurrentUser();
            catalogoService.SaveDependencia(dependencia);

            var form = dependenciaMapper.Map(dependencia);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var dependencia = catalogoService.GetDependenciaById(id);
            dependencia.Activo = false;
            dependencia.ModificadoPor = CurrentUser();
            catalogoService.SaveDependencia(dependencia);

            var form = dependenciaMapper.Map(dependencia);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Dependencia>(x => x.Nombre, q);
            return Content(data);
        }
    }
}