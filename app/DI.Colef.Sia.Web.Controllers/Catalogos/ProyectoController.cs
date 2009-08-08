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
    public class ProyectoController : BaseController<Proyecto, ProyectoForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IProyectoMapper proyectoMapper;

        public ProyectoController(IUsuarioService usuarioService, ICatalogoService catalogoService, IProyectoMapper proyectoMapper) 
			: base (usuarioService)
        {
            this.catalogoService = catalogoService;
            this.proyectoMapper = proyectoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);

            var proyectos = catalogoService.GetAllProyectos();
            data.List = proyectoMapper.Map(proyectos);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new ProyectoForm();
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var proyecto = catalogoService.GetProyectoById(id);
            data.Form = proyectoMapper.Map(proyecto);

			ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var proyecto = catalogoService.GetProyectoById(id);
            data.Form = proyectoMapper.Map(proyecto);
            
            ViewData.Model = data;
            return View();
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ProyectoForm form)
        {
        
            var proyecto = proyectoMapper.Map(form);
            
            proyecto.CreadorPor = CurrentUser();
            proyecto.ModificadoPor = CurrentUser();

            if(!IsValidateModel(proyecto, form, Title.New))
                return ViewNew();

            catalogoService.SaveProyecto(proyecto);

            return RedirectToIndex(String.Format("{0} ha sido creado", proyecto.Nombre));
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ProyectoForm form)
        {
        
            var proyecto = proyectoMapper.Map(form);
            
            proyecto.ModificadoPor = CurrentUser();

            if (!IsValidateModel(proyecto, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveProyecto(proyecto);

            return RedirectToIndex(String.Format("{0} ha sido modificado", proyecto.Nombre));
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var proyecto = catalogoService.GetProyectoById(id);
            proyecto.Activo = true;
            proyecto.ModificadoPor = CurrentUser();
            catalogoService.SaveProyecto(proyecto);

            var form = proyectoMapper.Map(proyecto);
            
            return Rjs(form);
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var proyecto = catalogoService.GetProyectoById(id);
            proyecto.Activo = false;
            proyecto.ModificadoPor = CurrentUser();
            catalogoService.SaveProyecto(proyecto);

            var form = proyectoMapper.Map(proyecto);
            
            return Rjs("Activate", form);
        }
    }
}
