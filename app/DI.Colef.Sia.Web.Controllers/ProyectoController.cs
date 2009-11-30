using System;
using System.Collections.Generic;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class ProyectoController : BaseController<Proyecto, ProyectoForm>
    {
        readonly IProyectoService proyectoService;
        readonly IProyectoMapper proyectoMapper;
        readonly ICatalogoService catalogoService;
        readonly ITipoProyectoMapper tipoProyectoMapper;
        readonly IConvenioMapper convenioMapper;
        readonly IInvestigadorMapper investigadorMapper;
        readonly IResponsableInternoProyectoMapper responsableInternoProyectoMapper;
        readonly IParticipanteInternoProyectoMapper participanteInternoProyectoMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly IParticipanteExternoProyectoMapper participanteExternoProyectoMapper;
        readonly ISedeMapper sedeMapper;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IImpactoPoliticaPublicaMapper impactoPoliticaPublicaMapper;
        readonly IAmbitoMapper ambitoMapper;
        readonly ITipoFinanciamientoMapper tipoFinanciamientoMapper;
        readonly IMonedaMapper monedaMapper;
        readonly IProductoAcademicoMapper productoAcademicoMapper;
        readonly IActividadPrevistaMapper actividadPrevistaMapper;
        readonly IUSEGMapper uSEGMapper;
        readonly IInstitucionMapper institucionMapper;
        readonly INivelEstudioMapper nivelEstudioMapper;
        readonly ISectorMapper sectorMapper;
        readonly IDepartamentoMapper departamentoMapper;
        readonly IInvestigadorService investigadorService;
        readonly ICoordinacionMapper coordinacionMapper;
        readonly IRecursoFinancieroProyectoMapper recursoFinancieroProyectoMapper;
        readonly IEstatusProyectoMapper estatusProyectoMapper;
        readonly IFondoConacytMapper fondoConacytMapper;
        readonly IGradoAcademicoMapper gradoAcademicoMapper;
        readonly IAreaTematicaMapper areaTematicaMapper;
        readonly ICustomCollection customCollection;
        readonly IAreaMapper areaMapper;

        public ProyectoController(IProyectoService proyectoService, IProyectoMapper proyectoMapper, ICatalogoService catalogoService, 
                                  IUsuarioService usuarioService, ITipoProyectoMapper tipoProyectoMapper, IConvenioMapper convenioMapper, 
                                  IInvestigadorMapper investigadorMapper, IResponsableInternoProyectoMapper responsableInternoProyectoMapper, 
                                  IParticipanteInternoProyectoMapper participanteInternoProyectoMapper, ICustomCollection customCollection,
                                  IInvestigadorExternoMapper investigadorExternoMapper, IParticipanteExternoProyectoMapper participanteExternoProyectoMapper, 
                                  ISedeMapper sedeMapper, ILineaTematicaMapper lineaTematicaMapper, IImpactoPoliticaPublicaMapper impactoPoliticaPublicaMapper, 
                                  IAmbitoMapper ambitoMapper, ITipoFinanciamientoMapper tipoFinanciamientoMapper, IMonedaMapper monedaMapper, 
                                  IProductoAcademicoMapper productoAcademicoMapper, 
                                  IActividadPrevistaMapper actividadPrevistaMapper, IUSEGMapper uSEGMapper, IInstitucionMapper institucionMapper, 
                                  INivelEstudioMapper nivelEstudioMapper, ISectorMapper sectorMapper, IOrganizacionMapper organizacionMapper, 
                                  INivelMapper nivelMapper, IDepartamentoMapper departamentoMapper, IDisciplinaMapper disciplinaMapper, 
                                  ISubdisciplinaMapper subdisciplinaMapper, ISearchService searchService, IInvestigadorService investigadorService,
                                  ICoordinacionMapper coordinacionMapper, IRecursoFinancieroProyectoMapper recursoFinancieroProyectoMapper,
                                  IEstatusProyectoMapper estatusProyectoMapper, IFondoConacytMapper fondoConacytMapper,
                                  IGradoAcademicoMapper gradoAcademicoMapper, IRamaMapper ramaMapper, IClaseMapper claseMapper,
                                  IAreaTematicaMapper areaTematicaMapper, IAreaMapper areaMapper)
            : base(usuarioService, searchService, catalogoService, disciplinaMapper, subdisciplinaMapper, organizacionMapper, nivelMapper, ramaMapper, claseMapper)
        {
        
            this.catalogoService = catalogoService;
            this.customCollection = customCollection;
            this.proyectoService = proyectoService;
            this.proyectoMapper = proyectoMapper;
            this.tipoProyectoMapper = tipoProyectoMapper;
            this.convenioMapper = convenioMapper;
            this.investigadorMapper = investigadorMapper;
            this.responsableInternoProyectoMapper = responsableInternoProyectoMapper;
            this.participanteInternoProyectoMapper = participanteInternoProyectoMapper;
            this.investigadorExternoMapper = investigadorExternoMapper;
            this.participanteExternoProyectoMapper = participanteExternoProyectoMapper;
            this.sedeMapper = sedeMapper;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.impactoPoliticaPublicaMapper = impactoPoliticaPublicaMapper;
            this.ambitoMapper = ambitoMapper;
            this.tipoFinanciamientoMapper = tipoFinanciamientoMapper;
            this.monedaMapper = monedaMapper;
            this.productoAcademicoMapper = productoAcademicoMapper;
            this.actividadPrevistaMapper = actividadPrevistaMapper;
            this.uSEGMapper = uSEGMapper;
            this.institucionMapper = institucionMapper;
            this.nivelEstudioMapper = nivelEstudioMapper;
            this.sectorMapper = sectorMapper;
            this.departamentoMapper = departamentoMapper;
            this.investigadorService = investigadorService;
            this.coordinacionMapper = coordinacionMapper;
            this.recursoFinancieroProyectoMapper = recursoFinancieroProyectoMapper;
            this.estatusProyectoMapper = estatusProyectoMapper;
            this.fondoConacytMapper = fondoConacytMapper;
            this.gradoAcademicoMapper = gradoAcademicoMapper;
            this.areaTematicaMapper = areaTematicaMapper;
            this.areaMapper = areaMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var proyectos = proyectoService.GetAllProyectos();
            data.List = proyectoMapper.Map(proyectos);

            return View(data);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();

            return View(data);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var proyecto = proyectoService.GetProyectoById(id);

            //if (proyecto == null)
            //    return RedirectToIndex("no ha sido encontrado", true);
            //if (proyecto.Usuario.Id != CurrentUser().Id)
            //    return RedirectToIndex("no lo puede modificar", true);

            var proyectoForm = proyectoMapper.Map(proyecto);

            data.Form = SetupNewForm(proyectoForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var proyecto = proyectoService.GetProyectoById(id);
            var proyectoForm = proyectoMapper.Map(proyecto);

            data.Form = SetupShowForm(proyectoForm);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ProyectoForm form, FormCollection formCollection)
        {
            var participantesExternos = new string[] {};
            var participantesInternos = new string[] {};
            var responsablesInternos = new string[] {};
            var institucionRecursoFinanciero = new string[] {};
            var monedaRecursoFinanciero = new string[] { };
            var montoRecursoFinanciero = new string[] { };
            var recursoRecursoFinanciero = new string[] { };

            if (formCollection["ParticipanteExternoProyecto.InvestigadorExternoId_New"] != null &&
                formCollection["ParticipanteExternoProyecto.InvestigadorExternoId_New"].Split(',').Length > 0)
                participantesExternos =
                    formCollection["ParticipanteExternoProyecto.InvestigadorExternoId_New"].Split(',');

            if (formCollection["ParticipanteInternoProyecto.InvestigadorId_New"] != null &&
                formCollection["ParticipanteInternoProyecto.InvestigadorId_New"].Split(',').Length > 0)
                participantesInternos = formCollection["ParticipanteInternoProyecto.InvestigadorId_New"].Split(',');

            if (formCollection["ResponsableInternoProyecto.InvestigadorId_New"] != null &&
                formCollection["ResponsableInternoProyecto.InvestigadorId_New"].Split(',').Length > 0)
                responsablesInternos = formCollection["ResponsableInternoProyecto.InvestigadorId_New"].Split(',');

            if (formCollection["RecursoFiancieroProyecto.InstitucionId_New"] != null &&
                formCollection["RecursoFiancieroProyecto.InstitucionId_New"].Split(',').Length > 0)
                institucionRecursoFinanciero = formCollection["RecursoFiancieroProyecto.InstitucionId_New"].Split(',');

            if (formCollection["RecursoFiancieroProyecto.MonedaId_New"] != null &&
                formCollection["RecursoFiancieroProyecto.MonedaId_New"].Split(',').Length > 0)
                monedaRecursoFinanciero = formCollection["RecursoFiancieroProyecto.MonedaId_New"].Split(',');

            if (formCollection["RecursoFiancieroProyecto.Monto_New"] != null &&
                formCollection["RecursoFiancieroProyecto.Monto_New"].Split(',').Length > 0)
                montoRecursoFinanciero = formCollection["Monto_New"].Split(',');

            if (formCollection["RecursoFiancieroProyecto.Recurso_New"] != null &&
                formCollection["RecursoFiancieroProyecto.Recurso_New"].Split(',').Length > 0)
                recursoRecursoFinanciero = formCollection["RecursoFiancieroProyecto.Recurso_New"].Split(',');

            var proyecto = proyectoMapper.Map(form, CurrentUser(), participantesExternos, participantesInternos,
                                              responsablesInternos, institucionRecursoFinanciero,
                                              monedaRecursoFinanciero, montoRecursoFinanciero, recursoRecursoFinanciero);

            if (!IsValidateModel(proyecto, form, Title.New, "Proyecto"))
            {
                var proyectoForm = proyectoMapper.Map(proyecto);

                ((GenericViewData<ProyectoForm>)ViewData.Model).Form = SetupNewForm(proyectoForm);
                FormSetCombos(proyectoForm);
                return ViewNew();
            }

            proyectoService.SaveProyecto(proyecto);

            return RedirectToIndex(String.Format("Proyecto {0} ha sido creado", proyecto.Nombre));
        }

        [CustomTransaction]
        [Authorize]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ProyectoForm form)
        {
            var proyecto = proyectoMapper.Map(form, CurrentUser());

            proyecto.ModificadoPor = CurrentUser();

            if (!IsValidateModel(proyecto, form, Title.Edit))
            {
                var proyectoForm = proyectoMapper.Map(proyecto);

                ((GenericViewData<ProyectoForm>)ViewData.Model).Form = SetupNewForm(proyectoForm);
                FormSetCombos(proyectoForm);
                return ViewEdit();
            }

            proyectoService.SaveProyecto(proyecto);

            return RedirectToIndex(String.Format("Proyecto {0} ha sido modificado", proyecto.Nombre));
        }
        
        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Proyecto>(x => x.Nombre, q);
            return Content(data);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeAreaTematica(int select)
        {
            var areaTematicaForm = areaTematicaMapper.Map(catalogoService.GetAreaTematicaById(select));
            var lineaTematicaForm = lineaTematicaMapper.Map(catalogoService.GetLineaTematicaById(areaTematicaForm.LineaTematicaId));

            var form = new ShowFieldsForm
                           {
                               AreaTematicaLineaTematicaNombre = lineaTematicaForm.Nombre,

                               AreaTematicaId = areaTematicaForm.Id
                           };

            return Rjs("ChangeAreaTematica", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewResponsableInterno(int id)
        {
            var proyecto = proyectoService.GetProyectoById(id);
            var form = new ProyectoForm();

            if (proyecto != null)
                form.Id = proyecto.Id;

            form.ResponsableInternoProyecto = new ResponsableInternoProyectoForm();
            form.ResponsablesInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());

            return Rjs("NewResponsableInterno", form);
        }


        [Authorize]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddResponsableInterno([Bind(Prefix = "ResponsableInternoProyecto")]ResponsableInternoProyectoForm form, int proyectoId)
        {
            var responsableInternoProyecto = responsableInternoProyectoMapper.Map(form);

            ModelState.AddModelErrors(responsableInternoProyecto.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            responsableInternoProyecto.CreadorPor = CurrentUser();
            responsableInternoProyecto.ModificadoPor = CurrentUser();

            if (proyectoId != 0)
            {
                var proyecto = proyectoService.GetProyectoById(proyectoId);
                proyecto.AddResponsableInterno(responsableInternoProyecto);
                proyectoService.SaveProyecto(proyecto);
            }

            var responsableInternoProyectoForm = responsableInternoProyectoMapper.Map(responsableInternoProyecto);

            return Rjs("AddResponsableInterno", responsableInternoProyectoForm);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewParticipanteInterno(int id)
        {
            var proyecto = proyectoService.GetProyectoById(id);
            var form = new ProyectoForm();

            if (proyecto != null)
                form.Id = proyecto.Id;

            form.ParticipanteInternoProyecto = new ParticipanteInternoProyectoForm();
            form.ParticipantesInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());

            return Rjs("NewParticipanteInterno", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddParticipanteInterno([Bind(Prefix = "ParticipanteInternoProyecto")]ParticipanteInternoProyectoForm form, int proyectoId)
        {
            var participanteInternoProyecto = participanteInternoProyectoMapper.Map(form);

            ModelState.AddModelErrors(participanteInternoProyecto.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            participanteInternoProyecto.CreadorPor = CurrentUser();
            participanteInternoProyecto.ModificadoPor = CurrentUser();

            if (proyectoId != 0)
            {
                var proyecto = proyectoService.GetProyectoById(proyectoId);
                proyecto.AddParticipanteInterno(participanteInternoProyecto);
                proyectoService.SaveProyecto(proyecto);
            }

            var participanteInternoProyectoForm = participanteInternoProyectoMapper.Map(participanteInternoProyecto);

            return Rjs("AddParticipanteInterno", participanteInternoProyectoForm);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewParticipanteExterno(int id)
        {
            var proyecto = proyectoService.GetProyectoById(id);
            var form = new ProyectoForm();

            if (proyecto != null)
                form.Id = proyecto.Id;

            form.ParticipanteExternoProyecto = new ParticipanteExternoProyectoForm();
            form.ParticipantesExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());

            return Rjs("NewParticipanteExterno", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddParticipanteExterno([Bind(Prefix = "ParticipanteExternoProyecto")]ParticipanteExternoProyectoForm form, int proyectoId)
        {
            var participanteExternoProyecto = participanteExternoProyectoMapper.Map(form);

            ModelState.AddModelErrors(participanteExternoProyecto.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            participanteExternoProyecto.CreadorPor = CurrentUser();
            participanteExternoProyecto.ModificadoPor = CurrentUser();

            if (proyectoId != 0)
            {
                var proyecto = proyectoService.GetProyectoById(proyectoId);
                proyecto.AddParticipanteExterno(participanteExternoProyecto);
                proyectoService.SaveProyecto(proyecto);
            }

            var participanteExternoProyectoForm = participanteExternoProyectoMapper.Map(participanteExternoProyecto);

            return Rjs("AddParticipanteExterno", participanteExternoProyectoForm);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewRecursoFinanciero(int id)
        {
            var proyecto = proyectoService.GetProyectoById(id);
            var form = new ProyectoForm();

            if (proyecto != null)
                form.Id = proyecto.Id;

            form.RecursoFinancieroProyecto = new RecursoFinancieroProyectoForm();
            form.Instituciones = institucionMapper.Map(catalogoService.GetActiveInstituciones());
            form.Monedas = monedaMapper.Map(catalogoService.GetActiveMonedas());

            return Rjs("NewRecursoFinanciero", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddRecursoFinanciero([Bind(Prefix = "RecursoFinancieroProyecto")]RecursoFinancieroProyectoForm form, int proyectoId)
        {
            var recursoFinancieroProyecto = recursoFinancieroProyectoMapper.Map(form);

            ModelState.AddModelErrors(recursoFinancieroProyecto.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            recursoFinancieroProyecto.CreadorPor = CurrentUser();
            recursoFinancieroProyecto.ModificadoPor = CurrentUser();

            if (proyectoId != 0)
            {
                var proyecto = proyectoService.GetProyectoById(proyectoId);
                proyecto.AddRecursoFinanciero(recursoFinancieroProyecto);
                proyectoService.SaveProyecto(proyecto);
            }

            var recursoFinancieroProyectoForm = recursoFinancieroProyectoMapper.Map(recursoFinancieroProyecto);

            return Rjs("AddRecursoFinanciero", recursoFinancieroProyectoForm);
        }

        ProyectoForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        ProyectoForm SetupNewForm(ProyectoForm form)
        {
            form = form ?? new ProyectoForm();

            form.ResponsableInternoProyecto = new ResponsableInternoProyectoForm();
            form.ParticipanteInternoProyecto = new ParticipanteInternoProyectoForm();
            form.ParticipanteExternoProyecto = new ParticipanteExternoProyectoForm();
            form.RecursoFinancieroProyecto = new RecursoFinancieroProyectoForm();

            //Lista de Catalogos Pendientes
            form.TiposProyectos = tipoProyectoMapper.Map(catalogoService.GetActiveTipoProyectos());
            form.Convenios = convenioMapper.Map(catalogoService.GetActiveConvenios());
            form.EstatusProyectos = estatusProyectoMapper.Map(catalogoService.GetActiveEstatusProyectos());
            form.SectoresFinanciamientos = sectorMapper.Map(catalogoService.GetActiveSectoresFinanciamientos());
            form.FondosConacyt = fondoConacytMapper.Map(catalogoService.GetActiveFondoConacyts());
            form.ImpactosPoliticasPublicas = impactoPoliticaPublicaMapper.Map(catalogoService.GetActiveImpactoPoliticaPublicas());
            form.Usegs = uSEGMapper.Map(catalogoService.GetActiveUSEGs());
            form.ProductosAcademicos = productoAcademicoMapper.Map(catalogoService.GetActiveProductoAcademicos());
            form.ActividadesPrevistas = actividadPrevistaMapper.Map(catalogoService.GetActiveActividadPrevistas());
            form.TiposEstudiantes = customCollection.TipoAlumnoCursoCustomCollection();
            form.GradosAcademicos = gradoAcademicoMapper.Map(catalogoService.GetActiveGrados());

            form.LineasTematicas = lineaTematicaMapper.Map(catalogoService.GetActiveLineaTematicas());

            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            var subdisciplina = subdisciplinaMapper.Map(catalogoService.GetSubdisciplinaById(form.SubdisciplinaId));
            form.Disciplinas = GetDisciplinas(subdisciplina.DisciplinaAreaId);
            form.Subdisciplinas = GetSubdisciplinas(subdisciplina.DisciplinaId);

            form.Sectores = sectorMapper.Map(catalogoService.GetActiveSectores());
            var nivel2 = nivelMapper.Map(catalogoService.GetNivelById(form.Nivel2Id));
            form.Organizaciones = GetOrganizaciones(nivel2.OrganizacionSectorId);
            form.Niveles = GetNiveles(nivel2.OrganizacionId);

            form.SectoresEconomicos = sectorMapper.Map(catalogoService.GetActiveSectoresEconomicos());
            var clase = claseMapper.Map(catalogoService.GetClaseById(form.ClaseId));
            form.Ramas = GetRamas(clase.RamaSectorId);
            form.Clases = GetClases(clase.RamaId);

            return form;
        }

        private void FormSetCombos(ProyectoForm form)
        {
            ViewData["TipoProyecto"] = form.TipoProyectoId;
            ViewData["Convenio"] = form.ConvenioId;
            ViewData["EstatusProyecto"] = form.EstatusProyectoId;
            ViewData["SectorFinanciamiento"] = form.SectorFinanciamientoId;
            ViewData["FondoConacyt"] = form.FondoConacytId;
            ViewData["LineaTematica"] = form.LineaTematicaId;
            ViewData["ImpactoPoliticaPublica"] = form.ImpactoPoliticaPublicaId;
            ViewData["USEG"] = form.USEGId;
            ViewData["ProductoAcademico"] = form.ProductoAcademicoId;
            ViewData["ActividadPrevista"] = form.ActividadPrevistaId;
            ViewData["TipoEstudiante"] = form.TipoEstudiante;
            ViewData["GradoAcademico"] = form.GradoAcademicoId;

            var subdisciplina = subdisciplinaMapper.Map(catalogoService.GetSubdisciplinaById(form.SubdisciplinaId));
            ViewData["AreaId"] = subdisciplina.DisciplinaAreaId;
            ViewData["DisciplinaId"] = subdisciplina.DisciplinaId;
            ViewData["SubdisciplinaId"] = form.SubdisciplinaId;

            var nivel2 = nivelMapper.Map(catalogoService.GetNivelById(form.Nivel2Id));
            ViewData["SectorId"] = nivel2.OrganizacionSectorId;
            ViewData["OrganizacionId"] = nivel2.OrganizacionId;
            ViewData["Nivel2Id"] = form.Nivel2Id;

            var clase = claseMapper.Map(catalogoService.GetClaseById(form.ClaseId));
            ViewData["SectorEconomicoId"] = clase.RamaSectorId;
            ViewData["RamaId"] = clase.RamaId;
            ViewData["ClaseId"] = form.ClaseId;
        }

        private ProyectoForm SetupShowForm(ProyectoForm form)
        {
            form = form ?? new ProyectoForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      SubdisciplinaNombre = form.Subdisciplina.Nombre,
                                      SubdisciplinaDisciplinaNombre = form.Subdisciplina.DisciplinaNombre,
                                      SubdisciplinaDisciplinaAreaNombre = form.Subdisciplina.DisciplinaAreaNombre,

                                      Nivel2Nombre = form.Nivel2.Nombre,
                                      Nivel2OrganizacionNombre = form.Nivel2.OrganizacionNombre,
                                      Nivel2OrganizacionSectorNombre = form.Nivel2.OrganizacionSectorNombre,

                                      ClaseNombre = form.Clase.Nombre,
                                      ClaseRamaNombre = form.Clase.RamaNombre,
                                      ClaseRamaSectorNombre = form.Clase.RamaSectorNombre,

                                      IsShowForm = true
                                  };

            return form;
        }
    }
}