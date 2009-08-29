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
    public class TipoApoyoController : BaseController<TipoApoyo, TipoApoyoForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ITipoApoyoMapper tipoApoyoMapper;
    
        public TipoApoyoController(IUsuarioService usuarioService, 
                                   ICatalogoService catalogoService, 
                                   ITipoApoyoMapper tipoApoyoMapper,
                                   ISearchService searchService) 
            : base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.tipoApoyoMapper = tipoApoyoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var tipoApoyos = catalogoService.GetAllTipoApoyos();
            data.List = tipoApoyoMapper.Map(tipoApoyos);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new TipoApoyoForm();
			
            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tipoApoyo = catalogoService.GetTipoApoyoById(id);
            data.Form = tipoApoyoMapper.Map(tipoApoyo);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var tipoApoyo = catalogoService.GetTipoApoyoById(id);
            data.Form = tipoApoyoMapper.Map(tipoApoyo);
            
            ViewData.Model = data;
            return View();
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoApoyoForm form)
        {
        
            var tipoApoyo = tipoApoyoMapper.Map(form);
            
            tipoApoyo.CreadorPor = CurrentUser();
            tipoApoyo.ModificadoPor = CurrentUser();

            if(!IsValidateModel(tipoApoyo, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoApoyo(tipoApoyo);

            return RedirectToIndex(String.Format("Tipo de apoyo {0} ha sido creado", tipoApoyo.Nombre));
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoApoyoForm form)
        {
        
            var tipoApoyo = tipoApoyoMapper.Map(form);
            
            tipoApoyo.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoApoyo, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoApoyo(tipoApoyo);

            return RedirectToIndex(String.Format("Tipo de apoyo {0} ha sido modificado", tipoApoyo.Nombre));
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoApoyo = catalogoService.GetTipoApoyoById(id);
            tipoApoyo.Activo = true;
            tipoApoyo.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoApoyo(tipoApoyo);

            var form = tipoApoyoMapper.Map(tipoApoyo);
            
            return Rjs(form);
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoApoyo = catalogoService.GetTipoApoyoById(id);
            tipoApoyo.Activo = false;
            tipoApoyo.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoApoyo(tipoApoyo);

            var form = tipoApoyoMapper.Map(tipoApoyo);
            
            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<TipoApoyo>(x => x.Nombre, q);
            return Content(data);
        }
    }
}