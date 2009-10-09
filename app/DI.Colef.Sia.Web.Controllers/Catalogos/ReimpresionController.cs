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
    public class ReimpresionController : BaseController<Reimpresion, ReimpresionForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IReimpresionMapper reimpresionMapper;
    
        public ReimpresionController(IUsuarioService usuarioService, ICatalogoService catalogoService, 
                                     IReimpresionMapper reimpresionMapper, ISearchService searchService) 
            : base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.reimpresionMapper = reimpresionMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);
			
            var reimpresions = catalogoService.GetAllReimpresions();
            data.List = reimpresionMapper.Map(reimpresions);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new ReimpresionForm();
			
            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var reimpresion = catalogoService.GetReimpresionById(id);
            data.Form = reimpresionMapper.Map(reimpresion);

            ViewData.Model = data;
            return View();
        }
        
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ReimpresionForm form)
        {
        
            var reimpresion = reimpresionMapper.Map(form);
            
            reimpresion.CreadorPor = CurrentUser();
            reimpresion.ModificadoPor = CurrentUser();

            if(!IsValidateModel(reimpresion, form, Title.New))
                return ViewNew();

            catalogoService.SaveReimpresion(reimpresion);

            return RedirectToIndex(String.Format("Reimpresión {0} ha sido creada", reimpresion.Nombre));
        }
        
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ReimpresionForm form)
        {
        
            var reimpresion = reimpresionMapper.Map(form);
            
            reimpresion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(reimpresion, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveReimpresion(reimpresion);

            return RedirectToIndex(String.Format("Reimpresión {0} ha sido modificada", reimpresion.Nombre));
        }
        
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var reimpresion = catalogoService.GetReimpresionById(id);
            reimpresion.Activo = true;
            reimpresion.ModificadoPor = CurrentUser();
            catalogoService.SaveReimpresion(reimpresion);

            var form = reimpresionMapper.Map(reimpresion);
            
            return Rjs(form);
        }
        
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var reimpresion = catalogoService.GetReimpresionById(id);
            reimpresion.Activo = false;
            reimpresion.ModificadoPor = CurrentUser();
            catalogoService.SaveReimpresion(reimpresion);

            var form = reimpresionMapper.Map(reimpresion);
            
            return Rjs("Activate", form);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Reimpresion>(x => x.Nombre, q);
            return Content(data);
        }
    }
}