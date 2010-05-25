using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    public class CategoriaController : BaseController<Categoria, CategoriaForm>
    {
        //readonly ICatalogoService catalogoService;
        readonly ICategoriaMapper categoriaMapper;

        public CategoriaController(IUsuarioService usuarioService, ICatalogoService catalogoService, ICategoriaMapper categoriaMapper,
                                   ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.categoriaMapper = categoriaMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = new GenericViewData<CategoriaForm>();
            var categorias = catalogoService.GetAllCategorias();
            data.List = categoriaMapper.Map(categorias);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = new GenericViewData<CategoriaForm> {Form = new CategoriaForm()};

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<CategoriaForm>();

            var categoria = catalogoService.GetCategoriaById(id);
            data.Form = categoriaMapper.Map(categoria);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(CategoriaForm form)
        {
            var categoria = categoriaMapper.Map(form);

            categoria.CreadoPor = CurrentUser();
            categoria.ModificadoPor = CurrentUser();

            if (!IsValidateModel(categoria, form, Title.New))
                return ViewNew();

            catalogoService.SaveCategoria(categoria);

            return RedirectToIndex(String.Format("Categoría {0} ha sido creada", categoria.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(CategoriaForm form)
        {
            var categoria = categoriaMapper.Map(form);

            categoria.ModificadoPor = CurrentUser();

            if (!IsValidateModel(categoria, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveCategoria(categoria);

            return RedirectToIndex(String.Format("Categoría {0} ha sido modificada", categoria.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var categoria = catalogoService.GetCategoriaById(id);
            categoria.Activo = true;
            categoria.ModificadoPor = CurrentUser();
            catalogoService.SaveCategoria(categoria);

            var form = categoriaMapper.Map(categoria);
            
            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var categoria = catalogoService.GetCategoriaById(id);
            categoria.Activo = false;
            categoria.ModificadoPor = CurrentUser();
            catalogoService.SaveCategoria(categoria);

            var form = categoriaMapper.Map(categoria);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Categoria>(x => x.Nombre, q);
            return Content(data);
        }
    }
}