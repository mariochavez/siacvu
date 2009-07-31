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
    public class TipoActividadController : BaseController<TipoActividad, TipoActividadForm>
    {
		readonly ICatalogoService catalogoService;
        readonly ITipoActividadMapper tipoActividadMapper;

        public TipoActividadController(ICatalogoService catalogoService, ITipoActividadMapper tipoActividadMapper) 
        {
            this.catalogoService = catalogoService;
            this.tipoActividadMapper = tipoActividadMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);

            var tipoActividads = catalogoService.GetAllTipoActividads();
            data.List = tipoActividadMapper.Map(tipoActividads);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new TipoActividadForm();
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tipoActividad = catalogoService.GetTipoActividadById(id);
            data.Form = tipoActividadMapper.Map(tipoActividad);

			ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var tipoActividad = catalogoService.GetTipoActividadById(id);
            data.Form = tipoActividadMapper.Map(tipoActividad);
            
            ViewData.Model = data;
            return View();
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoActividadForm form)
        {
        
            var tipoActividad = tipoActividadMapper.Map(form);

            if(!IsValidateModel(tipoActividad, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoActividad(tipoActividad);

            return RedirectToIndex(String.Format("{0} ha sido creada", tipoActividad.Nombre));
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoActividadForm form)
        {
        
            var tipoActividad = tipoActividadMapper.Map(form);

            if (!IsValidateModel(tipoActividad, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoActividad(tipoActividad);

            return RedirectToIndex(String.Format("{0} ha sido modificada", tipoActividad.Nombre));
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoActividad = catalogoService.GetTipoActividadById(id);
            tipoActividad.Activo = true;
            catalogoService.SaveTipoActividad(tipoActividad);

            var form = tipoActividadMapper.Map(tipoActividad);
            
            return Rjs(form);
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoActividad = catalogoService.GetTipoActividadById(id);
            tipoActividad.Activo = false;
            catalogoService.SaveTipoActividad(tipoActividad);

            var form = tipoActividadMapper.Map(tipoActividad);
            
            return Rjs("Activate", form);
        }
    }
}
