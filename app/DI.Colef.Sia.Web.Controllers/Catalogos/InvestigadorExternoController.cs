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
    public class InvestigadorExternoController : BaseController<InvestigadorExterno, InvestigadorExternoForm>
    {
        readonly IInvestigadorExternoMapper investigadorExternoMapper;

        public InvestigadorExternoController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                             IInvestigadorExternoMapper investigadorExternoMapper,
                                             ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.investigadorExternoMapper = investigadorExternoMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<InvestigadorExternoForm>();

            var investigadorExternos = catalogoService.GetAllInvestigadorExternos();
            data.List = investigadorExternoMapper.Map(investigadorExternos);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = new GenericViewData<InvestigadorExternoForm> {Form = new InvestigadorExternoForm()};

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<InvestigadorExternoForm>();

            var investigadorExterno = catalogoService.GetInvestigadorExternoById(id);
            data.Form = investigadorExternoMapper.Map(investigadorExterno);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = new GenericViewData<InvestigadorExternoForm>();

            var investigadorExterno = catalogoService.GetInvestigadorExternoById(id);
            data.Form = investigadorExternoMapper.Map(investigadorExterno);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(InvestigadorExternoForm form)
        {
            var investigadorExterno = investigadorExternoMapper.Map(form);

            investigadorExterno.CreadoPor = CurrentUser();
            investigadorExterno.ModificadoPor = CurrentUser();

            if (!IsValidateModel(investigadorExterno, form, Title.New))
                return ViewNew();

            catalogoService.SaveInvestigadorExterno(investigadorExterno);

            return RedirectToIndex(String.Format("Investigador Externo {0} ha sido creado", investigadorExterno.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(InvestigadorExternoForm form)
        {
            var investigadorExterno = investigadorExternoMapper.Map(form);

            investigadorExterno.ModificadoPor = CurrentUser();

            if (!IsValidateModel(investigadorExterno, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveInvestigadorExterno(investigadorExterno);

            return RedirectToIndex(String.Format("Investigador Externo {0} ha sido modificado", investigadorExterno.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var investigadorExterno = catalogoService.GetInvestigadorExternoById(id);
            investigadorExterno.Activo = true;
            investigadorExterno.ModificadoPor = CurrentUser();
            catalogoService.SaveInvestigadorExterno(investigadorExterno);

            var form = investigadorExternoMapper.Map(investigadorExterno);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var investigadorExterno = catalogoService.GetInvestigadorExternoById(id);
            investigadorExterno.Activo = false;
            investigadorExterno.ModificadoPor = CurrentUser();
            catalogoService.SaveInvestigadorExterno(investigadorExterno);

            var form = investigadorExternoMapper.Map(investigadorExterno);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<InvestigadorExterno>(x => x.Nombre, q);
            return Content(data);
        }
    }
}