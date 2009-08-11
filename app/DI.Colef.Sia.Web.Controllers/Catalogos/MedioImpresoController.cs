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
    public class MedioImpresoController : BaseController<MedioImpreso, MedioImpresoForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IMedioImpresoMapper medioImpresoMapper;

        public MedioImpresoController(IUsuarioService usuarioService, ICatalogoService catalogoService, IMedioImpresoMapper medioImpresoMapper,
            ISearchService searchService)
            : base(usuarioService, searchService)
        {
            this.catalogoService = catalogoService;
            this.medioImpresoMapper = medioImpresoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);

            var medioImpresos = catalogoService.GetAllMedioImpresos();
            data.List = medioImpresoMapper.Map(medioImpresos);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new MedioImpresoForm();
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var medioImpreso = catalogoService.GetMedioImpresoById(id);
            data.Form = medioImpresoMapper.Map(medioImpreso);

			ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var medioImpreso = catalogoService.GetMedioImpresoById(id);
            data.Form = medioImpresoMapper.Map(medioImpreso);
            
            ViewData.Model = data;
            return View();
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(MedioImpresoForm form)
        {
        
            var medioImpreso = medioImpresoMapper.Map(form);
            
            medioImpreso.CreadorPor = CurrentUser();
            medioImpreso.ModificadoPor = CurrentUser();

            if(!IsValidateModel(medioImpreso, form, Title.New))
                return ViewNew();

            catalogoService.SaveMedioImpreso(medioImpreso);

            return RedirectToIndex(String.Format("{0} ha sido creado", medioImpreso.Nombre));
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(MedioImpresoForm form)
        {
        
            var medioImpreso = medioImpresoMapper.Map(form);
            
            medioImpreso.ModificadoPor = CurrentUser();

            if (!IsValidateModel(medioImpreso, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveMedioImpreso(medioImpreso);

            return RedirectToIndex(String.Format("{0} ha sido modificado", medioImpreso.Nombre));
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var medioImpreso = catalogoService.GetMedioImpresoById(id);
            medioImpreso.Activo = true;
            medioImpreso.ModificadoPor = CurrentUser();
            catalogoService.SaveMedioImpreso(medioImpreso);

            var form = medioImpresoMapper.Map(medioImpreso);
            
            return Rjs(form);
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var medioImpreso = catalogoService.GetMedioImpresoById(id);
            medioImpreso.Activo = false;
            medioImpreso.ModificadoPor = CurrentUser();
            catalogoService.SaveMedioImpreso(medioImpreso);

            var form = medioImpresoMapper.Map(medioImpreso);
            
            return Rjs("Activate", form);
        }
    }
}
