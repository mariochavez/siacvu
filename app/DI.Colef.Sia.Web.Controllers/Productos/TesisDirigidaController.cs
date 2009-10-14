using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos
{
    [HandleError]
    public class TesisDirigidaController : BaseController<TesisDirigida, TesisDirigidaForm>
    {
        readonly IAreaMapper areaMapper;
        readonly ICatalogoService catalogoService;
        readonly IDepartamentoMapper departamentoMapper;
        readonly IDependenciaMapper dependenciaMapper;
        readonly IDisciplinaMapper disciplinaMapper;
        readonly IFormaParticipacionMapper formaParticipacionMapper;
        readonly IGradoAcademicoMapper gradoAcademicoMapper;
        readonly IPaisMapper paisMapper;
        readonly ISectorMapper sectorMapper;
        readonly ISubdisciplinaMapper subdisciplinaMapper;
        readonly ITesisDirigidaMapper tesisDirigidaMapper;
        readonly ITesisDirigidaService tesisDirigidaService;
        readonly ITipoEstudianteMapper tipoEstudianteMapper;
        readonly IVinculacionAPyDMapper vinculacionApyDMapper;
        readonly IAlumnoMapper alumnoMapper;
        readonly IAlumnoService alumnoService;
        readonly IOrganizacionMapper organizacionMapper;
        readonly INivelMapper nivelMapper;
        readonly IInstitucionMapper institucionMapper;

        public TesisDirigidaController(ITesisDirigidaService tesisDirigidaService, ITesisDirigidaMapper tesisDirigidaMapper, ICatalogoService catalogoService,
                               IUsuarioService usuarioService, IGradoAcademicoMapper gradoAcademicoMapper,
                               IPaisMapper paisMapper,
                               IFormaParticipacionMapper formaParticipacionMapper,
                               ISectorMapper sectorMapper,
                               IDependenciaMapper dependenciaMapper, IDepartamentoMapper departamentoMapper,
                               IAreaMapper areaMapper, IDisciplinaMapper disciplinaMapper,
                               ISubdisciplinaMapper subdisciplinaMapper, 
                               ISearchService searchService, ITipoEstudianteMapper tipoEstudianteMapper,
                               IVinculacionAPyDMapper vinculacionApyDMapper, IAlumnoMapper alumnoMapper,
                               IAlumnoService alumnoService, IOrganizacionMapper organizacionMapper, 
                               INivelMapper nivelMapper, IInstitucionMapper institucionMapper)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.tesisDirigidaService = tesisDirigidaService;
            this.tesisDirigidaMapper = tesisDirigidaMapper;
            this.gradoAcademicoMapper = gradoAcademicoMapper;
            this.paisMapper = paisMapper;
            this.formaParticipacionMapper = formaParticipacionMapper;
            this.sectorMapper = sectorMapper;
            this.dependenciaMapper = dependenciaMapper;
            this.departamentoMapper = departamentoMapper;
            this.areaMapper = areaMapper;
            this.disciplinaMapper = disciplinaMapper;
            this.subdisciplinaMapper = subdisciplinaMapper;
            this.tipoEstudianteMapper = tipoEstudianteMapper;
            this.vinculacionApyDMapper = vinculacionApyDMapper;
            this.alumnoMapper = alumnoMapper;
            this.alumnoService = alumnoService;
            this.organizacionMapper = organizacionMapper;
            this.nivelMapper = nivelMapper;
            this.institucionMapper = institucionMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var tesisDirigidas = new TesisDirigida[] { };

            if (User.IsInRole("Investigadores"))
                tesisDirigidas = tesisDirigidaService.GetAllTesisDirigidas(CurrentUser());
            if (User.IsInRole("DGAA"))
                tesisDirigidas = tesisDirigidaService.GetAllTesisDirigidas();

            data.List = tesisDirigidaMapper.Map(tesisDirigidas);

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

            var tesisDirigida = tesisDirigidaService.GetTesisDirigidaById(id);

            if (tesisDirigida == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (tesisDirigida.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var tesisDirigidaForm = tesisDirigidaMapper.Map(tesisDirigida);

            data.Form = SetupNewForm(tesisDirigidaForm);
            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var tesisDirigida = tesisDirigidaService.GetTesisDirigidaById(id);
            data.Form = tesisDirigidaMapper.Map(tesisDirigida);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TesisDirigidaForm form)
        {
            var tesisDirigida = tesisDirigidaMapper.Map(form, CurrentUser(), CurrentPeriodo(), CurrentInvestigador());

            if (!IsValidateModel(tesisDirigida, form, Title.New, "TesisDirigida"))
            {
                var tesisForm = tesisDirigidaMapper.Map(tesisDirigida);

                ((GenericViewData<TesisDirigidaForm>)ViewData.Model).Form = SetupNewForm(tesisForm);
                return ViewNew();
            }

            tesisDirigidaService.SaveTesisDirigida(tesisDirigida);

            return RedirectToIndex(String.Format("Tesis dirigida {0} ha sido creada", tesisDirigida.Titulo));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TesisDirigidaForm form)
        {
            var tesisDirigida = tesisDirigidaMapper.Map(form, CurrentUser(), CurrentPeriodo(), CurrentInvestigador());

            if (!IsValidateModel(tesisDirigida, form, Title.Edit))
            {
                var tesisDirigidaForm = tesisDirigidaMapper.Map(tesisDirigida);

                ((GenericViewData<TesisDirigidaForm>) ViewData.Model).Form = SetupNewForm(tesisDirigidaForm);
                FormSetCombos(tesisDirigidaForm);
                return ViewEdit();
            }

            tesisDirigidaService.SaveTesisDirigida(tesisDirigida);

            return RedirectToIndex(String.Format("Tesis dirigida {0} ha sido modificada", tesisDirigida.Titulo));
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeAlumno(int select)
        {
            var tesisDirigidaForm = new TesisDirigidaForm();
            var alumnoForm = alumnoMapper.Map(alumnoService.GetAlumnoById(select));

            tesisDirigidaForm.AlumnoProgramaEstudioNombre = alumnoForm.ProgramaEstudioNombre;
            tesisDirigidaForm.AlumnoGradoAcademicoNombre = alumnoForm.GradoAcademicoNombre;

            tesisDirigidaForm.AlumnoId = alumnoForm.Id;

            return Rjs("ChangeAlumno", tesisDirigidaForm);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeInstitucion(int select)
        {
            var tesisDirigidaForm = new TesisDirigidaForm();
            var institucionForm = institucionMapper.Map(catalogoService.GetInstitucionById(select));

            tesisDirigidaForm.InstitucionPaisNombre = institucionForm.PaisNombre;

            tesisDirigidaForm.InstitucionId = institucionForm.Id;

            return Rjs("ChangeInstitucion", tesisDirigidaForm);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeSector(int select)
        {
            var list = new List<OrganizacionForm> { new OrganizacionForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(organizacionMapper.Map(catalogoService.GetOrganizacionesBySectorId(select)));

            var form = new TesisDirigidaForm
                           {
                               Organizaciones = list.ToArray(),
                               Niveles2 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}}
                           };

            return Rjs("ChangeSector", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeOrganizacion(int select)
        {
            var list = new List<NivelForm> { new NivelForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(nivelMapper.Map(catalogoService.GetNivelesByOrganizacionId(select)));

            var form = new TesisDirigidaForm
                           {
                               Niveles2 = list.ToArray()
                           };

            return Rjs("ChangeOrganizacion", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeArea(int select)
        {
            var list = new List<DisciplinaForm> { new DisciplinaForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(disciplinaMapper.Map(catalogoService.GetDisciplinasByAreaId(select)));

            var form = new TesisDirigidaForm
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

            var form = new TesisDirigidaForm
                           {
                               Subdisciplinas = list.ToArray()
                           };

            return Rjs("ChangeDisciplina", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<TesisDirigida>(x => x.Titulo, q);
            return Content(data);
        }

        TesisDirigidaForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        TesisDirigidaForm SetupNewForm(TesisDirigidaForm form)
        {
            form = form ?? new TesisDirigidaForm();

            //Lista de Catalogos Pendientes
            form.Alumnos = alumnoMapper.Map(tesisDirigidaService.FindActiveAlumnos());

            form.GradosAcademicos = gradoAcademicoMapper.Map(catalogoService.GetActiveGrados());
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            form.FormasParticipaciones = formaParticipacionMapper.Map(catalogoService.GetActiveFormaParticipaciones());

            form.Sectores = sectorMapper.Map(catalogoService.GetActiveSectores());
            form.Organizaciones = organizacionMapper.Map(catalogoService.GetOrganizacionesBySectorId(form.SectorId));
            form.Niveles2 = nivelMapper.Map(catalogoService.GetNivelesByOrganizacionId(form.OrganizacionId));

            form.TiposEstudiantes = new[]
                                        {
                                            new CustomSelectForm {Id = 1, Nombre = "Interno"},
                                            new CustomSelectForm {Id = 2, Nombre = "Externo"}
                                        };

            form.VinculacionesAPyDs = vinculacionApyDMapper.Map(catalogoService.GetActiveVinculacionAPyDs());

            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = disciplinaMapper.Map(catalogoService.GetDisciplinasByAreaId(form.AreaId));
            form.Subdisciplinas = subdisciplinaMapper.Map(catalogoService.GetSubdisciplinasByDisciplinaId(form.DisciplinaId));

            return form;
        }

        void FormSetCombos(TesisDirigidaForm form)
        {
            ViewData["TipoEstudiante"] = form.TipoEstudiante;
            ViewData["Alumno"] = form.AlumnoId;
            ViewData["VinculacionAPyD"] = form.VinculacionAPyDId;
            ViewData["GradoAcademico"] = form.GradoAcademicoId;
            ViewData["Pais"] = form.PaisId;
            ViewData["FormaParticipacion"] = form.FormaParticipacionId;
            ViewData["Sector"] = form.SectorId;
            ViewData["Organizacion"] = form.OrganizacionId;
            ViewData["Nivel2"] = form.Nivel2Id;
            ViewData["Area"] = form.AreaId;
            ViewData["Disciplina"] = form.DisciplinaId;
            ViewData["Subdisciplina"] = form.SubdisciplinaId;
        }
    }
}