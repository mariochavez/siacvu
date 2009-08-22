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
    public class RevistaPublicacionController : BaseController<RevistaPublicacion, RevistaPublicacionForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IRevistaPublicacionMapper revistaPublicacionMapper;

        public RevistaPublicacionController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                            IRevistaPublicacionMapper revistaPublicacionMapper,
                                            ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.revistaPublicacionMapper = revistaPublicacionMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var revistaPublicacions = catalogoService.GetAllRevistaPublicaciones();
            data.List = revistaPublicacionMapper.Map(revistaPublicacions);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new RevistaPublicacionForm();

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var revistaPublicacion = catalogoService.GetRevistaPublicacionById(id);
            data.Form = revistaPublicacionMapper.Map(revistaPublicacion);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var revistaPublicacion = catalogoService.GetRevistaPublicacionById(id);
            data.Form = revistaPublicacionMapper.Map(revistaPublicacion);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(RevistaPublicacionForm form)
        {
            var revistaPublicacion = revistaPublicacionMapper.Map(form);

            revistaPublicacion.CreadorPor = CurrentUser();
            revistaPublicacion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(revistaPublicacion, form, Title.New))
                return ViewNew();

            catalogoService.SaveRevistaPublicacion(revistaPublicacion);

            return RedirectToIndex(String.Format("Revista de Publicación {0} ha sido creada", revistaPublicacion.Titulo));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(RevistaPublicacionForm form)
        {
            var revistaPublicacion = revistaPublicacionMapper.Map(form);

            revistaPublicacion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(revistaPublicacion, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveRevistaPublicacion(revistaPublicacion);

            return RedirectToIndex(String.Format("Revista de Publicación {0} ha sido modificada", revistaPublicacion.Titulo));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var revistaPublicacion = catalogoService.GetRevistaPublicacionById(id);
            revistaPublicacion.Activo = true;
            revistaPublicacion.ModificadoPor = CurrentUser();
            catalogoService.SaveRevistaPublicacion(revistaPublicacion);

            var form = revistaPublicacionMapper.Map(revistaPublicacion);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var revistaPublicacion = catalogoService.GetRevistaPublicacionById(id);
            revistaPublicacion.Activo = false;
            revistaPublicacion.ModificadoPor = CurrentUser();
            catalogoService.SaveRevistaPublicacion(revistaPublicacion);

            var form = revistaPublicacionMapper.Map(revistaPublicacion);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<RevistaPublicacion>(x => x.Titulo, q);
            return Content(data);
        }
    }
}