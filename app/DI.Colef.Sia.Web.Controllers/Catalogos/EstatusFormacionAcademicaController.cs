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
    public class EstatusFormacionAcademicaController : BaseController<EstatusFormacionAcademica, EstatusFormacionAcademicaForm>
    {
		readonly ICatalogoService catalogoService;
        readonly IEstatusFormacionAcademicaMapper estatusFormacionAcademicaMapper;
    
        public EstatusFormacionAcademicaController(IUsuarioService usuarioService,
            ICatalogoService catalogoService,
            IEstatusFormacionAcademicaMapper estatusFormacionAcademicaMapper,
            ISearchService searchService)
			: base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.estatusFormacionAcademicaMapper = estatusFormacionAcademicaMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);
			
			var estatusFormacionAcademicas = catalogoService.GetAllEstatusFormacionAcademicas();
            data.List = estatusFormacionAcademicaMapper.Map(estatusFormacionAcademicas);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new EstatusFormacionAcademicaForm();
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var estatusFormacionAcademica = catalogoService.GetEstatusFormacionAcademicaById(id);
            data.Form = estatusFormacionAcademicaMapper.Map(estatusFormacionAcademica);

			ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var estatusFormacionAcademica = catalogoService.GetEstatusFormacionAcademicaById(id);
            data.Form = estatusFormacionAcademicaMapper.Map(estatusFormacionAcademica);
            
            ViewData.Model = data;
            return View();
        }
        
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(EstatusFormacionAcademicaForm form)
        {
            var estatusFormacionAcademica = estatusFormacionAcademicaMapper.Map(form);
            
            estatusFormacionAcademica.CreadorPor = CurrentUser();
            estatusFormacionAcademica.ModificadoPor = CurrentUser();

            if(!IsValidateModel(estatusFormacionAcademica, form, Title.New))
                return ViewNew();

            catalogoService.SaveEstatusFormacionAcademica(estatusFormacionAcademica);

            return RedirectToIndex(String.Format("EstatusFormacionAcademica {0} ha sido creado", estatusFormacionAcademica.Nombre));
        }
        
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(EstatusFormacionAcademicaForm form)
        {
            var estatusFormacionAcademica = estatusFormacionAcademicaMapper.Map(form);
            
            estatusFormacionAcademica.ModificadoPor = CurrentUser();

            if (!IsValidateModel(estatusFormacionAcademica, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveEstatusFormacionAcademica(estatusFormacionAcademica);

            return RedirectToIndex(String.Format("EstatusFormacionAcademica {0} ha sido modificado", estatusFormacionAcademica.Nombre));
        }
        
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var estatusFormacionAcademica = catalogoService.GetEstatusFormacionAcademicaById(id);
            estatusFormacionAcademica.Activo = true;
            estatusFormacionAcademica.ModificadoPor = CurrentUser();
            catalogoService.SaveEstatusFormacionAcademica(estatusFormacionAcademica);

            var form = estatusFormacionAcademicaMapper.Map(estatusFormacionAcademica);
            
            return Rjs(form);
        }
        
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var estatusFormacionAcademica = catalogoService.GetEstatusFormacionAcademicaById(id);
            estatusFormacionAcademica.Activo = false;
            estatusFormacionAcademica.ModificadoPor = CurrentUser();
            catalogoService.SaveEstatusFormacionAcademica(estatusFormacionAcademica);

            var form = estatusFormacionAcademicaMapper.Map(estatusFormacionAcademica);
            
            return Rjs("Activate", form);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<EstatusFormacionAcademica>(x => x.Nombre, q);
            return Content(data);
        }
    }
}
