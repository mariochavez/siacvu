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
    public class RamaController : BaseController<Rama, RamaForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IRamaMapper ramaMapper;
    
        public RamaController(IUsuarioService usuarioService, 
                              ICatalogoService catalogoService, 
                              IRamaMapper ramaMapper,
                              ISearchService searchService) 
            : base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.ramaMapper = ramaMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var ramas = catalogoService.GetAllRamas();
            data.List = ramaMapper.Map(ramas);

            return View(data);
        }
        
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new RamaForm();
			
            return View(data);
        }
        
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var rama = catalogoService.GetRamaById(id);
            data.Form = ramaMapper.Map(rama);

            ViewData.Model = data;
            return View();
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(RamaForm form)
        {
            var rama = ramaMapper.Map(form);
            
            rama.CreadorPor = CurrentUser();
            rama.ModificadoPor = CurrentUser();

            if(!IsValidateModel(rama, form, Title.New))
                return ViewNew();

            catalogoService.SaveRama(rama);

            return RedirectToIndex(String.Format("Rama {0} ha sido creada", rama.Nombre));
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(RamaForm form)
        {
            var rama = ramaMapper.Map(form);
            
            rama.ModificadoPor = CurrentUser();

            if (!IsValidateModel(rama, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveRama(rama);

            return RedirectToIndex(String.Format("Rama {0} ha sido modificada", rama.Nombre));
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var rama = catalogoService.GetRamaById(id);
            rama.Activo = true;
            rama.ModificadoPor = CurrentUser();
            catalogoService.SaveRama(rama);

            var form = ramaMapper.Map(rama);
            
            return Rjs(form);
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var rama = catalogoService.GetRamaById(id);
            rama.Activo = false;
            rama.ModificadoPor = CurrentUser();
            catalogoService.SaveRama(rama);

            var form = ramaMapper.Map(rama);
            
            return Rjs("Activate", form);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Rama>(x => x.Nombre, q);
            return Content(data);
        }
    }
}