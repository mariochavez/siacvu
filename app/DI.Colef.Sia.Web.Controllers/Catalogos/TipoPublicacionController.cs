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
    public class TipoPublicacionController : BaseController<TipoPublicacion, TipoPublicacionForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ITipoPublicacionMapper tipoPublicacionMapper;

        public TipoPublicacionController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                         ITipoPublicacionMapper tipoPublicacionMapper, ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.tipoPublicacionMapper = tipoPublicacionMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var tipoPublicacions = catalogoService.GetAllTipoPublicacions();
            data.List = tipoPublicacionMapper.Map(tipoPublicacions);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new TipoPublicacionForm();

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tipoPublicacion = catalogoService.GetTipoPublicacionById(id);
            data.Form = tipoPublicacionMapper.Map(tipoPublicacion);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoPublicacionForm form)
        {
            var tipoPublicacion = tipoPublicacionMapper.Map(form);

            tipoPublicacion.CreadorPor = CurrentUser();
            tipoPublicacion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoPublicacion, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoPublicacion(tipoPublicacion);

            return RedirectToIndex(String.Format("Tipo de Publicación {0} ha sido creada", tipoPublicacion.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoPublicacionForm form)
        {
            var tipoPublicacion = tipoPublicacionMapper.Map(form);

            tipoPublicacion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoPublicacion, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoPublicacion(tipoPublicacion);

            return RedirectToIndex(String.Format("Tipo de Publicación {0} ha sido modificada", tipoPublicacion.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoPublicacion = catalogoService.GetTipoPublicacionById(id);
            tipoPublicacion.Activo = true;
            tipoPublicacion.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoPublicacion(tipoPublicacion);

            var form = tipoPublicacionMapper.Map(tipoPublicacion);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoPublicacion = catalogoService.GetTipoPublicacionById(id);
            tipoPublicacion.Activo = false;
            tipoPublicacion.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoPublicacion(tipoPublicacion);

            var form = tipoPublicacionMapper.Map(tipoPublicacion);

            return Rjs("Activate", form);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<TipoPublicacion>(x => x.Nombre, q);
            return Content(data);
        }
    }
}