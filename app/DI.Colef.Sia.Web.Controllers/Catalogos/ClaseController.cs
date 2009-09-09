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
    public class ClaseController : BaseController<Clase, ClaseForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IClaseMapper claseMapper;
    
        public ClaseController(IUsuarioService usuarioService, 
                               ICatalogoService catalogoService, 
                               IClaseMapper claseMapper,
                               ISearchService searchService) 
            : base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.claseMapper = claseMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var clases = catalogoService.GetAllClases();
            data.List = claseMapper.Map(clases);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new ClaseForm();
			
            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var clase = catalogoService.GetClaseById(id);
            data.Form = claseMapper.Map(clase);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ClaseForm form)
        {
        
            var clase = claseMapper.Map(form);
            
            clase.CreadorPor = CurrentUser();
            clase.ModificadoPor = CurrentUser();

            if(!IsValidateModel(clase, form, Title.New))
                return ViewNew();

            catalogoService.SaveClase(clase);

            return RedirectToIndex(String.Format("Clase {0} ha sido creada", clase.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ClaseForm form)
        {
        
            var clase = claseMapper.Map(form);
            
            clase.ModificadoPor = CurrentUser();

            if (!IsValidateModel(clase, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveClase(clase);

            return RedirectToIndex(String.Format("Clase {0} ha sido modificada", clase.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var clase = catalogoService.GetClaseById(id);
            clase.Activo = true;
            clase.ModificadoPor = CurrentUser();
            catalogoService.SaveClase(clase);

            var form = claseMapper.Map(clase);
            
            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var clase = catalogoService.GetClaseById(id);
            clase.Activo = false;
            clase.ModificadoPor = CurrentUser();
            catalogoService.SaveClase(clase);

            var form = claseMapper.Map(clase);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Clase>(x => x.Nombre, q);
            return Content(data);
        }
    }
}