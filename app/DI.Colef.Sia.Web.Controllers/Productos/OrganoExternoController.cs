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
        readonly ICatalogoService catalogoService;
        readonly IOrganoExternoMapper organoExternoMapper;
        readonly IOrganoExternoService organoExternoService;
        readonly ISectorMapper sectorMapper;
        readonly IArchivoService archivoService;
        readonly ITipoOrganoMapper tipoOrganoMapper;
        readonly IPaisMapper paisMapper;
        
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
            this.catalogoService = catalogoService;
            this.organoExternoService = organoExternoService;
            this.organoExternoMapper = organoExternoMapper;
            this.tipoOrganoMapper = tipoOrganoMapper;
            this.sectorMapper = sectorMapper;
            this.archivoService = archivoService;
            this.ambitoMapper = ambitoMapper;
            this.paisMapper = paisMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            return RedirectToHomeIndex();
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

        //[CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(OrganoExternoForm form)
        {
            var organoExterno = organoExternoMapper.Map(form, CurrentUser(), CurrentInvestigador());

            ModelState.AddModelErrors(organoExterno.ValidationResults(), true, "OrganoExterno");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }
            
            organoExternoService.SaveOrganoExterno(organoExterno, true);
            SetMessage(String.Format("Órgano externo {0} ha sido modificado", organoExterno.Nombre));

            return Rjs("Save", organoExterno.Id);
        }

        [CookieLessAuthorize(Roles = "Investigadores")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddFile(FormCollection form)
        {
            var id = Convert.ToInt32(form["Id"]);
            var organoExterno = organoExternoService.GetOrganoExternoById(id);

            var file = Request.Files["fileData"];

            var archivo = new Archivo
            {
                Activo = true,
                Contenido = file.ContentType,
                CreadoEl = DateTime.Now,
                CreadoPor = CurrentUser(),
                ModificadoEl = DateTime.Now,
                ModificadoPor = CurrentUser(),
                Nombre = file.FileName,
                Tamano = file.ContentLength
            };

            var datos = new byte[file.ContentLength];
            file.InputStream.Read(datos, 0, datos.Length);
            archivo.Datos = datos;

            if (form["TipoArchivo"] == "ComprobanteOrganoExterno")
            {
                archivo.TipoProducto = organoExterno.TipoProducto;
                archivoService.Save(archivo);
                organoExterno.ComprobanteOrganoExterno = archivo;
            }

            organoExternoService.SaveOrganoExterno(organoExterno);

            return Content("Uploaded");
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