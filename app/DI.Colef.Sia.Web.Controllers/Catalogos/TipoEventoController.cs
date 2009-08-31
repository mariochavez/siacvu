using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    public class TipoEventoController : BaseController<TipoEvento, TipoEventoForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ITipoEventoMapper tipoEventoMapper;

        public TipoEventoController(IUsuarioService usuarioService, ICatalogoService catalogoService, ITipoEventoMapper tipoEventoMapper,
                                    ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.tipoEventoMapper = tipoEventoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var tipoEventos = catalogoService.GetAllTipoEventos();
            data.List = tipoEventoMapper.Map(tipoEventos);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new TipoEventoForm();
			
            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tipoEvento = catalogoService.GetTipoEventoById(id);
            data.Form = tipoEventoMapper.Map(tipoEvento);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var tipoEvento = catalogoService.GetTipoEventoById(id);
            data.Form = tipoEventoMapper.Map(tipoEvento);
            
            ViewData.Model = data;
            return View();
        }
        
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoEventoForm form)
        {
        
            var tipoEvento = tipoEventoMapper.Map(form);
            
            tipoEvento.CreadorPor = CurrentUser();
            tipoEvento.ModificadoPor = CurrentUser();

            if(!IsValidateModel(tipoEvento, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoEvento(tipoEvento);

            return RedirectToIndex(String.Format("Tipo de Evento {0} ha sido creado", tipoEvento.Nombre));
        }
        
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoEventoForm form)
        {
        
            var tipoEvento = tipoEventoMapper.Map(form);
            
            tipoEvento.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoEvento, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoEvento(tipoEvento);

            return RedirectToIndex(String.Format("Tipo de Evento {0} ha sido modificado", tipoEvento.Nombre));
        }
        
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoEvento = catalogoService.GetTipoEventoById(id);
            tipoEvento.Activo = true;
            tipoEvento.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoEvento(tipoEvento);

            var form = tipoEventoMapper.Map(tipoEvento);
            
            return Rjs(form);
        }
        
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoEvento = catalogoService.GetTipoEventoById(id);
            tipoEvento.Activo = false;
            tipoEvento.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoEvento(tipoEvento);

            var form = tipoEventoMapper.Map(tipoEvento);
            
            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<TipoEvento>(x => x.Nombre, q);
            return Content(data);
        }
    }
}