using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class FormacionAcademicaController : BaseController<FormacionAcademica, FormacionAcademicaForm>
    {
        readonly IFormacionAcademicaService formacionAcademicaService;
        readonly IFormacionAcademicaMapper formacionAcademicaMapper;
        readonly ICatalogoService catalogoService;
        readonly INivelEstudioMapper nivelEstudioMapper;
        readonly IInstitucionMapper institucionMapper;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IPaisMapper paisMapper;
        readonly IEstadoPaisMapper estadoPaisMapper;
        readonly ISectorMapper sectorMapper;
        readonly IOrganizacionMapper organizacionMapper;
        readonly IAreaMapper areaMapper;
        readonly IDisciplinaMapper disciplinaMapper;
        readonly ISubdisciplinaMapper subdisciplinaMapper;


        public FormacionAcademicaController(IFormacionAcademicaService formacionAcademicaService, IFormacionAcademicaMapper formacionAcademicaMapper,
            ICatalogoService catalogoService, IUsuarioService usuarioService, INivelEstudioMapper nivelEstudioMapper, IInstitucionMapper institucionMapper, 
            ILineaTematicaMapper lineaTematicaMapper, IPaisMapper paisMapper, IEstadoPaisMapper estadoPaisMapper, ISectorMapper sectorMapper, 
            IOrganizacionMapper organizacionMapper, IAreaMapper areaMapper, IDisciplinaMapper disciplinaMapper, ISubdisciplinaMapper subdisciplinaMapper)
            : base(usuarioService)
        {
            this.catalogoService = catalogoService;
            this.formacionAcademicaService = formacionAcademicaService;
            this.formacionAcademicaMapper = formacionAcademicaMapper;
            this.nivelEstudioMapper = nivelEstudioMapper;
            this.institucionMapper = institucionMapper;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.paisMapper = paisMapper;
            this.estadoPaisMapper = estadoPaisMapper;
            this.sectorMapper = sectorMapper;
            this.organizacionMapper = organizacionMapper;
            this.areaMapper = areaMapper;
            this.disciplinaMapper = disciplinaMapper;
            this.subdisciplinaMapper = subdisciplinaMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var formacionAcademicas = formacionAcademicaService.GetAllFormacionAcademicas();
            data.List = formacionAcademicaMapper.Map(formacionAcademicas);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var formacionAcademica = formacionAcademicaService.GetFormacionAcademicaById(id);

            if (formacionAcademica == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (formacionAcademica.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var formacionAcademicaForm = formacionAcademicaMapper.Map(formacionAcademica);

            data.Form = SetupNewForm(formacionAcademicaForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var formacionAcademica = formacionAcademicaService.GetFormacionAcademicaById(id);
            data.Form = formacionAcademicaMapper.Map(formacionAcademica);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(FormacionAcademicaForm form)
        {
            var formacionAcademica = formacionAcademicaMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(formacionAcademica, form, Title.New, "FormacionAcademica"))
            {
                ((GenericViewData<FormacionAcademicaForm>)ViewData.Model).Form = SetupNewForm();
                return ViewNew();
            }

            formacionAcademicaService.SaveFormacionAcademica(formacionAcademica);

            return RedirectToIndex(String.Format("Formacion Academica {0} ha sido creada", formacionAcademica.TituloGrado));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(FormacionAcademicaForm form)
        {
            var formacionAcademica = formacionAcademicaMapper.Map(form, CurrentUser(), CurrentInvestigador());

            formacionAcademica.ModificadoPor = CurrentUser();

            if (!IsValidateModel(formacionAcademica, form, Title.Edit))
            {
                var formacionAcademicaForm = formacionAcademicaMapper.Map(formacionAcademica);

                ((GenericViewData<FormacionAcademicaForm>)ViewData.Model).Form = SetupNewForm(formacionAcademicaForm);
                FormSetCombos(formacionAcademicaForm);

                return ViewEdit();
            }

            formacionAcademicaService.SaveFormacionAcademica(formacionAcademica);

            return RedirectToIndex(String.Format("Formacion Academica {0} ha sido modificada", formacionAcademica.TituloGrado));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var formacionAcademica = formacionAcademicaService.GetFormacionAcademicaById(id);

            if (formacionAcademica.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            formacionAcademica.Activo = true;
            formacionAcademica.ModificadoPor = CurrentUser();
            formacionAcademicaService.SaveFormacionAcademica(formacionAcademica);

            var form = formacionAcademicaMapper.Map(formacionAcademica);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var formacionAcademica = formacionAcademicaService.GetFormacionAcademicaById(id);

            if (formacionAcademica.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            formacionAcademica.Activo = false;
            formacionAcademica.ModificadoPor = CurrentUser();
            formacionAcademicaService.SaveFormacionAcademica(formacionAcademica);

            var form = formacionAcademicaMapper.Map(formacionAcademica);

            return Rjs("Activate", form);
        }

        FormacionAcademicaForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        FormacionAcademicaForm SetupNewForm(FormacionAcademicaForm form)
        {
            form = form ?? new FormacionAcademicaForm();

            form.NivelesEstudios = nivelEstudioMapper.Map(catalogoService.GetActiveNivelEstudios());
            form.Instituciones = institucionMapper.Map(catalogoService.GetActiveInstituciones());
            form.LineasTematicas = lineaTematicaMapper.Map(catalogoService.GetActiveLineaTematicas());
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            form.EstadosPaises = estadoPaisMapper.Map(catalogoService.GetActiveEstadoPaises());
            form.Sectores = sectorMapper.Map(catalogoService.GetActiveSectores());
            form.Organizaciones = organizacionMapper.Map(catalogoService.GetActiveOrganizaciones());
            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = disciplinaMapper.Map(catalogoService.GetActiveDisciplinas());
            form.Subdisciplinas = subdisciplinaMapper.Map(catalogoService.GetActiveSubdisciplinas());

            return form;
        }

        private void FormSetCombos(FormacionAcademicaForm form)
        {
            ViewData["NivelEstudio"] = form.NivelEstudioId;
            ViewData["Institucion"] = form.InstitucionId;
            ViewData["LineaTematica"] = form.LineaTematicaId;
            ViewData["Pais"] = form.PaisId;
            ViewData["EstadoPais"] = form.EstadoPaisId;

            ViewData["Sector"] = form.SectorId;
            ViewData["Organizacion"] = form.OrganizacionId;
            ViewData["Area"] = form.AreaId;
            ViewData["Disciplina"] = form.DisciplinaId;
            ViewData["Subdisciplina"] = form.SubdisciplinaId;
        }
    }
}
