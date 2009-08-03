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
    public class IdiomaController : BaseController<Idioma, IdiomaForm>
    {
		readonly ICatalogoService catalogoService;
        readonly IIdiomaMapper idiomaMapper;

        public IdiomaController(IUsuarioService usuarioService, ICatalogoService catalogoService, IIdiomaMapper idiomaMapper)
            : base(usuarioService)
        {
            this.catalogoService = catalogoService;
            this.idiomaMapper = idiomaMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);

            var idiomas = catalogoService.GetAllIdiomas();
            data.List = idiomaMapper.Map(idiomas);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new IdiomaForm();
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var idioma = catalogoService.GetIdiomaById(id);
            data.Form = idiomaMapper.Map(idioma);

			ViewData.Model = data;
            return View();
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(IdiomaForm form)
        {
        
            var idioma = idiomaMapper.Map(form);

            if(!IsValidateModel(idioma, form, Title.New))
                return ViewNew();

            catalogoService.SaveIdioma(idioma);

            return RedirectToIndex(String.Format("{0} ha sido creado", idioma.Nombre));
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(IdiomaForm form)
        {
        
            var idioma = idiomaMapper.Map(form);

            if (!IsValidateModel(idioma, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveIdioma(idioma);

            return RedirectToIndex(String.Format("{0} ha sido modificado", idioma.Nombre));
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var idioma = catalogoService.GetIdiomaById(id);
            idioma.Activo = true;
            catalogoService.SaveIdioma(idioma);

            var form = idiomaMapper.Map(idioma);
            
            return Rjs(form);
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var idioma = catalogoService.GetIdiomaById(id);
            idioma.Activo = false;
            catalogoService.SaveIdioma(idioma);

            var form = idiomaMapper.Map(idioma);
            
            return Rjs("Activate", form);
        }
    }
}
