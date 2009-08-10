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
    public class NivelEstudioController : BaseController<NivelEstudio, NivelEstudioForm>
    {
		readonly ICatalogoService catalogoService;
        readonly INivelEstudioMapper nivelEstudioMapper;

        public NivelEstudioController(IUsuarioService usuarioService, ICatalogoService catalogoService, INivelEstudioMapper nivelEstudioMapper) 
			: base (usuarioService)
        {
            this.catalogoService = catalogoService;
            this.nivelEstudioMapper = nivelEstudioMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);

            var nivelEstudios = catalogoService.GetAllNivelEstudios();
            data.List = nivelEstudioMapper.Map(nivelEstudios);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new NivelEstudioForm();
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var nivelEstudio = catalogoService.GetNivelEstudioById(id);
            data.Form = nivelEstudioMapper.Map(nivelEstudio);

			ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var nivelEstudio = catalogoService.GetNivelEstudioById(id);
            data.Form = nivelEstudioMapper.Map(nivelEstudio);
            
            ViewData.Model = data;
            return View();
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(NivelEstudioForm form)
        {
        
            var nivelEstudio = nivelEstudioMapper.Map(form);
            
            nivelEstudio.CreadorPor = CurrentUser();
            nivelEstudio.ModificadoPor = CurrentUser();

            if(!IsValidateModel(nivelEstudio, form, Title.New))
                return ViewNew();

            catalogoService.SaveNivelEstudio(nivelEstudio);

            return RedirectToIndex(String.Format("{0} ha sido creado", nivelEstudio.Nombre));
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(NivelEstudioForm form)
        {
        
            var nivelEstudio = nivelEstudioMapper.Map(form);
            
            nivelEstudio.ModificadoPor = CurrentUser();

            if (!IsValidateModel(nivelEstudio, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveNivelEstudio(nivelEstudio);

            return RedirectToIndex(String.Format("{0} ha sido modificado", nivelEstudio.Nombre));
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var nivelEstudio = catalogoService.GetNivelEstudioById(id);
            nivelEstudio.Activo = true;
            nivelEstudio.ModificadoPor = CurrentUser();
            catalogoService.SaveNivelEstudio(nivelEstudio);

            var form = nivelEstudioMapper.Map(nivelEstudio);
            
            return Rjs(form);
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var nivelEstudio = catalogoService.GetNivelEstudioById(id);
            nivelEstudio.Activo = false;
            nivelEstudio.ModificadoPor = CurrentUser();
            catalogoService.SaveNivelEstudio(nivelEstudio);

            var form = nivelEstudioMapper.Map(nivelEstudio);
            
            return Rjs("Activate", form);
        }
    }
}
