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
    public class TipoFinanciamientoController : BaseController<TipoFinanciamiento, TipoFinanciamientoForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ITipoFinanciamientoMapper tipoFinanciamientoMapper;

        public TipoFinanciamientoController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                            ITipoFinanciamientoMapper tipoFinanciamientoMapper,
                                            ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.tipoFinanciamientoMapper = tipoFinanciamientoMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var tipoFinanciamientos = catalogoService.GetAllTipoFinanciamientos();
            data.List = tipoFinanciamientoMapper.Map(tipoFinanciamientos);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new TipoFinanciamientoForm();

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tipoFinanciamiento = catalogoService.GetTipoFinanciamientoById(id);
            data.Form = tipoFinanciamientoMapper.Map(tipoFinanciamiento);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoFinanciamientoForm form)
        {
            var tipoFinanciamiento = tipoFinanciamientoMapper.Map(form);

            tipoFinanciamiento.CreadoPor = CurrentUser();
            tipoFinanciamiento.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoFinanciamiento, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoFinanciamiento(tipoFinanciamiento);

            return RedirectToIndex(String.Format("Tipo de Financiamiento {0} ha sido creado", tipoFinanciamiento.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoFinanciamientoForm form)
        {
            var tipoFinanciamiento = tipoFinanciamientoMapper.Map(form);

            tipoFinanciamiento.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoFinanciamiento, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoFinanciamiento(tipoFinanciamiento);

            return RedirectToIndex(String.Format("Tipo de Financiamiento {0} ha sido modificado", tipoFinanciamiento.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoFinanciamiento = catalogoService.GetTipoFinanciamientoById(id);
            tipoFinanciamiento.Activo = true;
            tipoFinanciamiento.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoFinanciamiento(tipoFinanciamiento);

            var form = tipoFinanciamientoMapper.Map(tipoFinanciamiento);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoFinanciamiento = catalogoService.GetTipoFinanciamientoById(id);
            tipoFinanciamiento.Activo = false;
            tipoFinanciamiento.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoFinanciamiento(tipoFinanciamiento);

            var form = tipoFinanciamientoMapper.Map(tipoFinanciamiento);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<TipoFinanciamiento>(x => x.Nombre, q);
            return Content(data);
        }
    }
}