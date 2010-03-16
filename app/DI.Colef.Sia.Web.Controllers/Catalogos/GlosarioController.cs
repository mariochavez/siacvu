using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    public class GlosarioController : BaseController<Glosario, GlosarioForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IGlosarioMapper glosarioMapper;

        public GlosarioController(IUsuarioService usuarioService, ISearchService searchService, 
                                  ICatalogoService catalogoService, IGlosarioMapper glosarioMapper) 
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.glosarioMapper = glosarioMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var glosarios = catalogoService.GetAllGlosarios();
            data.List = glosarioMapper.Map(glosarios);

            return View(data);
        }

        //[Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);

            data.Form = new GlosarioForm();

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var glosario = catalogoService.GetGlosarioById(id);
            var glosarioForm = glosarioMapper.Map(glosario);

            data.Form = glosarioForm;

            ViewData.Model = data;

            return View();
        }

        //[Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(GlosarioForm form)
        {
            var glosario = glosarioMapper.Map(form);

            glosario.CreadoPor = CurrentUser();
            glosario.ModificadoPor = CurrentUser();

            if(IsValidateModel(glosario, form, Title.New))
            {
                var glosarioForm = glosarioMapper.Map(glosario);

                ((GenericViewData<GlosarioForm>) ViewData.Model).Form = glosarioForm;
                return ViewNew();
            }

            catalogoService.SaveGlosario(glosario);

            return RedirectToIndex(String.Format("Glosario {0} ha sido creado", glosario.Campo));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(GlosarioForm form)
        {
            var glosario = glosarioMapper.Map(form);

            glosario.ModificadoPor = CurrentUser();

            if (!IsValidateModel(glosario, form, Title.Edit))
            {
                var glosarioForm = glosarioMapper.Map(glosario);

                ((GenericViewData<GlosarioForm>) ViewData.Model).Form = glosarioForm;

                return ViewEdit();
            }

            catalogoService.SaveGlosario(glosario);

            return RedirectToIndex(String.Format("Glosario {0} ha sido modificado", glosario.Campo));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var glosario = catalogoService.GetGlosarioById(id);
            glosario.Activo = true;
            glosario.ModificadoPor = CurrentUser();
            catalogoService.SaveGlosario(glosario);

            var form = glosarioMapper.Map(glosario);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var glosario = catalogoService.GetGlosarioById(id);
            glosario.Activo = false;
            glosario.ModificadoPor = CurrentUser();
            catalogoService.SaveGlosario(glosario);

            var form = glosarioMapper.Map(glosario);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Glosario>(x => x.Campo, q);
            return Content(data);
        }
    }
}
