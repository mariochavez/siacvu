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
    public class DependenciaController : BaseController<Dependencia, DependenciaForm>
    {
		readonly ICatalogoService catalogoService;
        readonly IDependenciaMapper dependenciaMapper;

        public DependenciaController(IUsuarioService usuarioService, ICatalogoService catalogoService, IDependenciaMapper dependenciaMapper) 
			: base (usuarioService)
        {
            this.catalogoService = catalogoService;
            this.dependenciaMapper = dependenciaMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);

            var dependencias = catalogoService.GetAllDependencias();
            data.List = dependenciaMapper.Map(dependencias);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new DependenciaForm();
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var dependencia = catalogoService.GetDependenciaById(id);
            data.Form = dependenciaMapper.Map(dependencia);

			ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var dependencia = catalogoService.GetDependenciaById(id);
            data.Form = dependenciaMapper.Map(dependencia);
            
            ViewData.Model = data;
            return View();
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(DependenciaForm form)
        {
        
            var dependencia = dependenciaMapper.Map(form);
            
            dependencia.CreadorPor = CurrentUser();
            dependencia.ModificadoPor = CurrentUser();

            if(!IsValidateModel(dependencia, form, Title.New))
                return ViewNew();

            catalogoService.SaveDependencia(dependencia);

            return RedirectToIndex(String.Format("{0} ha sido creado", dependencia.Nombre));
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(DependenciaForm form)
        {
        
            var dependencia = dependenciaMapper.Map(form);
            
            dependencia.ModificadoPor = CurrentUser();

            if (!IsValidateModel(dependencia, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveDependencia(dependencia);

            return RedirectToIndex(String.Format("{0} ha sido modificado", dependencia.Nombre));
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var dependencia = catalogoService.GetDependenciaById(id);
            dependencia.Activo = true;
            dependencia.ModificadoPor = CurrentUser();
            catalogoService.SaveDependencia(dependencia);

            var form = dependenciaMapper.Map(dependencia);
            
            return Rjs(form);
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var dependencia = catalogoService.GetDependenciaById(id);
            dependencia.Activo = false;
            dependencia.ModificadoPor = CurrentUser();
            catalogoService.SaveDependencia(dependencia);

            var form = dependenciaMapper.Map(dependencia);
            
            return Rjs("Activate", form);
        }
    }
}
