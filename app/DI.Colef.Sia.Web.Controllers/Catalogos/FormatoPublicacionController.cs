using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    public class FormatoPublicacionController : BaseController<FormatoPublicacion, FormatoPublicacionForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IFormatoPublicacionMapper formatoPublicacionMapper;
    
        public FormatoPublicacionController(IUsuarioService usuarioService, ICatalogoService catalogoService, 
                                            IFormatoPublicacionMapper formatoPublicacionMapper, ISearchService searchService) 
            : base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.formatoPublicacionMapper = formatoPublicacionMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);
			
            var formatoPublicacions = catalogoService.GetAllFormatoPublicacions();
            data.List = formatoPublicacionMapper.Map(formatoPublicacions);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new FormatoPublicacionForm();
			
            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var formatoPublicacion = catalogoService.GetFormatoPublicacionById(id);
            data.Form = formatoPublicacionMapper.Map(formatoPublicacion);

            ViewData.Model = data;
            return View();
        }
        
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(FormatoPublicacionForm form)
        {
        
            var formatoPublicacion = formatoPublicacionMapper.Map(form);
            
            formatoPublicacion.CreadorPor = CurrentUser();
            formatoPublicacion.ModificadoPor = CurrentUser();

            if(!IsValidateModel(formatoPublicacion, form, Title.New))
                return ViewNew();

            catalogoService.SaveFormatoPublicacion(formatoPublicacion);

            return RedirectToIndex(String.Format("Formato de publicación {0} ha sido creado", formatoPublicacion.Nombre));
        }
        
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(FormatoPublicacionForm form)
        {
        
            var formatoPublicacion = formatoPublicacionMapper.Map(form);
            
            formatoPublicacion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(formatoPublicacion, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveFormatoPublicacion(formatoPublicacion);

            return RedirectToIndex(String.Format("Formato de publicación {0} ha sido modificado", formatoPublicacion.Nombre));
        }
        
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var formatoPublicacion = catalogoService.GetFormatoPublicacionById(id);
            formatoPublicacion.Activo = true;
            formatoPublicacion.ModificadoPor = CurrentUser();
            catalogoService.SaveFormatoPublicacion(formatoPublicacion);

            var form = formatoPublicacionMapper.Map(formatoPublicacion);
            
            return Rjs(form);
        }
        
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var formatoPublicacion = catalogoService.GetFormatoPublicacionById(id);
            formatoPublicacion.Activo = false;
            formatoPublicacion.ModificadoPor = CurrentUser();
            catalogoService.SaveFormatoPublicacion(formatoPublicacion);

            var form = formatoPublicacionMapper.Map(formatoPublicacion);
            
            return Rjs("Activate", form);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<FormatoPublicacion>(x => x.Nombre, q);
            return Content(data);
        }
    }
}