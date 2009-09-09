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
    public class ProductoDerivadoController : BaseController<ProductoDerivado, ProductoDerivadoForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IProductoDerivadoMapper productoDerivadoMapper;

        public ProductoDerivadoController(IUsuarioService usuarioService, ICatalogoService catalogoService, 
                                          IProductoDerivadoMapper productoDerivadoMapper,
                                          ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.productoDerivadoMapper = productoDerivadoMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var productoDerivados = catalogoService.GetAllProductoDerivados();
            data.List = productoDerivadoMapper.Map(productoDerivados);

            return View(data);
        }
        
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new ProductoDerivadoForm();
			
            return View(data);
        }
        
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var productoDerivado = catalogoService.GetProductoDerivadoById(id);
            data.Form = productoDerivadoMapper.Map(productoDerivado);

            ViewData.Model = data;
            return View();
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ProductoDerivadoForm form)
        {
        
            var productoDerivado = productoDerivadoMapper.Map(form);
            
            productoDerivado.CreadorPor = CurrentUser();
            productoDerivado.ModificadoPor = CurrentUser();

            if(!IsValidateModel(productoDerivado, form, Title.New))
                return ViewNew();

            catalogoService.SaveProductoDerivado(productoDerivado);

            return RedirectToIndex(String.Format("Producto Derivado {0} ha sido creado", productoDerivado.Nombre));
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ProductoDerivadoForm form)
        {
        
            var productoDerivado = productoDerivadoMapper.Map(form);
            
            productoDerivado.ModificadoPor = CurrentUser();

            if (!IsValidateModel(productoDerivado, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveProductoDerivado(productoDerivado);

            return RedirectToIndex(String.Format("Producto Derivado {0} ha sido modificado", productoDerivado.Nombre));
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var productoDerivado = catalogoService.GetProductoDerivadoById(id);
            productoDerivado.Activo = true;
            productoDerivado.ModificadoPor = CurrentUser();
            catalogoService.SaveProductoDerivado(productoDerivado);

            var form = productoDerivadoMapper.Map(productoDerivado);
            
            return Rjs(form);
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var productoDerivado = catalogoService.GetProductoDerivadoById(id);
            productoDerivado.Activo = false;
            productoDerivado.ModificadoPor = CurrentUser();
            catalogoService.SaveProductoDerivado(productoDerivado);

            var form = productoDerivadoMapper.Map(productoDerivado);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<ProductoDerivado>(x => x.Nombre, q);
            return Content(data);
        }
    }
}