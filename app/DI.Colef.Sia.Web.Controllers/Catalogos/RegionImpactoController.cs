using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class RegionImpactoController : BaseController<RegionImpacto, RegionImpactoForm>
    {
		readonly IRegionImpactoService regionImpactoService;
        readonly IRegionImpactoMapper regionImpactoMapper;
    
        public RegionImpactoController(IUsuarioService usuarioService, IRegionImpactoService regionImpactoService, IRegionImpactoMapper regionImpactoMapper) 
			: base (usuarioService)
        {
            this.regionImpactoService = regionImpactoService;
            this.regionImpactoMapper = regionImpactoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);
			
			var regionImpactos = regionImpactoService.GetAllRegionImpactos();
            data.List = regionImpactoMapper.Map(regionImpactos);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new RegionImpactoForm();
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var regionImpacto = regionImpactoService.GetRegionImpactoById(id);
            data.Form = regionImpactoMapper.Map(regionImpacto);

			ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var regionImpacto = regionImpactoService.GetRegionImpactoById(id);
            data.Form = regionImpactoMapper.Map(regionImpacto);
            
            ViewData.Model = data;
            return View();
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(RegionImpactoForm form)
        {
        
            var regionImpacto = regionImpactoMapper.Map(form);
            
            regionImpacto.CreadorPor = CurrentUser();
            regionImpacto.ModificadoPor = CurrentUser();

            if(!IsValidateModel(regionImpacto, form, Title.New))
                return ViewNew();

            regionImpactoService.SaveRegionImpacto(regionImpacto);

            return RedirectToIndex(String.Format("{0} ha sido creado", regionImpacto.Nombre));
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(RegionImpactoForm form)
        {
        
            var regionImpacto = regionImpactoMapper.Map(form);
            
            regionImpacto.ModificadoPor = CurrentUser();

            if (!IsValidateModel(regionImpacto, form, Title.Edit))
                return ViewEdit();

            regionImpactoService.SaveRegionImpacto(regionImpacto);

            return RedirectToIndex(String.Format("{0} ha sido modificado", regionImpacto.Nombre));
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var regionImpacto = regionImpactoService.GetRegionImpactoById(id);
            regionImpacto.Activo = true;
            regionImpacto.ModificadoPor = CurrentUser();
            regionImpactoService.SaveRegionImpacto(regionImpacto);

            var form = regionImpactoMapper.Map(regionImpacto);
            
            return Rjs(form);
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var regionImpacto = regionImpactoService.GetRegionImpactoById(id);
            regionImpacto.Activo = false;
            regionImpacto.ModificadoPor = CurrentUser();
            regionImpactoService.SaveRegionImpacto(regionImpacto);

            var form = regionImpactoMapper.Map(regionImpacto);
            
            return Rjs("Activate", form);
        }
    }
}
