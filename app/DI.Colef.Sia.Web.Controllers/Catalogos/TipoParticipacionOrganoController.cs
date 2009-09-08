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
    public class TipoParticipacionOrganoController : BaseController<TipoParticipacionOrgano, TipoParticipacionOrganoForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ITipoParticipacionOrganoMapper tipoParticipacionOrganoMapper;
    
        public TipoParticipacionOrganoController(IUsuarioService usuarioService,
                                                 ICatalogoService catalogoService,
                                                 ISearchService searchService,
                                                 ITipoParticipacionOrganoMapper tipoParticipacionOrganoMapper)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.tipoParticipacionOrganoMapper = tipoParticipacionOrganoMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var tipoParticipacionOrganos = catalogoService.GetAllTipoParticipacionOrganos();
            data.List = tipoParticipacionOrganoMapper.Map(tipoParticipacionOrganos);

            return View(data);
        }
        
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new TipoParticipacionOrganoForm();
			
            return View(data);
        }
        
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tipoParticipacionOrgano = catalogoService.GetTipoParticipacionOrganoById(id);
            data.Form = tipoParticipacionOrganoMapper.Map(tipoParticipacionOrgano);

            ViewData.Model = data;
            return View();
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoParticipacionOrganoForm form)
        {
        
            var tipoParticipacionOrgano = tipoParticipacionOrganoMapper.Map(form);
            
            tipoParticipacionOrgano.CreadorPor = CurrentUser();
            tipoParticipacionOrgano.ModificadoPor = CurrentUser();

            if(!IsValidateModel(tipoParticipacionOrgano, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoParticipacionOrgano(tipoParticipacionOrgano);

            return RedirectToIndex(String.Format("{0} ha sido creado", tipoParticipacionOrgano.Nombre));
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoParticipacionOrganoForm form)
        {
        
            var tipoParticipacionOrgano = tipoParticipacionOrganoMapper.Map(form);
            
            tipoParticipacionOrgano.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoParticipacionOrgano, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoParticipacionOrgano(tipoParticipacionOrgano);

            return RedirectToIndex(String.Format("{0} ha sido modificado", tipoParticipacionOrgano.Nombre));
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoParticipacionOrgano = catalogoService.GetTipoParticipacionOrganoById(id);
            tipoParticipacionOrgano.Activo = true;
            tipoParticipacionOrgano.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoParticipacionOrgano(tipoParticipacionOrgano);

            var form = tipoParticipacionOrganoMapper.Map(tipoParticipacionOrgano);
            
            return Rjs(form);
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoParticipacionOrgano = catalogoService.GetTipoParticipacionOrganoById(id);
            tipoParticipacionOrgano.Activo = false;
            tipoParticipacionOrgano.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoParticipacionOrgano(tipoParticipacionOrgano);

            var form = tipoParticipacionOrganoMapper.Map(tipoParticipacionOrgano);
            
            return Rjs("Activate", form);
        }
    }
}