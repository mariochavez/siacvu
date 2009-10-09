using System;
using System.Collections.Generic;
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
        readonly IOrganizacionMapper organizacionMapper;
        readonly INivelMapper nivelMapper;
        readonly IDepartamentoMapper departamentoMapper;
        readonly IAreaMapper areaMapper;
        readonly IDisciplinaMapper disciplinaMapper;
        readonly ISubdisciplinaMapper subdisciplinaMapper;
        readonly IInvestigadorService investigadorService;
        readonly ICoordinacionMapper coordinacionMapper;
        readonly IRecursoFinancieroProyectoMapper recursoFinancieroProyectoMapper;
        readonly IEstatusProyectoMapper estatusProyectoMapper;
        readonly IFondoConacytMapper fondoConacytMapper;
        readonly ITipoEstudianteMapper tipoEstudianteMapper;
        readonly IGradoAcademicoMapper gradoAcademicoMapper;
        readonly IRamaMapper ramaMapper;
        readonly IClaseMapper claseMapper;
        readonly IAreaTematicaMapper areaTematicaMapper;

        public ProyectoController(IProyectoService proyectoService, IProyectoMapper proyectoMapper, ICatalogoService catalogoService, 
                                  IUsuarioService usuarioService, ITipoProyectoMapper tipoProyectoMapper, IConvenioMapper convenioMapper, 
                                  IInvestigadorMapper investigadorMapper, IResponsableInternoProyectoMapper responsableInternoProyectoMapper, 
                                  IParticipanteInternoProyectoMapper participanteInternoProyectoMapper, 
                                  IInvestigadorExternoMapper investigadorExternoMapper, IParticipanteExternoProyectoMapper participanteExternoProyectoMapper, 
                                  ISedeMapper sedeMapper, ILineaTematicaMapper lineaTematicaMapper, IImpactoPoliticaPublicaMapper impactoPoliticaPublicaMapper, 
                                  IAmbitoMapper ambitoMapper, ITipoFinanciamientoMapper tipoFinanciamientoMapper, IMonedaMapper monedaMapper, 
                                  IProductoAcademicoMapper productoAcademicoMapper, 
                                  IActividadPrevistaMapper actividadPrevistaMapper, IUSEGMapper uSEGMapper, IInstitucionMapper institucionMapper, 
                                  INivelEstudioMapper nivelEstudioMapper, ISectorMapper sectorMapper, IOrganizacionMapper organizacionMapper, 
                                  INivelMapper nivelMapper, IDepartamentoMapper departamentoMapper, IAreaMapper areaMapper, IDisciplinaMapper disciplinaMapper, 
                                  ISubdisciplinaMapper subdisciplinaMapper, ISearchService searchService, IInvestigadorService investigadorService,
                                  ICoordinacionMapper coordinacionMapper, IRecursoFinancieroProyectoMapper recursoFinancieroProyectoMapper,
                                  IEstatusProyectoMapper estatusProyectoMapper, IFondoConacytMapper fondoConacytMapper, ITipoEstudianteMapper tipoEstudianteMapper,
                                  IGradoAcademicoMapper gradoAcademicoMapper, IRamaMapper ramaMapper, IClaseMapper claseMapper,
                                  IAreaTematicaMapper areaTematicaMapper)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
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
            this.organizacionMapper = organizacionMapper;
            this.nivelMapper = nivelMapper;
            this.departamentoMapper = departamentoMapper;
            this.areaMapper = areaMapper;
            this.disciplinaMapper = disciplinaMapper;
            this.subdisciplinaMapper = subdisciplinaMapper;
            this.investigadorService = investigadorService;
            this.coordinacionMapper = coordinacionMapper;
            this.recursoFinancieroProyectoMapper = recursoFinancieroProyectoMapper;
            this.estatusProyectoMapper = estatusProyectoMapper;
            this.fondoConacytMapper = fondoConacytMapper;
            this.tipoEstudianteMapper = tipoEstudianteMapper;
            this.gradoAcademicoMapper = gradoAcademicoMapper;
            this.ramaMapper = ramaMapper;
            this.claseMapper = claseMapper;
            this.areaTematicaMapper = areaTematicaMapper;
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
            data.Form = proyectoMapper.Map(proyecto);

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
                ((GenericViewData<ProyectoForm>) ViewData.Model).Form = SetupNewForm();
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

        [CustomTransaction]
        [Authorize]
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
        [Authorize]
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

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeLineaTematica(int select)
        {
            var list = new List<AreaTematicaForm> { new AreaTematicaForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(areaTematicaMapper.Map(catalogoService.GetAreaTematicasByLineaTematicaId(select)));

            var form = new ProyectoForm
                           {
                               AreasTematicas = list.ToArray()
                           };

            return Rjs("ChangeLineaTematica", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeSector(int select)
        {
            var list = new List<OrganizacionForm> { new OrganizacionForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(organizacionMapper.Map(catalogoService.GetOrganizacionesBySectorId(select)));

            var form = new ProyectoForm
                           {
                               Organizaciones = list.ToArray(),
                               Niveles2 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles3 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles4 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles5 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles6 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}}
                           };

            return Rjs("ChangeSector", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeOrganizacion(int select)
        {
            var list = new List<NivelForm> { new NivelForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(nivelMapper.Map(catalogoService.GetNivelesByOrganizacionId(select)));

            var form = new ProyectoForm
                           {
                               Niveles2 = list.ToArray(),
                               Niveles3 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles4 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles5 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles6 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}}
                           };

            return Rjs("ChangeOrganizacion", form);
        }


        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeNivel2(int select)
        {
            var list = new List<NivelForm> { new NivelForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(nivelMapper.Map(catalogoService.GetNivelesByNivelId(select)));

            var form = new ProyectoForm
                           {
                               Niveles3 = list.ToArray(),
                               Niveles4 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles5 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles6 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}}
                           };

            return Rjs("ChangeNivel2", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeNivel3(int select)
        {
            var list = new List<NivelForm> { new NivelForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(nivelMapper.Map(catalogoService.GetNivelesByNivelId(select)));

            var form = new ProyectoForm
                           {
                               Niveles4 = list.ToArray(),
                               Niveles5 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles6 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}}
                           };

            return Rjs("ChangeNivel3", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeNivel4(int select)
        {
            var list = new List<NivelForm> { new NivelForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(nivelMapper.Map(catalogoService.GetNivelesByNivelId(select)));

            var form = new ProyectoForm
                           {
                               Niveles5 = list.ToArray(),
                               Niveles6 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}}
                           };

            return Rjs("ChangeNivel4", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeNivel5(int select)
        {
            var list = new List<NivelForm> { new NivelForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(nivelMapper.Map(catalogoService.GetNivelesByNivelId(select)));

            var form = new ProyectoForm
                           {
                               Niveles6 = list.ToArray()
                           };

            return Rjs("ChangeNivel5", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeArea(int select)
        {
            var list = new List<DisciplinaForm> { new DisciplinaForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(disciplinaMapper.Map(catalogoService.GetDisciplinasByAreaId(select)));

            var form = new ProyectoForm
                           {
                               Disciplinas = list.ToArray(),
                               Subdisciplinas = new[] {new SubdisciplinaForm {Id = 0, Nombre = "Seleccione ..."}}
                           };

            return Rjs("ChangeArea", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeDisciplina(int select)
        {
            var list = new List<SubdisciplinaForm> { new SubdisciplinaForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(subdisciplinaMapper.Map(catalogoService.GetSubdisciplinasByDisciplinaId(select)));

            var form = new ProyectoForm
                           {
                               Subdisciplinas = list.ToArray()
                           };

            return Rjs("ChangeDisciplina", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeSectorEconomico(int select)
        {
            var list = new List<RamaForm> { new RamaForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(ramaMapper.Map(catalogoService.GetRamasBySectorId(select)));

            var form = new ProyectoForm
                           {
                               Ramas = list.ToArray(),
                               Clases = new[] {new ClaseForm {Id = 0, Nombre = "Seleccione ..."}}
                           };

            return Rjs("ChangeSectorEconomico", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeRama(int select)
        {
            var list = new List<ClaseForm> { new ClaseForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(claseMapper.Map(catalogoService.GetClasesByRamaId(select)));

            var form = new ProyectoForm
                           {
                               Clases = list.ToArray()
                           };

            return Rjs("ChangeRama", form);
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
            form.TiposEstudiantes = tipoEstudianteMapper.Map(catalogoService.GetActiveTipoEstudiantes());
            form.GradosAcademicos = gradoAcademicoMapper.Map(catalogoService.GetActiveGrados());

            form.LineasTematicas = lineaTematicaMapper.Map(catalogoService.GetActiveLineaTematicasInstitucionales());
            form.AreasTematicas = areaTematicaMapper.Map(catalogoService.GetAreaTematicasByLineaTematicaId(form.LineaTematicaId));

            form.Sectores = sectorMapper.Map(catalogoService.GetActiveSectores());
            form.Organizaciones = organizacionMapper.Map(catalogoService.GetOrganizacionesBySectorId(form.SectorId));
            form.Niveles2 = nivelMapper.Map(catalogoService.GetNivelesByOrganizacionId(form.OrganizacionId));
            form.Niveles3 = nivelMapper.Map(catalogoService.GetNivelesByNivelId(form.Nivel2Id));
            form.Niveles4 = nivelMapper.Map(catalogoService.GetNivelesByNivelId(form.Nivel2Id));
            form.Niveles5 = nivelMapper.Map(catalogoService.GetNivelesByNivelId(form.Nivel2Id));
            form.Niveles6 = nivelMapper.Map(catalogoService.GetNivelesByNivelId(form.Nivel2Id));

            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = disciplinaMapper.Map(catalogoService.GetDisciplinasByAreaId(form.AreaId));
            form.Subdisciplinas = subdisciplinaMapper.Map(catalogoService.GetSubdisciplinasByDisciplinaId(form.DisciplinaId));

            form.SectoresEconomicos = sectorMapper.Map(catalogoService.GetActiveSectoresEconomicos());
            form.Ramas = ramaMapper.Map(catalogoService.GetRamasBySectorId(form.SectorEconomicoId));
            form.Clases = claseMapper.Map(catalogoService.GetClasesByRamaId(form.RamaId));

            ///Catalogos Prototipo
            //form.Coordinaciones = coordinacionMapper.Map(catalogoService.GetActiveCoordinacions());

            ///Catalogos Nunca Usados
            //form.ResponsablesInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());
            //form.ResponsablesExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());
            //form.ParticipantesInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());
            //form.ParticipantesExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());
            //form.Sedes = sedeMapper.Map(catalogoService.GetActiveSedes());
            //form.Ambitos = ambitoMapper.Map(catalogoService.GetActiveAmbitos());
            //form.TiposFinanciamientos = tipoFinanciamientoMapper.Map(catalogoService.GetActiveTipoFinanciamientos());
            //form.Monedas = monedaMapper.Map(catalogoService.GetActiveMonedas());
            //form.Instituciones = institucionMapper.Map(catalogoService.GetActiveInstituciones());
            //form.NivelesEstudios = nivelEstudioMapper.Map(catalogoService.GetActiveNivelEstudios());
            //form.Departamentos = departamentoMapper.Map(catalogoService.GetActiveDepartamentos());

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
            ViewData["AreaTematica"] = form.AreaTematicaId;
            ViewData["ImpactoPoliticaPublica"] = form.ImpactoPoliticaPublicaId;
            ViewData["USEG"] = form.USEGId;
            ViewData["ProductoAcademico"] = form.ProductoAcademicoId;
            ViewData["ActividadPrevista"] = form.ActividadPrevistaId;
            ViewData["TipoEstudiante"] = form.TipoEstudianteId;
            ViewData["GradoAcademico"] = form.GradoAcademicoId;
            ViewData["Sector"] = form.SectorId;
            ViewData["Organizacion"] = form.OrganizacionId;
            ViewData["Nivel2"] = form.Nivel2Id;
            ViewData["Nivel3"] = form.Nivel3Id;
            ViewData["Nivel4"] = form.Nivel4Id;
            ViewData["Nivel5"] = form.Nivel5Id;
            ViewData["Nivel6"] = form.Nivel6Id;
            ViewData["Area"] = form.AreaId;
            ViewData["Disciplina"] = form.DisciplinaId;
            ViewData["Subdisciplina"] = form.SubdisciplinaId;
            ViewData["SectorEconomico"] = form.SectorEconomicoId;
            ViewData["Rama"] = form.RamaId;
            ViewData["Clase"] = form.ClaseId;

            ///Catalogos Prototipo
            //ViewData["Coordinacion"] = form.CoordinacionId;

            ///Catalogos Nunca Usados
            //ViewData["Sede"] = form.SedeId;
            //ViewData["Ambito"] = form.AmbitoId;
            //ViewData["TipoFinanciamiento"] = form.TipoFinanciamientoId;
            //ViewData["Moneda"] = form.MonedaId;
            //ViewData["Institucion"] = form.InstitucionId;
            //ViewData["NivelEstudio"] = form.NivelEstudioId;
            //ViewData["Departamento"] = form.DepartamentoId;
        }
    }
}