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
    public class SubprogramaConacytController : BaseController<SubprogramaConacyt, SubprogramaConacytForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ISubprogramaConacytMapper subprogramaConacytMapper;
    
        public SubprogramaConacytController(IUsuarioService usuarioService, 
                                            ICatalogoService catalogoService, 
                                            ISubprogramaConacytMapper subprogramaConacytMapper,
                                            ISearchService searchService) 
            : base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.subprogramaConacytMapper = subprogramaConacytMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var subprogramaConacyts = catalogoService.GetAllSubprogramasConacyt();
            data.List = subprogramaConacytMapper.Map(subprogramaConacyts);

            return View(data);
        }
        
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new SubprogramaConacytForm();
			
            return View(data);
        }
        
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var subprogramaConacyt = catalogoService.GetSubprogramaConacytById(id);
            data.Form = subprogramaConacytMapper.Map(subprogramaConacyt);

            ViewData.Model = data;
            return View();
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(SubprogramaConacytForm form)
        {
            var subprogramaConacyt = subprogramaConacytMapper.Map(form);
            
            subprogramaConacyt.CreadorPor = CurrentUser();
            subprogramaConacyt.ModificadoPor = CurrentUser();

            if(!IsValidateModel(subprogramaConacyt, form, Title.New))
                return ViewNew();

            catalogoService.SaveSubprogramaConacyt(subprogramaConacyt);

            return RedirectToIndex(String.Format("Subprograma del Conacyt {0} ha sido creado", subprogramaConacyt.Nombre));
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(SubprogramaConacytForm form)
        {
            var subprogramaConacyt = subprogramaConacytMapper.Map(form);
            
            subprogramaConacyt.ModificadoPor = CurrentUser();

            if (!IsValidateModel(subprogramaConacyt, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveSubprogramaConacyt(subprogramaConacyt);

            return RedirectToIndex(String.Format("Subprograma del Conacyt {0} ha sido modificado", subprogramaConacyt.Nombre));
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var subprogramaConacyt = catalogoService.GetSubprogramaConacytById(id);
            subprogramaConacyt.Activo = true;
            subprogramaConacyt.ModificadoPor = CurrentUser();
            catalogoService.SaveSubprogramaConacyt(subprogramaConacyt);

            var form = subprogramaConacytMapper.Map(subprogramaConacyt);
            
            return Rjs(form);
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var subprogramaConacyt = catalogoService.GetSubprogramaConacytById(id);
            subprogramaConacyt.Activo = false;
            subprogramaConacyt.ModificadoPor = CurrentUser();
            catalogoService.SaveSubprogramaConacyt(subprogramaConacyt);

            var form = subprogramaConacytMapper.Map(subprogramaConacyt);
            
            return Rjs("Activate", form);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<SubprogramaConacyt>(x => x.Nombre, q);
            return Content(data);
        }
    }
}