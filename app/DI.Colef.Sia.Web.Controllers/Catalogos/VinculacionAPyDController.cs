using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    public class VinculacionAPyDController : BaseController<VinculacionAPyD, VinculacionAPyDForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IVinculacionAPyDMapper vinculacionAPyDMapper;
    
        public VinculacionAPyDController(IUsuarioService usuarioService, ICatalogoService catalogoService, 
                                         IVinculacionAPyDMapper vinculacionAPyDMapper, ISearchService searchService) 
            : base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.vinculacionAPyDMapper = vinculacionAPyDMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);
			
            var vinculacionAPyDs = catalogoService.GetAllVinculacionAPyDs();
            data.List = vinculacionAPyDMapper.Map(vinculacionAPyDs);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new VinculacionAPyDForm();
			
            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var vinculacionAPyD = catalogoService.GetVinculacionAPyDById(id);
            data.Form = vinculacionAPyDMapper.Map(vinculacionAPyD);

            ViewData.Model = data;
            return View();
        }
        
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(VinculacionAPyDForm form)
        {
        
            var vinculacionAPyD = vinculacionAPyDMapper.Map(form);
            
            vinculacionAPyD.CreadoPor = CurrentUser();
            vinculacionAPyD.ModificadoPor = CurrentUser();

            if(!IsValidateModel(vinculacionAPyD, form, Title.New))
                return ViewNew();

            catalogoService.SaveVinculacionAPyD(vinculacionAPyD);

            return RedirectToIndex(String.Format("Vinculación APyD {0} ha sido creada", vinculacionAPyD.Nombre));
        }
        
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(VinculacionAPyDForm form)
        {
        
            var vinculacionAPyD = vinculacionAPyDMapper.Map(form);
            
            vinculacionAPyD.ModificadoPor = CurrentUser();

            if (!IsValidateModel(vinculacionAPyD, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveVinculacionAPyD(vinculacionAPyD);

            return RedirectToIndex(String.Format("Vinculación APyD {0} ha sido modificada", vinculacionAPyD.Nombre));
        }
        
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var vinculacionAPyD = catalogoService.GetVinculacionAPyDById(id);
            vinculacionAPyD.Activo = true;
            vinculacionAPyD.ModificadoPor = CurrentUser();
            catalogoService.SaveVinculacionAPyD(vinculacionAPyD);

            var form = vinculacionAPyDMapper.Map(vinculacionAPyD);
            
            return Rjs(form);
        }
        
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var vinculacionAPyD = catalogoService.GetVinculacionAPyDById(id);
            vinculacionAPyD.Activo = false;
            vinculacionAPyD.ModificadoPor = CurrentUser();
            catalogoService.SaveVinculacionAPyD(vinculacionAPyD);

            var form = vinculacionAPyDMapper.Map(vinculacionAPyD);
            
            return Rjs("Activate", form);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<VinculacionAPyD>(x => x.Nombre, q);
            return Content(data);
        }
    }
}