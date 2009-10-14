using System;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    public class InstitucionController : BaseController<Institucion, InstitucionForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IInstitucionMapper institucionMapper;
        readonly IPaisMapper paisMapper;

        public InstitucionController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                     IInstitucionMapper institucionMapper, ISearchService searchService,
                                     IPaisMapper paisMapper)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.institucionMapper = institucionMapper;
            this.paisMapper = paisMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var institucions = catalogoService.GetAllInstituciones();
            data.List = institucionMapper.Map(institucions);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
            ViewData["Pais"] = (from p in data.Form.Paises where p.Nombre == "México" select p.Id).FirstOrDefault();

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var institucion = catalogoService.GetInstitucionById(id);
            var institucionForm = institucionMapper.Map(institucion);

            data.Form = SetupNewForm(institucionForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var institucion = catalogoService.GetInstitucionById(id);
            data.Form = institucionMapper.Map(institucion);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(InstitucionForm form)
        {
            var institucion = institucionMapper.Map(form);

            institucion.CreadorPor = CurrentUser();
            institucion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(institucion, form, Title.New))
            {
                var institucionForm = institucionMapper.Map(institucion);

                ((GenericViewData<InstitucionForm>)ViewData.Model).Form = SetupNewForm(institucionForm);
                return ViewNew();
            }

            catalogoService.SaveInstitucion(institucion);

            return RedirectToIndex(String.Format("Institución {0} ha sido creada", institucion.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(InstitucionForm form)
        {
            var institucion = institucionMapper.Map(form);

            institucion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(institucion, form, Title.Edit))
            {
                var institucionForm = institucionMapper.Map(institucion);

                ((GenericViewData<InstitucionForm>)ViewData.Model).Form = SetupNewForm(institucionForm);
                FormSetCombos(institucionForm);
                return ViewEdit();
            }

            catalogoService.SaveInstitucion(institucion);

            return RedirectToIndex(String.Format("Institución {0} ha sido modificada", institucion.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var institucion = catalogoService.GetInstitucionById(id);
            institucion.Activo = true;
            institucion.ModificadoPor = CurrentUser();
            catalogoService.SaveInstitucion(institucion);

            var form = institucionMapper.Map(institucion);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var institucion = catalogoService.GetInstitucionById(id);
            institucion.Activo = false;
            institucion.ModificadoPor = CurrentUser();
            catalogoService.SaveInstitucion(institucion);

            var form = institucionMapper.Map(institucion);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Institucion>(x => x.Nombre, q);
            return Content(data);
        }

        InstitucionForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        InstitucionForm SetupNewForm(InstitucionForm form)
        {
            form = form ?? new InstitucionForm();

            //Lista de Catalogos
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());

            return form;
        }

        private void FormSetCombos(InstitucionForm form)
        {
            ViewData["Pais"] = form.PaisId;
        }
    }
}