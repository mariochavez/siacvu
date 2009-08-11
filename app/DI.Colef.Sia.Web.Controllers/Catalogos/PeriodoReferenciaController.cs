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
    public class PeriodoReferenciaController : BaseController<PeriodoReferencia, PeriodoReferenciaForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IPeriodoReferenciaMapper periodoReferenciaMapper;

        public PeriodoReferenciaController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                           IPeriodoReferenciaMapper periodoReferenciaMapper,
                                           ISearchService searchService) : base(usuarioService, searchService)
        {
            this.catalogoService = catalogoService;
            this.periodoReferenciaMapper = periodoReferenciaMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var periodoReferencias = catalogoService.GetAllPeriodoReferencias();
            data.List = periodoReferenciaMapper.Map(periodoReferencias);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new PeriodoReferenciaForm();

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var periodoReferencia = catalogoService.GetPeriodoReferenciaById(id);
            data.Form = periodoReferenciaMapper.Map(periodoReferencia);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var periodoReferencia = catalogoService.GetPeriodoReferenciaById(id);
            data.Form = periodoReferenciaMapper.Map(periodoReferencia);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(PeriodoReferenciaForm form)
        {
            var periodoReferencia = periodoReferenciaMapper.Map(form);

            periodoReferencia.CreadorPor = CurrentUser();
            periodoReferencia.ModificadoPor = CurrentUser();

            if (!IsValidateModel(periodoReferencia, form, Title.New))
                return ViewNew();

            catalogoService.SavePeriodoReferencia(periodoReferencia);

            return RedirectToIndex(String.Format("{0} ha sido creado", periodoReferencia.Periodo));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(PeriodoReferenciaForm form)
        {
            var periodoReferencia = periodoReferenciaMapper.Map(form);

            periodoReferencia.ModificadoPor = CurrentUser();

            if (!IsValidateModel(periodoReferencia, form, Title.Edit))
                return ViewEdit();

            catalogoService.SavePeriodoReferencia(periodoReferencia);

            return RedirectToIndex(String.Format("{0} ha sido modificado", periodoReferencia.Periodo));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var periodoReferencia = catalogoService.GetPeriodoReferenciaById(id);
            periodoReferencia.Activo = true;
            periodoReferencia.ModificadoPor = CurrentUser();
            catalogoService.SavePeriodoReferencia(periodoReferencia);

            var form = periodoReferenciaMapper.Map(periodoReferencia);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var periodoReferencia = catalogoService.GetPeriodoReferenciaById(id);
            periodoReferencia.Activo = false;
            periodoReferencia.ModificadoPor = CurrentUser();
            catalogoService.SavePeriodoReferencia(periodoReferencia);

            var form = periodoReferenciaMapper.Map(periodoReferencia);

            return Rjs("Activate", form);
        }
    }
}