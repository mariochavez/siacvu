using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class TipoEstudianteController : BaseController<TipoEstudiante, TipoEstudianteForm>
    {
		readonly ICatalogoService catalogoService;
        readonly ITipoEstudianteMapper tipoEstudianteMapper;
    
        public TipoEstudianteController(IUsuarioService usuarioService, ICatalogoService catalogoService, 
																	ITipoEstudianteMapper tipoEstudianteMapper, ISearchService searchService) 
			: base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.tipoEstudianteMapper = tipoEstudianteMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);
			
			var tipoEstudiantes = catalogoService.GetAllTipoEstudiantes();
            data.List = tipoEstudianteMapper.Map(tipoEstudiantes);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new TipoEstudianteForm();
			
			return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tipoEstudiante = catalogoService.GetTipoEstudianteById(id);
            data.Form = tipoEstudianteMapper.Map(tipoEstudiante);

			ViewData.Model = data;
            return View();
        }
        
        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoEstudianteForm form)
        {
        
            var tipoEstudiante = tipoEstudianteMapper.Map(form);
            
            tipoEstudiante.CreadorPor = CurrentUser();
            tipoEstudiante.ModificadoPor = CurrentUser();

            if(!IsValidateModel(tipoEstudiante, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoEstudiante(tipoEstudiante);

            return RedirectToIndex(String.Format("Tipo de estudiante {0} ha sido creado", tipoEstudiante.Nombre));
        }
        
        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoEstudianteForm form)
        {
        
            var tipoEstudiante = tipoEstudianteMapper.Map(form);
            
            tipoEstudiante.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoEstudiante, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoEstudiante(tipoEstudiante);

            return RedirectToIndex(String.Format("Tipo de estudiante {0} ha sido modificado", tipoEstudiante.Nombre));
        }
        
        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoEstudiante = catalogoService.GetTipoEstudianteById(id);
            tipoEstudiante.Activo = true;
            tipoEstudiante.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoEstudiante(tipoEstudiante);

            var form = tipoEstudianteMapper.Map(tipoEstudiante);
            
            return Rjs(form);
        }
        
        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoEstudiante = catalogoService.GetTipoEstudianteById(id);
            tipoEstudiante.Activo = false;
            tipoEstudiante.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoEstudiante(tipoEstudiante);

            var form = tipoEstudianteMapper.Map(tipoEstudiante);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<TipoEstudiante>(x => x.Nombre, q);
            return Content(data);
        }
    }
}
