using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;
using SharpArch.Core.DomainModel;
using uNhAddIns.Inflector;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    public enum Title
    {
        New,
        Edit,
        Index,
        Show,
        CV
    }

    public class BaseController : Controller
    {
        protected ContentResult Rjs(string viewName, ViewDataDictionary viewdata)
        {
            var output = this.RenderPartialToString(viewName, viewdata);
            output = output.Replace("\n", " ");
            output = output.Replace("\r", " ");

            output = "try { " + output + " } catch(e) { alert(e); }";
            return Content(output);
        }

        protected ContentResult Rjs(string viewName, object model)
        {
            ViewData.Model = model;
            return Rjs(viewName, ViewData);
        }

        protected ContentResult Rjs(string viewName)
        {
            return Rjs(viewName, ViewData);
        }

        protected ContentResult Rjs(object model)
        {
            var viewName = ControllerContext.RouteData.Values["action"].ToString();
            ViewData.Model = model;
            return Rjs(viewName, ViewData);
        }
    }

    public class BaseController<TModel, TForm> : BaseController where TModel : Entity
    {
        protected readonly IUsuarioService usuarioService;
        protected readonly ISearchService searchService;
        protected readonly ICatalogoService catalogoService;
        protected readonly IInstitucionMapper institucionMapper;
        protected readonly ISedeMapper sedeMapper;
        protected readonly IDisciplinaMapper disciplinaMapper;
        protected readonly ISubdisciplinaMapper subdisciplinaMapper;
        protected readonly IOrganizacionMapper organizacionMapper;
        protected readonly INivelMapper nivelMapper;
        protected readonly IRamaMapper ramaMapper;
        protected readonly IClaseMapper claseMapper;

        public BaseController(IUsuarioService usuarioService, ISearchService searchService,
                              ICatalogoService catalogoService) : 
            this(usuarioService, searchService, catalogoService, null, null, null, null, null, null, null, null)
        {
        }

        public BaseController(IUsuarioService usuarioService, ISearchService searchService,
                              ICatalogoService catalogoService, IInstitucionMapper institucionMapper, ISedeMapper sedeMapper) :
            this(usuarioService, searchService, catalogoService, institucionMapper, sedeMapper, null, null, null, null, null, null)
        {
        }

        public BaseController(IUsuarioService usuarioService, ISearchService searchService,
                              ICatalogoService catalogoService, IDisciplinaMapper disciplinaMapper, ISubdisciplinaMapper subdisciplinaMapper) :
            this(usuarioService, searchService, catalogoService, null, null, disciplinaMapper, subdisciplinaMapper, null, null, null, null)
        {
        }

        public BaseController(IUsuarioService usuarioService, ISearchService searchService,
                             ICatalogoService catalogoService, IDisciplinaMapper disciplinaMapper, ISubdisciplinaMapper subdisciplinaMapper,
                              IRamaMapper ramaMapper, IClaseMapper claseMapper) :
            this(usuarioService, searchService, catalogoService, null, null, disciplinaMapper, subdisciplinaMapper, null, null, ramaMapper, claseMapper)
        {
        }

        public BaseController(IUsuarioService usuarioService, ISearchService searchService,
                              ICatalogoService catalogoService, IOrganizacionMapper organizacionMapper,
                              INivelMapper nivelMapper) :
            this(usuarioService, searchService, catalogoService, null, null, null, null, organizacionMapper, nivelMapper, null, null)
        {
        }

        public BaseController(IUsuarioService usuarioService, ISearchService searchService,
                      ICatalogoService catalogoService, IInstitucionMapper institucionMapper, IOrganizacionMapper organizacionMapper,
                      INivelMapper nivelMapper) :
            this(usuarioService, searchService, catalogoService, institucionMapper, null, null, null, organizacionMapper, nivelMapper, null, null)
        {
        }

        public BaseController(IUsuarioService usuarioService, ISearchService searchService,
                              ICatalogoService catalogoService, IDisciplinaMapper disciplinaMapper, ISubdisciplinaMapper subdisciplinaMapper,
                              IOrganizacionMapper organizacionMapper, INivelMapper nivelMapper) :
            this(usuarioService, searchService, catalogoService, null, null, disciplinaMapper, subdisciplinaMapper, organizacionMapper, nivelMapper, null, null)
        {
        }

        public BaseController(IUsuarioService usuarioService, ISearchService searchService,
                             ICatalogoService catalogoService, IInstitucionMapper institucionMapper, IDisciplinaMapper disciplinaMapper, ISubdisciplinaMapper subdisciplinaMapper,
                             IOrganizacionMapper organizacionMapper, INivelMapper nivelMapper) :
            this(usuarioService, searchService, catalogoService, institucionMapper, null, disciplinaMapper, subdisciplinaMapper, organizacionMapper, nivelMapper, null, null)
        {
        }

        public BaseController(IUsuarioService usuarioService, ISearchService searchService,
                             ICatalogoService catalogoService, IDisciplinaMapper disciplinaMapper, ISubdisciplinaMapper subdisciplinaMapper,
                             IOrganizacionMapper organizacionMapper, INivelMapper nivelMapper, IRamaMapper ramaMapper, IClaseMapper claseMapper) :
            this(usuarioService, searchService, catalogoService, null, null, disciplinaMapper, subdisciplinaMapper, organizacionMapper, nivelMapper, ramaMapper, claseMapper)
        {
        }

        public BaseController(IUsuarioService usuarioService, ISearchService searchService,
                              ICatalogoService catalogoService, IInstitucionMapper institucionMapper, ISedeMapper sedeMapper,
                              IDisciplinaMapper disciplinaMapper, ISubdisciplinaMapper subdisciplinaMapper, IOrganizacionMapper organizacionMapper,
                              INivelMapper nivelMapper, IRamaMapper ramaMapper, IClaseMapper claseMapper)
        {
            this.usuarioService = usuarioService;
            this.searchService = searchService;
            this.catalogoService = catalogoService;
            this.institucionMapper = institucionMapper;
            this.sedeMapper = sedeMapper;
            this.disciplinaMapper = disciplinaMapper;
            this.subdisciplinaMapper = subdisciplinaMapper;
            this.organizacionMapper = organizacionMapper;
            this.nivelMapper = nivelMapper;
            this.ramaMapper = ramaMapper;
            this.claseMapper = claseMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public virtual ActionResult Search(string q)
        {
            return Content("");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public virtual ActionResult Search(int searchId)
        {
            return RedirectToEdit(searchId);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeArea(int select)
        {
            if (disciplinaMapper == null)
                return Content("Action not supported");

            var list = new List<DisciplinaForm> { new DisciplinaForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(disciplinaMapper.Map(catalogoService.GetDisciplinasByAreaId(select)));

            var form = new ShowFieldsForm
                           {
                               Disciplinas = list.ToArray(),
                               Subdisciplinas = new List<SubdisciplinaForm> { new SubdisciplinaForm { Id = 0, Nombre = "Seleccione ..." } }.ToArray()
                           };

            return Rjs("ChangeArea", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeDisciplina(int select)
        {
            if (subdisciplinaMapper == null)
                return Content("Action not supported");

            var list = new List<SubdisciplinaForm> { new SubdisciplinaForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(subdisciplinaMapper.Map(catalogoService.GetSubdisciplinasByDisciplinaId(select)));

            var form = new ShowFieldsForm
                           {
                               Subdisciplinas = list.ToArray()
                           };

            return Rjs("ChangeDisciplina", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeSector(int select)
        {
            if (organizacionMapper == null)
                return Content("Action not supported");

            var list = new List<OrganizacionForm> { new OrganizacionForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(organizacionMapper.Map(catalogoService.GetOrganizacionesBySectorId(select)));

            var form = new ShowFieldsForm
                           {
                               Organizaciones = list.ToArray(),
                               Niveles = new List<NivelForm> { new NivelForm { Id = 0, Nombre = "Seleccione ..." } }.ToArray()
                           };

            return Rjs("ChangeSector", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeOrganizacion(int select)
        {
            if (nivelMapper == null)
                return Content("Action not supported");

            var list = new List<NivelForm> { new NivelForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(nivelMapper.Map(catalogoService.GetNivelesByOrganizacionId(select)));

            var form = new ShowFieldsForm
                           {
                               Niveles = list.ToArray()
                           };

            return Rjs("ChangeOrganizacion", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeSectorEconomico(int select)
        {
            if (ramaMapper == null)
                return Content("Action not supported");

            var list = new List<RamaForm> { new RamaForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(ramaMapper.Map(catalogoService.GetRamasBySectorId(select)));

            var form = new ShowFieldsForm
                           {
                               Ramas = list.ToArray(),
                               Clases = new List<ClaseForm> { new ClaseForm { Id = 0, Nombre = "Seleccione ..." } }.ToArray()
                           };

            return Rjs("ChangeSectorEconomico", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeRama(int select)
        {
            if (ramaMapper == null)
                return Content("Action not supported");

            var list = new List<ClaseForm> { new ClaseForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(claseMapper.Map(catalogoService.GetClasesByRamaId(select)));

            var form = new ShowFieldsForm
                           {
                               Clases = list.ToArray()
                           };

            return Rjs("ChangeRama", form);
        }

        protected DisciplinaForm[] GetDisciplinasByAreaId(int id)
        {
            return id == 0
                       ? new DisciplinaForm[] {}
                       : disciplinaMapper.Map(catalogoService.GetDisciplinasByAreaId(id));

        }

        protected SubdisciplinaForm[] GetSubdisciplinasByDisciplinaId(int id)
        {
            return id == 0
                       ? new SubdisciplinaForm[] { }
                       : subdisciplinaMapper.Map(catalogoService.GetSubdisciplinasByDisciplinaId(id));
        }

        protected OrganizacionForm[] GetOrganizacionesBySectorId(int id)
        {
            return id == 0
                      ? new OrganizacionForm[] { }
                      : organizacionMapper.Map(catalogoService.GetOrganizacionesBySectorId(id));
        }

        protected NivelForm[] GetNivelesByOrganizacionId(int id)
        {
            return id == 0
                      ? new NivelForm[] { }
                      : nivelMapper.Map(catalogoService.GetNivelesByOrganizacionId(id));
        }

        protected RamaForm[] GetRamasBySectorEconomicoId(int id)
        {
            return id == 0
                      ? new RamaForm[] { }
                      : ramaMapper.Map(catalogoService.GetRamasBySectorId(id));
        }

        protected ClaseForm[] GetClasesByRamaId(int id)
        {
            return id == 0
                      ? new ClaseForm[] { }
                      : claseMapper.Map(catalogoService.GetClasesByRamaId(id));
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeInstitucion(int select)
        {
            if (institucionMapper == null)
                return Content("Action not supported");

            var institucionForm = institucionMapper.Map(catalogoService.GetInstitucionById(select));

            var form = new ShowFieldsForm
                           {
                               InstitucionId = institucionForm.Id,

                               InstitucionCiudad = institucionForm.Ciudad,
                               InstitucionEstadoPaisNombre = institucionForm.EstadoPaisNombre,
                               InstitucionPaisNombre = institucionForm.PaisNombre,
                               InstitucionTipoInstitucionNombre = institucionForm.TipoInstitucion
                           };

            return Rjs("ChangeInstitucion", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeSede(int select)
        {
            if (sedeMapper == null)
                return Content("Action not supported");

            var sedeForm = sedeMapper.Map(catalogoService.GetSedeById(select));

            var form = new ShowFieldsForm
            {
                DireccionRegionalNombre = sedeForm.DireccionRegionalNombre
            };

            return Rjs("ChangeSede", form);
        }

        protected Usuario CurrentUser()
        {
            var username = User.Identity.Name;
            return usuarioService.GetUsuarioByUserName(username);
        }

        protected Investigador CurrentInvestigador()
        {
            var usuario = CurrentUser();
            return usuarioService.GetInvestigadorByUsuario(usuario);
        }

        protected Pais GetDefaultPais()
        {
            var paises = catalogoService.GetActivePaises();
            return catalogoService.GetPaisById((from p in paises where p.Nombre == "México" select p.Id).FirstOrDefault());
        }

        protected bool IsInternacionalOrBinacional(string ambitoNombre, string[] ambitos)
        {
            var esInternacional = false;

            for (var i = 0; i < ambitos.Length; i++)
            {
                if (ambitoNombre == ambitos[i])
                    esInternacional = true;
            }

            return esInternacional;
        }

        protected RedirectToRouteResult RedirectToHomeIndex()
        {
            return RedirectToAction("Index", "Home");
        }

        protected RedirectToRouteResult RedirectToHomeIndex(string message)
        {
            SetMessage(message);
            return RedirectToAction("Index", "Home");
        }

        protected RedirectToRouteResult RedirectToIndex(string message)
        {
            SetMessage(message);
            return RedirectToAction("Index", "Home");
        }

        protected RedirectToRouteResult RedirectToIndex(string message, bool error)
        {
            if (error)
                SetError(String.Format("El {0} {1}", GetObjectName(false), message));
            else
                SetMessage(String.Format("El {0} {1}", GetObjectName(false), message));
            return RedirectToAction("Index", "Home");
        }

        protected RedirectToRouteResult RedirectToEdit(int id)
        {
            return RedirectToAction("Edit", new { id = id });
        }

        protected ActionResult NotAuthorized()
        {
            return RedirectToIndex("No tiene autorización para ver la página solicitada.");
        }

        protected ActionResult NoInvestigadorProfile()
        {
            return NoInvestigadorProfile(String.Empty);
        }

        protected ActionResult NoInvestigadorProfile(string message)
        {
            return RedirectToIndex("No existe perfil de investigador definido para éste usuario. " + message);
        }

        protected ViewResult ViewEdit()
        {
            return View("Edit");
        }

        protected ViewResult ViewNew()
        {
            return View("New");
        }

        protected bool IsValidateModel(TModel model, TForm form, Title title)
        {
            return IsValidateModel(model, form, title, null);
        }

        protected bool IsValidateModel(TModel model, TForm form, Title title, string excludePrefix)
        {
            ModelState.AddModelErrors(model.ValidationResults(), !excludePrefix.IsNullOrEmpty(), excludePrefix);
            if (!ModelState.IsValid)
            {
                var data = CreateViewDataWithTitle(title); 
                data.Form = form;
                SetError(string.Format("Se ha generado un error al actualizar el {0}, por favor corrija los siguientes errores.\n{1}",
                    GetObjectName(false),
                    ModelState.ContainsKey("Entity") ? ModelState["Entity"].Errors[0].ErrorMessage : String.Empty));

                ViewData.Model = data;
                ViewData["Rollback"] = true;
                return false;
            }

            return true;
        }

        protected string GetObjectName(bool pluralize)
        {
            return GetObjectName(pluralize, 0);
        }


        protected string GetObjectName(bool pluralize, int titleType)
        {
            var spanishInflector = new SpanishInflector();
            var objectName = typeof (TModel).Name;
            objectName = spanishInflector.Titleize(objectName);

            if (pluralize)
            {
                var objectNames = objectName.Split(' ');
                objectName = "";

                foreach (var name in objectNames)
                {
                    objectName += spanishInflector.Pluralize(name);
                }

                objectName = spanishInflector.Titleize(objectName);
            }

            if (titleType == 1)
                objectName = GetPluralObjectName(objectName);
            if (titleType == 2 || titleType == 3 || titleType == 4)
                objectName = GetSingularObjectName(objectName, titleType);

            return objectName;
        }

        protected string GetPluralObjectName(string objectName)
        {
            switch (objectName)
            {
                case "Estancias Instituciones Externas":
                    objectName = "de estancias en instituciones externas";
                    break;
                case "Estancias Academicas Externas":
                    objectName = "de estancias académicas externas";
                    break;
                case "Grupos Investigaciones":
                    objectName = "de grupos de investigación";
                    break;
                case "Organos Internos":
                    objectName = "de órganos internos";
                    break;
                case "Apoyos Conacyts":
                    objectName = "de apoyos del CONACyT";
                    break;
                case "Idiomas Investigadores":
                    objectName = "de idiomas del investigador";
                    break;
                default:
                    objectName = "de " + objectName;
                    break;
            }

            return objectName;
        }

        protected string GetSingularObjectName(string objectName, int titleType)
        {
            string newPrefix;
            string editShowPrefix;

            switch (objectName)
            {
                case "Distincion":
                    newPrefix = "nueva ";
                    editShowPrefix = "de la ";
                    objectName = "distinción";
                    break;
                case "Articulo":
                    newPrefix = "nuevo ";
                    editShowPrefix = "del ";
                    objectName = "artículo en revista de investigación";
                    break;
                case "Articulo Difusion":
                    newPrefix = "nuevo ";
                    editShowPrefix = "del ";
                    objectName = "artículo en revista de difusión";
                    break;
                case "Capitulo":
                    newPrefix = "nuevo ";
                    editShowPrefix = "del ";
                    objectName = "capítulo en libro";
                    break;
                case "Reporte":
                    newPrefix = "nuevo ";
                    editShowPrefix = "del ";
                    objectName = "reporte técnico";
                    break;
                case "Resena":
                    newPrefix = "nueva ";
                    editShowPrefix = "de la ";
                    objectName = "reseña";
                    break;
                case "Obra Traducida":
                    newPrefix = "nueva ";
                    editShowPrefix = "de la ";
                    objectName = "obra traducida";
                    break;
                case "Tesis Dirigida":
                    newPrefix = "nueva ";
                    editShowPrefix = "de la ";
                    objectName = "tesis dirigida";
                    break;
                case "Estancia Institucion Externa":
                    newPrefix = "nueva ";
                    editShowPrefix = "de la ";
                    objectName = "estancia en institución externa";
                    break;
                case "Estancia Academica Externa":
                    newPrefix = "nueva ";
                    editShowPrefix = "de la ";
                    objectName = "estancia académica externa";
                    break;
                case "Participacion Medio":
                    newPrefix = "nueva ";
                    editShowPrefix = "de la ";
                    objectName = "participación en medio";
                    break;
                case "Grupo Investigacion":
                    newPrefix = "nuevo ";
                    editShowPrefix = "del ";
                    objectName = "grupo de investigación";
                    break;
                case "Organo Interno":
                    newPrefix = "nuevo ";
                    editShowPrefix = "del ";
                    objectName = "órgano interno";
                    break;
                case "Organo Externo":
                    newPrefix = "nuevo ";
                    editShowPrefix = "del ";
                    objectName = "órgano externo";
                    break;
                case "Formacion Academica":
                    newPrefix = "nueva ";
                    editShowPrefix = "de la ";
                    objectName = "formación académica";
                    break;
                case "Experiencia Profesional":
                    newPrefix = "nueva ";
                    editShowPrefix = "de la ";
                    break;
                case "Idiomas Investigador":
                    newPrefix = "nuevo ";
                    editShowPrefix = "del ";
                    objectName = "idioma del investigador";
                    break;
                default:
                    newPrefix = "nuevo ";
                    editShowPrefix = "de ";
                    break;
            }

            if (titleType == 2)
                objectName = newPrefix + objectName;
            if (titleType == 3 || titleType == 4)
                objectName = editShowPrefix + objectName;

            return objectName;
        }

        protected GenericViewData<TForm> CreateViewDataWithTitle(Title title)
        {
            string message = String.Empty;

            switch (title)
            {
                case Title.Index:
                    message = String.Format("Administración {0}", GetObjectName(true, 1).ToLower());
                    break;

                case Title.New:
                    message = String.Format("Crear {0}", GetObjectName(false, 2).ToLower());
                    break;

                case Title.Edit:
                    message = String.Format("Modificación {0}", GetObjectName(false, 3).ToLower());
                    break;

                case Title.Show:
                    message = String.Format("Información {0}", GetObjectName(false, 4).ToLower());
                    break;

                case Title.CV:
                    message = String.Format("Curriculum Vitae");
                    break;
            }

            return new GenericViewData<TForm> { Title = message };
        }

        protected void SetMessage(string message)
        {
            TempData["message"] = message;
        }

        protected void SetError(string message)
        {
            ViewData["error"] = message;
        }

        protected Archivo MapArchivo()
        {
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
            return archivo;
        }
    }
}
