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
    public class LineaInvestigacionController : BaseController<LineaInvestigacion, LineaInvestigacionForm>
    {
		readonly ICatalogoService catalogoService;
        readonly ILineaInvestigacionMapper lineaInvestigacionMapper;

        public LineaInvestigacionController(ICatalogoService catalogoService, ILineaInvestigacionMapper lineaInvestigacionMapper) 
        {
            this.catalogoService = catalogoService;
            this.lineaInvestigacionMapper = lineaInvestigacionMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);

            var lineaInvestigacions = catalogoService.GetAllLineaInvestigacions();
            data.List = lineaInvestigacionMapper.Map(lineaInvestigacions);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new LineaInvestigacionForm();
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var lineaInvestigacion = catalogoService.GetLineaInvestigacionById(id);
            data.Form = lineaInvestigacionMapper.Map(lineaInvestigacion);

			ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var lineaInvestigacion = catalogoService.GetLineaInvestigacionById(id);
            data.Form = lineaInvestigacionMapper.Map(lineaInvestigacion);
            
            ViewData.Model = data;
            return View();
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(LineaInvestigacionForm form)
        {
        
            var lineaInvestigacion = lineaInvestigacionMapper.Map(form);

            if(!IsValidateModel(lineaInvestigacion, form, Title.New))
                return ViewNew();

            catalogoService.SaveLineaInvestigacion(lineaInvestigacion);

            return RedirectToIndex(String.Format("{0} ha sido creado", lineaInvestigacion.Nombre));
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(LineaInvestigacionForm form)
        {
        
            var lineaInvestigacion = lineaInvestigacionMapper.Map(form);

            if (!IsValidateModel(lineaInvestigacion, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveLineaInvestigacion(lineaInvestigacion);

            return RedirectToIndex(String.Format("{0} ha sido modificado", lineaInvestigacion.Nombre));
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var lineaInvestigacion = catalogoService.GetLineaInvestigacionById(id);
            lineaInvestigacion.Activo = true;
            catalogoService.SaveLineaInvestigacion(lineaInvestigacion);

            var form = lineaInvestigacionMapper.Map(lineaInvestigacion);
            
            return Rjs(form);
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var lineaInvestigacion = catalogoService.GetLineaInvestigacionById(id);
            lineaInvestigacion.Activo = false;
            catalogoService.SaveLineaInvestigacion(lineaInvestigacion);

            var form = lineaInvestigacionMapper.Map(lineaInvestigacion);
            
            return Rjs("Activate", form);
        }
    }
}
