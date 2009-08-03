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
    public class TipoParticipacionController : BaseController<TipoParticipacion, TipoParticipacionForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ITipoParticipacionMapper tipoParticipacionMapper;

        public TipoParticipacionController(IUsuarioService usuarioService, ICatalogoService catalogoService, ITipoParticipacionMapper tipoParticipacionMapper)
            : base(usuarioService)
        {
            this.catalogoService = catalogoService;
            this.tipoParticipacionMapper = tipoParticipacionMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);

            var tipoParticipacions = catalogoService.GetAllTipoParticipacions();
            data.List = tipoParticipacionMapper.Map(tipoParticipacions);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new TipoParticipacionForm();
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tipoParticipacion = catalogoService.GetTipoParticipacionById(id);
            data.Form = tipoParticipacionMapper.Map(tipoParticipacion);

			ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var tipoParticipacion = catalogoService.GetTipoParticipacionById(id);
            data.Form = tipoParticipacionMapper.Map(tipoParticipacion);
            
            ViewData.Model = data;
            return View();
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoParticipacionForm form)
        {
        
            var tipoParticipacion = tipoParticipacionMapper.Map(form);

            if(!IsValidateModel(tipoParticipacion, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoParticipacion(tipoParticipacion);

            return RedirectToIndex(String.Format("{0} ha sido creado", tipoParticipacion.Nombre));
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoParticipacionForm form)
        {
        
            var tipoParticipacion = tipoParticipacionMapper.Map(form);

            if (!IsValidateModel(tipoParticipacion, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoParticipacion(tipoParticipacion);

            return RedirectToIndex(String.Format("{0} ha sido modificado", tipoParticipacion.Nombre));
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoParticipacion = catalogoService.GetTipoParticipacionById(id);
            tipoParticipacion.Activo = true;
            catalogoService.SaveTipoParticipacion(tipoParticipacion);

            var form = tipoParticipacionMapper.Map(tipoParticipacion);
            
            return Rjs(form);
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoParticipacion = catalogoService.GetTipoParticipacionById(id);
            tipoParticipacion.Activo = false;
            catalogoService.SaveTipoParticipacion(tipoParticipacion);

            var form = tipoParticipacionMapper.Map(tipoParticipacion);
            
            return Rjs("Activate", form);
        }
    }
}
