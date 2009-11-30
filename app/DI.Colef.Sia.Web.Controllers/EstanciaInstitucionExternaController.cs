using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class EstanciaInstitucionExternaController : BaseController<EstanciaInstitucionExterna, EstanciaInstitucionExternaForm>
    {
        readonly IEstanciaInstitucionExternaService estanciaInstitucionExternaService;
        readonly IEstanciaInstitucionExternaMapper estanciaInstitucionExternaMapper;
        readonly ICatalogoService catalogoService;
        readonly ITipoEstanciaMapper tipoEstanciaMapper;
        readonly ISectorMapper sectorMapper;
        readonly IInstitucionMapper institucionMapper;

        public EstanciaInstitucionExternaController(IEstanciaInstitucionExternaService estanciaInstitucionExternaService,
                                            IEstanciaInstitucionExternaMapper estanciaInstitucionExternaMapper,
                                            ICatalogoService catalogoService, IUsuarioService usuarioService, 
                                            ITipoEstanciaMapper tipoEstanciaMapper, 
                                            INivelMapper nivelMapper,
                                            ISearchService searchService, ISectorMapper sectorMapper,
                                            IOrganizacionMapper organizacionMapper, IInstitucionMapper institucionMapper)
            : base(usuarioService, searchService, catalogoService, organizacionMapper, nivelMapper)
        {
            this.catalogoService = catalogoService;
            this.estanciaInstitucionExternaService = estanciaInstitucionExternaService;
            this.estanciaInstitucionExternaMapper = estanciaInstitucionExternaMapper;
            this.tipoEstanciaMapper = tipoEstanciaMapper;
            this.sectorMapper = sectorMapper;
            this.institucionMapper = institucionMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var movilidadAcademicas = new EstanciaInstitucionExterna[] { };

            if (User.IsInRole("Investigadores"))
                movilidadAcademicas = estanciaInstitucionExternaService.GetAllEstanciaInstitucionExternas(CurrentUser());
            if (User.IsInRole("DGAA"))
                movilidadAcademicas = estanciaInstitucionExternaService.GetAllEstanciaInstitucionExternas();

            data.List = estanciaInstitucionExternaMapper.Map(movilidadAcademicas);

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

            var movilidadAcademica = estanciaInstitucionExternaService.GetEstanciaInstitucionExternaById(id);

            if (movilidadAcademica == null)
                return RedirectToIndex("no ha sido encontrado", true);

            if (movilidadAcademica.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var movilidadAcademicaForm = estanciaInstitucionExternaMapper.Map(movilidadAcademica);

            data.Form = SetupNewForm(movilidadAcademicaForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var movilidadAcademica = estanciaInstitucionExternaService.GetEstanciaInstitucionExternaById(id);
            var movilidadAcademicaForm = estanciaInstitucionExternaMapper.Map(movilidadAcademica);

            data.Form = SetupShowForm(movilidadAcademicaForm);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(EstanciaInstitucionExternaForm form,FormCollection formCollection)
        {
            var movilidadAcademica = estanciaInstitucionExternaMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(movilidadAcademica, form, Title.New, "EstanciaInstitucionExterna"))
            {
                var estanciaInstitucionExternaForm = estanciaInstitucionExternaMapper.Map(movilidadAcademica);

                ((GenericViewData<EstanciaInstitucionExternaForm>)ViewData.Model).Form = SetupNewForm(estanciaInstitucionExternaForm);
                FormSetCombos(estanciaInstitucionExternaForm);
                return ViewNew();
            }

            estanciaInstitucionExternaService.SaveEstanciaInstitucionExterna(movilidadAcademica);

            return RedirectToIndex(String.Format("Estancia en institución externa {0} ha sido creada", movilidadAcademica.Institucion.Nombre));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(EstanciaInstitucionExternaForm form)
        {
            var movilidadAcademica = estanciaInstitucionExternaMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(movilidadAcademica, form, Title.Edit))
            {
                var estanciaInstitucionExternaForm = estanciaInstitucionExternaMapper.Map(movilidadAcademica);

                ((GenericViewData<EstanciaInstitucionExternaForm>)ViewData.Model).Form = SetupNewForm(estanciaInstitucionExternaForm);
                FormSetCombos(estanciaInstitucionExternaForm);
                return ViewEdit();
            }

            estanciaInstitucionExternaService.SaveEstanciaInstitucionExterna(movilidadAcademica);

            return RedirectToIndex(String.Format("Estancia en institución externa {0} ha sido modificada", movilidadAcademica.Institucion.Nombre));
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.SearchMovilidadAcademica(q);
            return Content(data);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeInstitucion(int select)
        {
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

        EstanciaInstitucionExternaForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        EstanciaInstitucionExternaForm SetupNewForm(EstanciaInstitucionExternaForm form)
        {
            form = form ?? new EstanciaInstitucionExternaForm();

            //Lista de Catalogos Pendientes
            form.TiposEstancias = tipoEstanciaMapper.Map(catalogoService.GetActiveTipoEstancias());

            form.Sectores = sectorMapper.Map(catalogoService.GetActiveSectores());
            var nivel2 = nivelMapper.Map(catalogoService.GetNivelById(form.Nivel2Id));
            form.Organizaciones = GetOrganizaciones(nivel2.OrganizacionSectorId);
            form.Niveles = GetNiveles(nivel2.OrganizacionId);

            return form;
        }

        private void FormSetCombos(EstanciaInstitucionExternaForm form)
        {
            ViewData["TipoEstancia"] = form.TipoEstanciaId;

            var nivel2 = nivelMapper.Map(catalogoService.GetNivelById(form.Nivel2Id));
            ViewData["SectorId"] = nivel2.OrganizacionSectorId;
            ViewData["OrganizacionId"] = nivel2.OrganizacionId;
            ViewData["Nivel2Id"] = form.Nivel2Id;
        }

        private EstanciaInstitucionExternaForm SetupShowForm(EstanciaInstitucionExternaForm form)
        {
            form = form ?? new EstanciaInstitucionExternaForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      InstitucionTipoInstitucionNombre = form.Institucion.TipoInstitucion,
                                      InstitucionPaisNombre = form.Institucion.PaisNombre,
                                      InstitucionEstadoPaisNombre = form.Institucion.EstadoPaisNombre,
                                      InstitucionCiudad = form.Institucion.Ciudad,
                                      InstitucionNombre = form.Institucion.Nombre,

                                      Nivel2Nombre = form.Nivel2.Nombre,
                                      Nivel2OrganizacionNombre = form.Nivel2.OrganizacionNombre,
                                      Nivel2OrganizacionSectorNombre = form.Nivel2.OrganizacionSectorNombre,

                                      IsShowForm = true,
                                      InstitucionLabel = "Institución de destino"
                                  };

            return form;
        }
    }
}