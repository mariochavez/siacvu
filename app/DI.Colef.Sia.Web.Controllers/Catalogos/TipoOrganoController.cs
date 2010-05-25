using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    public class TipoOrganoController : BaseController<TipoOrgano, TipoOrganoForm>
    {
        readonly ITipoOrganoMapper tipoOrganoMapper;

        public TipoOrganoController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                    ITipoOrganoMapper tipoOrganoMapper, ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.tipoOrganoMapper = tipoOrganoMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<TipoOrganoForm>();

            var tipoOrganos = catalogoService.GetAllTipoOrganos();
            data.List = tipoOrganoMapper.Map(tipoOrganos);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = new GenericViewData<TipoOrganoForm> {Form = new TipoOrganoForm()};

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<TipoOrganoForm>();

            var tipoOrgano = catalogoService.GetTipoOrganoById(id);
            data.Form = tipoOrganoMapper.Map(tipoOrgano);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoOrganoForm form)
        {
            var tipoOrgano = tipoOrganoMapper.Map(form);

            tipoOrgano.CreadoPor = CurrentUser();
            tipoOrgano.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoOrgano, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoOrgano(tipoOrgano);

            return RedirectToIndex(String.Format("Tipo de Órgano {0} ha sido creado", tipoOrgano.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoOrganoForm form)
        {
            var tipoOrgano = tipoOrganoMapper.Map(form);

            tipoOrgano.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoOrgano, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoOrgano(tipoOrgano);

            return RedirectToIndex(String.Format("Tipo de Órgano {0} ha sido modificado", tipoOrgano.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoOrgano = catalogoService.GetTipoOrganoById(id);
            tipoOrgano.Activo = true;
            tipoOrgano.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoOrgano(tipoOrgano);

            var form = tipoOrganoMapper.Map(tipoOrgano);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoOrgano = catalogoService.GetTipoOrganoById(id);
            tipoOrgano.Activo = false;
            tipoOrgano.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoOrgano(tipoOrgano);

            var form = tipoOrganoMapper.Map(tipoOrgano);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<TipoOrgano>(x => x.Nombre, q);
            return Content(data);
        }
    }
}