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
    public class DirigidoAController : BaseController<DirigidoA, DirigidoAForm>
    {
		readonly ICatalogoService catalogoService;
        readonly IDirigidoAMapper dirigidoAMapper;
    
        public DirigidoAController(IUsuarioService usuarioService, ICatalogoService catalogoService, 
																	IDirigidoAMapper dirigidoAMapper, ISearchService searchService) 
			: base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.dirigidoAMapper = dirigidoAMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);
			
			var dirigidoAs = catalogoService.GetAllDirigidoAs();
            data.List = dirigidoAMapper.Map(dirigidoAs);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new DirigidoAForm();
			
			return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var dirigidoA = catalogoService.GetDirigidoAById(id);
            data.Form = dirigidoAMapper.Map(dirigidoA);

			ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(DirigidoAForm form)
        {
            var dirigidoA = dirigidoAMapper.Map(form);
            
            dirigidoA.CreadoPor = CurrentUser();
            dirigidoA.ModificadoPor = CurrentUser();

            if(!IsValidateModel(dirigidoA, form, Title.New))
                return ViewNew();

            catalogoService.SaveDirigidoA(dirigidoA);

            return RedirectToIndex(String.Format("Dirigido a {0} ha sido creado", dirigidoA.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(DirigidoAForm form)
        {
            var dirigidoA = dirigidoAMapper.Map(form);
            
            dirigidoA.ModificadoPor = CurrentUser();

            if (!IsValidateModel(dirigidoA, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveDirigidoA(dirigidoA);

            return RedirectToIndex(String.Format("Dirigido a {0} ha sido modificado", dirigidoA.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var dirigidoA = catalogoService.GetDirigidoAById(id);
            dirigidoA.Activo = true;
            dirigidoA.ModificadoPor = CurrentUser();
            catalogoService.SaveDirigidoA(dirigidoA);

            var form = dirigidoAMapper.Map(dirigidoA);
            
            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var dirigidoA = catalogoService.GetDirigidoAById(id);
            dirigidoA.Activo = false;
            dirigidoA.ModificadoPor = CurrentUser();
            catalogoService.SaveDirigidoA(dirigidoA);

            var form = dirigidoAMapper.Map(dirigidoA);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<DirigidoA>(x => x.Nombre, q);
            return Content(data);
        }
    }
}
