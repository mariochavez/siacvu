using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class CategoriaController : BaseController
    {
        readonly ICatalogoService catalogoService;
        readonly ICategoriaMapper categoriaMapper;

        public CategoriaController(ICatalogoService catalogoService, ICategoriaMapper categoriaMapper) 
        {
            this.catalogoService = catalogoService;
            this.categoriaMapper = categoriaMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = new GenericViewData<CategoriaForm> { Title = "Administracion de Categorias" };
            var categorias = catalogoService.GetAllCategorias();
            data.List = categoriaMapper.Map(categorias);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
			var data = new GenericViewData<CategoriaForm> {Title = "Nuevo Categoria", Form = new CategoriaForm()};
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<CategoriaForm> { Title = "Modificar Categoria" };

            var categoria = catalogoService.GetCategoriaById(id);
            data.Form = categoriaMapper.Map(categoria);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = new GenericViewData<CategoriaForm> { Title = "Informacion de Categoria" };

            var categoria = catalogoService.GetCategoriaById(id);
            data.Form = categoriaMapper.Map(categoria);

            return View(data);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(CategoriaForm form)
        {
            var categoria = categoriaMapper.Map(form);
            
            ModelState.AddModelErrors(categoria.ValidationResults());
            if (!ModelState.IsValid)
            {
                SetMessage("Se ha generado un error al crear el Categoria");
                return View("New", form);
            }

            catalogoService.SaveCategoria(categoria);
            SetMessage(string.Format("El Categoria {0} ha sido creado", categoria.Id));

            return RedirectToAction("Index");
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(CategoriaForm form)
        {
            var categoria = categoriaMapper.Map(form);

            ModelState.AddModelErrors(categoria.ValidationResults());
            if (!ModelState.IsValid)
            {
                SetMessage("Se ha generado un error al actualizar el Categoria");
                return View("Edit", form);
            }

            catalogoService.SaveCategoria(categoria);
            SetMessage(string.Format("El Categoria {0} ha sido modificado", categoria.Id));

            return RedirectToAction("Index");
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var categoria = catalogoService.GetCategoriaById(id);
            categoria.Activo = true;
            catalogoService.SaveCategoria(categoria);

            var form = categoriaMapper.Map(categoria);
            
            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var categoria = catalogoService.GetCategoriaById(id);
            categoria.Activo = false;
            catalogoService.SaveCategoria(categoria);

            var form = categoriaMapper.Map(categoria);
            
            return Rjs("Activate", form);
        }
    }
}