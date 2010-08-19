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
    public class IdiomaController : BaseController<Idioma, IdiomaForm>
    {
        readonly IIdiomaMapper idiomaMapper;

        public IdiomaController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                IIdiomaMapper idiomaMapper, ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.idiomaMapper = idiomaMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<IdiomaForm>();

            var idiomas = catalogoService.GetAllIdiomas();
            data.List = idiomaMapper.Map(idiomas);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = new GenericViewData<IdiomaForm> {Form = new IdiomaForm()};

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<IdiomaForm>();

            var idioma = catalogoService.GetIdiomaById(id);
            data.Form = idiomaMapper.Map(idioma);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(IdiomaForm form)
        {
            var idioma = idiomaMapper.Map(form);

            idioma.CreadoPor = CurrentUser();
            idioma.ModificadoPor = CurrentUser();

            if (!IsValidateModel(idioma, form, Title.New))
                return ViewNew();

            catalogoService.SaveIdioma(idioma);

            return RedirectToIndex(String.Format("Idioma {0} ha sido registrado", idioma.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(IdiomaForm form)
        {
            var idioma = idiomaMapper.Map(form);

            idioma.ModificadoPor = CurrentUser();

            if (!IsValidateModel(idioma, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveIdioma(idioma);

            return RedirectToIndex(String.Format("Idioma {0} ha sido modificado", idioma.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var idioma = catalogoService.GetIdiomaById(id);
            idioma.Activo = true;
            idioma.ModificadoPor = CurrentUser();
            catalogoService.SaveIdioma(idioma);

            var form = idiomaMapper.Map(idioma);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var idioma = catalogoService.GetIdiomaById(id);
            idioma.Activo = false;
            idioma.ModificadoPor = CurrentUser();
            catalogoService.SaveIdioma(idioma);

            var form = idiomaMapper.Map(idioma);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Idioma>(x => x.Nombre, q);
            return Content(data);
        }
    }
}