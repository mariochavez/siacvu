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
    public class TipoOrganoController : BaseController<TipoOrgano, TipoOrganoForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ITipoOrganoMapper tipoOrganoMapper;

        public TipoOrganoController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                    ITipoOrganoMapper tipoOrganoMapper, ISearchService searchService)
            : base(usuarioService, searchService)
        {
            this.catalogoService = catalogoService;
            this.tipoOrganoMapper = tipoOrganoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var tipoOrganos = catalogoService.GetAllTipoOrganos();
            data.List = tipoOrganoMapper.Map(tipoOrganos);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new TipoOrganoForm();

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tipoOrgano = catalogoService.GetTipoOrganoById(id);
            data.Form = tipoOrganoMapper.Map(tipoOrgano);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var tipoOrgano = catalogoService.GetTipoOrganoById(id);
            data.Form = tipoOrganoMapper.Map(tipoOrgano);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoOrganoForm form)
        {
            var tipoOrgano = tipoOrganoMapper.Map(form);

            tipoOrgano.CreadorPor = CurrentUser();
            tipoOrgano.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoOrgano, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoOrgano(tipoOrgano);

            return RedirectToIndex(String.Format("{0} ha sido creado", tipoOrgano.Nombre));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoOrganoForm form)
        {
            var tipoOrgano = tipoOrganoMapper.Map(form);

            tipoOrgano.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoOrgano, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoOrgano(tipoOrgano);

            return RedirectToIndex(String.Format("{0} ha sido modificado", tipoOrgano.Nombre));
        }

        [Transaction]
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

        [Transaction]
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

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<TipoOrgano>(x => x.Nombre, q);
            return Content(data);
        }
    }
}