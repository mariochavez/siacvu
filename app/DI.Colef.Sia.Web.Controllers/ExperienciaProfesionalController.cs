using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class ExperienciaProfesionalController : BaseController<ExperienciaProfesional, ExperienciaProfesionalForm>
    {
        readonly IExperienciaProfesionalService experienciaProfesionalService;
        readonly IExperienciaProfesionalMapper experienciaProfesionalMapper;
        readonly ICatalogoService catalogoService;
        readonly IPaisMapper paisMapper;
        readonly ISectorMapper sectorMapper;
        readonly IAreaMapper areaMapper;

        public ExperienciaProfesionalController(IExperienciaProfesionalService experienciaProfesionalService,
                                                IExperienciaProfesionalMapper experienciaProfesionalMapper,
                                                ICatalogoService catalogoService,
                                                IUsuarioService usuarioService, 
                                                INivelMapper nivelMapper, 
                                                IPaisMapper paisMapper,
                                                ISubdisciplinaMapper subdisciplinaMapper, 
                                                IClaseMapper claseMapper,
                                                ISearchService searchService, IOrganizacionMapper organizacionMapper, ISectorMapper sectorMapper,
                                                IDisciplinaMapper disciplinaMapper, IRamaMapper ramaMapper, IAreaMapper areaMapper
            ): base(usuarioService, searchService, catalogoService, disciplinaMapper, subdisciplinaMapper, organizacionMapper, nivelMapper, ramaMapper, claseMapper)
        {
            this.catalogoService = catalogoService;
            this.experienciaProfesionalService = experienciaProfesionalService;
            this.experienciaProfesionalMapper = experienciaProfesionalMapper;
            this.paisMapper = paisMapper;
            this.sectorMapper = sectorMapper;
            this.areaMapper = areaMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var experienciaProfesionals = new ExperienciaProfesional[] { };

            if (User.IsInRole("Investigadores"))
                experienciaProfesionals = experienciaProfesionalService.GetAllExperienciasProfesionales(CurrentUser());
            if (User.IsInRole("DGAA"))
                experienciaProfesionals = experienciaProfesionalService.GetAllExperienciasProfesionales();

            data.List = experienciaProfesionalMapper.Map(experienciaProfesionals);

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

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var experienciaProfesional = experienciaProfesionalService.GetExperienciaProfesionalById(id);

            if (experienciaProfesional == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (experienciaProfesional.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var experienciaProfesionalForm = experienciaProfesionalMapper.Map(experienciaProfesional);

            data.Form = SetupNewForm(experienciaProfesionalForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var experienciaProfesional = experienciaProfesionalService.GetExperienciaProfesionalById(id);
            var experienciaProfesionalForm = experienciaProfesionalMapper.Map(experienciaProfesional);

            data.Form = SetupShowForm(experienciaProfesionalForm);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ExperienciaProfesionalForm form)
        {
            var experienciaProfesional = experienciaProfesionalMapper.Map(form, CurrentUser());

            if (!IsValidateModel(experienciaProfesional, form, Title.New, "ExperienciaProfesional"))
            {
                var experienciaProfesionalForm = experienciaProfesionalMapper.Map(experienciaProfesional);

                ((GenericViewData<ExperienciaProfesionalForm>)ViewData.Model).Form = SetupNewForm(experienciaProfesionalForm);
                FormSetCombos(experienciaProfesionalForm);
                return ViewNew();
            }

            experienciaProfesionalService.SaveExperienciaProfesional(experienciaProfesional);

            return RedirectToIndex(String.Format("Experiencia profesional {0} ha sido creada", experienciaProfesional.Nombramiento));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ExperienciaProfesionalForm form)
        {
            var experienciaProfesional = experienciaProfesionalMapper.Map(form, CurrentUser());

            if (!IsValidateModel(experienciaProfesional, form, Title.Edit))
            {
                var experienciaProfesionalForm = experienciaProfesionalMapper.Map(experienciaProfesional);

                ((GenericViewData<ExperienciaProfesionalForm>)ViewData.Model).Form = SetupNewForm(experienciaProfesionalForm);
                FormSetCombos(experienciaProfesionalForm);
                return ViewEdit();
            }

            experienciaProfesionalService.SaveExperienciaProfesional(experienciaProfesional);

            return RedirectToIndex(String.Format("Experiencia profesional {0} ha sido modificada", experienciaProfesional.Nombramiento));
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<ExperienciaProfesional>(x => x.Nombramiento, q);
            return Content(data);
        }

        ExperienciaProfesionalForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        ExperienciaProfesionalForm SetupNewForm(ExperienciaProfesionalForm form)
        {
            form = form ?? new ExperienciaProfesionalForm();

            //Lista de Catalogos Pendientes
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());

            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = GetDisciplinasByAreaId(form.AreaId);
            form.Subdisciplinas = GetSubdisciplinasByDisciplinaId(form.DisciplinaId);

            form.Sectores = sectorMapper.Map(catalogoService.GetActiveSectores());
            form.Organizaciones = GetOrganizacionesBySectorId(form.SectorId);
            form.Niveles = GetNivelesByOrganizacionId(form.OrganizacionId);

            form.SectoresEconomicos = sectorMapper.Map(catalogoService.GetActiveSectoresEconomicos());
            form.Ramas = GetRamasBySectorEconomicoId(form.SectorEconomicoId);
            form.Clases = GetClasesByRamaId(form.RamaId);

            return form;
        }

        private void FormSetCombos(ExperienciaProfesionalForm form)
        {
            ViewData["Pais"] = form.PaisId;

            ViewData["AreaId"] = form.AreaId;
            ViewData["DisciplinaId"] = form.DisciplinaId;
            ViewData["SubdisciplinaId"] = form.SubdisciplinaId;

            ViewData["SectorId"] = form.SectorId;
            ViewData["OrganizacionId"] = form.OrganizacionId;
            ViewData["Nivel2Id"] = form.Nivel2Id;

            ViewData["SectorEconomicoId"] = form.SectorEconomicoId;
            ViewData["RamaId"] = form.RamaId;
            ViewData["ClaseId"] = form.ClaseId;
        }

        private ExperienciaProfesionalForm SetupShowForm(ExperienciaProfesionalForm form)
        {
            form = form ?? new ExperienciaProfesionalForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      SubdisciplinaNombre = form.SubdisciplinaNombre,
                                      DisciplinaNombre = form.DisciplinaNombre,
                                      AreaNombre = form.AreaNombre,

                                      Nivel2Nombre = form.Nivel2Nombre,
                                      OrganizacionNombre = form.OrganizacionNombre,
                                      SectorNombre = form.SectorNombre,

                                      ClaseNombre = form.ClaseNombre,
                                      RamaNombre = form.RamaNombre,
                                      SectorEconomicoNombre = form.SectorEconomicoNombre,

                                      IsShowForm = true
                                  };

            return form;
        }
    }
}