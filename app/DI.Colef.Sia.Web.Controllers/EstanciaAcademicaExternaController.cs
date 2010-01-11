using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Security;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class EstanciaAcademicaExternaController : BaseController<EstanciaAcademicaExterna, EstanciaAcademicaExternaForm>
    {
		readonly IEstanciaAcademicaExternaService estanciaAcademicaExternaService;
        readonly IArchivoService archivoService;
        readonly IEstanciaAcademicaExternaMapper estanciaAcademicaExternaMapper;
        readonly ICatalogoService catalogoService;
        readonly ITipoEstanciaMapper tipoEstanciaMapper;
        readonly IGradoAcademicoMapper gradoAcademicoMapper;
        readonly ISedeMapper sedeMapper;
        readonly IDepartamentoMapper departamentoMapper;

        public EstanciaAcademicaExternaController(IEstanciaAcademicaExternaService estanciaAcademicaExternaService,
                                                  IArchivoService archivoService,
                                                  IEstanciaAcademicaExternaMapper estanciaAcademicaExternaMapper,
                                                  ICatalogoService catalogoService,
                                                  IInvestigadorExternoMapper investigadorExternoMapper,
                                                  IGradoAcademicoMapper gradoAcademicoMapper,
                                                  IUsuarioService usuarioService,
                                                  IDepartamentoMapper departamentoMapper,
                                                  ISearchService searchService, ITipoEstanciaMapper tipoEstanciaMapper, 
                                                  IInstitucionMapper institucionMapper, ISedeMapper sedeMapper)
            : base(usuarioService, searchService, catalogoService, institucionMapper, sedeMapper)
        {
            this.archivoService = archivoService;
            this.catalogoService = catalogoService;
            this.sedeMapper = sedeMapper;
            this.departamentoMapper = departamentoMapper;
            this.gradoAcademicoMapper = gradoAcademicoMapper;
            this.estanciaAcademicaExternaService = estanciaAcademicaExternaService;
            this.estanciaAcademicaExternaMapper = estanciaAcademicaExternaMapper;
            this.tipoEstanciaMapper = tipoEstanciaMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);

            var estanciaAcademicaExternas = new EstanciaAcademicaExterna[] { };

            if (User.IsInRole("DGAA"))
                estanciaAcademicaExternas = estanciaAcademicaExternaService.GetAllEstanciaAcademicaExternas();

            data.List = estanciaAcademicaExternaMapper.Map(estanciaAcademicaExternas);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
            ViewData["FechaInicial"] = DateTime.Now.ToString("dd/MM/yyyy");
            ViewData["FechaFinal"] = DateTime.Now.ToString("dd/MM/yyyy");

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var estanciaAcademicaExterna = estanciaAcademicaExternaService.GetEstanciaAcademicaExternaById(id);

            if (estanciaAcademicaExterna == null)
                return RedirectToIndex("no ha sido encontrado", true);

            if (estanciaAcademicaExterna.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);
                        
            var estanciaAcademicaExternaForm = estanciaAcademicaExternaMapper.Map(estanciaAcademicaExterna);

            data.Form = SetupNewForm(estanciaAcademicaExternaForm);

            FormSetCombos(data.Form);
            
			ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var estanciaAcademicaExterna = estanciaAcademicaExternaService.GetEstanciaAcademicaExternaById(id);
            var estanciaAcademicaExternaForm = estanciaAcademicaExternaMapper.Map(estanciaAcademicaExterna);
            data.Form = SetupShowForm(estanciaAcademicaExternaForm);
            
            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(EstanciaAcademicaExternaForm form)
        {
            var estanciaAcademicaExterna = estanciaAcademicaExternaMapper.Map(form, CurrentUser());

            ModelState.AddModelErrors(estanciaAcademicaExterna.ValidationResults(), true, "EstanciaAcademicaExterna");

            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            estanciaAcademicaExternaService.SaveEstanciaAcademicaExterna(estanciaAcademicaExterna);
            SetMessage(String.Format("Estancia académica externa {0} ha sido creada",
                                     estanciaAcademicaExterna.Institucion.Nombre));

            return Rjs("Save", estanciaAcademicaExterna.Id);
        }

        [Authorize(Roles = "DGAA")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(EstanciaAcademicaExternaForm form)
        {
            var estanciaAcademicaExterna = estanciaAcademicaExternaMapper.Map(form, CurrentUser());

            ModelState.AddModelErrors(estanciaAcademicaExterna.ValidationResults(), true, "EstanciaAcademicaExterna");

            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            estanciaAcademicaExternaService.SaveEstanciaAcademicaExterna(estanciaAcademicaExterna, true);
            SetMessage(String.Format("Estancia académica externa {0} ha sido modificada", estanciaAcademicaExterna.Institucion.Nombre));

            return Rjs("Save", estanciaAcademicaExterna.Id);
        }

        [CookieLessAuthorize]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddFile(FormCollection form)
        {
            var id = Convert.ToInt32(form["Id"]);
            var estanciaAcademicaExterna = estanciaAcademicaExternaService.GetEstanciaAcademicaExternaById(id);

            Archivo archivo = MapArchivo();

            archivo.TipoProducto = estanciaAcademicaExterna.TipoProductoLibro;
            archivoService.Save(archivo);
            estanciaAcademicaExterna.ComprobanteEstancia = archivo;

            estanciaAcademicaExternaService.SaveEstanciaAcademicaExterna(estanciaAcademicaExterna);

            return Content("Uploaded");
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<EstanciaAcademicaExterna>(x => x.Institucion.Nombre, q);
            return Content(data);
        }

        EstanciaAcademicaExternaForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        EstanciaAcademicaExternaForm SetupNewForm(EstanciaAcademicaExternaForm form)
        {
            form = form ?? new EstanciaAcademicaExternaForm();
            //Lista de Catalogos Pendientes
            form.TiposEstancias = tipoEstanciaMapper.Map(catalogoService.GetActiveTipoEstancias());
            form.GradosAcademicos = gradoAcademicoMapper.Map(catalogoService.GetActiveGrados());
            form.Departamentos = departamentoMapper.Map(catalogoService.GetActiveDepartamentos());
            form.Sedes = sedeMapper.Map(catalogoService.GetActiveSedes());

            return form;
        }

        private void FormSetCombos(EstanciaAcademicaExternaForm form)
        {
            ViewData["TipoEstancia"] = form.TipoEstanciaId;
            ViewData["GradoAcademico"] = form.GradoAcademicoId;
            ViewData["Departamento"] = form.DepartamentoId;
            ViewData["Sede"] = form.SedeId;
        }

        private EstanciaAcademicaExternaForm SetupShowForm(EstanciaAcademicaExternaForm form)
        {
            form = form ?? new EstanciaAcademicaExternaForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      InstitucionTipoInstitucionNombre = form.Institucion.TipoInstitucion,
                                      InstitucionPaisNombre = form.Institucion.PaisNombre,
                                      InstitucionEstadoPaisNombre = form.Institucion.EstadoPaisNombre,
                                      InstitucionCiudad = form.Institucion.Ciudad,
                                      InstitucionNombre = form.Institucion.Nombre,

                                      IsShowForm = true,
                                      InstitucionLabel = "Institución de procedencia"
                                  };

            return form;
        }
    }
}