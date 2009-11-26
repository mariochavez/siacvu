using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class ContenidoLibroController : BaseController<ContenidoLibro, ContenidoLibroForm>
    {
		readonly ICatalogoService catalogoService;
        readonly IContenidoLibroMapper contenidoLibroMapper;
    
        public ContenidoLibroController(IUsuarioService usuarioService,
                                        ICatalogoService catalogoService,
                                        IContenidoLibroMapper contenidoLibroMapper,
                                        ISearchService searchService
            ) : base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.contenidoLibroMapper = contenidoLibroMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);
			
			var contenidoLibros = catalogoService.GetAllContenidoLibros();
            data.List = contenidoLibroMapper.Map(contenidoLibros);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new ContenidoLibroForm();
			
			return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var contenidoLibro = catalogoService.GetContenidoLibroById(id);
            data.Form = contenidoLibroMapper.Map(contenidoLibro);

			ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ContenidoLibroForm form)
        {
            var contenidoLibro = contenidoLibroMapper.Map(form);
            
            contenidoLibro.CreadorPor = CurrentUser();
            contenidoLibro.ModificadoPor = CurrentUser();

            if(!IsValidateModel(contenidoLibro, form, Title.New))
                return ViewNew();

            catalogoService.SaveContenidoLibro(contenidoLibro);

            return RedirectToIndex(String.Format("Contenido de libro {0} ha sido creado", contenidoLibro.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ContenidoLibroForm form)
        {
            var contenidoLibro = contenidoLibroMapper.Map(form);
            
            contenidoLibro.ModificadoPor = CurrentUser();

            if (!IsValidateModel(contenidoLibro, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveContenidoLibro(contenidoLibro);

            return RedirectToIndex(String.Format("Contenido de libro {0} ha sido modificado", contenidoLibro.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var contenidoLibro = catalogoService.GetContenidoLibroById(id);
            contenidoLibro.Activo = true;
            contenidoLibro.ModificadoPor = CurrentUser();
            catalogoService.SaveContenidoLibro(contenidoLibro);

            var form = contenidoLibroMapper.Map(contenidoLibro);
            
            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var contenidoLibro = catalogoService.GetContenidoLibroById(id);
            contenidoLibro.Activo = false;
            contenidoLibro.ModificadoPor = CurrentUser();
            catalogoService.SaveContenidoLibro(contenidoLibro);

            var form = contenidoLibroMapper.Map(contenidoLibro);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<ContenidoLibro>(x => x.Nombre, q);
            return Content(data);
        }
    }
}