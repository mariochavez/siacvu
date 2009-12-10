using System;
using System.Collections;
using System.Collections.Generic;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
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
            var produccionAcademica = new List<ProductoDTO>();
            var formacionRecursosHumanos = new List<ProductoDTO>();
            var proyectos = new List<ProductoDTO>();
            var vinculacion = new List<ProductoDTO>();

            var productos = productoService.GetProductosBandeja(CurrentUser());

            foreach (var producto in (IEnumerable)productos[0])
            {
                produccionAcademica.Add(producto as ProductoDTO);
            }

            foreach (var producto in (IEnumerable)productos[1])
            {
                formacionRecursosHumanos.Add(producto as ProductoDTO);
            }

            foreach (var producto in (IEnumerable)productos[2])
            {
                proyectos.Add(producto as ProductoDTO);
            }

            foreach (var producto in (IEnumerable)productos[3])
            {
                vinculacion.Add(producto as ProductoDTO);
            }

            var data = new GenericViewData<HomeForm>
                           {
                               Title = "Sistema de administración académica",
                               Form = new HomeForm
                                          {
                                              ProduccionAcademica = produccionAcademica.ToArray(),
                                              FormacionRecursosHumanos = formacionRecursosHumanos.ToArray(),
                                              Proyectos = proyectos.ToArray(),
                                              Vinculacion = vinculacion.ToArray()
                                          }
                           };

            return View(data);
        }

        [Authorize]
        public ActionResult Edit(int id, int tipoProducto)
        {
            return RedirectToProducto(id, tipoProducto, "Edit");
        }

        [Authorize]
        public ActionResult Show(int id, int tipoProducto)
        {
            return RedirectToProducto(id, tipoProducto, "Show");
        }

        protected ActionResult RedirectToProducto(int id, int tipoProducto, string action)
        {
            RedirectToRouteResult route = null;

            switch (tipoProducto)
            {
                case 1:
                    route = RedirectToAction(action, "Productos/Articulo", new { id = id });
                    break;
                case 2:
                    route = RedirectToAction(action, "Productos/Capitulo", new { id = id });
                    break;
                case 3:
                    route = RedirectToAction(action, "Productos/Curso", new { id = id });
                    break;
                case 4:
                    route = RedirectToAction(action, "Productos/Dictamen", new { id = id });
                    break;
                case 6:
                    route = RedirectToAction(action, "Productos/Evento", new { id = id });
                    break;
                case 7:
                    route = RedirectToAction(action, "Productos/Libro", new { id = id });
                    break;
                case 8:
                    route = RedirectToAction(action, "Productos/OrganoExterno", new { id = id });
                    break;
                case 10:
                    route = RedirectToAction(action, "Productos/ParticipacionMedio", new { id = id });
                    break;
                case 11:
                    route = RedirectToAction(action, "Productos/Reporte", new { id = id });
                    break;
                case 12:
                    route = RedirectToAction(action, "Productos/Resena", new { id = id });
                    break;
                case 13:
                    route = RedirectToAction(action, "Productos/TesisDirigida", new { id = id });
                    break;
                case 14:
                    route = RedirectToAction(action, "Proyecto", new { id = id });
                    break;
                case 20:
                    route = RedirectToAction(action, "Productos/ObraTraducida", new { id = id });
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