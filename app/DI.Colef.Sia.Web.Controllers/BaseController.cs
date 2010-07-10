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

    public class BaseController<TModel, TForm> : BaseController where TModel : Entity, new()
    {
        protected readonly IUsuarioService usuarioService;
        protected readonly ISearchService searchService;
        protected ICatalogoService catalogoService;
        protected IInstitucionMapper institucionMapper;
        protected ISedeMapper sedeMapper;
        protected readonly IDisciplinaMapper disciplinaMapper;
        protected readonly ISubdisciplinaMapper subdisciplinaMapper;
        protected readonly IOrganizacionMapper organizacionMapper;
        protected readonly INivelMapper nivelMapper;
        protected readonly IRamaMapper ramaMapper;
        protected readonly IClaseMapper claseMapper;
        protected IAreaTematicaMapper areaTematicaMapper;
        protected IPaisMapper paisMapper;

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

        [AcceptVerbs(HttpVerbs.Get)]
        public virtual ActionResult Glosario(string contexto, string campo)
        {
            return Content(catalogoService.GetGlosario(contexto, campo));
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeLineaTematica(int select)
        {
            if (areaTematicaMapper == null)
                return Content("Action not supported");

            var list = new List<CatalogoForm> {new CatalogoForm {Id = 0, Nombre = "Seleccione ..."}};
            list.AddRange(areaTematicaMapper.Map(catalogoService.GetAreaTematicasByLineaTematicaId(select)));
            var form = new BaseForm
                           {
                               AreasTematicas = list.ToArray()
                           };

            return Rjs("ChangeLineaTematica", form);
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

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewEditorial(int id)
        {
            if (paisMapper == null)
                return Rjs("ModelError");

            var model = GetModelById(id);

            var form = new EditorialForm
                           {
                               Paises = paisMapper.Map(catalogoService.GetAllPaises())
                           };

            ViewData["Editorial.PaisId"] = GetDefaultPaisId(form.Paises);
            if (model != null)
                form.Id = model.Id;

            return Rjs("NewEditorial", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddEditorial([Bind(Prefix = "Editorial")] EditorialProductoForm form, int modelId)
        {
            var editorialProducto = MapEditorialMessage(form);

            ModelState.AddModelErrors(editorialProducto.ValidationResults(), false, "Editorial", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            var added = true;
            if (modelId != 0)
            {
                editorialProducto.CreadoPor = CurrentUser();
                editorialProducto.ModificadoPor = CurrentUser();

                var model = GetModelById(modelId);
                added = SaveEditorialToModel(model, editorialProducto);
            }

            if (!added && !ModelState.IsValid)
            {
                ViewData["Rollback"] = true;
                return Rjs("EditorialAddError");
            }

            var editorialProductoForm = added
                                            ? MapEditorialModel(editorialProducto, modelId)
                                            : new EditorialProductoForm();

            return Rjs(added ? "AddEditorial" : "HideEditorialForm", editorialProductoForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteEditorial(int id, int editorialId)
        {
            var model = GetModelById(id);

            if(model != null)
                DeleteEditorialInModel(model, editorialId);

            var form = new EditorialForm { EditorialId = editorialId };

            return Rjs("DeleteEditorial", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewInstitucion(int id)
        {
            var model = GetModelById(id);

            var form = new InstitucionForm();

            if (model != null)
                form.Id = model.Id;

            return Rjs("NewInstitucion", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddInstitucion([Bind(Prefix = "Institucion")] InstitucionProductoForm form, int modelId)
        {
            var institucionProducto = MapInstitucionMessage(form);

            ModelState.AddModelErrors(institucionProducto.ValidationResults(), false, "Institucion", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            var added = true;
            if (modelId != 0)
            {
                institucionProducto.CreadoPor = CurrentUser();
                institucionProducto.ModificadoPor = CurrentUser();

                var model = GetModelById(modelId);
                var alreadyHasIt = AlreadyHasIt(modelId, institucionProducto);
                
                if (!alreadyHasIt)
                {
                    added = SaveInstitucionToModel(model, institucionProducto);
                }
            }

            var institucionProductoForm = added
                                              ? MapInstitucionModel(institucionProducto, modelId)
                                              : new InstitucionProductoForm();

            return Rjs(added ? "AddInstitucion" : "HideInstitucionForm", institucionProductoForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteInstitucion(int id, int institucionId)
        {
            var model = GetModelById(id);

            if (model != null)
                DeleteInstitucionInModel(model, institucionId);

            var form = new InstitucionForm { InstitucionId = institucionId };

            return Rjs("DeleteInstitucion", form);
        }

        protected virtual void DeleteEditorialInModel(TModel model, int editorialId)
        {
            throw new NotSupportedException();
        }

        protected virtual bool SaveEditorialToModel(TModel model, EditorialProducto editorialProducto)
        {
            throw new NotSupportedException();
        }

        protected virtual void DeleteInstitucionInModel(TModel model, int institucionId)
        {
            throw new NotSupportedException();
        }

        protected virtual bool SaveInstitucionToModel(TModel model, InstitucionProducto institucionProducto)
        {
            throw new NotSupportedException();
        }

        protected virtual EditorialProductoForm MapEditorialModel(EditorialProducto model, int parentId)
        {
            throw new NotSupportedException();
        }

        protected virtual EditorialProducto MapEditorialMessage(EditorialProductoForm form)
        {
            throw new NotSupportedException();
        }

        protected virtual InstitucionProductoForm MapInstitucionModel(InstitucionProducto model, int parentId)
        {
            throw new NotSupportedException();
        }

        protected virtual InstitucionProducto MapInstitucionMessage(InstitucionProductoForm form)
        {
            throw new NotSupportedException();
        }

        protected virtual TModel GetModelById(int id)
        {
            throw new NotSupportedException();
        }

        protected virtual bool AlreadyHasIt(int modelId, InstitucionProducto institucionProducto)
        {
            throw new NotSupportedException();
        }

        protected int GetDefaultPaisId(PaisForm[] paises)
        {
            return (from p in paises
                    where p.Nombre == "México"
                    select p.Id).SingleOrDefault();
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
                               InstitucionNombre = institucionForm.InstitucionNombre,
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

        [Obsolete("Este metodo no debe ser usado mas")]
        protected Pais GetDefaultPais()
        {
            var paises = catalogoService.GetActivePaises();
            return catalogoService.GetPaisById((from p in paises where p.Nombre == "México" select p.Id).FirstOrDefault());
        }

        protected bool IsInternacionalOrBinacional(string ambitoNombre, string[] ambitos)
        {
            var esInternacional = false;

            foreach (var t in ambitos)
            {
                if (ambitoNombre == t)
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
                var data = new GenericViewData<TForm> {Form = form};

                SetError(string.Format("Se ha generado un error al actualizar el {0}, por favor corrija los siguientes errores.\n{1}",
                    GetObjectName(false),
                    ModelState.ContainsKey("Entity") ? ModelState["Entity"].Errors[0].ErrorMessage : String.Empty));

                ViewData.Model = data;
                ViewData["Rollback"] = true;
                return false;
            }

            return true;
        }

        [Obsolete("Prefirir el helper ProductoHelper")]
        protected string GetObjectName(bool pluralize)
        {
            return GetObjectName(pluralize, 0);
        }

        [Obsolete("Prefirir el helper ProductoHelper")]
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

        [Obsolete("Prefirir el helper ProductoHelper")]
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

        [Obsolete("Prefirir el helper ProductoHelper")]
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

        [Obsolete("Este codigo ya es manejado directamente con helpers en la vista")]
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
            return MapArchivo<Archivo>();
        }

        protected T MapArchivo<T>() where T:Archivo, new()
        {
            var file = Request.Files["fileData"];

            var archivo = new T
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

        protected string VerifyProductoStatus(Firma firma, string titulo)
        {
            var message = String.Empty;
            if (firma.Aceptacion1 == 1 && firma.Aceptacion2 == 0 && User.IsInRole("Investigadores"))
                message = String.Format("El {0} {1} esta en firma y no puede ser editado",
                                        ProductoHelper.ProductoNameSingular(EntityHelper.GetTipoProducto<TModel>()),
                                        titulo);

            if (User.IsInRole("DGAA"))
            {
                if ((firma.Aceptacion1 == 1 && firma.Aceptacion2 == 1) ||
                    (firma.Aceptacion1 == 0 && firma.Aceptacion2 == 0) ||
                    (firma.Aceptacion1 == 0 && firma.Aceptacion2 == 2)
                    )
                    message = String.Format(
                        "El {0} {1} ya fue aceptado o no ha sido enviado a firma",
                        ProductoHelper.ProductoNameSingular(EntityHelper.GetTipoProducto<TModel>()),
                        titulo);
            }

            return message;
        }

        protected string VerifyProductoOwnership(bool esInvestigador, int productoUsuarioId, int currentUserId)
        {
            var message = string.Empty;

            if (esInvestigador && productoUsuarioId != currentUserId)
            {
                message = "Tienes que ser el titular del producto para poder editarlo";
            }

            return message;
        }
    }
}
