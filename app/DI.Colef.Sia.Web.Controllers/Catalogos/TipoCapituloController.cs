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
    public class TipoCapituloController : BaseController<TipoCapitulo, TipoCapituloForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ITipoCapituloMapper tipoCapituloMapper;

        public TipoCapituloController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                      ITipoCapituloMapper tipoCapituloMapper, ISearchService searchService)
            : base(usuarioService, searchService)
        {
            this.catalogoService = catalogoService;
            this.tipoCapituloMapper = tipoCapituloMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var tipoCapitulos = catalogoService.GetAllTipoCapitulos();
            data.List = tipoCapituloMapper.Map(tipoCapitulos);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new TipoCapituloForm();

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tipoCapitulo = catalogoService.GetTipoCapituloById(id);
            data.Form = tipoCapituloMapper.Map(tipoCapitulo);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var tipoCapitulo = catalogoService.GetTipoCapituloById(id);
            data.Form = tipoCapituloMapper.Map(tipoCapitulo);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoCapituloForm form)
        {
            var tipoCapitulo = tipoCapituloMapper.Map(form);

            tipoCapitulo.CreadorPor = CurrentUser();
            tipoCapitulo.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoCapitulo, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoCapitulo(tipoCapitulo);

            return RedirectToIndex(String.Format("Tipo de Capítulo {0} ha sido creado", tipoCapitulo.Nombre));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoCapituloForm form)
        {
            var tipoCapitulo = tipoCapituloMapper.Map(form);

            tipoCapitulo.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoCapitulo, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoCapitulo(tipoCapitulo);

            return RedirectToIndex(String.Format("Tipo de Capítulo {0} ha sido modificado", tipoCapitulo.Nombre));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoCapitulo = catalogoService.GetTipoCapituloById(id);
            tipoCapitulo.Activo = true;
            tipoCapitulo.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoCapitulo(tipoCapitulo);

            var form = tipoCapituloMapper.Map(tipoCapitulo);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoCapitulo = catalogoService.GetTipoCapituloById(id);
            tipoCapitulo.Activo = false;
            tipoCapitulo.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoCapitulo(tipoCapitulo);

            var form = tipoCapituloMapper.Map(tipoCapitulo);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<TipoCapitulo>(x => x.Nombre, q);
            return Content(data);
        }
    }
}