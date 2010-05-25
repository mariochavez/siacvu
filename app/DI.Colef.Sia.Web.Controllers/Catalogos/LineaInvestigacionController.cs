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
    public class LineaInvestigacionController : BaseController<LineaInvestigacion, LineaInvestigacionForm>
    {
        readonly ILineaInvestigacionMapper lineaInvestigacionMapper;

        public LineaInvestigacionController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                            ILineaInvestigacionMapper lineaInvestigacionMapper,
                                            ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.lineaInvestigacionMapper = lineaInvestigacionMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<LineaInvestigacionForm>();

            var lineaInvestigacions = catalogoService.GetAllLineaInvestigaciones();
            data.List = lineaInvestigacionMapper.Map(lineaInvestigacions);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = new GenericViewData<LineaInvestigacionForm> {Form = new LineaInvestigacionForm()};

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<LineaInvestigacionForm>();

            var lineaInvestigacion = catalogoService.GetLineaInvestigacionById(id);
            data.Form = lineaInvestigacionMapper.Map(lineaInvestigacion);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(LineaInvestigacionForm form)
        {
            var lineaInvestigacion = lineaInvestigacionMapper.Map(form);

            lineaInvestigacion.CreadoPor = CurrentUser();
            lineaInvestigacion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(lineaInvestigacion, form, Title.New))
                return ViewNew();

            catalogoService.SaveLineaInvestigacion(lineaInvestigacion);

            return RedirectToIndex(String.Format("Línea de Investigación {0} ha sido creada", lineaInvestigacion.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(LineaInvestigacionForm form)
        {
            var lineaInvestigacion = lineaInvestigacionMapper.Map(form);

            lineaInvestigacion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(lineaInvestigacion, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveLineaInvestigacion(lineaInvestigacion);

            return RedirectToIndex(String.Format("Línea de Investigación {0} ha sido modificada", lineaInvestigacion.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var lineaInvestigacion = catalogoService.GetLineaInvestigacionById(id);
            lineaInvestigacion.Activo = true;
            lineaInvestigacion.ModificadoPor = CurrentUser();
            catalogoService.SaveLineaInvestigacion(lineaInvestigacion);

            var form = lineaInvestigacionMapper.Map(lineaInvestigacion);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var lineaInvestigacion = catalogoService.GetLineaInvestigacionById(id);
            lineaInvestigacion.Activo = false;
            lineaInvestigacion.ModificadoPor = CurrentUser();
            catalogoService.SaveLineaInvestigacion(lineaInvestigacion);

            var form = lineaInvestigacionMapper.Map(lineaInvestigacion);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<LineaInvestigacion>(x => x.Nombre, q);
            return Content(data);
        }
    }
}