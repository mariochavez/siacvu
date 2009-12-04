using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        readonly IUsuarioService usuarioService;
        readonly IProductoService productoService;

        public HomeController(IUsuarioService usuarioService, IProductoService productoService)
        {
            this.usuarioService = usuarioService;
            this.productoService = productoService;
        }

        [Authorize]
        public ActionResult Index()
        {
            var productos = productoService.GetProductosBandeja(CurrentUser());


            var data = new GenericViewData<HomeForm>
                           {
                               Title = "Sistema de administración académica",
                               Form = new HomeForm {ProduccionAcademica = productos}
                           };

            return View(data);
        }

        [Authorize]
        public ActionResult Edit(int id, int? tipoProducto)
        {
            return RedirectToProducto(id, tipoProducto);
        }

        protected ActionResult RedirectToProducto(int id, int? tipoProducto)
        {
            RedirectToRouteResult route = null;

            switch (tipoProducto)
            {
                case 1:
                    route = RedirectToAction("Edit", "Productos/Articulo", new {id = id});
                    break;
            }

            return route;
        }

        protected Usuario CurrentUser()
        {
            var username = User.Identity.Name;
            return usuarioService.GetUsuarioByUserName(username);
        }
    }
}