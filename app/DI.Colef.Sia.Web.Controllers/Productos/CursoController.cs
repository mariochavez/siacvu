using System;
using System.Collections.Generic;
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
    public class CursoController : BaseController<Curso, CursoForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ICursoMapper cursoMapper;
        readonly ICursoService cursoService;
        readonly INivelEstudioMapper nivelEstudioMapper;
        readonly IPaisMapper paisMapper;
        readonly IDiplomadoMapper diplomadoMapper;
        readonly ICustomCollection customCollection;
        readonly ICursoInvestigadorService cursoInvestigadorService;
        readonly ICursoInvestigadorMapper cursoInvestigadorMapper;
        readonly ISectorMapper sectorMapper;
        readonly IInstitucionMapper institucionMapper;
        readonly IAreaMapper areaMapper;

        public CursoController(ICursoService cursoService,
                               ICursoMapper cursoMapper,
                               IDiplomadoMapper diplomadoMapper,
                               ICatalogoService catalogoService, IUsuarioService usuarioService,
                               INivelMapper nivelMapper,
                               INivelEstudioMapper nivelEstudioMapper,
                               IPaisMapper paisMapper,
                               ISubdisciplinaMapper subdisciplinaMapper, 
                               ISearchService searchService, ICustomCollection customCollection,
                               ICursoInvestigadorService cursoInvestigadorService, ICursoInvestigadorMapper cursoInvestigadorMapper,
                               IOrganizacionMapper organizacionMapper, ISectorMapper sectorMapper, IDisciplinaMapper disciplinaMapper,
                               IInstitucionMapper institucionMapper, IAreaMapper areaMapper)
            : base(usuarioService, searchService, catalogoService, disciplinaMapper, subdisciplinaMapper, organizacionMapper, nivelMapper)
        {
            this.catalogoService = catalogoService;
            this.diplomadoMapper = diplomadoMapper;
            this.nivelEstudioMapper = nivelEstudioMapper;
            this.cursoService = cursoService;
            this.cursoMapper = cursoMapper;
            this.paisMapper = paisMapper;
            this.customCollection = customCollection;
            this.cursoInvestigadorMapper = cursoInvestigadorMapper;
            this.cursoInvestigadorService = cursoInvestigadorService;
            this.sectorMapper = sectorMapper;
            this.institucionMapper = institucionMapper;
            this.areaMapper = areaMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var cursos = new Curso[] { };

            if (User.IsInRole("Investigadores"))
                cursos = cursoService.GetAllCursos(CurrentUser());
            if (User.IsInRole("DGAA"))
                cursos = cursoService.GetAllCursos();

            data.List = cursoMapper.Map(cursos);

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
            ViewData["Pais"] = (from p in data.Form.Paises where p.Nombre == "México" select p.Id).FirstOrDefault();

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var curso = cursoService.GetCursoById(id);

            if (curso == null)
                return RedirectToIndex("no ha sido encontrado", true);

            if (curso.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var cursoForm = cursoMapper.Map(curso);

            data.Form = SetupNewForm(cursoForm);
            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var curso = cursoService.GetCursoById(id);

            var cursoForm = cursoMapper.Map(curso);

            data.Form = SetupShowForm(cursoForm);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(CursoForm form)
        {
            var curso = cursoMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(curso, form, Title.New, "Curso"))
            {
                var cursoForm = cursoMapper.Map(curso);

                ((GenericViewData<CursoForm>)ViewData.Model).Form = SetupNewForm(cursoForm);
                FormSetCombos(cursoForm);
                return ViewNew();
            }

            cursoService.SaveCurso(curso);

            return RedirectToIndex(String.Format("Curso {0} ha sido creado", IndexValueHelper.GetCursoIndexStringValue(cursoMapper.Map(curso))));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(CursoForm form)
        {
            var curso = cursoMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(curso, form, Title.Edit))
            {
                var cursoForm = cursoMapper.Map(curso);

                ((GenericViewData<CursoForm>) ViewData.Model).Form = SetupNewForm(cursoForm);
                FormSetCombos(cursoForm);
                return ViewEdit();
            }

            cursoService.SaveCurso(curso);

            return RedirectToIndex(String.Format("Curso {0} ha sido modificado", IndexValueHelper.GetCursoIndexStringValue(cursoMapper.Map(curso))));
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Curso>(x => x.Nombre, q);
            return Content(data);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeInstitucion(int select)
        {
            var institucionForm = institucionMapper.Map(catalogoService.GetInstitucionById(select));

            var form = new ShowFieldsForm
                           {
                               InstitucionId = institucionForm.Id,

                               InstitucionCiudad = institucionForm.Ciudad,
                               InstitucionEstadoPaisNombre = institucionForm.EstadoPaisNombre,
                               InstitucionPaisNombre = institucionForm.PaisNombre,
                               InstitucionTipoInstitucionNombre = institucionForm.TipoInstitucion
                           };

            return Rjs("ChangeInstitucion", form);
        }

        CursoForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        CursoForm SetupNewForm(CursoForm form)
        {
            form = form ?? new CursoForm();

            form.TiposCursos = customCollection.TipoAlumnoCursoCustomCollection();

            form.NivelEstudios = nivelEstudioMapper.Map(catalogoService.GetActiveNivelEstudios());
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            form.Diplomados = diplomadoMapper.Map(catalogoService.GetActiveDiplomados());
            form.CursosInvestigadores = cursoInvestigadorMapper.Map(cursoInvestigadorService.GetAllCursosInvestigador());

            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            var subdisciplina = subdisciplinaMapper.Map(catalogoService.GetSubdisciplinaById(form.SubdisciplinaId));
            form.Disciplinas = GetDisciplinas(subdisciplina.DisciplinaAreaId);
            form.Subdisciplinas = GetSubdisciplinas(subdisciplina.DisciplinaId);

            form.Sectores = sectorMapper.Map(catalogoService.GetActiveSectores());
            var nivel2 = nivelMapper.Map(catalogoService.GetNivelById(form.Nivel2Id));
            form.Organizaciones = GetOrganizaciones(nivel2.OrganizacionSectorId);
            form.Niveles = GetNiveles(nivel2.OrganizacionId);

            return form;
        }

        void FormSetCombos(CursoForm form)
        {
            ViewData["TipoCurso"] = form.TipoCurso;
            ViewData["NivelEstudio"] = form.NivelEstudioId;
            ViewData["Pais"] = form.PaisId;
            ViewData["Diplomado"] = form.DiplomadoId;
            ViewData["CursoInvestigadorId"] = form.CursoInvestigadorId;

            var subdisciplina = subdisciplinaMapper.Map(catalogoService.GetSubdisciplinaById(form.SubdisciplinaId));
            ViewData["AreaId"] = subdisciplina.DisciplinaAreaId;
            ViewData["DisciplinaId"] = subdisciplina.DisciplinaId;
            ViewData["SubdisciplinaId"] = form.SubdisciplinaId;

            var nivel2 = nivelMapper.Map(catalogoService.GetNivelById(form.Nivel2Id));
            ViewData["SectorId"] = nivel2.OrganizacionSectorId;
            ViewData["OrganizacionId"] = nivel2.OrganizacionId;
            ViewData["Nivel2Id"] = form.Nivel2Id;
        }

        private CursoForm SetupShowForm(CursoForm form)
        {
            form = form ?? new CursoForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      SubdisciplinaNombre = form.Subdisciplina.Nombre,
                                      SubdisciplinaDisciplinaNombre = form.Subdisciplina.DisciplinaNombre,
                                      SubdisciplinaDisciplinaAreaNombre = form.Subdisciplina.DisciplinaAreaNombre,

                                      Nivel2Nombre = form.Nivel2.Nombre,
                                      Nivel2OrganizacionNombre = form.Nivel2.OrganizacionNombre,
                                      Nivel2OrganizacionSectorNombre = form.Nivel2.OrganizacionSectorNombre,

                                      InstitucionNombre = form.Institucion.Nombre,
                                      InstitucionCiudad = form.Institucion.Ciudad,
                                      InstitucionEstadoPaisNombre = form.Institucion.EstadoPaisNombre,
                                      InstitucionPaisNombre = form.Institucion.PaisNombre,
                                      InstitucionTipoInstitucionNombre = form.Institucion.TipoInstitucion,

                                      IsShowForm = true,
                                      InstitucionLabel = "Institución"
                                  };
            return form;
        }
    }
}