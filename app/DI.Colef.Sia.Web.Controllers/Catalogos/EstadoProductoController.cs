using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    public class EstadoProductoController : BaseController<EstadoProducto, EstadoProductoForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IEstadoProductoMapper estadoProductoMapper;

        public EstadoProductoController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                        IEstadoProductoMapper estadoProductoMapper, ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.estadoProductoMapper = estadoProductoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var estadoProductos = catalogoService.GetAllEstadoProductos();
            data.List = estadoProductoMapper.Map(estadoProductos);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new EstadoProductoForm();

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var estadoProducto = catalogoService.GetEstadoProductoById(id);
            data.Form = estadoProductoMapper.Map(estadoProducto);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var estadoProducto = catalogoService.GetEstadoProductoById(id);
            data.Form = estadoProductoMapper.Map(estadoProducto);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(EstadoProductoForm form)
        {
            var estadoProducto = estadoProductoMapper.Map(form);

            estadoProducto.CreadorPor = CurrentUser();
            estadoProducto.ModificadoPor = CurrentUser();

            if (!IsValidateModel(estadoProducto, form, Title.New))
                return ViewNew();

            catalogoService.SaveEstadoProducto(estadoProducto);

            return RedirectToIndex(String.Format("Estado del Producto {0} ha sido creado", estadoProducto.Nombre));
        }

        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(EstadoProductoForm form)
        {
            var estadoProducto = estadoProductoMapper.Map(form);

            estadoProducto.ModificadoPor = CurrentUser();

            if (!IsValidateModel(estadoProducto, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveEstadoProducto(estadoProducto);

            return RedirectToIndex(String.Format("Estado del Producto {0} ha sido modificado", estadoProducto.Nombre));
        }

        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var estadoProducto = catalogoService.GetEstadoProductoById(id);
            estadoProducto.Activo = true;
            estadoProducto.ModificadoPor = CurrentUser();
            catalogoService.SaveEstadoProducto(estadoProducto);

            var form = estadoProductoMapper.Map(estadoProducto);

            return Rjs(form);
        }

        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var estadoProducto = catalogoService.GetEstadoProductoById(id);
            estadoProducto.Activo = false;
            estadoProducto.ModificadoPor = CurrentUser();
            catalogoService.SaveEstadoProducto(estadoProducto);

            var form = estadoProductoMapper.Map(estadoProducto);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<EstadoProducto>(x => x.Nombre, q);
            return Content(data);
        }
    }
}