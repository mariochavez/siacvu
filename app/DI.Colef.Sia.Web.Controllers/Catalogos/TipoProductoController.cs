using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    public class TipoProductoController : BaseController<TipoProducto, TipoProductoForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ITipoProductoMapper tipoProductoMapper;
    
        public TipoProductoController(IUsuarioService usuarioService, ICatalogoService catalogoService, 
                                      ITipoProductoMapper tipoProductoMapper, ISearchService searchService) 
            : base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.tipoProductoMapper = tipoProductoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);
			
            var tipoProductos = catalogoService.GetAllTipoProductos();
            data.List = tipoProductoMapper.Map(tipoProductos);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new TipoProductoForm();
			
            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tipoProducto = catalogoService.GetTipoProductoById(id);
            data.Form = tipoProductoMapper.Map(tipoProducto);

            ViewData.Model = data;
            return View();
        }
        
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoProductoForm form)
        {
        
            var tipoProducto = tipoProductoMapper.Map(form);
            
            tipoProducto.CreadorPor = CurrentUser();
            tipoProducto.ModificadoPor = CurrentUser();

            if(!IsValidateModel(tipoProducto, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoProducto(tipoProducto);

            return RedirectToIndex(String.Format("Tipo de producto {0} ha sido creado", tipoProducto.Nombre));
        }
        
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoProductoForm form)
        {
        
            var tipoProducto = tipoProductoMapper.Map(form);
            
            tipoProducto.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoProducto, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoProducto(tipoProducto);

            return RedirectToIndex(String.Format("Tipo de producto {0} ha sido modificado", tipoProducto.Nombre));
        }
        
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoProducto = catalogoService.GetTipoProductoById(id);
            tipoProducto.Activo = true;
            tipoProducto.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoProducto(tipoProducto);

            var form = tipoProductoMapper.Map(tipoProducto);
            
            return Rjs(form);
        }
        
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoProducto = catalogoService.GetTipoProductoById(id);
            tipoProducto.Activo = false;
            tipoProducto.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoProducto(tipoProducto);

            var form = tipoProductoMapper.Map(tipoProducto);
            
            return Rjs("Activate", form);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<TipoProducto>(x => x.Nombre, q);
            return Content(data);
        }
    }
}