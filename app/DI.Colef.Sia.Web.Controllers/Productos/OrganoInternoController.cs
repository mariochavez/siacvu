using System;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Security;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos
{
    [HandleError]
    public class OrganoInternoController : BaseController<OrganoInterno, OrganoInternoForm>
    {
		readonly IOrganoInternoService organoInternoService;
        readonly IOrganoInternoMapper organoInternoMapper;
        readonly ICatalogoService catalogoService;
        readonly IConsejoComisionMapper consejoComisionMapper;
        readonly ICustomCollection customCollection;
        readonly IArchivoService archivoService;
    
        public OrganoInternoController(IOrganoInternoService organoInternoService, 
			IOrganoInternoMapper organoInternoMapper,
            IArchivoService archivoService,
			ICatalogoService catalogoService,
            ICustomCollection customCollection,
            IUsuarioService usuarioService,
            ISearchService searchService,
            IConsejoComisionMapper consejoComisionMapper)
            : base(usuarioService, searchService, catalogoService)
        {
			this.catalogoService = catalogoService;
            this.customCollection = customCollection;
            this.archivoService = archivoService;
            this.organoInternoService = organoInternoService;
            this.organoInternoMapper = organoInternoMapper;
			this.consejoComisionMapper = consejoComisionMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);
            var organoInternos = new OrganoInterno[] { };

            if (User.IsInRole("Investigadores"))
                organoInternos = organoInternoService.GetAllOrganoInternos(CurrentUser());

            if (User.IsInRole("DGAA"))
                organoInternos = organoInternoService.GetAllOrganoInternos();

            data.List = organoInternoMapper.Map(organoInternos);

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
            ViewData["Periodo"] = (from p in data.Form.Periodos where p.Nombre == "Primer periodo" select p.Id).FirstOrDefault();

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var organoInterno = organoInternoService.GetOrganoInternoById(id);

            if (organoInterno == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (organoInterno.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);
                        
            var organoInternoForm = organoInternoMapper.Map(organoInterno);

            data.Form = SetupNewForm(organoInternoForm);

            FormSetCombos(data.Form);
            
			ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var organoInterno = organoInternoService.GetOrganoInternoById(id);
            data.Form = organoInternoMapper.Map(organoInterno);
            
            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "Investigadores")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(OrganoInternoForm form)
        {
            var organoInterno = organoInternoMapper.Map(form, CurrentUser(), CurrentInvestigador());

            ModelState.AddModelErrors(organoInterno.ValidationResults(), true, "OrganoInterno");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            organoInternoService.SaveOrganoInterno(organoInterno);
            SetMessage(String.Format("Órgano interno {0} ha sido creado", organoInterno.ConsejoComision.Nombre));

            return Rjs("Save", organoInterno.Id);
        }

        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(OrganoInternoForm form)
        {
            var organoInterno = organoInternoMapper.Map(form, CurrentUser(), CurrentInvestigador());
            ModelState.AddModelErrors(organoInterno.ValidationResults(), true, "OrganoInterno");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }
            
            organoInternoService.SaveOrganoInterno(organoInterno, true);
            SetMessage(String.Format("Órgano interno {0} ha sido modificado", organoInterno.ConsejoComision.Nombre));

            return Rjs("Save", organoInterno.Id);
        }

        [CookieLessAuthorize(Roles = "Investigadores")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddFile(FormCollection form)
        {
            var id = Convert.ToInt32(form["Id"]);
            var organoInterno = organoInternoService.GetOrganoInternoById(id);

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

            if (form["TipoArchivo"] == "ComprobanteOrganoInterno")
            {
                archivo.TipoProducto = organoInterno.TipoProducto;
                archivoService.Save(archivo);
                organoInterno.ComprobanteOrganoInterno = archivo;
            }

            organoInternoService.SaveOrganoInterno(organoInterno);

            return Content("Uploaded");
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.SearchOrganoInterno(q);
            return Content(data);
        }

        OrganoInternoForm SetupNewForm()
        {
            return SetupNewForm(null);
        }
        
        OrganoInternoForm SetupNewForm(OrganoInternoForm form)
        {
			form = form ?? new OrganoInternoForm();
            
			//Lista de Catalogos Pendientes
            form.Periodos = customCollection.PeriodoCustomCollection();
            form.ConsejosComisiones = consejoComisionMapper.Map(catalogoService.GetActiveConsejoComisions());

			return form;
        }
        
        private void FormSetCombos(OrganoInternoForm form)
        {
            ViewData["ConsejoComision"] = form.ConsejoComisionId;
            ViewData["Periodo"] = form.Periodo;
        }
    }
}
