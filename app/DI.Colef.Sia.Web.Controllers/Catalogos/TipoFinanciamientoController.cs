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
    public class TipoFinanciamientoController : BaseController<TipoFinanciamiento, TipoFinanciamientoForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ITipoFinanciamientoMapper tipoFinanciamientoMapper;

        public TipoFinanciamientoController(IUsuarioService usuarioService, ICatalogoService catalogoService, ITipoFinanciamientoMapper tipoFinanciamientoMapper) 
			: base (usuarioService)
        {
            this.catalogoService = catalogoService;
            this.tipoFinanciamientoMapper = tipoFinanciamientoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);

            var tipoFinanciamientos = catalogoService.GetAllTipoFinanciamientos();
            data.List = tipoFinanciamientoMapper.Map(tipoFinanciamientos);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new TipoFinanciamientoForm();
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tipoFinanciamiento = catalogoService.GetTipoFinanciamientoById(id);
            data.Form = tipoFinanciamientoMapper.Map(tipoFinanciamiento);

			ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var tipoFinanciamiento = catalogoService.GetTipoFinanciamientoById(id);
            data.Form = tipoFinanciamientoMapper.Map(tipoFinanciamiento);
            
            ViewData.Model = data;
            return View();
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoFinanciamientoForm form)
        {
        
            var tipoFinanciamiento = tipoFinanciamientoMapper.Map(form);
            
            tipoFinanciamiento.CreadorPor = CurrentUser();
            tipoFinanciamiento.ModificadoPor = CurrentUser();

            if(!IsValidateModel(tipoFinanciamiento, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoFinanciamiento(tipoFinanciamiento);

            return RedirectToIndex(String.Format("{0} ha sido creado", tipoFinanciamiento.Nombre));
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoFinanciamientoForm form)
        {
        
            var tipoFinanciamiento = tipoFinanciamientoMapper.Map(form);
            
            tipoFinanciamiento.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoFinanciamiento, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoFinanciamiento(tipoFinanciamiento);

            return RedirectToIndex(String.Format("{0} ha sido modificado", tipoFinanciamiento.Nombre));
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoFinanciamiento = catalogoService.GetTipoFinanciamientoById(id);
            tipoFinanciamiento.Activo = true;
            tipoFinanciamiento.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoFinanciamiento(tipoFinanciamiento);

            var form = tipoFinanciamientoMapper.Map(tipoFinanciamiento);
            
            return Rjs(form);
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoFinanciamiento = catalogoService.GetTipoFinanciamientoById(id);
            tipoFinanciamiento.Activo = false;
            tipoFinanciamiento.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoFinanciamiento(tipoFinanciamiento);

            var form = tipoFinanciamientoMapper.Map(tipoFinanciamiento);
            
            return Rjs("Activate", form);
        }
    }
}
