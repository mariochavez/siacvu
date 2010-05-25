using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class AreaInvestigacionController : BaseController<AreaInvestigacion, AreaInvestigacionForm>
    {
		//readonly ICatalogoService catalogoService;
        readonly IAreaInvestigacionMapper areaInvestigacionMapper;
    
        public AreaInvestigacionController(IUsuarioService usuarioService, ICatalogoService catalogoService, 
																	IAreaInvestigacionMapper areaInvestigacionMapper, ISearchService searchService) 
			: base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.areaInvestigacionMapper = areaInvestigacionMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = new GenericViewData<AreaInvestigacionForm>();
			
			var areaInvestigacions = catalogoService.GetAllAreaInvestigacions();
            data.List = areaInvestigacionMapper.Map(areaInvestigacions);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = new GenericViewData<AreaInvestigacionForm> {Form = new AreaInvestigacionForm()};

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<AreaInvestigacionForm>();

            var areaInvestigacion = catalogoService.GetAreaInvestigacionById(id);
            data.Form = areaInvestigacionMapper.Map(areaInvestigacion);

			ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(AreaInvestigacionForm form)
        {
        
            var areaInvestigacion = areaInvestigacionMapper.Map(form);
            
            areaInvestigacion.CreadoPor = CurrentUser();
            areaInvestigacion.ModificadoPor = CurrentUser();

            if(!IsValidateModel(areaInvestigacion, form, Title.New))
                return ViewNew();

            catalogoService.SaveAreaInvestigacion(areaInvestigacion);

            return RedirectToIndex(String.Format("Área de investigación {0} ha sido creada", areaInvestigacion.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(AreaInvestigacionForm form)
        {
        
            var areaInvestigacion = areaInvestigacionMapper.Map(form);
            
            areaInvestigacion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(areaInvestigacion, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveAreaInvestigacion(areaInvestigacion);

            return RedirectToIndex(String.Format("Área de investigación {0} ha sido modificada", areaInvestigacion.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var areaInvestigacion = catalogoService.GetAreaInvestigacionById(id);
            areaInvestigacion.Activo = true;
            areaInvestigacion.ModificadoPor = CurrentUser();
            catalogoService.SaveAreaInvestigacion(areaInvestigacion);

            var form = areaInvestigacionMapper.Map(areaInvestigacion);
            
            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var areaInvestigacion = catalogoService.GetAreaInvestigacionById(id);
            areaInvestigacion.Activo = false;
            areaInvestigacion.ModificadoPor = CurrentUser();
            catalogoService.SaveAreaInvestigacion(areaInvestigacion);

            var form = areaInvestigacionMapper.Map(areaInvestigacion);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<AreaInvestigacion>(x => x.Nombre, q);
            return Content(data);
        }
    }
}