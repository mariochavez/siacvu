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
    public class TipoDictamenController : BaseController<TipoDictamen, TipoDictamenForm>
    {
        readonly ITipoDictamenMapper tipoDictamenMapper;

        public TipoDictamenController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                      ITipoDictamenMapper tipoDictamenMapper, ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.tipoDictamenMapper = tipoDictamenMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<TipoDictamenForm>();

            var tipoDictamens = catalogoService.GetAllTipoDictamenes();
            data.List = tipoDictamenMapper.Map(tipoDictamens);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = new GenericViewData<TipoDictamenForm> {Form = new TipoDictamenForm()};

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<TipoDictamenForm>();

            var tipoDictamen = catalogoService.GetTipoDictamenById(id);
            data.Form = tipoDictamenMapper.Map(tipoDictamen);

            ViewData.Model = data;
            return View();
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoDictamenForm form)
        {
            var tipoDictamen = tipoDictamenMapper.Map(form);

            tipoDictamen.CreadoPor = CurrentUser();
            tipoDictamen.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoDictamen, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoDictamen(tipoDictamen);

            return RedirectToIndex(String.Format("Tipo de Dictámen {0} ha sido registrado", tipoDictamen.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoDictamenForm form)
        {
            var tipoDictamen = tipoDictamenMapper.Map(form);

            tipoDictamen.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoDictamen, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoDictamen(tipoDictamen);

            return RedirectToIndex(String.Format("Tipo de Dictámen {0} ha sido modificado", tipoDictamen.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoDictamen = catalogoService.GetTipoDictamenById(id);
            tipoDictamen.Activo = true;
            tipoDictamen.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoDictamen(tipoDictamen);

            var form = tipoDictamenMapper.Map(tipoDictamen);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoDictamen = catalogoService.GetTipoDictamenById(id);
            tipoDictamen.Activo = false;
            tipoDictamen.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoDictamen(tipoDictamen);

            var form = tipoDictamenMapper.Map(tipoDictamen);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<TipoDictamen>(x => x.Nombre, q);
            return Content(data);
        }
    }
}