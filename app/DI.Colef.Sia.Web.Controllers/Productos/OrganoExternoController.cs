using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos
{
    [HandleError]
    public class OrganoExternoController : BaseController<OrganoExterno, OrganoExternoForm>
    {
        readonly IAmbitoMapper ambitoMapper;
        readonly ICatalogoService catalogoService;
        readonly IOrganoExternoMapper organoExternoMapper;
        readonly IOrganoExternoService organoExternoService;
        readonly ISectorMapper sectorMapper;
        readonly ITipoOrganoMapper tipoOrganoMapper;
        
        public OrganoExternoController(IOrganoExternoService organoExternoService,
                                       IOrganoExternoMapper organoExternoMapper,
                                       ICatalogoService catalogoService,
                                       IUsuarioService usuarioService,
                                       ITipoOrganoMapper tipoOrganoMapper,
                                       ISectorMapper sectorMapper,
                                       IAmbitoMapper ambitoMapper,
                                       ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.organoExternoService = organoExternoService;
            this.organoExternoMapper = organoExternoMapper;
            this.tipoOrganoMapper = tipoOrganoMapper;
            this.sectorMapper = sectorMapper;
            this.ambitoMapper = ambitoMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var organoExternos = new OrganoExterno[] { };

            if (User.IsInRole("Investigadores"))
                organoExternos = organoExternoService.GetAllOrganoExternos(CurrentUser());
            if (User.IsInRole("DGAA"))
                organoExternos = organoExternoService.GetAllOrganoExternos();

            data.List = organoExternoMapper.Map(organoExternos);

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            if (CurrentInvestigador() == null)
                return NoInvestigadorProfile("Por tal motivo no puede crear nuevos productos.");

            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var organoExterno = organoExternoService.GetOrganoExternoById(id);

            if (organoExterno == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (organoExterno.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var organoExternoForm = organoExternoMapper.Map(organoExterno);

            data.Form = SetupNewForm(organoExternoForm);
            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var organoExterno = organoExternoService.GetOrganoExternoById(id);
            data.Form = organoExternoMapper.Map(organoExterno);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(OrganoExternoForm form)
        {
            var organoExterno = organoExternoMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(organoExterno, form, Title.New, "OrganoExterno"))
            {
                ((GenericViewData<OrganoExternoForm>) ViewData.Model).Form = SetupNewForm();
                return ViewNew();
            }

            organoExternoService.SaveOrganoExterno(organoExterno);

            return RedirectToIndex(String.Format("Órgano externo {0} ha sido creado", organoExterno.Nombre));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(OrganoExternoForm form)
        {
            var organoExterno = organoExternoMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(organoExterno, form, Title.Edit))
            {
                var organoExternoForm = organoExternoMapper.Map(organoExterno);
                ((GenericViewData<OrganoExternoForm>) ViewData.Model).Form = SetupNewForm(organoExternoForm);
                FormSetCombos(organoExternoForm);
                return ViewEdit();
            }

            organoExternoService.SaveOrganoExterno(organoExterno);

            return RedirectToIndex(String.Format("Órgano externo {0} ha sido modificado", organoExterno.Nombre));
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<OrganoExterno>(x => x.Nombre, q);
            return Content(data);
        }

        OrganoExternoForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        OrganoExternoForm SetupNewForm(OrganoExternoForm form)
        {
            form = form ?? new OrganoExternoForm();

            form.TiposOrganos = tipoOrganoMapper.Map(catalogoService.GetActiveTipoOrganos());
            form.Sectores = sectorMapper.Map(catalogoService.GetActiveSectoresOrganosExternos());
            form.Ambitos = ambitoMapper.Map(catalogoService.GetActiveAmbitos());

            return form;
        }

        void FormSetCombos(OrganoExternoForm form)
        {
            ViewData["TipoOrgano"] = form.TipoOrganoId;
            ViewData["Sector"] = form.SectorId;
            ViewData["Ambito"] = form.AmbitoId;
        }
    }
}