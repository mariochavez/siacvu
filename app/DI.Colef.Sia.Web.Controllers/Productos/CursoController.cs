using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections;
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
        readonly INivelMapper nivelMapper;
        readonly IPaisMapper paisMapper;
        readonly IDiplomadoMapper diplomadoMapper;
        readonly ISubdisciplinaMapper subdisciplinaMapper;
        readonly ICustomCollection customCollection;

        public CursoController(ICursoService cursoService,
                               ICursoMapper cursoMapper,
                               IDiplomadoMapper diplomadoMapper,
                               ICatalogoService catalogoService, IUsuarioService usuarioService,
                               INivelMapper nivelMapper,
                               INivelEstudioMapper nivelEstudioMapper,
                               IPaisMapper paisMapper,
                               ISubdisciplinaMapper subdisciplinaMapper, 
                               ISearchService searchService, ICustomCollection customCollection)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.diplomadoMapper = diplomadoMapper;
            this.nivelEstudioMapper = nivelEstudioMapper;
            this.cursoService = cursoService;
            this.cursoMapper = cursoMapper;
            this.nivelMapper = nivelMapper;
            this.paisMapper = paisMapper;
            this.subdisciplinaMapper = subdisciplinaMapper;
            this.customCollection = customCollection;
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
            var curso = cursoMapper.Map(form, CurrentUser(), CurrentInvestigador());

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
            var curso = cursoMapper.Map(form, CurrentUser(), CurrentInvestigador());

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

            form.TiposCursos = customCollection.TipoAlumnoCursoCustomCollection();

            form.NivelEstudios = nivelEstudioMapper.Map(catalogoService.GetActiveNivelEstudios());
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            form.Diplomados = diplomadoMapper.Map(catalogoService.GetActiveDiplomados());
            form.Niveles2 = nivelMapper.Map(catalogoService.GetActiveNiveles());
            form.Subdisciplinas = subdisciplinaMapper.Map(catalogoService.GetActiveSubdisciplinas());

            return form;
        }

        void FormSetCombos(CursoForm form)
        {
            ViewData["TipoCurso"] = form.TipoCurso;
            ViewData["NivelEstudio"] = form.NivelEstudioId;
            ViewData["Pais"] = form.PaisId;
            ViewData["Diplomado"] = form.DiplomadoId;
            ViewData["Nivel2"] = form.Nivel2Id;
            ViewData["Subdisciplina"] = form.SubdisciplinaId;
        }
    }
}