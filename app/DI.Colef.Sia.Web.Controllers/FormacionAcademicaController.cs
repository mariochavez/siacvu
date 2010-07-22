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
    public class FormacionAcademicaController : BaseController<FormacionAcademica, FormacionAcademicaForm>
    {
        readonly IEstadoPaisMapper estadoPaisMapper;
        readonly IFormacionAcademicaMapper formacionAcademicaMapper;
        readonly IFormacionAcademicaService formacionAcademicaService;
        readonly INivelEstudioMapper nivelEstudioMapper;
        readonly IEstatusFormacionAcademicaMapper estatusFormacionAcademicaMapper;
        readonly ISectorMapper sectorMapper;
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
            : base(usuarioService, searchService, catalogoService, institucionMapper, disciplinaMapper, subdisciplinaMapper, organizacionMapper, nivelMapper)
        {
            this.catalogoService = catalogoService;
            this.estatusFormacionAcademicaMapper = estatusFormacionAcademicaMapper;
            this.formacionAcademicaService = formacionAcademicaService;
            this.formacionAcademicaMapper = formacionAcademicaMapper;
            this.nivelEstudioMapper = nivelEstudioMapper;
            this.paisMapper = paisMapper;
            this.estadoPaisMapper = estadoPaisMapper;
            this.sectorMapper = sectorMapper;
            this.areaMapper = areaMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<FormacionAcademicaForm>();
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
            var data = new GenericViewData<FormacionAcademicaForm> {Form = SetupNewForm()};
            ViewData["Pais"] = (from p in data.Form.Paises where p.Nombre == "México" select p.Id).FirstOrDefault();
            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<FormacionAcademicaForm>();

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
            var data = new GenericViewData<FormacionAcademicaForm>();

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
                var formacionAcademicaForm = formacionAcademicaMapper.Map(formacionAcademica);

                ((GenericViewData<FormacionAcademicaForm>)ViewData.Model).Form = SetupNewForm(formacionAcademicaForm);
                FormSetCombos(formacionAcademicaForm);
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
            form.Disciplinas = GetDisciplinasByAreaId(form.AreaId);
            form.Subdisciplinas = GetSubdisciplinasByDisciplinaId(form.DisciplinaId);

            form.Sectores = sectorMapper.Map(catalogoService.GetActiveSectores());
            form.Organizaciones = GetOrganizacionesBySectorId(form.SectorId);
            form.Niveles = GetNivelesByOrganizacionId(form.OrganizacionId);

            if(form.Institucion != null) 
                form.InstitucionTipoInstitucionNombre = form.Institucion.TipoInstitucion;
            form.InstitucionLabel = "Institución";
            form.IsShowForm = false;

            return form;
        }

        FormacionAcademicaForm SetupShowForm(FormacionAcademicaForm form)
        {
            form = form ?? new FormacionAcademicaForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      InstitucionPaisNombre = form.Institucion.PaisNombre,
                                      InstitucionEstadoPaisNombre = form.Institucion.EstadoPaisNombre,
                                      InstitucionCiudad = form.Institucion.Ciudad,
                                      InstitucionNombre = form.Institucion.Nombre,

                                      SubdisciplinaNombre = form.SubdisciplinaNombre,
                                      DisciplinaNombre = form.DisciplinaNombre,
                                      AreaNombre = form.AreaNombre,

                                      Nivel2Nombre = form.Nivel2Nombre,
                                      OrganizacionNombre = form.OrganizacionNombre,
                                      SectorNombre = form.SectorNombre                                    
                                  };

            form.InstitucionTipoInstitucionNombre = form.Institucion.TipoInstitucion;
            form.InstitucionLabel = "Institución";
            form.IsShowForm = true;

            return form;
        }

        void FormSetCombos(FormacionAcademicaForm form)
        {
            ViewData["NivelEstudio"] = form.NivelEstudioId;
            ViewData["Estatus"] = form.EstatusId;
            ViewData["Pais"] = form.PaisId;
            ViewData["EstadoPais"] = form.EstadoPaisId;

            ViewData["AreaId"] = form.AreaId;
            ViewData["DisciplinaId"] = form.DisciplinaId;
            ViewData["SubdisciplinaId"] = form.SubdisciplinaId;

            ViewData["SectorId"] = form.SectorId;
            ViewData["OrganizacionId"] = form.OrganizacionId;
            ViewData["Nivel2Id"] = form.Nivel2Id;
        }
    }
}