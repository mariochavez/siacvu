using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    public class CategoriaController : BaseController<Categoria, CategoriaForm>
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
            var data = CreateViewDataWithTitle(Title.Index);
            var categorias = catalogoService.GetAllCategorias();
            data.List = categoriaMapper.Map(categorias);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new CategoriaForm();

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var categoria = catalogoService.GetCategoriaById(id);
            data.Form = categoriaMapper.Map(categoria);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(CategoriaForm form)
        {
            var categoria = categoriaMapper.Map(form);

            if (!IsValidateModel(categoria, form, Title.New))
                return ViewNew();

            catalogoService.SaveCategoria(categoria);

            return RedirectToIndex(String.Format("{0} ha sido creado", categoria.Nombre));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(CategoriaForm form)
        {
            var categoria = categoriaMapper.Map(form);

            if (!IsValidateModel(categoria, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveCategoria(categoria);

            return RedirectToIndex(String.Format("{0} ha sido modificado", categoria.Nombre));
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