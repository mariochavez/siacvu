using System;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos
{
    [HandleError]
    public class ReporteController : BaseController<Reporte, ReporteForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ICoautorExternoReporteMapper coautorExternoReporteMapper;
        readonly ICoautorInternoReporteMapper coautorInternoReporteMapper;
        readonly IEstadoProductoMapper estadoProductoMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly IInvestigadorMapper investigadorMapper;
        readonly IInvestigadorService investigadorService;
        readonly IPaisMapper paisMapper;
        readonly IProyectoMapper proyectoMapper;
        readonly IReporteMapper reporteMapper;
        readonly IReporteService reporteService;
        readonly ITipoReporteMapper tipoReporteMapper;
        readonly IProyectoService proyectoService;


        public ReporteController(IReporteService reporteService, IReporteMapper reporteMapper,
                                 ICatalogoService catalogoService,
                                 IUsuarioService usuarioService, ITipoReporteMapper tipoReporteMapper,
                                 IEstadoProductoMapper estadoProductoMapper,
                                 IProyectoMapper proyectoMapper,
                                 IInvestigadorExternoMapper investigadorExternoMapper,
                                 IInvestigadorMapper investigadorMapper,
                                 IPaisMapper paisMapper, IInvestigadorService investigadorService,
                                 ICoautorExternoReporteMapper coautorExternoReporteMapper,
                                 ICoautorInternoReporteMapper coautorInternoReporteMapper, ISearchService searchService,
                                 IProyectoService proyectoService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.reporteService = reporteService;
            this.reporteMapper = reporteMapper;
            this.tipoReporteMapper = tipoReporteMapper;
            this.estadoProductoMapper = estadoProductoMapper;
            this.proyectoMapper = proyectoMapper;
            this.investigadorExternoMapper = investigadorExternoMapper;
            this.investigadorMapper = investigadorMapper;
            this.paisMapper = paisMapper;
            this.investigadorService = investigadorService;
            this.coautorExternoReporteMapper = coautorExternoReporteMapper;
            this.coautorInternoReporteMapper = coautorInternoReporteMapper;
            this.proyectoService = proyectoService;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var reportes = new Reporte[] { };

            if (User.IsInRole("Investigadores"))
                reportes = reporteService.GetAllReportes(CurrentUser());
            if (User.IsInRole("DGAA"))
                reportes = reporteService.GetAllReportes();

            data.List = reporteMapper.Map(reportes);

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
            ViewData["Pais"] = (from p in data.Form.Paises where p.Nombre == "México" select p.Id).FirstOrDefault();
            data.Form.PeriodoReferenciaPeriodo = CurrentPeriodo().Periodo;

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var reporte = reporteService.GetReporteById(id);

            if (reporte == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (reporte.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var reporteForm = reporteMapper.Map(reporte);

            data.Form = SetupNewForm(reporteForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var reporte = reporteService.GetReporteById(id);
            data.Form = reporteMapper.Map(reporte);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ReporteForm form,
                                   FormCollection formCollection)
        {
            var coautoresExternos = new string[] { };
            var coautoresInternos = new string[] { };

            if (formCollection["CoautorExternoReporte.InvestigadorExternoId_New"] != null &&
                    formCollection["CoautorExternoReporte.InvestigadorExternoId_New"].Split(',').Length > 0)
                coautoresExternos = formCollection["CoautorExternoReporte.InvestigadorExternoId_New"].Split(',');

            if (formCollection["CoautorInternoReporte.InvestigadorId_New"] != null &&
                    formCollection["CoautorInternoReporte.InvestigadorId_New"].Split(',').Length > 0)
                coautoresInternos = formCollection["CoautorInternoReporte.InvestigadorId_New"].Split(',');

            var reporte = reporteMapper.Map(form, CurrentUser(), CurrentPeriodo(),
                                            coautoresExternos, coautoresInternos);

            if (!IsValidateModel(reporte, form, Title.New, "Reporte"))
            {
                var reporteForm = reporteMapper.Map(reporte);

                ((GenericViewData<ReporteForm>)ViewData.Model).Form = SetupNewForm(reporteForm);
                return ViewNew();
            }

            reporteService.SaveReporte(reporte);

            return RedirectToIndex(String.Format("Reporte {0} ha sido creado", reporte.Titulo));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ReporteForm form)
        {
            var reporte = reporteMapper.Map(form, CurrentUser(), CurrentPeriodo());

            if (!IsValidateModel(reporte, form, Title.Edit))
            {
                var reporteForm = reporteMapper.Map(reporte);

                ((GenericViewData<ReporteForm>) ViewData.Model).Form = SetupNewForm(reporteForm);
                FormSetCombos(reporteForm);
                return ViewEdit();
            }

            reporteService.SaveReporte(reporte);

            return RedirectToIndex(String.Format("Reporte {0} ha sido modificado", reporte.Titulo));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var reporte = reporteService.GetReporteById(id);

            if (reporte.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            reporte.Activo = true;
            reporte.ModificadoPor = CurrentUser();
            reporteService.SaveReporte(reporte);

            var form = reporteMapper.Map(reporte);

            return Rjs(form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var reporte = reporteService.GetReporteById(id);

            if (reporte.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            reporte.Activo = false;
            reporte.ModificadoPor = CurrentUser();
            reporteService.SaveReporte(reporte);

            var form = reporteMapper.Map(reporte);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Reporte>(x => x.Titulo, q);
            return Content(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorInterno(int id)
        {
            var reporte = reporteService.GetReporteById(id);
            var form = new ReporteForm();

            if (reporte != null)
                form.Id = reporte.Id;

            form.CoautorInternoReporte = new CoautorInternoReporteForm();
            form.CoautoresInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores(CurrentUser()));

            return Rjs("NewCoautorInterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorInterno([Bind(Prefix = "CoautorInternoReporte")] CoautorInternoReporteForm form,
                                              int reporteId)
        {
            var coautorInternoReporte = coautorInternoReporteMapper.Map(form);

            ModelState.AddModelErrors(coautorInternoReporte.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            coautorInternoReporte.CreadorPor = CurrentUser();
            coautorInternoReporte.ModificadoPor = CurrentUser();

            if (reporteId != 0)
            {
                var reporte = reporteService.GetReporteById(reporteId);
                reporte.AddCoautorInterno(coautorInternoReporte);
                reporteService.SaveReporte(reporte);
            }

            var coautorInternoReporteForm = coautorInternoReporteMapper.Map(coautorInternoReporte);

            return Rjs("AddCoautorInterno", coautorInternoReporteForm);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id)
        {
            var reporte = reporteService.GetReporteById(id);
            var form = new ReporteForm();

            if (reporte != null)
                form.Id = reporte.Id;

            form.CoautorExternoReporte = new CoautorExternoReporteForm();
            form.CoautoresExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());

            return Rjs("NewCoautorExterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorExterno([Bind(Prefix = "CoautorExternoReporte")] CoautorExternoReporteForm form,
                                              int reporteId)
        {
            var coautorExternoReporte = coautorExternoReporteMapper.Map(form);

            ModelState.AddModelErrors(coautorExternoReporte.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            coautorExternoReporte.CreadorPor = CurrentUser();
            coautorExternoReporte.ModificadoPor = CurrentUser();

            if (reporteId != 0)
            {
                var reporte = reporteService.GetReporteById(reporteId);
                reporte.AddCoautorExterno(coautorExternoReporte);
                reporteService.SaveReporte(reporte);
            }

            var coautorExternoReporteForm = coautorExternoReporteMapper.Map(coautorExternoReporte);

            return Rjs("AddCoautorExterno", coautorExternoReporteForm);
        }

        ReporteForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        ReporteForm SetupNewForm(ReporteForm form)
        {
            form = form ?? new ReporteForm();

            form.CoautorExternoReporte = new CoautorExternoReporteForm();
            form.CoautorInternoReporte = new CoautorInternoReporteForm();

            //Lista de Catalogos Pendientes
            form.TiposReportes = tipoReporteMapper.Map(catalogoService.GetActiveTipoReportes());
            form.EstadosProductos = estadoProductoMapper.Map(catalogoService.GetActiveEstadoProductos());
            form.Proyectos = proyectoMapper.Map(proyectoService.GetActiveProyectos());
            form.CoautoresExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());
            form.CoautoresInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());

            return form;
        }

        void FormSetCombos(ReporteForm form)
        {
            ViewData["TipoReporte"] = form.TipoReporteId;
            ViewData["EstadoProducto"] = form.EstadoProductoId;
            ViewData["Proyecto"] = form.ProyectoId;
            ViewData["Pais"] = form.PaisId;
        }
    }
}