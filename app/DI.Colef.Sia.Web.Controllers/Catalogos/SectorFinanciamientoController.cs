using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class SectorFinanciamientoController : BaseController<SectorFinanciamiento, SectorFinanciamientoForm>
    {
		readonly ICatalogoService catalogoService;
        readonly ISectorFinanciamientoMapper sectorFinanciamientoMapper;

        public SectorFinanciamientoController(IUsuarioService usuarioService, ICatalogoService catalogoService, 
                                              ISectorFinanciamientoMapper sectorFinanciamientoMapper, ISearchService searchService) 
			: base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.sectorFinanciamientoMapper = sectorFinanciamientoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);

            var sectorFinanciamientos = catalogoService.GetAllSectorFinanciamientos();
            data.List = sectorFinanciamientoMapper.Map(sectorFinanciamientos);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new SectorFinanciamientoForm();
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var sectorFinanciamiento = catalogoService.GetSectorFinanciamientoById(id);
            data.Form = sectorFinanciamientoMapper.Map(sectorFinanciamiento);

			ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var sectorFinanciamiento = catalogoService.GetSectorFinanciamientoById(id);
            data.Form = sectorFinanciamientoMapper.Map(sectorFinanciamiento);
            
            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(SectorFinanciamientoForm form)
        {
        
            var sectorFinanciamiento = sectorFinanciamientoMapper.Map(form);
            
            sectorFinanciamiento.CreadorPor = CurrentUser();
            sectorFinanciamiento.ModificadoPor = CurrentUser();

            if(!IsValidateModel(sectorFinanciamiento, form, Title.New))
                return ViewNew();

            catalogoService.SaveSectorFinanciamiento(sectorFinanciamiento);

            return RedirectToIndex(String.Format("{0} ha sido creado", sectorFinanciamiento.Nombre));
        }

        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(SectorFinanciamientoForm form)
        {
        
            var sectorFinanciamiento = sectorFinanciamientoMapper.Map(form);
            
            sectorFinanciamiento.ModificadoPor = CurrentUser();

            if (!IsValidateModel(sectorFinanciamiento, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveSectorFinanciamiento(sectorFinanciamiento);

            return RedirectToIndex(String.Format("{0} ha sido modificado", sectorFinanciamiento.Nombre));
        }

        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var sectorFinanciamiento = catalogoService.GetSectorFinanciamientoById(id);
            sectorFinanciamiento.Activo = true;
            sectorFinanciamiento.ModificadoPor = CurrentUser();
            catalogoService.SaveSectorFinanciamiento(sectorFinanciamiento);

            var form = sectorFinanciamientoMapper.Map(sectorFinanciamiento);
            
            return Rjs(form);
        }
        
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var sectorFinanciamiento = catalogoService.GetSectorFinanciamientoById(id);
            sectorFinanciamiento.Activo = false;
            sectorFinanciamiento.ModificadoPor = CurrentUser();
            catalogoService.SaveSectorFinanciamiento(sectorFinanciamiento);

            var form = sectorFinanciamientoMapper.Map(sectorFinanciamiento);
            
            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<SectorFinanciamiento>(x => x.Nombre, q);
            return Content(data);
        }
    }
}
