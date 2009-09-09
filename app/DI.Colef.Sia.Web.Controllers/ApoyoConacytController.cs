using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class ApoyoConacytController : BaseController<ApoyoConacyt, ApoyoConacytForm>
    {
        readonly IApoyoConacytService apoyoConacytService;
        readonly IApoyoConacytMapper apoyoConacytMapper;
        readonly ICatalogoService catalogoService;
        readonly ITipoApoyoMapper tipoApoyoMapper;
        readonly ISubprogramaConacytMapper subprogramaConacytMapper;

        public ApoyoConacytController(IApoyoConacytService apoyoConacytService, IApoyoConacytMapper apoyoConacytMapper,
                                      ICatalogoService catalogoService, IUsuarioService usuarioService,
                                      ITipoApoyoMapper tipoApoyoMapper, ISubprogramaConacytMapper subprogramaConacytMapper,
                                      ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.apoyoConacytService = apoyoConacytService;
            this.apoyoConacytMapper = apoyoConacytMapper;
            this.tipoApoyoMapper = tipoApoyoMapper;
            this.subprogramaConacytMapper = subprogramaConacytMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var apoyoConacyts = apoyoConacytService.GetAllApoyosConacyt();
            data.List = apoyoConacytMapper.Map(apoyoConacyts);

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var apoyoConacyt = apoyoConacytService.GetApoyoConacytById(id);

            if (apoyoConacyt == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (apoyoConacyt.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var apoyoConacytForm = apoyoConacytMapper.Map(apoyoConacyt);

            data.Form = SetupNewForm(apoyoConacytForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var apoyoConacyt = apoyoConacytService.GetApoyoConacytById(id);
            data.Form = apoyoConacytMapper.Map(apoyoConacyt);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ApoyoConacytForm form)
        {
            var apoyoConacyt = apoyoConacytMapper.Map(form, CurrentUser());

            if (!IsValidateModel(apoyoConacyt, form, Title.New, "ApoyoConacyt"))
            {
                ((GenericViewData<ApoyoConacytForm>)ViewData.Model).Form = SetupNewForm();
                return ViewNew();
            }

            apoyoConacytService.SaveApoyoConacyt(apoyoConacyt);

            return RedirectToIndex(String.Format("Apoyo del Conacyt {0} ha sido creado", apoyoConacyt.TipoApoyo.Nombre));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ApoyoConacytForm form)
        {
            var apoyoConacyt = apoyoConacytMapper.Map(form, CurrentUser());

            apoyoConacyt.ModificadoPor = CurrentUser();

            if (!IsValidateModel(apoyoConacyt, form, Title.Edit))
            {
                var apoyoConacytForm = apoyoConacytMapper.Map(apoyoConacyt);

                ((GenericViewData<ApoyoConacytForm>)ViewData.Model).Form = SetupNewForm(apoyoConacytForm);
                FormSetCombos(apoyoConacytForm);
                return ViewEdit();
            }

            apoyoConacytService.SaveApoyoConacyt(apoyoConacyt);

            return RedirectToIndex(String.Format("Apoyo del Conacyt {0} ha sido modificado", apoyoConacyt.TipoApoyo.Nombre));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var apoyoConacyt = apoyoConacytService.GetApoyoConacytById(id);

            if (apoyoConacyt.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            apoyoConacyt.Activo = true;
            apoyoConacyt.ModificadoPor = CurrentUser();
            apoyoConacytService.SaveApoyoConacyt(apoyoConacyt);

            var form = apoyoConacytMapper.Map(apoyoConacyt);

            return Rjs(form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var apoyoConacyt = apoyoConacytService.GetApoyoConacytById(id);

            if (apoyoConacyt.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            apoyoConacyt.Activo = false;
            apoyoConacyt.ModificadoPor = CurrentUser();
            apoyoConacytService.SaveApoyoConacyt(apoyoConacyt);

            var form = apoyoConacytMapper.Map(apoyoConacyt);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.SearchApoyoConacyt(q);
            return Content(data);
        }

        ApoyoConacytForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        ApoyoConacytForm SetupNewForm(ApoyoConacytForm form)
        {
            form = form ?? new ApoyoConacytForm();

            //Lista de Catalogos Pendientes
            form.TiposApoyos = tipoApoyoMapper.Map(catalogoService.GetActiveTipoApoyos());
            form.SubprogramasConacyts = subprogramaConacytMapper.Map(catalogoService.GetActiveSubprogramasConacyt());
            return form;
        }

        private void FormSetCombos(ApoyoConacytForm form)
        {
            ViewData["TipoApoyo"] = form.TipoApoyoId;
            ViewData["SubprogramaConacyt"] = form.SubprogramaConacytId;
        }
    }
}
