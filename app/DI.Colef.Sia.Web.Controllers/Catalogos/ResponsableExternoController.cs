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
    public class ResponsableExternoController : BaseController<ResponsableExterno, ResponsableExternoForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IResponsableExternoMapper responsableExternoMapper;

        public ResponsableExternoController(IUsuarioService usuarioService, ICatalogoService catalogoService, IResponsableExternoMapper responsableExternoMapper)
            : base(usuarioService)
        {
            this.catalogoService = catalogoService;
            this.responsableExternoMapper = responsableExternoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);

            var responsableExternos = catalogoService.GetAllResponsableExternos();
            data.List = responsableExternoMapper.Map(responsableExternos);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new ResponsableExternoForm();
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var responsableExterno = catalogoService.GetResponsableExternoById(id);
            data.Form = responsableExternoMapper.Map(responsableExterno);

			ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var responsableExterno = catalogoService.GetResponsableExternoById(id);
            data.Form = responsableExternoMapper.Map(responsableExterno);
            
            ViewData.Model = data;
            return View();
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ResponsableExternoForm form)
        {
        
            var responsableExterno = responsableExternoMapper.Map(form);

            if(!IsValidateModel(responsableExterno, form, Title.New))
                return ViewNew();

            catalogoService.SaveResponsableExterno(responsableExterno);

            return RedirectToIndex(String.Format("{0} ha sido creado", responsableExterno.Nombre));
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ResponsableExternoForm form)
        {
        
            var responsableExterno = responsableExternoMapper.Map(form);

            if (!IsValidateModel(responsableExterno, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveResponsableExterno(responsableExterno);

            return RedirectToIndex(String.Format("{0} ha sido modificado", responsableExterno.Nombre));
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var responsableExterno = catalogoService.GetResponsableExternoById(id);
            responsableExterno.Activo = true;
            catalogoService.SaveResponsableExterno(responsableExterno);

            var form = responsableExternoMapper.Map(responsableExterno);
            
            return Rjs(form);
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var responsableExterno = catalogoService.GetResponsableExternoById(id);
            responsableExterno.Activo = false;
            catalogoService.SaveResponsableExterno(responsableExterno);

            var form = responsableExternoMapper.Map(responsableExterno);
            
            return Rjs("Activate", form);
        }
    }
}
