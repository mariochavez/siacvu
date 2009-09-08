using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    public class PeriodoReferenciaController : BaseController<PeriodoReferencia, PeriodoReferenciaForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IPeriodoReferenciaMapper periodoReferenciaMapper;

        public PeriodoReferenciaController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                           IPeriodoReferenciaMapper periodoReferenciaMapper,
                                           ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.periodoReferenciaMapper = periodoReferenciaMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var periodoReferencias = catalogoService.GetAllPeriodoReferencias();
            data.List = periodoReferenciaMapper.Map(periodoReferencias);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new PeriodoReferenciaForm();

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var periodoReferencia = catalogoService.GetPeriodoReferenciaById(id);
            data.Form = periodoReferenciaMapper.Map(periodoReferencia);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var periodoReferencia = catalogoService.GetPeriodoReferenciaById(id);
            data.Form = periodoReferenciaMapper.Map(periodoReferencia);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
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

            return RedirectToIndex(String.Format("Periodo Referencia {0} ha sido creado", periodoReferencia.Periodo));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(PeriodoReferenciaForm form)
        {
            var periodoReferencia = periodoReferenciaMapper.Map(form);

            periodoReferencia.ModificadoPor = CurrentUser();

            if (!IsValidateModel(periodoReferencia, form, Title.Edit))
                return ViewEdit();

            catalogoService.SavePeriodoReferencia(periodoReferencia);

            return RedirectToIndex(String.Format("Periodo Referencia {0} ha sido modificado", periodoReferencia.Periodo));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
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

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
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

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<PeriodoReferencia>(x => x.Periodo, q);
            return Content(data);
        }
    }
}