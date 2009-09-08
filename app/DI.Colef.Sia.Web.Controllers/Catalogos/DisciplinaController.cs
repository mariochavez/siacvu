using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    public class DisciplinaController : BaseController<Disciplina, DisciplinaForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IDisciplinaMapper disciplinaMapper;

        public DisciplinaController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                    IDisciplinaMapper disciplinaMapper, ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.disciplinaMapper = disciplinaMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var disciplinas = catalogoService.GetAllDisciplinas();
            data.List = disciplinaMapper.Map(disciplinas);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new DisciplinaForm();

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var disciplina = catalogoService.GetDisciplinaById(id);
            data.Form = disciplinaMapper.Map(disciplina);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(DisciplinaForm form)
        {
            var disciplina = disciplinaMapper.Map(form);

            disciplina.CreadorPor = CurrentUser();
            disciplina.ModificadoPor = CurrentUser();

            if (!IsValidateModel(disciplina, form, Title.New))
                return ViewNew();

            catalogoService.SaveDisciplina(disciplina);

            return RedirectToIndex(String.Format("Disciplina {0} ha sido creada", disciplina.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(DisciplinaForm form)
        {
            var disciplina = disciplinaMapper.Map(form);

            disciplina.ModificadoPor = CurrentUser();

            if (!IsValidateModel(disciplina, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveDisciplina(disciplina);

            return RedirectToIndex(String.Format("Disciplina {0} ha sido modificada", disciplina.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var disciplina = catalogoService.GetDisciplinaById(id);
            disciplina.Activo = true;
            disciplina.ModificadoPor = CurrentUser();
            catalogoService.SaveDisciplina(disciplina);

            var form = disciplinaMapper.Map(disciplina);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var disciplina = catalogoService.GetDisciplinaById(id);
            disciplina.Activo = false;
            disciplina.ModificadoPor = CurrentUser();
            catalogoService.SaveDisciplina(disciplina);

            var form = disciplinaMapper.Map(disciplina);

            return Rjs("Activate", form);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Disciplina>(x => x.Nombre, q);
            return Content(data);
        }
    }
}