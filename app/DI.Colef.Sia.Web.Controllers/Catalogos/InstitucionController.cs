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
    public class InstitucionController : BaseController<Institucion, InstitucionForm>
    {
		readonly ICatalogoService catalogoService;
        readonly IInstitucionMapper institucionMapper;

        public InstitucionController(ICatalogoService catalogoService, IInstitucionMapper institucionMapper) 
        {
            this.catalogoService = catalogoService;
            this.institucionMapper = institucionMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);

            var institucions = catalogoService.GetAllInstitucions();
            data.List = institucionMapper.Map(institucions);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new InstitucionForm();
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var institucion = catalogoService.GetInstitucionById(id);
            data.Form = institucionMapper.Map(institucion);

			ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var institucion = catalogoService.GetInstitucionById(id);
            data.Form = institucionMapper.Map(institucion);
            
            ViewData.Model = data;
            return View();
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(InstitucionForm form)
        {
        
            var institucion = institucionMapper.Map(form);

            if(!IsValidateModel(institucion, form, Title.New))
                return ViewNew();

            catalogoService.SaveInstitucion(institucion);

            return RedirectToIndex(String.Format("{0} ha sido creado", institucion.Nombre));
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(InstitucionForm form)
        {
        
            var institucion = institucionMapper.Map(form);

            if (!IsValidateModel(institucion, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveInstitucion(institucion);

            return RedirectToIndex(String.Format("{0} ha sido modificado", institucion.Nombre));
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var institucion = catalogoService.GetInstitucionById(id);
            institucion.Activo = true;
            catalogoService.SaveInstitucion(institucion);

            var form = institucionMapper.Map(institucion);
            
            return Rjs(form);
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var institucion = catalogoService.GetInstitucionById(id);
            institucion.Activo = false;
            catalogoService.SaveInstitucion(institucion);

            var form = institucionMapper.Map(institucion);
            
            return Rjs("Activate", form);
        }
    }
}
