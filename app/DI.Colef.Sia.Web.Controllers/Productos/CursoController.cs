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
    public class CursoController : BaseController<Curso, CursoForm>
    {
        readonly IAreaMapper areaMapper;
        readonly ICatalogoService catalogoService;
        readonly ICursoMapper cursoMapper;
        readonly ICursoService cursoService;
        readonly IDisciplinaMapper disciplinaMapper;
        readonly INivelEstudioMapper nivelEstudioMapper;
        readonly INivelMapper nivelMapper;
        readonly IOrganizacionMapper organizacionMapper;
        readonly IPaisMapper paisMapper;
        readonly ISectorMapper sectorMapper;
        readonly ISubdisciplinaMapper subdisciplinaMapper;


        public CursoController(ICursoService cursoService,
                               ICursoMapper cursoMapper,
                               ICatalogoService catalogoService, IUsuarioService usuarioService,
                               INivelMapper nivelMapper,
                               INivelEstudioMapper nivelEstudioMapper,
                               ISectorMapper sectorMapper,
                               IOrganizacionMapper organizacionMapper,
                               IPaisMapper paisMapper,
                               IAreaMapper areaMapper,
                               IDisciplinaMapper disciplinaMapper,
                               ISubdisciplinaMapper subdisciplinaMapper
                               , ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.nivelEstudioMapper = nivelEstudioMapper;
            this.cursoService = cursoService;
            this.cursoMapper = cursoMapper;
            this.nivelMapper = nivelMapper;
            this.sectorMapper = sectorMapper;
            this.organizacionMapper = organizacionMapper;
            this.paisMapper = paisMapper;
            this.areaMapper = areaMapper;
            this.disciplinaMapper = disciplinaMapper;
            this.subdisciplinaMapper = subdisciplinaMapper;
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
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
            data.Form.PeriodoReferenciaPeriodo = CurrentPeriodo().Periodo;
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
            data.Form = cursoMapper.Map(curso);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(CursoForm form)
        {
            var curso = cursoMapper.Map(form, CurrentUser(), CurrentPeriodo());

            if (!IsValidateModel(curso, form, Title.New, "Curso"))
            {
                var cursoForm = cursoMapper.Map(curso);

                ((GenericViewData<CursoForm>)ViewData.Model).Form = SetupNewForm(cursoForm);
                return ViewNew();
            }

            cursoService.SaveCurso(curso);

            return RedirectToIndex(String.Format("Curso {0} ha sido creado", curso.Nombre));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(CursoForm form)
        {
            var curso = cursoMapper.Map(form, CurrentUser(), CurrentPeriodo());

            if (!IsValidateModel(curso, form, Title.Edit))
            {
                var cursoForm = cursoMapper.Map(curso);

                ((GenericViewData<CursoForm>) ViewData.Model).Form = SetupNewForm(cursoForm);
                FormSetCombos(cursoForm);
                return ViewEdit();
            }

            cursoService.SaveCurso(curso);

            return RedirectToIndex(String.Format("Curso {0} ha sido modificado", curso.Nombre));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var curso = cursoService.GetCursoById(id);

            if (curso.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            curso.Activo = true;
            curso.ModificadoPor = CurrentUser();
            cursoService.SaveCurso(curso);

            var form = cursoMapper.Map(curso);

            return Rjs(form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var curso = cursoService.GetCursoById(id);

            if (curso.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            curso.Activo = false;
            curso.ModificadoPor = CurrentUser();
            cursoService.SaveCurso(curso);

            var form = cursoMapper.Map(curso);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeSector(int select)
        {
            var list = new List<OrganizacionForm> { new OrganizacionForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(organizacionMapper.Map(catalogoService.GetOrganizacionesBySectorId(select)));

            var form = new CursoForm
                           {
                               Organizaciones = list.ToArray(),
                               Niveles2 = new[] { new NivelForm { Id = 0, Nombre = "Seleccione ..." } },
                               Niveles3 = new[] { new NivelForm { Id = 0, Nombre = "Seleccione ..." } },
                               Niveles4 = new[] { new NivelForm { Id = 0, Nombre = "Seleccione ..." } },
                               Niveles5 = new[] { new NivelForm { Id = 0, Nombre = "Seleccione ..." } }
                           };

            return Rjs("ChangeSector", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeOrganizacion(int select)
        {
            var list = new List<NivelForm> { new NivelForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(nivelMapper.Map(catalogoService.GetNivelesByOrganizacionId(select)));

            var form = new CursoForm
                           {
                               Niveles2 = list.ToArray(),
                               Niveles3 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles4 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles5 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}}
                           };

            return Rjs("ChangeOrganizacion", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeNivel(int select)
        {
            var list = new List<NivelForm> { new NivelForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(nivelMapper.Map(catalogoService.GetNivelesByNivelId(select)));

            var form = new CursoForm
                           {
                               Niveles3 = list.ToArray(),
                               Niveles4 = list.ToArray(),
                               Niveles5 = list.ToArray()
                           };

            return Rjs("ChangeNivel", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeArea(int select)
        {
            var list = new List<DisciplinaForm> { new DisciplinaForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(disciplinaMapper.Map(catalogoService.GetDisciplinasByAreaId(select)));

            var form = new CursoForm
                           {
                               Disciplinas = list.ToArray(),
                               Subdisciplinas = new[] { new SubdisciplinaForm { Id = 0, Nombre = "Seleccione ..." } }
                           };

            return Rjs("ChangeArea", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeDisciplina(int select)
        {
            var list = new List<SubdisciplinaForm> { new SubdisciplinaForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(subdisciplinaMapper.Map(catalogoService.GetSubdisciplinasByDisciplinaId(select)));

            var form = new CursoForm
                           {
                               Subdisciplinas = list.ToArray()
                           };

            return Rjs("ChangeDisciplina", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Curso>(x => x.Nombre, q);
            return Content(data);
        }

        CursoForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        CursoForm SetupNewForm(CursoForm form)
        {
            form = form ?? new CursoForm();

            form.NivelEstudios = nivelEstudioMapper.Map(catalogoService.GetActiveNivelEstudios());
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

        void FormSetCombos(CursoForm form)
        {
            ViewData["Sector"] = form.SectorId;
            ViewData["Organizacion"] = form.OrganizacionId;
            ViewData["NivelEstudio"] = form.NivelEstudioId;
            ViewData["Pais"] = form.PaisId;
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