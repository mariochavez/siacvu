using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Results;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class HomeController : BaseController
    {
        readonly IUsuarioService usuarioService;
        readonly IProductoService productoService;
        readonly IInvestigadorService investigadorService;
        readonly ICatalogoService catalogoService;
        readonly IInvestigadorMapper investigadorMapper;
        readonly IDepartamentoMapper departamentoMapper;

        public HomeController(IUsuarioService usuarioService, IProductoService productoService, IInvestigadorService investigadorService,
            ICatalogoService catalogoService, IInvestigadorMapper investigadorMapper, IDepartamentoMapper departamentoMapper)
        {
            this.usuarioService = usuarioService;
            this.productoService = productoService;
            this.investigadorService = investigadorService;
            this.catalogoService = catalogoService;
            this.investigadorMapper = investigadorMapper;
            this.departamentoMapper = departamentoMapper;
        }

        [Authorize]
        public ActionResult Index()
        {
            var data = new GenericViewData<HomeForm>
                           {
                               Title = "Menú"
                           };

            var currentUser = CurrentUser();

            Session["nombreCompleto"] = string.Format("{0} {1} {2}", currentUser.Nombre,
                                                               currentUser.ApellidoPaterno, currentUser.ApellidoMaterno);

            return View(data);
        }

        [Authorize]
        public ActionResult Bandeja()
        {
            var data = new GenericViewData<HomeForm>
                           {
                               Title = "Sistema de Información Académica",
                               Form = GetProductosEnProcesoBandeja()
                           };

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Sign(int id, int tipoProducto)
        {
            var producto = productoService.SignAndGetNombreProducto(id, tipoProducto, CurrentUser());

            var data = new HomeForm
                           {
                               NombreProducto = producto,
                               IdProducto = id,
                               TipoProducto = tipoProducto
                           };

            return Rjs(data);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult FilterProductsByInvestigador(int select)
        {
            var data = select == 0 ? GetProductosEnProcesoBandeja() : GetProductosEnProcesoBandeja(select, 1);

            return Rjs("FilterProducts", data);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult FilterProductsByDepartamento(int select)
        {
            var data = select == 0 ? GetProductosEnProcesoBandeja() : GetProductosEnProcesoBandeja(select, 2);

            return Rjs("FilterProducts", data);
        }

        private HomeForm GetProductosEnProcesoBandeja()
        {
            return GetProductosEnProcesoBandeja(0, 0);
        }

        private HomeForm GetProductosEnProcesoBandeja(int filterId, int filterType)
        {
            object[] productos = productoService.GetProductosPendientesBandeja(CurrentUser());

            //if (User.IsInRole("Investigadores"))
            //    productos = productoService.GetProductosBandeja(CurrentUser());
            //if (User.IsInRole("DGAA"))
            //{
                
            //    //if (filterId == 0 && filterType == 0)
            //    //    productos = productoService.GetProductosEnProcesoBandeja(true);
            //    //if(filterId != 0 && filterType == 1)
            //    //    productos = productoService.GetProductosEnProcesoBandeja(true, filterId, filterType);
            //    //if (filterId != 0 && filterType == 2)
            //    //    productos = productoService.GetProductosEnProcesoBandeja(true, filterId, filterType);
            //}

            var data = new HomeForm
                           {
                               ProduccionAcademica = (ProductoDTO[]) productos[0],
                               FormacionRecursosHumanos = (ProductoDTO[]) productos[1],
                               Proyectos = (ProductoDTO[]) productos[2],
                               Vinculacion = (ProductoDTO[]) productos[3],
                               Eventos = (ProductoDTO[]) productos[4],
                               Investigadores = investigadorMapper.Map(investigadorService.GetActiveInvestigadores()),
                               Departamentos = departamentoMapper.Map(catalogoService.GetActiveDepartamentos()),
                               FilterType = filterType
                           };

            return data;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id, int tipoProducto)
        {
            return new RedirectToAreaRouteResult("Productos", ((TipoProductoEnum)tipoProducto).ToString(), "Edit", new { id = id });
        }

        [Authorize]
        public ActionResult Show(int id, int tipoProducto)
        {
            return new RedirectToAreaRouteResult("Productos", ((TipoProductoEnum)tipoProducto).ToString(), "Show", new { id = id });
        }

        protected Usuario CurrentUser()
        {
            var username = User.Identity.Name;
            return usuarioService.GetUsuarioByUserName(username);
        }
    }
}