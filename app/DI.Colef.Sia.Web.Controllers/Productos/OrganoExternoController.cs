using System;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Security;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos
{
    [HandleError]
    public class OrganoExternoController : BaseController<OrganoExterno, OrganoExternoForm>
    {
        readonly IAmbitoMapper ambitoMapper;
        readonly IOrganoExternoMapper organoExternoMapper;
        readonly IOrganoExternoService organoExternoService;
        readonly ISectorMapper sectorMapper;
        readonly ITipoOrganoMapper tipoOrganoMapper;
        
        public OrganoExternoController(IOrganoExternoService organoExternoService,
                                       IOrganoExternoMapper organoExternoMapper,
                                       IArchivoService archivoService,
                                       ICatalogoService catalogoService,
                                       IUsuarioService usuarioService,
                                       ITipoOrganoMapper tipoOrganoMapper,
                                       ISectorMapper sectorMapper,
                                       IAmbitoMapper ambitoMapper,
                                       ISearchService searchService, IPaisMapper paisMapper)
            : base(usuarioService, searchService, catalogoService)
        {
            base.catalogoService = catalogoService;
            this.organoExternoService = organoExternoService;
            this.organoExternoMapper = organoExternoMapper;
            this.tipoOrganoMapper = tipoOrganoMapper;
            this.sectorMapper = sectorMapper;
            this.ambitoMapper = ambitoMapper;
            this.paisMapper = paisMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<OrganoExternoForm>();
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
            ViewData["Pais"] = (from p in data.Form.Paises where p.Nombre == "México" select p.Id).FirstOrDefault();
            return View(data);
        }

        [Authorize(Roles = "Investigadores, DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var organoExterno = organoExternoService.GetOrganoExternoById(id);

            if (organoExterno.Firma.Aceptacion1 == 1 && organoExterno.Firma.Aceptacion2 == 0 && User.IsInRole("Investigadores"))
                return RedirectToHomeIndex(String.Format("El órgano externo {0} esta en firma y no puede ser editado", organoExterno.Nombre));
            
            if (User.IsInRole("DGAA"))
            {
                if ((organoExterno.Firma.Aceptacion1 == 1 && organoExterno.Firma.Aceptacion2 == 1) ||
                    (organoExterno.Firma.Aceptacion1 == 0 && organoExterno.Firma.Aceptacion2 == 0) ||
                    (organoExterno.Firma.Aceptacion1 == 0 && organoExterno.Firma.Aceptacion2 == 2)
                   )
                    return
                        RedirectToHomeIndex(String.Format(
                                                "El órgano externo {0} ya fue aceptado o no ha sido enviado a firma",
                                                organoExterno.Nombre));
            }

            if (User.IsInRole("Investigadores"))
            {
                if (organoExterno.Usuario.Id != CurrentUser().Id)
                    return RedirectToHomeIndex("no lo puede modificar");
            }
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

            ModelState.AddModelErrors(organoExterno.ValidationResults(), true, "OrganoExterno");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            organoExternoService.SaveOrganoExterno(organoExterno);
            SetMessage(String.Format("Órgano externo {0} ha sido creado", organoExterno.Nombre));

            return Rjs("Save", organoExterno.Id);
        }

        [Authorize]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(OrganoExternoForm form)
        {
            var organoExterno = new OrganoExterno();

            if (User.IsInRole("Investigadores"))
               organoExterno = organoExternoMapper.Map(form, CurrentUser(), CurrentInvestigador());
            if (User.IsInRole("DGAA"))
               organoExterno = organoExternoMapper.Map(form, CurrentUser());

            ModelState.AddModelErrors(organoExterno.ValidationResults(), true, "OrganoExterno");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }
            
            organoExternoService.SaveOrganoExterno(organoExterno, true);
            SetMessage(String.Format("Órgano externo {0} ha sido modificado", organoExterno.Nombre));

            return Rjs("Save", organoExterno.Id);
        }

        [CookieLessAuthorize]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddFile(FormCollection form)
        {
            var id = Convert.ToInt32(form["Id"]);
            var organoExterno = organoExternoService.GetOrganoExternoById(id);

            var archivo = MapArchivo<ArchivoOrganoExterno>();
            organoExterno.AddArchivo(archivo);

            organoExternoService.SaveOrganoExterno(organoExterno);

            return Content("Uploaded");
        }

        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DgaaValidateProduct(FirmaForm firmaForm)
        {

            var organoExterno = organoExternoService.GetOrganoExternoById(firmaForm.ProductoId);

            organoExterno.Firma.Aceptacion2 = 1;
            organoExterno.Firma.Usuario2 = CurrentUser();

            organoExternoService.SaveOrganoExterno(organoExterno);

            var data = new FirmaForm
            {
                TipoProducto = firmaForm.TipoProducto,
                Aceptacion2 = 1
            };

            return Rjs("DgaaSign", data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DgaaRejectProduct(FirmaForm firmaForm)
        {

            var organoExterno = organoExternoService.GetOrganoExternoById(firmaForm.ProductoId);
            organoExterno.Firma.Aceptacion1 = 0;
            organoExterno.Firma.Aceptacion2 = 2;
            organoExterno.Firma.Descripcion = firmaForm.Descripcion;
            organoExterno.Firma.Usuario1 = CurrentUser();
            organoExterno.Firma.Usuario2 = CurrentUser();

            ModelState.AddModelErrors(organoExterno.ValidationResults(), false, "Firma");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            organoExternoService.SaveOrganoExterno(organoExterno, true);

            var data = new FirmaForm
                           {
                               TipoProducto = firmaForm.TipoProducto,
                               Aceptacion2 = 2
                           };

            return Rjs("DgaaSign", data);
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
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());

            return form;
        }

        void FormSetCombos(OrganoExternoForm form)
        {
            ViewData["TipoOrgano"] = form.TipoOrganoId;
            ViewData["Sector"] = form.SectorId;
            ViewData["Ambito"] = form.AmbitoId;
            ViewData["Pais"] = form.PaisId;
        }
    }
}