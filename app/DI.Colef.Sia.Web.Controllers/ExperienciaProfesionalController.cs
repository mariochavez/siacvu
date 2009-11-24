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
        readonly INivelMapper nivelMapper;
        readonly IPaisMapper paisMapper;
        readonly ISubdisciplinaMapper subdisciplinaMapper;
        readonly IClaseMapper claseMapper;
        readonly IOrganizacionMapper organizacionMapper;
        readonly ISectorMapper sectorMapper;
        readonly IDisciplinaMapper disciplinaMapper;
        readonly IAreaMapper areaMapper;
        readonly IRamaMapper ramaMapper;

        public ExperienciaProfesionalController(IExperienciaProfesionalService experienciaProfesionalService,
                                                IExperienciaProfesionalMapper experienciaProfesionalMapper,
                                                ICatalogoService catalogoService,
                                                IUsuarioService usuarioService, 
                                                INivelMapper nivelMapper, 
                                                IPaisMapper paisMapper,
                                                ISubdisciplinaMapper subdisciplinaMapper, 
                                                IClaseMapper claseMapper,
                                                ISearchService searchService, IOrganizacionMapper organizacionMapper, ISectorMapper sectorMapper,
                                                IDisciplinaMapper disciplinaMapper, IAreaMapper areaMapper, IRamaMapper ramaMapper
            ): base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.experienciaProfesionalService = experienciaProfesionalService;
            this.experienciaProfesionalMapper = experienciaProfesionalMapper;
            this.nivelMapper = nivelMapper;
            this.paisMapper = paisMapper;
            this.subdisciplinaMapper = subdisciplinaMapper;
            this.claseMapper = claseMapper;
            this.organizacionMapper = organizacionMapper;
            this.sectorMapper = sectorMapper;
            this.disciplinaMapper = disciplinaMapper;
            this.areaMapper = areaMapper;
            this.ramaMapper = ramaMapper;
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
                ((GenericViewData<ExperienciaProfesionalForm>)ViewData.Model).Form = SetupNewForm();
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

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeNivel(int select)
        {
            var nivelForm = nivelMapper.Map(catalogoService.GetNivelById(select));
            var organizacionForm = organizacionMapper.Map(catalogoService.GetOrganizacionById(nivelForm.OrganizacionId));
            var sectorForm = sectorMapper.Map(catalogoService.GetSectorById(organizacionForm.SectorId));

            var form = new ShowFieldsForm
                           {
                               Nivel2OrganizacionNombre = organizacionForm.Nombre,
                               Nivel2OrganizacionSectorNombre = sectorForm.Nombre,
                               Nivel2Id = nivelForm.Id
                           };

            return Rjs("ChangeNivel", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeSubdisciplina(int select)
        {
            var subdisciplinaForm = subdisciplinaMapper.Map(catalogoService.GetSubdisciplinaById(select));
            var disciplinaForm = disciplinaMapper.Map(catalogoService.GetDisciplinaById(subdisciplinaForm.DisciplinaId));
            var areaForm = areaMapper.Map(catalogoService.GetAreaById(disciplinaForm.AreaId));

            var form = new ShowFieldsForm
                           {
                               SubdisciplinaDisciplinaNombre = disciplinaForm.Nombre,
                               SubdisciplinaDisciplinaAreaNombre = areaForm.Nombre,
                               SubdisciplinaId = subdisciplinaForm.Id
                           };

            return Rjs("ChangeSubdisciplina", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeClase(int select)
        {
            var claseForm = claseMapper.Map(catalogoService.GetClaseById(select));
            var ramaForm = ramaMapper.Map(catalogoService.GetRamaById(claseForm.RamaId));
            var sectorForm = sectorMapper.Map(catalogoService.GetSectorById(ramaForm.SectorId));

            var form = new ShowFieldsForm
                           {
                               ClaseRamaNombre = ramaForm.Nombre,
                               ClaseRamaSectorEconomicoNombre = sectorForm.Nombre,
                               ClaseId = claseForm.Id
                           };

            return Rjs("ChangeClase", form);
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

            return form;
        }

        private void FormSetCombos(ExperienciaProfesionalForm form)
        {
            ViewData["Pais"] = form.PaisId;
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
                                      ClaseRamaSectorEconomicoNombre = form.Clase.RamaSectorNombre,

                                      IsShowForm = true
                                  };

            return form;
        }
    }
}