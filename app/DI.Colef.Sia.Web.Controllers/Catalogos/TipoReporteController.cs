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
    public class TipoReporteController : BaseController<TipoReporte, TipoReporteForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ITipoReporteMapper tipoReporteMapper;

        public TipoReporteController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                     ITipoReporteMapper tipoReporteMapper, ISearchService searchService)
            : base(usuarioService, searchService)
        {
            this.catalogoService = catalogoService;
            this.tipoReporteMapper = tipoReporteMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var tipoReportes = catalogoService.GetAllTipoReportes();
            data.List = tipoReporteMapper.Map(tipoReportes);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new TipoReporteForm();

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tipoReporte = catalogoService.GetTipoReporteById(id);
            data.Form = tipoReporteMapper.Map(tipoReporte);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var tipoReporte = catalogoService.GetTipoReporteById(id);
            data.Form = tipoReporteMapper.Map(tipoReporte);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoReporteForm form)
        {
            var tipoReporte = tipoReporteMapper.Map(form);

            tipoReporte.CreadorPor = CurrentUser();
            tipoReporte.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoReporte, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoReporte(tipoReporte);

            return RedirectToIndex(String.Format("{0} ha sido creado", tipoReporte.Nombre));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoReporteForm form)
        {
            var tipoReporte = tipoReporteMapper.Map(form);

            tipoReporte.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoReporte, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoReporte(tipoReporte);

            return RedirectToIndex(String.Format("{0} ha sido modificado", tipoReporte.Nombre));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoReporte = catalogoService.GetTipoReporteById(id);
            tipoReporte.Activo = true;
            tipoReporte.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoReporte(tipoReporte);

            var form = tipoReporteMapper.Map(tipoReporte);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoReporte = catalogoService.GetTipoReporteById(id);
            tipoReporte.Activo = false;
            tipoReporte.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoReporte(tipoReporte);

            var form = tipoReporteMapper.Map(tipoReporte);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<TipoReporte>(x => x.Nombre, q);
            return Content(data);
        }
    }
}