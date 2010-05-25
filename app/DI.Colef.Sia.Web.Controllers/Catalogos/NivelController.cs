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
    public class NivelController : BaseController<Nivel, NivelForm>
    {
        readonly INivelMapper nivelMapper;
        readonly IOrganizacionMapper organizacionMapper;

        public NivelController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                               INivelMapper nivelMapper, ISearchService searchService,
                               IOrganizacionMapper organizacionMapper)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.nivelMapper = nivelMapper;
            this.organizacionMapper = organizacionMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<NivelForm>();

            var nivels = catalogoService.GetAllNiveles();
            data.List = nivelMapper.Map(nivels);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = new GenericViewData<NivelForm> {Form = SetupNewForm()};

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<NivelForm>();

            var nivel = catalogoService.GetNivelById(id);
            var nivelForm = nivelMapper.Map(nivel);

            data.Form = SetupNewForm(nivelForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(NivelForm form)
        {
            var nivel = nivelMapper.Map(form);

            nivel.CreadoPor = CurrentUser();
            nivel.ModificadoPor = CurrentUser();

            if (!IsValidateModel(nivel, form, Title.New, "Nivel"))
            {
                var nivelForm = nivelMapper.Map(nivel);

                ((GenericViewData<NivelForm>)ViewData.Model).Form = SetupNewForm(nivelForm);
                return ViewNew();
            }

            catalogoService.SaveNivel(nivel);

            return RedirectToIndex(String.Format("Nivel {0} ha sido creado", nivel.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(NivelForm form)
        {
            var nivel = nivelMapper.Map(form);

            nivel.ModificadoPor = CurrentUser();

            if (!IsValidateModel(nivel, form, Title.Edit))
            {
                var nivelForm = nivelMapper.Map(nivel);

                ((GenericViewData<NivelForm>)ViewData.Model).Form = SetupNewForm(nivelForm);
                FormSetCombos(nivelForm);
                return ViewEdit();
            }

            catalogoService.SaveNivel(nivel);

            return RedirectToIndex(String.Format("Nivel {0} ha sido modificado", nivel.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var nivel = catalogoService.GetNivelById(id);
            nivel.Activo = true;
            nivel.ModificadoPor = CurrentUser();
            catalogoService.SaveNivel(nivel);

            var form = nivelMapper.Map(nivel);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var nivel = catalogoService.GetNivelById(id);
            nivel.Activo = false;
            nivel.ModificadoPor = CurrentUser();
            catalogoService.SaveNivel(nivel);

            var form = nivelMapper.Map(nivel);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Nivel>(x => x.Nombre, q);
            return Content(data);
        }

        NivelForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        NivelForm SetupNewForm(NivelForm form)
        {
            form = form ?? new NivelForm();

            form.Organizaciones = organizacionMapper.Map(catalogoService.GetActiveOrganizaciones());

            return form;
        }

        private void FormSetCombos(NivelForm form)
        {
            ViewData["Organizacion"] = form.OrganizacionId;
        }
    }
}