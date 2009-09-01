using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    public class USEGController : BaseController<USEG, USEGForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IUSEGMapper uSEGMapper;
    
        public USEGController(IUsuarioService usuarioService,
                              ICatalogoService catalogoService,
                              ISearchService searchService,
                              IUSEGMapper uSEGMapper)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.uSEGMapper = uSEGMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var uSEGs = catalogoService.GetAllUSEGs();
            data.List = uSEGMapper.Map(uSEGs);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new USEGForm();
			
            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var uSEG = catalogoService.GetUSEGById(id);
            data.Form = uSEGMapper.Map(uSEG);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var uSEG = catalogoService.GetUSEGById(id);
            data.Form = uSEGMapper.Map(uSEG);
            
            ViewData.Model = data;
            return View();
        }
        
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(USEGForm form)
        {        
            var uSEG = uSEGMapper.Map(form);
            
            uSEG.CreadorPor = CurrentUser();
            uSEG.ModificadoPor = CurrentUser();

            if(!IsValidateModel(uSEG, form, Title.New))
                return ViewNew();

            catalogoService.SaveUSEG(uSEG);

            return RedirectToIndex(String.Format("USEG {0} ha sido creado", uSEG.Nombre));
        }
        
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(USEGForm form)
        {        
            var uSEG = uSEGMapper.Map(form);
            
            uSEG.ModificadoPor = CurrentUser();

            if (!IsValidateModel(uSEG, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveUSEG(uSEG);

            return RedirectToIndex(String.Format("USEG {0} ha sido modificado", uSEG.Nombre));
        }
        
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var uSEG = catalogoService.GetUSEGById(id);
            uSEG.Activo = true;
            uSEG.ModificadoPor = CurrentUser();
            catalogoService.SaveUSEG(uSEG);

            var form = uSEGMapper.Map(uSEG);
            
            return Rjs(form);
        }
        
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var uSEG = catalogoService.GetUSEGById(id);
            uSEG.Activo = false;
            uSEG.ModificadoPor = CurrentUser();
            catalogoService.SaveUSEG(uSEG);

            var form = uSEGMapper.Map(uSEG);
            
            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<USEG>(x => x.Nombre, q);
            return Content(data);
        }
    }
}