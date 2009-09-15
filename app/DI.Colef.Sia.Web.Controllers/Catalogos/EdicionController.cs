using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class EdicionController : BaseController<Edicion, EdicionForm>
    {
		readonly ICatalogoService catalogoService;
        readonly IEdicionMapper edicionMapper;
    
        public EdicionController(IUsuarioService usuarioService, ICatalogoService catalogoService, 
																	IEdicionMapper edicionMapper, ISearchService searchService) 
			: base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.edicionMapper = edicionMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);
			
			var edicions = catalogoService.GetAllEdicions();
            data.List = edicionMapper.Map(edicions);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new EdicionForm();
			
			return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var edicion = catalogoService.GetEdicionById(id);
            data.Form = edicionMapper.Map(edicion);

			ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(EdicionForm form)
        {
        
            var edicion = edicionMapper.Map(form);
            
            edicion.CreadorPor = CurrentUser();
            edicion.ModificadoPor = CurrentUser();

            if(!IsValidateModel(edicion, form, Title.New))
                return ViewNew();

            catalogoService.SaveEdicion(edicion);

            return RedirectToIndex(String.Format("Edicion {0} ha sido creado", edicion.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(EdicionForm form)
        {
        
            var edicion = edicionMapper.Map(form);
            
            edicion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(edicion, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveEdicion(edicion);

            return RedirectToIndex(String.Format("Edicion {0} ha sido modificado", edicion.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var edicion = catalogoService.GetEdicionById(id);
            edicion.Activo = true;
            edicion.ModificadoPor = CurrentUser();
            catalogoService.SaveEdicion(edicion);

            var form = edicionMapper.Map(edicion);
            
            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var edicion = catalogoService.GetEdicionById(id);
            edicion.Activo = false;
            edicion.ModificadoPor = CurrentUser();
            catalogoService.SaveEdicion(edicion);

            var form = edicionMapper.Map(edicion);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Edicion>(x => x.Nombre, q);
            return Content(data);
        }
    }
}
