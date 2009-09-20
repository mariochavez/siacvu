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
        readonly IOrganizacionMapper organizacionMapper;
        readonly INivelMapper nivelMapper;
        readonly IPaisMapper paisMapper;
        readonly IAreaMapper areaMapper;
        readonly IDisciplinaMapper disciplinaMapper;
        readonly ISubdisciplinaMapper subdisciplinaMapper;
        readonly ISectorMapper sectorMapper;
        readonly IRamaMapper ramaMapper;
        readonly IClaseMapper claseMapper;

        public ExperienciaProfesionalController(IExperienciaProfesionalService experienciaProfesionalService,
                                                IExperienciaProfesionalMapper experienciaProfesionalMapper,
                                                ICatalogoService catalogoService, IUsuarioService usuarioService, 
                                                IOrganizacionMapper organizacionMapper, INivelMapper nivelMapper, 
                                                IPaisMapper paisMapper, IAreaMapper areaMapper, 
                                                IDisciplinaMapper disciplinaMapper, ISubdisciplinaMapper subdisciplinaMapper, 
                                                ISectorMapper sectorMapper, IRamaMapper ramaMapper, IClaseMapper claseMapper,
                                                ISearchService searchService
            )
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.experienciaProfesionalService = experienciaProfesionalService;
            this.experienciaProfesionalMapper = experienciaProfesionalMapper;
            this.organizacionMapper = organizacionMapper;
            this.nivelMapper = nivelMapper;
            this.paisMapper = paisMapper;
            this.areaMapper = areaMapper;
            this.disciplinaMapper = disciplinaMapper;
            this.subdisciplinaMapper = subdisciplinaMapper;
            this.sectorMapper = sectorMapper;
            this.ramaMapper = ramaMapper;
            this.claseMapper = claseMapper;
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
            data.Form = experienciaProfesionalMapper.Map(experienciaProfesional);

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

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var experienciaProfesional = experienciaProfesionalService.GetExperienciaProfesionalById(id);

            if (experienciaProfesional.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            experienciaProfesional.Activo = true;
            experienciaProfesional.ModificadoPor = CurrentUser();
            experienciaProfesionalService.SaveExperienciaProfesional(experienciaProfesional);

            var form = experienciaProfesionalMapper.Map(experienciaProfesional);

            return Rjs(form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var experienciaProfesional = experienciaProfesionalService.GetExperienciaProfesionalById(id);

            if (experienciaProfesional.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            experienciaProfesional.Activo = false;
            experienciaProfesional.ModificadoPor = CurrentUser();
            experienciaProfesionalService.SaveExperienciaProfesional(experienciaProfesional);

            var form = experienciaProfesionalMapper.Map(experienciaProfesional);

            return Rjs("Activate", form);
        }
        
        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeSector(int select)
        {
            var list = new List<OrganizacionForm> { new OrganizacionForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(organizacionMapper.Map(catalogoService.GetOrganizacionesBySectorId(select)));

            var form = new ExperienciaProfesionalForm
                           {
                               Organizaciones = list.ToArray(),
                               Niveles2 = new[] { new NivelForm { Id = 0, Nombre = "Seleccione ..." } },
                               Niveles3 = new[] { new NivelForm { Id = 0, Nombre = "Seleccione ..." } },
                               Niveles4 = new[] { new NivelForm { Id = 0, Nombre = "Seleccione ..." } },
                               Niveles5 = new[] { new NivelForm { Id = 0, Nombre = "Seleccione ..." } },
                               Niveles6 = new[] { new NivelForm { Id = 0, Nombre = "Seleccione ..." } }
                           };

            return Rjs("ChangeSector", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeOrganizacion(int select)
        {
            var list = new List<NivelForm> { new NivelForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(nivelMapper.Map(catalogoService.GetNivelesByOrganizacionId(select)));

            var form = new ExperienciaProfesionalForm
                           {
                               Niveles2 = list.ToArray(),
                               Niveles3 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles4 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles5 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles6 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}}
                           };

            return Rjs("ChangeOrganizacion", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeNivel2(int select)
        {
            var list = new List<NivelForm> { new NivelForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(nivelMapper.Map(catalogoService.GetNivelesByNivelId(select)));

            var form = new ExperienciaProfesionalForm
                           {
                               Niveles3 = list.ToArray(),
                               Niveles4 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles5 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles6 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}}
                           };

            return Rjs("ChangeNivel2", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeNivel3(int select)
        {
            var list = new List<NivelForm> { new NivelForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(nivelMapper.Map(catalogoService.GetNivelesByNivelId(select)));

            var form = new ExperienciaProfesionalForm
                           {
                               Niveles4 = list.ToArray(),
                               Niveles5 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles6 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}}
                           };

            return Rjs("ChangeNivel3", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeNivel4(int select)
        {
            var list = new List<NivelForm> { new NivelForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(nivelMapper.Map(catalogoService.GetNivelesByNivelId(select)));

            var form = new ExperienciaProfesionalForm
                           {
                               Niveles5 = list.ToArray(),
                               Niveles6 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}}
                           };

            return Rjs("ChangeNivel4", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeNivel5(int select)
        {
            var list = new List<NivelForm> { new NivelForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(nivelMapper.Map(catalogoService.GetNivelesByNivelId(select)));

            var form = new ExperienciaProfesionalForm
                           {
                               Niveles6 = list.ToArray()
                           };

            return Rjs("ChangeNivel5", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeSectorEconomico(int select)
        {
            var list = new List<RamaForm> { new RamaForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(ramaMapper.Map(catalogoService.GetRamasBySectorId(select)));

            var form = new ExperienciaProfesionalForm
                           {
                               Ramas = list.ToArray(),
                               Clases = new[] {new ClaseForm {Id = 0, Nombre = "Seleccione ..."}}
                           };

            return Rjs("ChangeSectorEconomico", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeRama(int select)
        {
            var list = new List<ClaseForm> { new ClaseForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(claseMapper.Map(catalogoService.GetClasesByRamaId(select)));

            var form = new ExperienciaProfesionalForm
                           {
                               Clases = list.ToArray()
                           };

            return Rjs("ChangeRama", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeArea(int select)
        {
            var list = new List<DisciplinaForm> { new DisciplinaForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(disciplinaMapper.Map(catalogoService.GetDisciplinasByAreaId(select)));

            var form = new ExperienciaProfesionalForm
            {
                Disciplinas = list.ToArray(),
                Subdisciplinas = new[] { new SubdisciplinaForm { Id = 0, Nombre = "Seleccione ..." } }
            };

            return Rjs("ChangeArea", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeDisciplina(int select)
        {
            var list = new List<SubdisciplinaForm> { new SubdisciplinaForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(subdisciplinaMapper.Map(catalogoService.GetSubdisciplinasByDisciplinaId(select)));

            var form = new ExperienciaProfesionalForm
            {
                Subdisciplinas = list.ToArray()
            };

            return Rjs("ChangeDisciplina", form);
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

            form.Sectores = sectorMapper.Map(catalogoService.GetActiveSectores());
            form.Organizaciones = organizacionMapper.Map(catalogoService.GetOrganizacionesBySectorId(form.SectorId));
            form.Niveles2 = nivelMapper.Map(catalogoService.GetNivelesByOrganizacionId(form.OrganizacionId));
            form.Niveles3 = nivelMapper.Map(catalogoService.GetNivelesByNivelId(form.Nivel2Id));
            form.Niveles4 = nivelMapper.Map(catalogoService.GetNivelesByNivelId(form.Nivel2Id));
            form.Niveles5 = nivelMapper.Map(catalogoService.GetNivelesByNivelId(form.Nivel2Id));
            form.Niveles6 = nivelMapper.Map(catalogoService.GetNivelesByNivelId(form.Nivel2Id));

            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = disciplinaMapper.Map(catalogoService.GetDisciplinasByAreaId(form.AreaId));
            form.Subdisciplinas = subdisciplinaMapper.Map(catalogoService.GetSubdisciplinasByDisciplinaId(form.DisciplinaId));

            form.SectoresEconomicos = sectorMapper.Map(catalogoService.GetActiveSectoresEconomicos());
            form.Ramas = ramaMapper.Map(catalogoService.GetRamasBySectorId(form.SectorEconomicoId));
            form.Clases = claseMapper.Map(catalogoService.GetClasesByRamaId(form.RamaId));

            return form;
        }

        private void FormSetCombos(ExperienciaProfesionalForm form)
        {
            ViewData["Sector"] = form.SectorId;
            ViewData["Organizacion"] = form.OrganizacionId;
            ViewData["Nivel2"] = form.Nivel2Id;
            ViewData["Nivel3"] = form.Nivel3Id;
            ViewData["Nivel4"] = form.Nivel4Id;
            ViewData["Nivel5"] = form.Nivel5Id;
            ViewData["Nivel6"] = form.Nivel6Id;
            ViewData["Pais"] = form.PaisId;
            ViewData["Area"] = form.AreaId;
            ViewData["Disciplina"] = form.DisciplinaId;
            ViewData["Subdisciplina"] = form.SubdisciplinaId;
            ViewData["SectorEconomico"] = form.SectorEconomicoId;
            ViewData["Rama"] = form.RamaId;
            ViewData["Clase"] = form.ClaseId;
        }
    }
}
