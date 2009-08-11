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
    public class TipoArticuloController : BaseController<TipoArticulo, TipoArticuloForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ITipoArticuloMapper tipoArticuloMapper;

        public TipoArticuloController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                      ITipoArticuloMapper tipoArticuloMapper, ISearchService searchService)
            : base(usuarioService, searchService)
        {
            this.catalogoService = catalogoService;
            this.tipoArticuloMapper = tipoArticuloMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var tipoArticulos = catalogoService.GetAllTipoArticulos();
            data.List = tipoArticuloMapper.Map(tipoArticulos);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new TipoArticuloForm();

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tipoArticulo = catalogoService.GetTipoArticuloById(id);
            data.Form = tipoArticuloMapper.Map(tipoArticulo);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var tipoArticulo = catalogoService.GetTipoArticuloById(id);
            data.Form = tipoArticuloMapper.Map(tipoArticulo);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoArticuloForm form)
        {
            var tipoArticulo = tipoArticuloMapper.Map(form);

            tipoArticulo.CreadorPor = CurrentUser();
            tipoArticulo.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoArticulo, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoArticulo(tipoArticulo);

            return RedirectToIndex(String.Format("{0} ha sido creado", tipoArticulo.Nombre));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoArticuloForm form)
        {
            var tipoArticulo = tipoArticuloMapper.Map(form);

            tipoArticulo.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoArticulo, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoArticulo(tipoArticulo);

            return RedirectToIndex(String.Format("{0} ha sido modificado", tipoArticulo.Nombre));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoArticulo = catalogoService.GetTipoArticuloById(id);
            tipoArticulo.Activo = true;
            tipoArticulo.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoArticulo(tipoArticulo);

            var form = tipoArticuloMapper.Map(tipoArticulo);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoArticulo = catalogoService.GetTipoArticuloById(id);
            tipoArticulo.Activo = false;
            tipoArticulo.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoArticulo(tipoArticulo);

            var form = tipoArticuloMapper.Map(tipoArticulo);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<TipoArticulo>(x => x.Nombre, q);
            return Content(data);
        }
    }
}