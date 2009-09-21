using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    public class NivelIdiomaController : BaseController<NivelIdioma, NivelIdiomaForm>
    {
        readonly ICatalogoService catalogoService;
        readonly INivelIdiomaMapper nivelIdiomaMapper;
    
        public NivelIdiomaController(IUsuarioService usuarioService, ICatalogoService catalogoService, 
                                     INivelIdiomaMapper nivelIdiomaMapper, ISearchService searchService) 
            : base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.nivelIdiomaMapper = nivelIdiomaMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);
			
            var nivelIdiomas = catalogoService.GetAllNivelIdiomas();
            data.List = nivelIdiomaMapper.Map(nivelIdiomas);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new NivelIdiomaForm();
			
            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var nivelIdioma = catalogoService.GetNivelIdiomaById(id);
            data.Form = nivelIdiomaMapper.Map(nivelIdioma);

            ViewData.Model = data;
            return View();
        }
        
        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(NivelIdiomaForm form)
        {
        
            var nivelIdioma = nivelIdiomaMapper.Map(form);
            
            nivelIdioma.CreadorPor = CurrentUser();
            nivelIdioma.ModificadoPor = CurrentUser();

            if(!IsValidateModel(nivelIdioma, form, Title.New))
                return ViewNew();

            catalogoService.SaveNivelIdioma(nivelIdioma);

            return RedirectToIndex(String.Format("Nivel de idioma {0} ha sido creado", nivelIdioma.Nombre));
        }
        
        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(NivelIdiomaForm form)
        {
        
            var nivelIdioma = nivelIdiomaMapper.Map(form);
            
            nivelIdioma.ModificadoPor = CurrentUser();

            if (!IsValidateModel(nivelIdioma, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveNivelIdioma(nivelIdioma);

            return RedirectToIndex(String.Format("Nivel de idioma {0} ha sido modificado", nivelIdioma.Nombre));
        }
        
        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var nivelIdioma = catalogoService.GetNivelIdiomaById(id);
            nivelIdioma.Activo = true;
            nivelIdioma.ModificadoPor = CurrentUser();
            catalogoService.SaveNivelIdioma(nivelIdioma);

            var form = nivelIdiomaMapper.Map(nivelIdioma);
            
            return Rjs(form);
        }
        
        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var nivelIdioma = catalogoService.GetNivelIdiomaById(id);
            nivelIdioma.Activo = false;
            nivelIdioma.ModificadoPor = CurrentUser();
            catalogoService.SaveNivelIdioma(nivelIdioma);

            var form = nivelIdiomaMapper.Map(nivelIdioma);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<NivelIdioma>(x => x.Nombre, q);
            return Content(data);
        }
    }
}