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
    public class EstadoPaisController : BaseController<EstadoPais, EstadoPaisForm>
    {
        //readonly ICatalogoService catalogoService;
        readonly IEstadoPaisMapper estadoPaisMapper;
        //readonly IPaisMapper paisMapper;

        public EstadoPaisController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                    IEstadoPaisMapper estadoPaisMapper, ISearchService searchService,
                                    IPaisMapper paisMapper)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.estadoPaisMapper = estadoPaisMapper;
            this.paisMapper = paisMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<EstadoPaisForm>();

            var estadoPais = catalogoService.GetAllEstadoPaises();
            data.List = estadoPaisMapper.Map(estadoPais);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = new GenericViewData<EstadoPaisForm> {Form = SetupNewForm()};

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<EstadoPaisForm>();

            var estadoPais = catalogoService.GetEstadoPaisById(id);
            var estadoPaisForm = estadoPaisMapper.Map(estadoPais);

            data.Form = SetupNewForm(estadoPaisForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(EstadoPaisForm form)
        {
            var estadoPais = estadoPaisMapper.Map(form);

            estadoPais.CreadoPor = CurrentUser();
            estadoPais.ModificadoPor = CurrentUser();

            if (!IsValidateModel(estadoPais, form, Title.New, "EstadoPais"))
            {
                var estadoPaisForm = estadoPaisMapper.Map(estadoPais);

                ((GenericViewData<EstadoPaisForm>)ViewData.Model).Form = SetupNewForm(estadoPaisForm);
                return ViewNew();   
            }

            catalogoService.SaveEstadoPais(estadoPais);

            return RedirectToIndex(String.Format("Estado del País {0} ha sido creado", estadoPais.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(EstadoPaisForm form)
        {
            var estadoPais = estadoPaisMapper.Map(form);

            estadoPais.ModificadoPor = CurrentUser();

            if (!IsValidateModel(estadoPais, form, Title.Edit))
            {
                var estadoPaisForm = estadoPaisMapper.Map(estadoPais);

                ((GenericViewData<EstadoPaisForm>)ViewData.Model).Form = SetupNewForm(estadoPaisForm);
                FormSetCombos(estadoPaisForm);
                return ViewEdit();   
            }

            catalogoService.SaveEstadoPais(estadoPais);

            return RedirectToIndex(String.Format("Estado del País {0} ha sido modificado", estadoPais.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var estadoPais = catalogoService.GetEstadoPaisById(id);
            estadoPais.Activo = true;
            estadoPais.ModificadoPor = CurrentUser();
            catalogoService.SaveEstadoPais(estadoPais);

            var form = estadoPaisMapper.Map(estadoPais);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var estadoPais = catalogoService.GetEstadoPaisById(id);
            estadoPais.Activo = false;
            estadoPais.ModificadoPor = CurrentUser();
            catalogoService.SaveEstadoPais(estadoPais);

            var form = estadoPaisMapper.Map(estadoPais);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<EstadoPais>(x => x.Nombre, q);
            return Content(data);
        }

        EstadoPaisForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        EstadoPaisForm SetupNewForm(EstadoPaisForm form)
        {
            form = form ?? new EstadoPaisForm();

            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());

            return form;
        }

        private void FormSetCombos(EstadoPaisForm form)
        {
            ViewData["Pais"] = form.PaisId;
        }
    }
}