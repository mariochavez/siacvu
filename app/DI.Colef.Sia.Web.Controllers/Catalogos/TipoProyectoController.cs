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
    public class TipoProyectoController : BaseController<TipoProyecto, TipoProyectoForm>
    {
        readonly ITipoProyectoMapper tipoProyectoMapper;

        public TipoProyectoController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                      ITipoProyectoMapper tipoProyectoMapper, ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.tipoProyectoMapper = tipoProyectoMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<TipoProyectoForm>();

            var tipoProyectos = catalogoService.GetAllTipoProyectos();
            data.List = tipoProyectoMapper.Map(tipoProyectos);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = new GenericViewData<TipoProyectoForm> {Form = new TipoProyectoForm()};

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<TipoProyectoForm>();

            var tipoProyecto = catalogoService.GetTipoProyectoById(id);
            data.Form = tipoProyectoMapper.Map(tipoProyecto);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoProyectoForm form)
        {
            var tipoProyecto = tipoProyectoMapper.Map(form);

            tipoProyecto.CreadoPor = CurrentUser();
            tipoProyecto.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoProyecto, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoProyecto(tipoProyecto);

            return RedirectToIndex(String.Format("Tipo de Proyecto {0} ha sido registrado", tipoProyecto.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoProyectoForm form)
        {
            var tipoProyecto = tipoProyectoMapper.Map(form);

            tipoProyecto.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoProyecto, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoProyecto(tipoProyecto);

            return RedirectToIndex(String.Format("Tipo de Proyecto {0} ha sido modificado", tipoProyecto.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoProyecto = catalogoService.GetTipoProyectoById(id);
            tipoProyecto.Activo = true;
            tipoProyecto.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoProyecto(tipoProyecto);

            var form = tipoProyectoMapper.Map(tipoProyecto);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoProyecto = catalogoService.GetTipoProyectoById(id);
            tipoProyecto.Activo = false;
            tipoProyecto.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoProyecto(tipoProyecto);

            var form = tipoProyectoMapper.Map(tipoProyecto);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<TipoProyecto>(x => x.Nombre, q);
            return Content(data);
        }
    }
}