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
    public class DiplomadoController : BaseController<Diplomado, DiplomadoForm>
    {
		readonly ICatalogoService catalogoService;
        readonly IDiplomadoMapper diplomadoMapper;
    
        public DiplomadoController(IUsuarioService usuarioService,
                                   ICatalogoService catalogoService, 
								   IDiplomadoMapper diplomadoMapper,
                                   ISearchService searchService) 
			: base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.diplomadoMapper = diplomadoMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);
			
			var diplomados = catalogoService.GetAllDiplomados();
            data.List = diplomadoMapper.Map(diplomados);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new DiplomadoForm();
			
			return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var diplomado = catalogoService.GetDiplomadoById(id);
            data.Form = diplomadoMapper.Map(diplomado);

			ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(DiplomadoForm form)
        {
        
            var diplomado = diplomadoMapper.Map(form);
            
            diplomado.CreadorPor = CurrentUser();
            diplomado.ModificadoPor = CurrentUser();

            if(!IsValidateModel(diplomado, form, Title.New))
                return ViewNew();

            catalogoService.SaveDiplomado(diplomado);

            return RedirectToIndex(String.Format("Diplomado {0} ha sido creado", diplomado.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(DiplomadoForm form)
        {
        
            var diplomado = diplomadoMapper.Map(form);
            
            diplomado.ModificadoPor = CurrentUser();

            if (!IsValidateModel(diplomado, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveDiplomado(diplomado);

            return RedirectToIndex(String.Format("Diplomado {0} ha sido modificado", diplomado.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var diplomado = catalogoService.GetDiplomadoById(id);
            diplomado.Activo = true;
            diplomado.ModificadoPor = CurrentUser();
            catalogoService.SaveDiplomado(diplomado);

            var form = diplomadoMapper.Map(diplomado);
            
            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var diplomado = catalogoService.GetDiplomadoById(id);
            diplomado.Activo = false;
            diplomado.ModificadoPor = CurrentUser();
            catalogoService.SaveDiplomado(diplomado);

            var form = diplomadoMapper.Map(diplomado);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Diplomado>(x => x.Nombre, q);
            return Content(data);
        }
    }
}