using System;
using System.Collections;
using System.Collections.Generic;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
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
                               Title = "Sistema de administración académica",
                               Form = GetProductosBandeja()
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
            var data = select == 0 ? GetProductosBandeja() : GetProductosBandeja(select, 1);

            return Rjs("FilterProducts", data);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult FilterProductsByDepartamento(int select)
        {
            var data = select == 0 ? GetProductosBandeja() : GetProductosBandeja(select, 2);

            return Rjs("FilterProducts", data);
        }

        private HomeForm GetProductosBandeja()
        {
            return GetProductosBandeja(0, 0);
        }

        private HomeForm GetProductosBandeja(int filterId, int filterType)
        {
            var productos = new object[4];

            if (User.IsInRole("Investigadores"))
                productos = productoService.GetProductosBandeja(CurrentUser());
            if (User.IsInRole("DGAA"))
            {
                if (filterId == 0 && filterType == 0)
                    productos = productoService.GetProductosBandeja(true);
                if(filterId != 0 && filterType == 1)
                    productos = productoService.GetProductosBandeja(true, filterId, filterType);
                if (filterId != 0 && filterType == 2)
                    productos = productoService.GetProductosBandeja(true, filterId, filterType);
            }

            var data = new HomeForm
                           {
                               ProduccionAcademica =  (ProductoDTO[]) productos[0],
                               FormacionRecursosHumanos = (ProductoDTO[]) productos[1],
                               Proyectos = (ProductoDTO[]) productos[2],
                               Vinculacion = (ProductoDTO[]) productos[3],
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
                case 15:
                    route = RedirectToAction(action, "Proyecto", new { id = id });
                    break;
                case 16:
                    route = RedirectToAction(action, "Productos/ArticuloDifusion", new { id = id });
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