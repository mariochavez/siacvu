using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class CoordinacionController : BaseController<Coordinacion, CoordinacionForm>
    {
		readonly ICatalogoService catalogoService;
        readonly ICoordinacionMapper coordinacionMapper;

        public CoordinacionController(IUsuarioService usuarioService, ICatalogoService catalogoService, 
                                      ICoordinacionMapper coordinacionMapper, ISearchService searchService) 
			: base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.coordinacionMapper = coordinacionMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);

            var coordinacions = catalogoService.GetAllCoordinacions();
            data.List = coordinacionMapper.Map(coordinacions);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new CoordinacionForm();
			
			return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var coordinacion = catalogoService.GetCoordinacionById(id);
            data.Form = coordinacionMapper.Map(coordinacion);

			ViewData.Model = data;
            return View();
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(CoordinacionForm form)
        {
        
            var coordinacion = coordinacionMapper.Map(form);
            
            coordinacion.CreadoPor = CurrentUser();
            coordinacion.ModificadoPor = CurrentUser();

            if(!IsValidateModel(coordinacion, form, Title.New))
                return ViewNew();

            catalogoService.SaveCoordinacion(coordinacion);

            return RedirectToIndex(String.Format("Coordinación {0} ha sido creada", coordinacion.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(CoordinacionForm form)
        {
        
            var coordinacion = coordinacionMapper.Map(form);
            
            coordinacion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(coordinacion, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveCoordinacion(coordinacion);

            return RedirectToIndex(String.Format("Coordinación {0} ha sido modificada", coordinacion.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var coordinacion = catalogoService.GetCoordinacionById(id);
            coordinacion.Activo = true;
            coordinacion.ModificadoPor = CurrentUser();
            catalogoService.SaveCoordinacion(coordinacion);

            var form = coordinacionMapper.Map(coordinacion);
            
            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var coordinacion = catalogoService.GetCoordinacionById(id);
            coordinacion.Activo = false;
            coordinacion.ModificadoPor = CurrentUser();
            catalogoService.SaveCoordinacion(coordinacion);

            var form = coordinacionMapper.Map(coordinacion);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Coordinacion>(x => x.Nombre, q);
            return Content(data);
        }
    }
}
