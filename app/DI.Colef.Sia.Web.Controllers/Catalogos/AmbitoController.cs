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
    public class AmbitoController : BaseController<Ambito, AmbitoForm>
    {
        readonly IAmbitoMapper ambitoMapper;
        readonly ICatalogoService catalogoService;

        public AmbitoController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                IAmbitoMapper ambitoMapper, ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.ambitoMapper = ambitoMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var ambitos = catalogoService.GetAllAmbitos();
            data.List = ambitoMapper.Map(ambitos);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new AmbitoForm();

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var ambito = catalogoService.GetAmbitoById(id);
            data.Form = ambitoMapper.Map(ambito);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(AmbitoForm form)
        {
            var ambito = ambitoMapper.Map(form);

            ambito.CreadorPor = CurrentUser();
            ambito.ModificadoPor = CurrentUser();

            if (!IsValidateModel(ambito, form, Title.New))
                return ViewNew();

            catalogoService.SaveAmbito(ambito);

            return RedirectToIndex(String.Format("Ámbito {0} ha sido creado", ambito.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(AmbitoForm form)
        {
            var ambito = ambitoMapper.Map(form);

            ambito.ModificadoPor = CurrentUser();

            if (!IsValidateModel(ambito, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveAmbito(ambito);

            return RedirectToIndex(String.Format("Ámbito {0} ha sido modificado", ambito.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var ambito = catalogoService.GetAmbitoById(id);
            ambito.Activo = true;
            ambito.ModificadoPor = CurrentUser();
            catalogoService.SaveAmbito(ambito);

            var form = ambitoMapper.Map(ambito);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var ambito = catalogoService.GetAmbitoById(id);
            ambito.Activo = false;
            ambito.ModificadoPor = CurrentUser();
            catalogoService.SaveAmbito(ambito);

            var form = ambitoMapper.Map(ambito);

            return Rjs("Activate", form);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Ambito>(x => x.Nombre, q);
            return Content(data);
        }
    }
}