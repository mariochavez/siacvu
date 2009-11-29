using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class FormacionAcademicaController : BaseController<FormacionAcademica, FormacionAcademicaForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IEstadoPaisMapper estadoPaisMapper;
        readonly IFormacionAcademicaMapper formacionAcademicaMapper;
        readonly IFormacionAcademicaService formacionAcademicaService;
        readonly INivelEstudioMapper nivelEstudioMapper;
        readonly IPaisMapper paisMapper;
        readonly INivelMapper nivelMapper;
        readonly IEstatusFormacionAcademicaMapper estatusFormacionAcademicaMapper;
        readonly IOrganizacionMapper organizacionMapper;
        readonly ISectorMapper sectorMapper;
        readonly IInstitucionMapper institucionMapper;
        readonly IAreaMapper areaMapper;

        public FormacionAcademicaController(IFormacionAcademicaService formacionAcademicaService,
                                            IFormacionAcademicaMapper formacionAcademicaMapper,
                                            ICatalogoService catalogoService,
                                            IUsuarioService usuarioService,
                                            INivelEstudioMapper nivelEstudioMapper,
                                            IPaisMapper paisMapper,
                                            IEstadoPaisMapper estadoPaisMapper,
                                            ISubdisciplinaMapper subdisciplinaMapper,
                                            INivelMapper nivelMapper,
                                            IEstatusFormacionAcademicaMapper estatusFormacionAcademicaMapper,
                                            ISearchService searchService, IOrganizacionMapper organizacionMapper, 
                                            ISectorMapper sectorMapper,IDisciplinaMapper disciplinaMapper, IAreaMapper areaMapper,
                                            IInstitucionMapper institucionMapper)
            : base(usuarioService, searchService, catalogoService, disciplinaMapper, subdisciplinaMapper)
        {
            this.catalogoService = catalogoService;
            this.nivelMapper = nivelMapper;
            this.estatusFormacionAcademicaMapper = estatusFormacionAcademicaMapper;
            this.formacionAcademicaService = formacionAcademicaService;
            this.formacionAcademicaMapper = formacionAcademicaMapper;
            this.nivelEstudioMapper = nivelEstudioMapper;
            this.paisMapper = paisMapper;
            this.estadoPaisMapper = estadoPaisMapper;
            this.organizacionMapper = organizacionMapper;
            this.sectorMapper = sectorMapper;
            this.institucionMapper = institucionMapper;
            this.areaMapper = areaMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var formacionAcademicas = new FormacionAcademica[] { };

            if (User.IsInRole("Investigadores"))
                formacionAcademicas = formacionAcademicaService.GetAllFormacionAcademicas(CurrentUser());
            if (User.IsInRole("DGAA"))
                formacionAcademicas = formacionAcademicaService.GetAllFormacionAcademicas();

            data.List = formacionAcademicaMapper.Map(formacionAcademicas);

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

            var formacionAcademica = formacionAcademicaService.GetFormacionAcademicaById(id);

            if (formacionAcademica == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (formacionAcademica.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var formacionAcademicaForm = formacionAcademicaMapper.Map(formacionAcademica);

            data.Form = SetupNewForm(formacionAcademicaForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var formacionAcademica = formacionAcademicaService.GetFormacionAcademicaById(id);
            var formacionAcademicaForm = formacionAcademicaMapper.Map(formacionAcademica);

            data.Form = SetupShowForm(formacionAcademicaForm);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(FormacionAcademicaForm form)
        {
            var formacionAcademica = formacionAcademicaMapper.Map(form, CurrentUser());

            if (!IsValidateModel(formacionAcademica, form, Title.New, "FormacionAcademica"))
            {
                ((GenericViewData<FormacionAcademicaForm>) ViewData.Model).Form = SetupNewForm();
                return ViewNew();
            }

            formacionAcademicaService.SaveFormacionAcademica(formacionAcademica);

            return
                RedirectToIndex(String.Format("Formación Académica {0} ha sido creada", formacionAcademica.TituloGrado));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(FormacionAcademicaForm form)
        {
            var formacionAcademica = formacionAcademicaMapper.Map(form, CurrentUser());

            formacionAcademica.ModificadoPor = CurrentUser();

            if (!IsValidateModel(formacionAcademica, form, Title.Edit))
            {
                var formacionAcademicaForm = formacionAcademicaMapper.Map(formacionAcademica);

                ((GenericViewData<FormacionAcademicaForm>) ViewData.Model).Form = SetupNewForm(formacionAcademicaForm);
                FormSetCombos(formacionAcademicaForm);

                return ViewEdit();
            }

            formacionAcademicaService.SaveFormacionAcademica(formacionAcademica);

            return
                RedirectToIndex(String.Format("Formación Académica {0} ha sido modificada",
                                              formacionAcademica.TituloGrado));
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangePais(int select)
        {
            var list = new List<EstadoPaisForm> { new EstadoPaisForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(estadoPaisMapper.Map(catalogoService.GetEstadoPaisesByPaisId(select)));

            var form = new FormacionAcademicaForm
                           {
                               EstadosPaises = list.ToArray()
                           };

            return Rjs("ChangePais", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<FormacionAcademica>(x => x.TituloGrado, q);
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

        FormacionAcademicaForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        FormacionAcademicaForm SetupNewForm(FormacionAcademicaForm form)
        {
            form = form ?? new FormacionAcademicaForm();

            form.NivelesEstudios = nivelEstudioMapper.Map(catalogoService.GetActiveNivelEstudios());
            form.EstatusFormacionAcademicas = estatusFormacionAcademicaMapper.Map(catalogoService.GetActiveEstatusFormacionAcademicas());

            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            if (form.Id == 0)
            {
                var pais = (from p in form.Paises where p.Nombre == "México" select p.Id).FirstOrDefault();
                form.EstadosPaises = estadoPaisMapper.Map(catalogoService.GetEstadoPaisesByPaisId(pais));
            }

            else
                form.EstadosPaises = estadoPaisMapper.Map(catalogoService.GetEstadoPaisesByPaisId(form.PaisId));

            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            var subdisciplina = subdisciplinaMapper.Map(catalogoService.GetSubdisciplinaById(form.SubdisciplinaId));
            form.Disciplinas = GetDisciplinas(subdisciplina.DisciplinaAreaId);
            form.Subdisciplinas = GetSubdisciplinas(subdisciplina.DisciplinaId);

            return form;
        }

        void FormSetCombos(FormacionAcademicaForm form)
        {
            ViewData["NivelEstudio"] = form.NivelEstudioId;
            ViewData["Estatus"] = form.EstatusId;
            ViewData["Pais"] = form.PaisId;
            ViewData["EstadoPais"] = form.EstadoPaisId;

            var subdisciplina = subdisciplinaMapper.Map(catalogoService.GetSubdisciplinaById(form.SubdisciplinaId));
            ViewData["AreaId"] = subdisciplina.DisciplinaAreaId;
            ViewData["DisciplinaId"] = subdisciplina.DisciplinaId;
            ViewData["SubdisciplinaId"] = form.SubdisciplinaId;
        }

        private FormacionAcademicaForm SetupShowForm(FormacionAcademicaForm form)
        {
            form = form ?? new FormacionAcademicaForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      InstitucionTipoInstitucionNombre = form.Institucion.TipoInstitucion,
                                      InstitucionPaisNombre = form.Institucion.PaisNombre,
                                      InstitucionEstadoPaisNombre = form.Institucion.EstadoPaisNombre,
                                      InstitucionCiudad = form.Institucion.Ciudad,
                                      InstitucionNombre = form.Institucion.Nombre,

                                      SubdisciplinaNombre = form.Subdisciplina.Nombre,
                                      SubdisciplinaDisciplinaNombre = form.Subdisciplina.DisciplinaNombre,
                                      SubdisciplinaDisciplinaAreaNombre = form.Subdisciplina.DisciplinaAreaNombre,

                                      Nivel2Nombre = form.Nivel2.Nombre,
                                      Nivel2OrganizacionNombre = form.Nivel2.OrganizacionNombre,
                                      Nivel2OrganizacionSectorNombre = form.Nivel2.OrganizacionSectorNombre,

                                      IsShowForm = true,
                                      InstitucionLabel = "Institución"
                                  };

            return form;
        }
    }
}