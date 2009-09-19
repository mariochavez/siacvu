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
    public class EstatusProyectoController : BaseController<EstatusProyecto, EstatusProyectoForm>
    {
		readonly ICatalogoService catalogoService;
        readonly IEstatusProyectoMapper estatusProyectoMapper;
    
        public EstatusProyectoController(IUsuarioService usuarioService, ICatalogoService catalogoService, 
																	IEstatusProyectoMapper estatusProyectoMapper, ISearchService searchService) 
			: base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.estatusProyectoMapper = estatusProyectoMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);
			
			var estatusProyectos = catalogoService.GetAllEstatusProyectos();
            data.List = estatusProyectoMapper.Map(estatusProyectos);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new EstatusProyectoForm();
			
			return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var estatusProyecto = catalogoService.GetEstatusProyectoById(id);
            data.Form = estatusProyectoMapper.Map(estatusProyecto);

			ViewData.Model = data;
            return View();
        }
        
        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(EstatusProyectoForm form)
        {
        
            var estatusProyecto = estatusProyectoMapper.Map(form);
            
            estatusProyecto.CreadorPor = CurrentUser();
            estatusProyecto.ModificadoPor = CurrentUser();

            if(!IsValidateModel(estatusProyecto, form, Title.New))
                return ViewNew();

            catalogoService.SaveEstatusProyecto(estatusProyecto);

            return RedirectToIndex(String.Format("Estatus del proyecto {0} ha sido creado", estatusProyecto.Nombre));
        }
        
        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(EstatusProyectoForm form)
        {
        
            var estatusProyecto = estatusProyectoMapper.Map(form);
            
            estatusProyecto.ModificadoPor = CurrentUser();

            if (!IsValidateModel(estatusProyecto, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveEstatusProyecto(estatusProyecto);

            return RedirectToIndex(String.Format("Estatus del proyecto {0} ha sido modificado", estatusProyecto.Nombre));
        }
        
        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var estatusProyecto = catalogoService.GetEstatusProyectoById(id);
            estatusProyecto.Activo = true;
            estatusProyecto.ModificadoPor = CurrentUser();
            catalogoService.SaveEstatusProyecto(estatusProyecto);

            var form = estatusProyectoMapper.Map(estatusProyecto);
            
            return Rjs(form);
        }
        
        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var estatusProyecto = catalogoService.GetEstatusProyectoById(id);
            estatusProyecto.Activo = false;
            estatusProyecto.ModificadoPor = CurrentUser();
            catalogoService.SaveEstatusProyecto(estatusProyecto);

            var form = estatusProyectoMapper.Map(estatusProyecto);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<EstatusProyecto>(x => x.Nombre, q);
            return Content(data);
        }
    }
}
