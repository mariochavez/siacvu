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
            var subdisciplina = subdisciplinaMapper.Map(catalogoService.GetSubdisciplinaById(form.SubdisciplinaId));
            form.Disciplinas = GetDisciplinas(subdisciplina.DisciplinaAreaId);
            form.Subdisciplinas = GetSubdisciplinas(subdisciplina.DisciplinaId);

            form.Sectores = sectorMapper.Map(catalogoService.GetActiveSectores());
            var nivel2 = nivelMapper.Map(catalogoService.GetNivelById(form.Nivel2Id));
            form.Organizaciones = GetOrganizaciones(nivel2.OrganizacionSectorId);
            form.Niveles = GetNiveles(nivel2.OrganizacionId);

            form.SectoresEconomicos = sectorMapper.Map(catalogoService.GetActiveSectoresEconomicos());
            var clase = claseMapper.Map(catalogoService.GetClaseById(form.ClaseId));
            form.Ramas = GetRamas(clase.RamaSectorId);
            form.Clases = GetClases(clase.RamaId);

            return form;
        }

        private void FormSetCombos(ExperienciaProfesionalForm form)
        {
            ViewData["Pais"] = form.PaisId;

            var subdisciplina = subdisciplinaMapper.Map(catalogoService.GetSubdisciplinaById(form.SubdisciplinaId));
            ViewData["AreaId"] = subdisciplina.DisciplinaAreaId;
            ViewData["DisciplinaId"] = subdisciplina.DisciplinaId;
            ViewData["SubdisciplinaId"] = form.SubdisciplinaId;

            var nivel2 = nivelMapper.Map(catalogoService.GetNivelById(form.Nivel2Id));
            ViewData["SectorId"] = nivel2.OrganizacionSectorId;
            ViewData["OrganizacionId"] = nivel2.OrganizacionId;
            ViewData["Nivel2Id"] = form.Nivel2Id;

            var clase = claseMapper.Map(catalogoService.GetClaseById(form.ClaseId));
            ViewData["SectorEconomicoId"] = clase.RamaSectorId;
            ViewData["RamaId"] = clase.RamaId;
            ViewData["ClaseId"] = form.ClaseId;
        }

        private ExperienciaProfesionalForm SetupShowForm(ExperienciaProfesionalForm form)
        {
            form = form ?? new ExperienciaProfesionalForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      SubdisciplinaNombre = form.Subdisciplina.Nombre,
                                      SubdisciplinaDisciplinaNombre = form.Subdisciplina.DisciplinaNombre,
                                      SubdisciplinaDisciplinaAreaNombre = form.Subdisciplina.DisciplinaAreaNombre,

                                      Nivel2Nombre = form.Nivel2.Nombre,
                                      Nivel2OrganizacionNombre = form.Nivel2.OrganizacionNombre,
                                      Nivel2OrganizacionSectorNombre = form.Nivel2.OrganizacionSectorNombre,

                                      ClaseNombre = form.Clase.Nombre,
                                      ClaseRamaNombre = form.Clase.RamaNombre,
                                      ClaseRamaSectorNombre = form.Clase.RamaSectorNombre,

                                      IsShowForm = true
                                  };

            return form;
        }
    }
}