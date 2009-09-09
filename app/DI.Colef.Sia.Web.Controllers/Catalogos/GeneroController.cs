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
    public class GeneroController : BaseController<Genero, GeneroForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IGeneroMapper generoMapper;

        public GeneroController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                IGeneroMapper generoMapper, ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.generoMapper = generoMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var generos = catalogoService.GetAllGeneros();
            data.List = generoMapper.Map(generos);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new GeneroForm();

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var genero = catalogoService.GetGeneroById(id);
            data.Form = generoMapper.Map(genero);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(GeneroForm form)
        {
            var genero = generoMapper.Map(form);

            genero.CreadorPor = CurrentUser();
            genero.ModificadoPor = CurrentUser();

            if (!IsValidateModel(genero, form, Title.New))
                return ViewNew();

            catalogoService.SaveGenero(genero);

            return RedirectToIndex(String.Format("G�nero {0} ha sido creado", genero.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(GeneroForm form)
        {
            var genero = generoMapper.Map(form);

            genero.ModificadoPor = CurrentUser();

            if (!IsValidateModel(genero, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveGenero(genero);

            return RedirectToIndex(String.Format("G�nero {0} ha sido modificado", genero.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var genero = catalogoService.GetGeneroById(id);
            genero.Activo = true;
            genero.ModificadoPor = CurrentUser();
            catalogoService.SaveGenero(genero);

            var form = generoMapper.Map(genero);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var genero = catalogoService.GetGeneroById(id);
            genero.Activo = false;
            genero.ModificadoPor = CurrentUser();
            catalogoService.SaveGenero(genero);

            var form = generoMapper.Map(genero);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Genero>(x => x.Nombre, q);
            return Content(data);
        }
    }
}