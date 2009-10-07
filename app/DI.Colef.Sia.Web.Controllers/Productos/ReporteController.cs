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
        public ActionResult Create([Bind(Prefix = "CoautorInterno")] CoautorInternoProductoForm[] coautorInterno,
                                   [Bind(Prefix = "CoautorExterno")] CoautorExternoProductoForm[] coautorExterno, 
                                   ReporteForm form)
        {
            var reporte = reporteMapper.Map(form, CurrentUser(), CurrentPeriodo(),
                                            coautorExterno, coautorInterno);

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
            var form = new CoautorForm { Controller = "Reporte", IdName = "ReporteId" };

            if (reporte != null)
                form.Id = reporte.Id;

            return Rjs("NewCoautorInterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorInterno([Bind(Prefix = "CoautorInterno")] CoautorInternoProductoForm form,
                                              int reporteId)
        {
            var coautorInternoReporte = coautorInternoReporteMapper.Map(form);

            ModelState.AddModelErrors(coautorInternoReporte.ValidationResults(), false, "CoautorInterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (reporteId != 0)
            {
                coautorInternoReporte.CreadorPor = CurrentUser();
                coautorInternoReporte.ModificadoPor = CurrentUser();

                var reporte = reporteService.GetReporteById(reporteId);

                var alreadyHasIt =
                    reporte.CoautorInternoReportes.Where(
                        x => x.Investigador.Id == coautorInternoReporte.Investigador.Id).Count();

                if (alreadyHasIt == 0)
                {
                    reporte.AddCoautorInterno(coautorInternoReporte);
                    reporteService.SaveReporte(reporte);
                }
            }

            var coautorInternoReporteForm = coautorInternoReporteMapper.Map(coautorInternoReporte);

            return Rjs("AddCoautorInterno", coautorInternoReporteForm);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id)
        {
            var reporte = reporteService.GetReporteById(id);
            var form = new CoautorForm { Controller = "Reporte", IdName = "ReporteId" };

            if (reporte != null)
                form.Id = reporte.Id;

            return Rjs("NewCoautorExterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorExterno([Bind(Prefix = "CoautorExterno")] CoautorExternoProductoForm form,
                                              int reporteId)
        {
            var coautorExternoReporte = coautorExternoReporteMapper.Map(form);

            ModelState.AddModelErrors(coautorExternoReporte.ValidationResults(), false, "CoautorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (reporteId != 0)
            {
                coautorExternoReporte.CreadorPor = CurrentUser();
                coautorExternoReporte.ModificadoPor = CurrentUser();

                var reporte = reporteService.GetReporteById(reporteId);

                var alreadyHasIt =
                    reporte.CoautorExternoReportes.Where(
                        x => x.InvestigadorExterno.Id == coautorExternoReporte.InvestigadorExterno.Id).Count();

                if (alreadyHasIt == 0)
                {
                    reporte.AddCoautorExterno(coautorExternoReporte);
                    reporteService.SaveReporte(reporte);
                }
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

            form.CoautorExternoProducto = new CoautorExternoProductoForm();
            form.CoautorInternoProducto = new CoautorInternoProductoForm();

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