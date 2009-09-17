using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
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
        readonly IResponsableExternoProyectoMapper responsableExternoProyectoMapper;
        readonly IParticipanteInternoProyectoMapper participanteInternoProyectoMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly IParticipanteExternoProyectoMapper participanteExternoProyectoMapper;
        readonly ISedeMapper sedeMapper;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IImpactoPoliticaPublicaMapper impactoPoliticaPublicaMapper;
        readonly IAmbitoMapper ambitoMapper;
        readonly ITipoFinanciamientoMapper tipoFinanciamientoMapper;
        readonly IMonedaMapper monedaMapper;
        readonly ISectorFinanciamientoMapper sectorFinanciamientoMapper;
        readonly IProductoAcademicoMapper productoAcademicoMapper;
        readonly IActividadPrevistaMapper actividadPrevistaMapper;
        readonly IUSEGMapper uSEGMapper;
        readonly IInstitucionMapper institucionMapper;
        readonly INivelEstudioMapper nivelEstudioMapper;
        readonly ISectorMapper sectorMapper;
        readonly IOrganizacionMapper organizacionMapper;
        readonly INivelMapper nivelMapper;
        readonly IDepartamentoMapper departamentoMapper;
        readonly IAreaMapper areaMapper;
        readonly IDisciplinaMapper disciplinaMapper;
        readonly ISubdisciplinaMapper subdisciplinaMapper;
        readonly IInvestigadorService investigadorService;
        readonly ICoordinacionMapper coordinacionMapper;
        readonly IRecursoFinancieroProyectoMapper recursoFinancieroProyectoMapper;

        public ProyectoController(IProyectoService proyectoService, IProyectoMapper proyectoMapper, ICatalogoService catalogoService, 
                                  IUsuarioService usuarioService, ITipoProyectoMapper tipoProyectoMapper, IConvenioMapper convenioMapper, 
                                  IInvestigadorMapper investigadorMapper, IResponsableInternoProyectoMapper responsableInternoProyectoMapper, 
                                  IResponsableExternoProyectoMapper responsableExternoProyectoMapper, IParticipanteInternoProyectoMapper participanteInternoProyectoMapper, 
                                  IInvestigadorExternoMapper investigadorExternoMapper, IParticipanteExternoProyectoMapper participanteExternoProyectoMapper, 
                                  ISedeMapper sedeMapper, ILineaTematicaMapper lineaTematicaMapper, IImpactoPoliticaPublicaMapper impactoPoliticaPublicaMapper, 
                                  IAmbitoMapper ambitoMapper, ITipoFinanciamientoMapper tipoFinanciamientoMapper, IMonedaMapper monedaMapper, 
                                  ISectorFinanciamientoMapper sectorFinanciamientoMapper, IProductoAcademicoMapper productoAcademicoMapper, 
                                  IActividadPrevistaMapper actividadPrevistaMapper, IUSEGMapper uSEGMapper, IInstitucionMapper institucionMapper, 
                                  INivelEstudioMapper nivelEstudioMapper, ISectorMapper sectorMapper, IOrganizacionMapper organizacionMapper, 
                                  INivelMapper nivelMapper, IDepartamentoMapper departamentoMapper, IAreaMapper areaMapper, IDisciplinaMapper disciplinaMapper, 
                                  ISubdisciplinaMapper subdisciplinaMapper, ISearchService searchService, IInvestigadorService investigadorService,
                                  ICoordinacionMapper coordinacionMapper, IRecursoFinancieroProyectoMapper recursoFinancieroProyectoMapper)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.proyectoService = proyectoService;
            this.proyectoMapper = proyectoMapper;
            this.tipoProyectoMapper = tipoProyectoMapper;
            this.convenioMapper = convenioMapper;
            this.investigadorMapper = investigadorMapper;
            this.responsableInternoProyectoMapper = responsableInternoProyectoMapper;
            this.responsableExternoProyectoMapper = responsableExternoProyectoMapper;
            this.participanteInternoProyectoMapper = participanteInternoProyectoMapper;
            this.investigadorExternoMapper = investigadorExternoMapper;
            this.participanteExternoProyectoMapper = participanteExternoProyectoMapper;
            this.sedeMapper = sedeMapper;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.impactoPoliticaPublicaMapper = impactoPoliticaPublicaMapper;
            this.ambitoMapper = ambitoMapper;
            this.tipoFinanciamientoMapper = tipoFinanciamientoMapper;
            this.monedaMapper = monedaMapper;
            this.sectorFinanciamientoMapper = sectorFinanciamientoMapper;
            this.productoAcademicoMapper = productoAcademicoMapper;
            this.actividadPrevistaMapper = actividadPrevistaMapper;
            this.uSEGMapper = uSEGMapper;
            this.institucionMapper = institucionMapper;
            this.nivelEstudioMapper = nivelEstudioMapper;
            this.sectorMapper = sectorMapper;
            this.organizacionMapper = organizacionMapper;
            this.nivelMapper = nivelMapper;
            this.departamentoMapper = departamentoMapper;
            this.areaMapper = areaMapper;
            this.disciplinaMapper = disciplinaMapper;
            this.subdisciplinaMapper = subdisciplinaMapper;
            this.investigadorService = investigadorService;
            this.coordinacionMapper = coordinacionMapper;
            this.recursoFinancieroProyectoMapper = recursoFinancieroProyectoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var proyectos = proyectoService.GetAllProyectos();
            data.List = proyectoMapper.Map(proyectos);

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

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var proyecto = proyectoService.GetProyectoById(id);
            data.Form = proyectoMapper.Map(proyecto);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ProyectoForm form, FormCollection formCollection)
        {
            var participantesExternos = new string[] {};
            var participantesInternos = new string[] {};
            var responsablesExternos = new string[] {};
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

            if (formCollection["ResponsableExternoProyecto.InvestigadorExternoId_New"] != null &&
                formCollection["ResponsableExternoProyecto.InvestigadorExternoId_New"].Split(',').Length > 0)
                responsablesExternos = formCollection["ResponsableExternoProyecto.InvestigadorExternoId_New"].Split(',');

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
                                              responsablesExternos, responsablesInternos, institucionRecursoFinanciero,
                                              monedaRecursoFinanciero, montoRecursoFinanciero, recursoRecursoFinanciero);

            if (!IsValidateModel(proyecto, form, Title.New, "Proyecto"))
            {
                ((GenericViewData<ProyectoForm>) ViewData.Model).Form = SetupNewForm();
                return ViewNew();
            }

            proyectoService.SaveProyecto(proyecto);

            return RedirectToIndex(String.Format("Proyecto {0} ha sido creado", proyecto.Nombre));
        }

        [CustomTransaction]
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

        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var proyecto = proyectoService.GetProyectoById(id);

            if (proyecto.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            proyecto.Activo = true;
            proyecto.ModificadoPor = CurrentUser();
            proyectoService.SaveProyecto(proyecto);

            var form = proyectoMapper.Map(proyecto);

            return Rjs(form);
        }

        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var proyecto = proyectoService.GetProyectoById(id);

            if (proyecto.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            proyecto.Activo = false;
            proyecto.ModificadoPor = CurrentUser();
            proyectoService.SaveProyecto(proyecto);

            var form = proyectoMapper.Map(proyecto);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Proyecto>(x => x.Nombre, q);
            return Content(data);
        }

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

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewResponsableExterno(int id)
        {
            var proyecto = proyectoService.GetProyectoById(id);
            var form = new ProyectoForm();

            if (proyecto != null)
                form.Id = proyecto.Id;

            form.ResponsableExternoProyecto = new ResponsableExternoProyectoForm();
            form.ResponsablesExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());

            return Rjs("NewResponsableExterno", form);
        }

        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddResponsableExterno([Bind(Prefix = "ResponsableExternoProyecto")]ResponsableExternoProyectoForm form, int proyectoId)
        {
            var responsableExternoProyecto = responsableExternoProyectoMapper.Map(form);

            ModelState.AddModelErrors(responsableExternoProyecto.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            responsableExternoProyecto.CreadorPor = CurrentUser();
            responsableExternoProyecto.ModificadoPor = CurrentUser();

            if (proyectoId != 0)
            {
                var proyecto = proyectoService.GetProyectoById(proyectoId);
                proyecto.AddResponsableExterno(responsableExternoProyecto);
                proyectoService.SaveProyecto(proyecto);
            }

            var responsableExternoProyectoForm = responsableExternoProyectoMapper.Map(responsableExternoProyecto);

            return Rjs("AddResponsableExterno", responsableExternoProyectoForm);
        }

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
            form.ResponsableExternoProyecto = new ResponsableExternoProyectoForm();
            form.ParticipanteInternoProyecto = new ParticipanteInternoProyectoForm();
            form.ParticipanteExternoProyecto = new ParticipanteExternoProyectoForm();
            form.RecursoFinancieroProyecto = new RecursoFinancieroProyectoForm();

            //Lista de Catalogos Pendientes
            form.Coordinaciones = coordinacionMapper.Map(catalogoService.GetActiveCoordinacions());
            form.TiposProyectos = tipoProyectoMapper.Map(catalogoService.GetActiveTipoProyectos());
            form.LineasTematicas = lineaTematicaMapper.Map(catalogoService.GetActiveLineaTematicas());
            //form.Convenios = convenioMapper.Map(catalogoService.GetActiveConvenios());
            //form.ResponsablesInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());
            //form.ResponsablesExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());
            //form.ParticipantesInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());
            //form.ParticipantesExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());
            //form.Sedes = sedeMapper.Map(catalogoService.GetActiveSedes());
            //form.ImpactosPoliticasPublicas = impactoPoliticaPublicaMapper.Map(catalogoService.GetActiveImpactoPoliticaPublicas());
            //form.Ambitos = ambitoMapper.Map(catalogoService.GetActiveAmbitos());
            //form.TiposFinanciamientos = tipoFinanciamientoMapper.Map(catalogoService.GetActiveTipoFinanciamientos());
            //form.Monedas = monedaMapper.Map(catalogoService.GetActiveMonedas());
            //form.SectoresFinanciamientos = sectorFinanciamientoMapper.Map(catalogoService.GetActiveSectorFinanciamientos());
            //form.ProductosAcademicos = productoAcademicoMapper.Map(catalogoService.GetActiveProductoAcademicos());
            //form.ActividadesPrevistas = actividadPrevistaMapper.Map(catalogoService.GetActiveActividadPrevistas());
            //form.Usegs = uSEGMapper.Map(catalogoService.GetActiveUSEGs());
            //form.Instituciones = institucionMapper.Map(catalogoService.GetActiveInstituciones());
            //form.NivelesEstudios = nivelEstudioMapper.Map(catalogoService.GetActiveNivelEstudios());
            //form.Sectores = sectorMapper.Map(catalogoService.GetActiveSectores());
            //form.Organizaciones = organizacionMapper.Map(catalogoService.GetActiveOrganizaciones());
            //form.Niveles2 = nivelMapper.Map(catalogoService.GetActiveNiveles());
            //form.Niveles3 = nivelMapper.Map(catalogoService.GetActiveNiveles());
            //form.Niveles4 = nivelMapper.Map(catalogoService.GetActiveNiveles());
            //form.Niveles5 = nivelMapper.Map(catalogoService.GetActiveNiveles());
            //form.Niveles6 = nivelMapper.Map(catalogoService.GetActiveNiveles());
            //form.Departamentos = departamentoMapper.Map(catalogoService.GetActiveDepartamentos());
            //form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            //form.Disciplinas = disciplinaMapper.Map(catalogoService.GetActiveDisciplinas());
            //form.Subdisciplinas = subdisciplinaMapper.Map(catalogoService.GetActiveSubdisciplinas());
            return form;
        }

        private void FormSetCombos(ProyectoForm form)
        {
            ViewData["Coordinacion"] = form.CoordinacionId;
            ViewData["TipoProyecto"] = form.TipoProyectoId;
            //ViewData["Convenio"] = form.ConvenioId;
            //ViewData["Sede"] = form.SedeId;
            ViewData["LineaTematica"] = form.LineaTematicaId;
            //ViewData["ImpactoPoliticaPublica"] = form.ImpactoPoliticaPublicaId;
            //ViewData["Ambito"] = form.AmbitoId;
            //ViewData["TipoFinanciamiento"] = form.TipoFinanciamientoId;
            //ViewData["Moneda"] = form.MonedaId;
            //ViewData["SectorFinanciamiento"] = form.SectorFinanciamientoId;
            //ViewData["ProductoAcademico"] = form.ProductoAcademicoId;
            //ViewData["ActividadPrevista"] = form.ActividadPrevistaId;
            //ViewData["USEG"] = form.USEGId;
            //ViewData["Institucion"] = form.InstitucionId;
            //ViewData["NivelEstudio"] = form.NivelEstudioId;
            //ViewData["Sector"] = form.SectorId;
            //ViewData["Organizacion"] = form.OrganizacionId;
            //ViewData["Nivel2"] = form.Nivel2Id;
            //ViewData["Nivel3"] = form.Nivel3Id;
            //ViewData["Nivel4"] = form.Nivel4Id;
            //ViewData["Nivel5"] = form.Nivel5Id;
            //ViewData["Nivel6"] = form.Nivel6Id;
            //ViewData["Departamento"] = form.DepartamentoId;
            //ViewData["Area"] = form.AreaId;
            //ViewData["Disciplina"] = form.DisciplinaId;
            //ViewData["Subdisciplina"] = form.SubdisciplinaId;
        }
    }
}