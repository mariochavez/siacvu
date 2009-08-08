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
    public class EstadoPaisController : BaseController<EstadoPais, EstadoPaisForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IEstadoPaisMapper estadoPaisMapper;

        public EstadoPaisController(IUsuarioService usuarioService, ICatalogoService catalogoService, IEstadoPaisMapper estadoPaisMapper) 
			: base (usuarioService)
        {
            this.catalogoService = catalogoService;
            this.estadoPaisMapper = estadoPaisMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);

            var estadoPais = catalogoService.GetAllEstadoPaises();
            data.List = estadoPaisMapper.Map(estadoPais);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new EstadoPaisForm();
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var estadoPais = catalogoService.GetEstadoPaisById(id);
            data.Form = estadoPaisMapper.Map(estadoPais);

			ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var estadoPais = catalogoService.GetEstadoPaisById(id);
            data.Form = estadoPaisMapper.Map(estadoPais);
            
            ViewData.Model = data;
            return View();
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(EstadoPaisForm form)
        {
        
            var estadoPais = estadoPaisMapper.Map(form);
            
            estadoPais.CreadorPor = CurrentUser();
            estadoPais.ModificadoPor = CurrentUser();

            if(!IsValidateModel(estadoPais, form, Title.New))
                return ViewNew();

            catalogoService.SaveEstadoPais(estadoPais);

            return RedirectToIndex(String.Format("{0} ha sido creado", estadoPais.Nombre));
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(EstadoPaisForm form)
        {
        
            var estadoPais = estadoPaisMapper.Map(form);
            
            estadoPais.ModificadoPor = CurrentUser();

            if (!IsValidateModel(estadoPais, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveEstadoPais(estadoPais);

            return RedirectToIndex(String.Format("{0} ha sido modificado", estadoPais.Nombre));
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var estadoPais = catalogoService.GetEstadoPaisById(id);
            estadoPais.Activo = true;
            estadoPais.ModificadoPor = CurrentUser();
            catalogoService.SaveEstadoPais(estadoPais);

            var form = estadoPaisMapper.Map(estadoPais);
            
            return Rjs(form);
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var estadoPais = catalogoService.GetEstadoPaisById(id);
            estadoPais.Activo = false;
            estadoPais.ModificadoPor = CurrentUser();
            catalogoService.SaveEstadoPais(estadoPais);

            var form = estadoPaisMapper.Map(estadoPais);
            
            return Rjs("Activate", form);
        }
    }
}
