using System;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Security;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos
{
    [HandleError]
    public class DistincionController : BaseController<Distincion, DistincionForm>
    {
        readonly IAmbitoMapper ambitoMapper;
        readonly IDistincionMapper distincionMapper;
        readonly IDistincionService distincionService;
        readonly IEstadoPaisMapper estadoPaisMapper;
        readonly IProductoService productoService;
        readonly ITipoDistincionMapper tipoDistincionMapper;

        public DistincionController(IDistincionService distincionService, IDistincionMapper distincionMapper,
                                    ICatalogoService catalogoService, IUsuarioService usuarioService,
                                    ITipoDistincionMapper tipoDistincionMapper,
                                    IArchivoService archivoService,
                                    IAmbitoMapper ambitoMapper, IPaisMapper paisMapper,
                                    IEstadoPaisMapper estadoPaisMapper, ISearchService searchService,
                                    IInstitucionMapper institucionMapper, ISedeMapper sedeMapper,
                                    IProductoService productoService)
            : base(usuarioService, searchService, catalogoService, institucionMapper, sedeMapper)
        {
            base.catalogoService = catalogoService;
            base.paisMapper = paisMapper;

            this.distincionService = distincionService;
            this.distincionMapper = distincionMapper;
            this.tipoDistincionMapper = tipoDistincionMapper;
            this.ambitoMapper = ambitoMapper;
            this.estadoPaisMapper = estadoPaisMapper;
            this.productoService = productoService;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<DistincionForm>();
            var productos = productoService.GetProductosByUsuario<Distincion>(CurrentUser(), x => x.Titulo,
                                                                              x => x.TipoDistincion);
            data.ProductList = productos;

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            if (CurrentInvestigador() == null)
                return NoInvestigadorProfile("Por tal motivo no puede crear nuevos productos.");

            var data = new GenericViewData<DistincionForm> {Form = SetupNewForm()};

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<DistincionForm>();

            var distincion = distincionService.GetDistincionById(id);

            if (distincion == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (distincion.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var distincionForm = distincionMapper.Map(distincion);

            data.Form = SetupNewForm(distincionForm);
            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = new GenericViewData<DistincionForm>();

            var distincion = distincionService.GetDistincionById(id);

            data.Form = distincionMapper.Map(distincion);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(DistincionForm form)
        {
            var distincion = distincionMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (
                !IsInternacionalOrBinacional(distincionMapper.Map(distincion).AmbitoNombre,
                                             new[] {"Internacional", "Binacional", ""}))
                distincion.Pais = GetDefaultPais();

            ModelState.AddModelErrors(distincion.ValidationResults(), true, "Distincion");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            distincionService.SaveDistincion(distincion);
            SetMessage(String.Format("Distinción {0} ha sido creada", distincion.Titulo));

            return Rjs("Save", distincion.Id);
        }

        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(DistincionForm form)
        {
            var distincion = distincionMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (
                !IsInternacionalOrBinacional(distincionMapper.Map(distincion).AmbitoNombre,
                                             new[] {"Internacional", "Binacional", ""}))
                distincion.Pais = GetDefaultPais();

            ModelState.AddModelErrors(distincion.ValidationResults(), true, "Distincion");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            distincionService.SaveDistincion(distincion, true);
            SetMessage(String.Format("Distinción {0} ha sido modificada", distincion.Titulo));

            return Rjs("Save", distincion.Id);
        }

        [CookieLessAuthorize(Roles = "Investigadores")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddFile(FormCollection form)
        {
            var id = Convert.ToInt32(form["Id"]);
            var distincion = distincionService.GetDistincionById(id);

            var archivo = MapArchivo<ArchivoDistincion>();
            distincion.AddArchivo(archivo);

            distincionService.SaveDistincion(distincion);

            return Content("Uploaded");
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Distincion>(x => x.Titulo, q);
            return Content(data);
        }

        DistincionForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        DistincionForm SetupNewForm(DistincionForm form)
        {
            form = form ?? new DistincionForm();

            form.TiposDistinciones = tipoDistincionMapper.Map(catalogoService.GetActiveTipoDistinciones());
            form.Ambitos = ambitoMapper.Map(catalogoService.GetActiveAmbitos());

            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            if (form.Id == 0)
            {
                var pais = (from p in form.Paises where p.Nombre == "México" select p.Id).FirstOrDefault();
                form.EstadosPaises = estadoPaisMapper.Map(catalogoService.GetEstadoPaisesByPaisId(pais));
            }
            else
                form.EstadosPaises = estadoPaisMapper.Map(catalogoService.GetEstadoPaisesByPaisId(form.PaisId));

            return form;
        }

        void FormSetCombos(DistincionForm form)
        {
            ViewData["TipoDistincion"] = form.TipoDistincionId;
            ViewData["Ambito"] = form.AmbitoId;
            ViewData["Pais"] = form.PaisId;
            ViewData["EstadoPais"] = form.EstadoPaisId;
        }
    }
}