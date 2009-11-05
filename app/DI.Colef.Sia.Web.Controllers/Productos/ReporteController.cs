using System;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections;
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
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly IInvestigadorMapper investigadorMapper;
        readonly IInvestigadorService investigadorService;
        readonly IProyectoMapper proyectoMapper;
        readonly IReporteMapper reporteMapper;
        readonly IReporteService reporteService;
        readonly ITipoReporteMapper tipoReporteMapper;
        readonly IProyectoService proyectoService;
        readonly ICustomCollection customCollection;
        readonly IAreaTematicaMapper areaTematicaMapper;

        public ReporteController(IReporteService reporteService, IReporteMapper reporteMapper,
                                 ICatalogoService catalogoService,
                                 IUsuarioService usuarioService, ITipoReporteMapper tipoReporteMapper,
                                 IProyectoMapper proyectoMapper,
                                 IInvestigadorExternoMapper investigadorExternoMapper,
                                 IInvestigadorMapper investigadorMapper, IInvestigadorService investigadorService,
                                 ICoautorExternoReporteMapper coautorExternoReporteMapper, ICustomCollection customCollection,
                                 ICoautorInternoReporteMapper coautorInternoReporteMapper, ISearchService searchService,
                                 IProyectoService proyectoService, IAreaTematicaMapper areaTematicaMapper)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.customCollection = customCollection;
            this.reporteService = reporteService;
            this.reporteMapper = reporteMapper;
            this.tipoReporteMapper = tipoReporteMapper;
            this.proyectoMapper = proyectoMapper;
            this.investigadorExternoMapper = investigadorExternoMapper;
            this.investigadorMapper = investigadorMapper;
            this.investigadorService = investigadorService;
            this.coautorExternoReporteMapper = coautorExternoReporteMapper;
            this.coautorInternoReporteMapper = coautorInternoReporteMapper;
            this.proyectoService = proyectoService;
            this.areaTematicaMapper = areaTematicaMapper;
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
            if (CurrentInvestigador() == null)
                return NoInvestigadorProfile("Por tal motivo no puede crear nuevos productos.");

            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
            data.Form.PosicionAutor = 1;

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

            var reporteForm = reporteMapper.Map(reporte);
            data.Form = SetupShowForm(reporteForm);

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
            var reporte = reporteMapper.Map(form, CurrentUser(), CurrentInvestigador(),
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
            var reporte = reporteMapper.Map(form, CurrentUser(), CurrentInvestigador());

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
            coautorInternoReporteForm.ParentId = reporteId;

            return Rjs("AddCoautorInterno", coautorInternoReporteForm);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteCoautorInterno(int id, int investigadorId)
        {
            var reporte = reporteService.GetReporteById(id);

            if (reporte != null)
            {
                var coautor = reporte.CoautorInternoReportes.Where(x => x.Investigador.Id == investigadorId).First();
                reporte.DeleteCoautorInterno(coautor);

                reporteService.SaveReporte(reporte);
            }

            return Rjs("DeleteCoautorInterno", investigadorId);
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
            coautorExternoReporteForm.ParentId = reporteId;

            return Rjs("AddCoautorExterno", coautorExternoReporteForm);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteCoautorExterno(int id, int investigadorExternoId)
        {
            var reporte = reporteService.GetReporteById(id);

            if (reporte != null)
            {
                var coautor = reporte.CoautorExternoReportes.Where(x => x.InvestigadorExterno.Id == investigadorExternoId).First();
                reporte.DeleteCoautorExterno(coautor);

                reporteService.SaveReporte(reporte);
            }

            return Rjs("DeleteCoautorExterno", investigadorExternoId);
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
            form.AreasTematicas = areaTematicaMapper.Map(catalogoService.GetActiveAreaTematicas());
            form.TiposReportes = tipoReporteMapper.Map(catalogoService.GetActiveTipoReportes());
            form.EstadosProductos = customCollection.EstadoProductoCustomCollection();
            form.Proyectos = proyectoMapper.Map(proyectoService.GetActiveProyectos());
            form.CoautoresExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());
            form.CoautoresInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());

            return form;
        }

        void FormSetCombos(ReporteForm form)
        {
            ViewData["AreaTematicaId"] = form.AreaTematicaId;
            ViewData["TipoReporte"] = form.TipoReporteId;
            ViewData["EstadoProducto"] = form.EstadoProducto;
        }

        private ReporteForm SetupShowForm(ReporteForm form)
        {
            form = form ?? new ReporteForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      ProyectoAreaTematicaLineaTematicaNombre = form.Proyecto.AreaTematicaLineaTematicaNombre,
                                      ProyectoAreaTematicaNombre = form.Proyecto.AreaTematicaNombre,
                                      ProyectoAreaTematicaSubdisciplinaDisciplinaAreaNombre = form.Proyecto.AreaTematicaSubdisciplinaDisciplinaAreaNombre,
                                      ProyectoAreaTematicaSubdisciplinaDisciplinaNombre = form.Proyecto.AreaTematicaSubdisciplinaDisciplinaNombre,
                                      ProyectoAreaTematicaSubdisciplinaNombre = form.Proyecto.AreaTematicaSubdisciplinaNombre,

                                      AreaTematicaNombre = form.AreaTematica.Nombre,
                                      AreaTematicaLineaTematicaNombre = form.AreaTematica.LineaTematicaNombre,
                                      AreaTematicaSubdisciplinaDisciplinaAreaNombre = form.AreaTematica.SubdisciplinaDisciplinaAreaNombre,
                                      AreaTematicaSubdisciplinaDisciplinaNombre = form.AreaTematica.SubdisciplinaDisciplinaNombre,
                                      AreaTematicaSubdisciplinaNombre = form.AreaTematica.SubdisciplinaNombre
                                  };

            return form;
        }
    }
}