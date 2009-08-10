using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;
using SharpArch.Core.CommonValidator;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class CursoController : BaseController<Curso, CursoForm>
    {
        readonly ICursoService cursoService;
        readonly ICursoMapper cursoMapper;
        readonly ICatalogoService catalogoService;
        readonly IPeriodoReferenciaMapper periodoReferenciaMapper;
        readonly IProgramaEstudioMapper programaEstudioMapper;
        readonly IInstitucionMapper institucionMapper;
        readonly INivelMapper nivelMapper;
        readonly ISectorMapper sectorMapper;
        readonly IOrganizacionMapper organizacionMapper;
        readonly IPaisMapper paisMapper;
        readonly IAreaMapper areaMapper;
        readonly IDisciplinaMapper disciplinaMapper;
        readonly ISubdisciplinaMapper subdisciplinaMapper;


        public CursoController(ICursoService cursoService,
            ICursoMapper cursoMapper,
            ICatalogoService catalogoService, IUsuarioService usuarioService,
            IPeriodoReferenciaMapper periodoReferenciaMapper,
            IProgramaEstudioMapper programaEstudioMapper,
            IInstitucionMapper institucionMapper,
            INivelMapper nivelMapper,
            ISectorMapper sectorMapper,
            IOrganizacionMapper organizacionMapper,
            IPaisMapper paisMapper,
            IAreaMapper areaMapper,
            IDisciplinaMapper disciplinaMapper,
            ISubdisciplinaMapper subdisciplinaMapper
            )
            : base(usuarioService)
        {
            this.catalogoService = catalogoService;
            this.cursoService = cursoService;
            this.cursoMapper = cursoMapper;
            this.periodoReferenciaMapper = periodoReferenciaMapper;
            this.programaEstudioMapper = programaEstudioMapper;
            this.institucionMapper = institucionMapper;
            this.nivelMapper = nivelMapper;
            this.sectorMapper = sectorMapper;
            this.organizacionMapper = organizacionMapper;
            this.paisMapper = paisMapper;
            this.areaMapper = areaMapper;
            this.disciplinaMapper = disciplinaMapper;
            this.subdisciplinaMapper = subdisciplinaMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var cursos = cursoService.GetAllCursos();
            data.List = cursoMapper.Map(cursos);

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

            var curso = cursoService.GetCursoById(id);

            if (curso == null)
                return RedirectToIndex("no ha sido encontrado", true);

            if (curso.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var cursoForm = cursoMapper.Map(curso);

            data.Form = SetupNewForm(cursoForm);
            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var curso = cursoService.GetCursoById(id);
            data.Form = cursoMapper.Map(curso);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(CursoForm form)
        {
            var curso = cursoMapper.Map(form, CurrentUser(), CurrentInvestigador());
            
            if (!IsValidateModel(curso, form, Title.New, "Curso"))
            {
                ((GenericViewData<CursoForm>)ViewData.Model).Form = SetupNewForm();
                return ViewNew();
            }

            cursoService.SaveCurso(curso);

            return RedirectToIndex(String.Format("{0} ha sido creado", curso.NumeroHoras));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(CursoForm form)
        {
            var curso = cursoMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(curso, form, Title.Edit))
            {
                var cursoForm = cursoMapper.Map(curso);

                ((GenericViewData<CursoForm>)ViewData.Model).Form = SetupNewForm(cursoForm);
                FormSetCombos(cursoForm);
                return ViewEdit();
            }

            cursoService.SaveCurso(curso);

            return RedirectToIndex(String.Format("{0} ha sido modificado", curso.NumeroHoras));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var curso = cursoService.GetCursoById(id);

            if (curso.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            curso.Activo = true;
            curso.ModificadoPor = CurrentUser();
            cursoService.SaveCurso(curso);

            var form = cursoMapper.Map(curso);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var curso = cursoService.GetCursoById(id);

            if (curso.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            curso.Activo = false;
            curso.ModificadoPor = CurrentUser();
            cursoService.SaveCurso(curso);

            var form = cursoMapper.Map(curso);

            return Rjs("Activate", form);
        }

        CursoForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        CursoForm SetupNewForm(CursoForm form)
        {
            form = form ?? new CursoForm();

            form.PeriodosReferencias = periodoReferenciaMapper.Map(catalogoService.GetActivePeriodoReferencias());
            form.ProgramasEstudios = programaEstudioMapper.Map(catalogoService.GetActiveProgramaEstudios());
            form.Instituciones = institucionMapper.Map(catalogoService.GetActiveInstituciones());
            form.Niveles = nivelMapper.Map(catalogoService.GetActiveNiveles());
            form.Sectores = sectorMapper.Map(catalogoService.GetActiveSectores());
            form.Organizaciones = organizacionMapper.Map(catalogoService.GetActiveOrganizaciones());
            form.Niveles2 = nivelMapper.Map(catalogoService.GetActiveNiveles());
            form.Niveles3 = nivelMapper.Map(catalogoService.GetActiveNiveles());
            form.Niveles4 = nivelMapper.Map(catalogoService.GetActiveNiveles());
            form.Niveles5 = nivelMapper.Map(catalogoService.GetActiveNiveles());
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = disciplinaMapper.Map(catalogoService.GetActiveDisciplinas());
            form.Subdisciplinas = subdisciplinaMapper.Map(catalogoService.GetActiveSubdisciplinas());
            
            return form;
        }

        private void FormSetCombos(CursoForm form)
        {
            ViewData["ProgramaEstudio"] = form.ProgramaEstudioId;
            ViewData["Sector"] = form.SectorId;
            ViewData["Organizacion"] = form.OrganizacionId;
            ViewData["PeriodoReferencia"] = form.PeriodoReferenciaId;
            ViewData["Nivel"] = form.NivelId;
            ViewData["Pais"] = form.PaisId;
            ViewData["Institucion"] = form.InstitucionId;
            ViewData["Nivel2"] = form.Nivel2Id;
            ViewData["Nivel3"] = form.Nivel3Id;
            ViewData["Nivel4"] = form.Nivel4Id;
            ViewData["Nivel5"] = form.Nivel5Id;
            ViewData["Area"] = form.AreaId;
            ViewData["Disciplina"] = form.DisciplinaId;
            ViewData["Subdisciplina"] = form.SubdisciplinaId;
        }
    }
}
