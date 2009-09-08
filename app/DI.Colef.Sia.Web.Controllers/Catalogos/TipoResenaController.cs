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
    public class TipoResenaController : BaseController<TipoResena, TipoResenaForm>
    {
		readonly ICatalogoService catalogoService;
        readonly ITipoResenaMapper tipoResenaMapper;

        public TipoResenaController(IUsuarioService usuarioService, 
                                    ICatalogoService catalogoService, 
                                    ITipoResenaMapper tipoResenaMapper,
                                    ISearchService searchService) 
			: base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.tipoResenaMapper = tipoResenaMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);

            var tipoResenas = catalogoService.GetAllTipoResenas();
            data.List = tipoResenaMapper.Map(tipoResenas);

            return View(data);
        }
        
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new TipoResenaForm();
			
			return View(data);
        }
        
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tipoResena = catalogoService.GetTipoResenaById(id);
            data.Form = tipoResenaMapper.Map(tipoResena);

			ViewData.Model = data;
            return View();
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoResenaForm form)
        {
        
            var tipoResena = tipoResenaMapper.Map(form);
            
            tipoResena.CreadorPor = CurrentUser();
            tipoResena.ModificadoPor = CurrentUser();

            if(!IsValidateModel(tipoResena, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoResena(tipoResena);

            return RedirectToIndex(String.Format("Tipo de Reseña {0} ha sido creada", tipoResena.Nombre));
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoResenaForm form)
        {
        
            var tipoResena = tipoResenaMapper.Map(form);
            
            tipoResena.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoResena, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoResena(tipoResena);

            return RedirectToIndex(String.Format("Tipo de Reseña {0} ha sido modificada", tipoResena.Nombre));
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoResena = catalogoService.GetTipoResenaById(id);
            tipoResena.Activo = true;
            tipoResena.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoResena(tipoResena);

            var form = tipoResenaMapper.Map(tipoResena);
            
            return Rjs(form);
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoResena = catalogoService.GetTipoResenaById(id);
            tipoResena.Activo = false;
            tipoResena.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoResena(tipoResena);

            var form = tipoResenaMapper.Map(tipoResena);
            
            return Rjs("Activate", form);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<TipoResena>(x => x.Nombre, q);
            return Content(data);
        }
    }
}
