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
    public class ConsejoComisionController : BaseController<ConsejoComision, ConsejoComisionForm>
    {
		//readonly ICatalogoService catalogoService;
        readonly IConsejoComisionMapper consejoComisionMapper;
    
        public ConsejoComisionController(IUsuarioService usuarioService,
            ICatalogoService catalogoService, 
            IConsejoComisionMapper consejoComisionMapper,
            ISearchService searchService) 
			: base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.consejoComisionMapper = consejoComisionMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = new GenericViewData<ConsejoComisionForm>();
			
			var consejoComisions = catalogoService.GetAllConsejoComisions();
            data.List = consejoComisionMapper.Map(consejoComisions);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = new GenericViewData<ConsejoComisionForm> {Form = new ConsejoComisionForm()};

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<ConsejoComisionForm>();

            var consejoComision = catalogoService.GetConsejoComisionById(id);
            data.Form = consejoComisionMapper.Map(consejoComision);

			ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = new GenericViewData<ConsejoComisionForm>();

            var consejoComision = catalogoService.GetConsejoComisionById(id);
            data.Form = consejoComisionMapper.Map(consejoComision);
            
            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ConsejoComisionForm form)
        {
            var consejoComision = consejoComisionMapper.Map(form);
            
            consejoComision.CreadoPor = CurrentUser();
            consejoComision.ModificadoPor = CurrentUser();

            if(!IsValidateModel(consejoComision, form, Title.New))
                return ViewNew();

            catalogoService.SaveConsejoComision(consejoComision);

            return RedirectToIndex(String.Format("Consejo ó Comisión {0} ha sido creado", consejoComision.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ConsejoComisionForm form)
        {
            var consejoComision = consejoComisionMapper.Map(form);
            
            consejoComision.ModificadoPor = CurrentUser();

            if (!IsValidateModel(consejoComision, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveConsejoComision(consejoComision);

            return RedirectToIndex(String.Format("Consejo ó Comisión {0} ha sido modificado", consejoComision.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var consejoComision = catalogoService.GetConsejoComisionById(id);
            consejoComision.Activo = true;
            consejoComision.ModificadoPor = CurrentUser();
            catalogoService.SaveConsejoComision(consejoComision);

            var form = consejoComisionMapper.Map(consejoComision);
            
            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var consejoComision = catalogoService.GetConsejoComisionById(id);
            consejoComision.Activo = false;
            consejoComision.ModificadoPor = CurrentUser();
            catalogoService.SaveConsejoComision(consejoComision);

            var form = consejoComisionMapper.Map(consejoComision);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<ConsejoComision>(x => x.Nombre, q);
            return Content(data);
        }
    }
}