using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    public class SubdisciplinaController : BaseController<Subdisciplina, SubdisciplinaForm>
    {
        readonly ISubdisciplinaMapper subdisciplinaMapper;
        readonly IDisciplinaMapper disciplinaMapper;

        public SubdisciplinaController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                       ISubdisciplinaMapper subdisciplinaMapper, ISearchService searchService,
                                       IDisciplinaMapper disciplinaMapper, IAreaTematicaMapper areaTematicaMapper)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.subdisciplinaMapper = subdisciplinaMapper;
            this.disciplinaMapper = disciplinaMapper;
            this.areaTematicaMapper = areaTematicaMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<SubdisciplinaForm>();

            var subdisciplinas = catalogoService.GetAllSubdisciplinas();
            data.List = subdisciplinaMapper.Map(subdisciplinas);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = new GenericViewData<SubdisciplinaForm> {Form = SetupNewForm()};

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<SubdisciplinaForm>();

            var subdisciplina = catalogoService.GetSubdisciplinaById(id);

            var subdisciplinaForm = subdisciplinaMapper.Map(subdisciplina);

            data.Form = SetupNewForm(subdisciplinaForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(SubdisciplinaForm form)
        {
            var subdisciplina = subdisciplinaMapper.Map(form);

            subdisciplina.CreadoPor = CurrentUser();
            subdisciplina.ModificadoPor = CurrentUser();

            if (!IsValidateModel(subdisciplina, form, Title.New, "Subdisciplina"))
            {
                var subdisciplinaForm = subdisciplinaMapper.Map(subdisciplina);

                ((GenericViewData<SubdisciplinaForm>)ViewData.Model).Form = SetupNewForm(subdisciplinaForm);
                return ViewNew();   
            }

            catalogoService.SaveSubdisciplina(subdisciplina);

            return RedirectToIndex(String.Format("Subdisciplina {0} ha sido creada", subdisciplina.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(SubdisciplinaForm form)
        {
            var subdisciplina = subdisciplinaMapper.Map(form);

            subdisciplina.ModificadoPor = CurrentUser();

            if (!IsValidateModel(subdisciplina, form, Title.Edit))
            {
                var subdisciplinaForm = subdisciplinaMapper.Map(subdisciplina);

                ((GenericViewData<SubdisciplinaForm>)ViewData.Model).Form = SetupNewForm(subdisciplinaForm);
                FormSetCombos(subdisciplinaForm);
                return ViewEdit();
            }

            catalogoService.SaveSubdisciplina(subdisciplina);

            return RedirectToIndex(String.Format("Subdisciplina {0} ha sido modificada", subdisciplina.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var subdisciplina = catalogoService.GetSubdisciplinaById(id);
            subdisciplina.Activo = true;
            subdisciplina.ModificadoPor = CurrentUser();
            catalogoService.SaveSubdisciplina(subdisciplina);

            var form = subdisciplinaMapper.Map(subdisciplina);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var subdisciplina = catalogoService.GetSubdisciplinaById(id);
            subdisciplina.Activo = false;
            subdisciplina.ModificadoPor = CurrentUser();
            catalogoService.SaveSubdisciplina(subdisciplina);

            var form = subdisciplinaMapper.Map(subdisciplina);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Subdisciplina>(x => x.Nombre, q);
            return Content(data);
        }

        SubdisciplinaForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        SubdisciplinaForm SetupNewForm(SubdisciplinaForm form)
        {
            form = form ?? new SubdisciplinaForm();

            form.Disciplinas = disciplinaMapper.Map(catalogoService.GetActiveDisciplinas());

            return form;
        }

        private void FormSetCombos(SubdisciplinaForm form)
        {
            ViewData["Disciplina"] = form.DisciplinaId;
        }
    }
}