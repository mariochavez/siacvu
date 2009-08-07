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
            ICatalogoService catalogoService, IUsuarioService usuarioService
            , IPeriodoReferenciaMapper periodoReferenciaMapper
        , IProgramaEstudioMapper programaEstudioMapper
        , IInstitucionMapper institucionMapper
        , INivelMapper nivelMapper
        , ISectorMapper sectorMapper
        , IOrganizacionMapper organizacionMapper
        , IPaisMapper paisMapper
        , IAreaMapper areaMapper
        , IDisciplinaMapper disciplinaMapper
        , ISubdisciplinaMapper subdisciplinaMapper
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
            data.Form = cursoMapper.Map(curso);

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
            var curso = cursoMapper.Map(form);

            curso.CreadorPor = CurrentUser();
            curso.ModificadoPor = CurrentUser();

            if (!IsValidateModel(curso, form, Title.New, "Curso"))
            {
                ((GenericViewData<CursoForm>)ViewData.Model).Form = SetupNewForm();
                return ViewNew();
            }

            cursoService.SaveCurso(curso);

            return RedirectToIndex(String.Format("{0} ha sido creado", "curso.Nombre"));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(CursoForm form)
        {
            var curso = cursoMapper.Map(form);

            curso.ModificadoPor = CurrentUser();

            if (!IsValidateModel(curso, form, Title.Edit))
                return ViewEdit();

            cursoService.SaveCurso(curso);

            return RedirectToIndex(String.Format("{0} ha sido modificado", "curso.Nombre"));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var curso = cursoService.GetCursoById(id);
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
            curso.Activo = false;
            curso.ModificadoPor = CurrentUser();
            cursoService.SaveCurso(curso);

            var form = cursoMapper.Map(curso);

            return Rjs("Activate", form);
        }

        CursoForm SetupNewForm()
        {
            return new CursoForm
            {


                //Lista de Catalogos Pendientes
                PeriodosReferencias = periodoReferenciaMapper.Map(catalogoService.GetActivePeriodoReferencias()),
                ProgramasEstudios = programaEstudioMapper.Map(catalogoService.GetActiveProgramaEstudios()),
                Instituciones = institucionMapper.Map(catalogoService.GetActiveInstituciones()),
                Niveles = nivelMapper.Map(catalogoService.GetActiveNiveles()),
                Sectores = sectorMapper.Map(catalogoService.GetActiveSectores()),
                Organizaciones = organizacionMapper.Map(catalogoService.GetActiveOrganizaciones()),
                Niveles2 = nivelMapper.Map(catalogoService.GetActiveNiveles()),
                Niveles3 = nivelMapper.Map(catalogoService.GetActiveNiveles()),
                Niveles4 = nivelMapper.Map(catalogoService.GetActiveNiveles()),
                Niveles5 = nivelMapper.Map(catalogoService.GetActiveNiveles()),
                Paises = paisMapper.Map(catalogoService.GetActivePaises()),
                Areas = areaMapper.Map(catalogoService.GetActiveAreas()),
                Disciplinas = disciplinaMapper.Map(catalogoService.GetActiveDisciplinas()),
                Subdisciplinas = subdisciplinaMapper.Map(catalogoService.GetActiveSubdisciplinas()),
            };
        }
    }
}
