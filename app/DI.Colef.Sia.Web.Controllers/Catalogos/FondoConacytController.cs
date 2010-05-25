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
    public class FondoConacytController : BaseController<FondoConacyt, FondoConacytForm>
    {
        readonly IFondoConacytMapper fondoConacytMapper;
    
        public FondoConacytController(IUsuarioService usuarioService, ICatalogoService catalogoService, 
																	IFondoConacytMapper fondoConacytMapper, ISearchService searchService) 
			: base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.fondoConacytMapper = fondoConacytMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = new GenericViewData<FondoConacytForm>();
			
			var fondoConacyts = catalogoService.GetAllFondoConacyts();
            data.List = fondoConacytMapper.Map(fondoConacyts);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = new GenericViewData<FondoConacytForm> {Form = new FondoConacytForm()};

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<FondoConacytForm>();

            var fondoConacyt = catalogoService.GetFondoConacytById(id);
            data.Form = fondoConacytMapper.Map(fondoConacyt);

			ViewData.Model = data;
            return View();
        }
        
        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(FondoConacytForm form)
        {
        
            var fondoConacyt = fondoConacytMapper.Map(form);
            
            fondoConacyt.CreadoPor = CurrentUser();
            fondoConacyt.ModificadoPor = CurrentUser();

            if(!IsValidateModel(fondoConacyt, form, Title.New))
                return ViewNew();

            catalogoService.SaveFondoConacyt(fondoConacyt);

            return RedirectToIndex(String.Format("Fondo del CONACyT {0} ha sido creado", fondoConacyt.Nombre));
        }
        
        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(FondoConacytForm form)
        {
        
            var fondoConacyt = fondoConacytMapper.Map(form);
            
            fondoConacyt.ModificadoPor = CurrentUser();

            if (!IsValidateModel(fondoConacyt, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveFondoConacyt(fondoConacyt);

            return RedirectToIndex(String.Format("Fondo del CONACyT {0} ha sido modificado", fondoConacyt.Nombre));
        }
        
        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var fondoConacyt = catalogoService.GetFondoConacytById(id);
            fondoConacyt.Activo = true;
            fondoConacyt.ModificadoPor = CurrentUser();
            catalogoService.SaveFondoConacyt(fondoConacyt);

            var form = fondoConacytMapper.Map(fondoConacyt);
            
            return Rjs(form);
        }
        
        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var fondoConacyt = catalogoService.GetFondoConacytById(id);
            fondoConacyt.Activo = false;
            fondoConacyt.ModificadoPor = CurrentUser();
            catalogoService.SaveFondoConacyt(fondoConacyt);

            var form = fondoConacytMapper.Map(fondoConacyt);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<FondoConacyt>(x => x.Nombre, q);
            return Content(data);
        }
    }
}
