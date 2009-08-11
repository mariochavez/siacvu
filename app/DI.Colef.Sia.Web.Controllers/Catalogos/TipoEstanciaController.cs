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
    public class TipoEstanciaController : BaseController<TipoEstancia, TipoEstanciaForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ITipoEstanciaMapper tipoEstanciaMapper;

        public TipoEstanciaController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                      ITipoEstanciaMapper tipoEstanciaMapper, ISearchService searchService)
            : base(usuarioService, searchService)
        {
            this.catalogoService = catalogoService;
            this.tipoEstanciaMapper = tipoEstanciaMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var tipoEstancias = catalogoService.GetAllTipoEstancias();
            data.List = tipoEstanciaMapper.Map(tipoEstancias);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new TipoEstanciaForm();

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tipoEstancia = catalogoService.GetTipoEstanciaById(id);
            data.Form = tipoEstanciaMapper.Map(tipoEstancia);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var tipoEstancia = catalogoService.GetTipoEstanciaById(id);
            data.Form = tipoEstanciaMapper.Map(tipoEstancia);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoEstanciaForm form)
        {
            var tipoEstancia = tipoEstanciaMapper.Map(form);

            tipoEstancia.CreadorPor = CurrentUser();
            tipoEstancia.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoEstancia, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoEstancia(tipoEstancia);

            return RedirectToIndex(String.Format("{0} ha sido creada", tipoEstancia.Nombre));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoEstanciaForm form)
        {
            var tipoEstancia = tipoEstanciaMapper.Map(form);

            tipoEstancia.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoEstancia, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoEstancia(tipoEstancia);

            return RedirectToIndex(String.Format("{0} ha sido modificada", tipoEstancia.Nombre));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoEstancia = catalogoService.GetTipoEstanciaById(id);
            tipoEstancia.Activo = true;
            tipoEstancia.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoEstancia(tipoEstancia);

            var form = tipoEstanciaMapper.Map(tipoEstancia);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoEstancia = catalogoService.GetTipoEstanciaById(id);
            tipoEstancia.Activo = false;
            tipoEstancia.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoEstancia(tipoEstancia);

            var form = tipoEstanciaMapper.Map(tipoEstancia);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<TipoEstancia>(x => x.Nombre, q);
            return Content(data);
        }
    }
}