using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;
using SharpArch.Core.CommonValidator;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class TesisController : BaseController<Tesis, TesisForm>
    {
        readonly ITesisService tesisService;
        readonly ITesisMapper tesisMapper;
        readonly ICatalogoService catalogoService;
        readonly IGradoAcademicoMapper gradoAcademicoMapper;
        readonly IPaisMapper paisMapper;
        readonly IFormaParticipacionMapper formaParticipacionMapper;
        readonly IInstitucionMapper institucionMapper;
        readonly IProgramaEstudioMapper programaEstudioMapper;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IPeriodoReferenciaMapper periodoReferenciaMapper;
        readonly ISectorMapper sectorMapper;
        readonly IDependenciaMapper dependenciaMapper;
        readonly IDepartamentoMapper departamentoMapper;
        readonly IAreaMapper areaMapper;
        readonly IDisciplinaMapper disciplinaMapper;
        readonly ISubdisciplinaMapper subdisciplinaMapper;


        public TesisController(ITesisService tesisService, ITesisMapper tesisMapper, ICatalogoService catalogoService, 
            IUsuarioService usuarioService, IGradoAcademicoMapper gradoAcademicoMapper, IPaisMapper paisMapper, 
            IFormaParticipacionMapper formaParticipacionMapper, IInstitucionMapper institucionMapper, 
            IProgramaEstudioMapper programaEstudioMapper, ILineaTematicaMapper lineaTematicaMapper, 
            IPeriodoReferenciaMapper periodoReferenciaMapper, ISectorMapper sectorMapper, 
            IDependenciaMapper dependenciaMapper, IDepartamentoMapper departamentoMapper, 
            IAreaMapper areaMapper, IDisciplinaMapper disciplinaMapper, 
            ISubdisciplinaMapper subdisciplinaMapper
            )
            : base(usuarioService)
        {
            this.catalogoService = catalogoService;
            this.tesisService = tesisService;
            this.tesisMapper = tesisMapper;
            this.gradoAcademicoMapper = gradoAcademicoMapper;
            this.paisMapper = paisMapper;
            this.formaParticipacionMapper = formaParticipacionMapper;
            this.institucionMapper = institucionMapper;
            this.programaEstudioMapper = programaEstudioMapper;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.periodoReferenciaMapper = periodoReferenciaMapper;
            this.sectorMapper = sectorMapper;
            this.dependenciaMapper = dependenciaMapper;
            this.departamentoMapper = departamentoMapper;
            this.areaMapper = areaMapper;
            this.disciplinaMapper = disciplinaMapper;
            this.subdisciplinaMapper = subdisciplinaMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var teses = tesisService.GetAllTesis();
            data.List = tesisMapper.Map(teses);

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

            var tesis = tesisService.GetTesisById(id);

            if (tesis == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (tesis.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var tesisForm = tesisMapper.Map(tesis);

            data.Form = SetupNewForm(tesisForm);
            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var tesis = tesisService.GetTesisById(id);
            data.Form = tesisMapper.Map(tesis);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TesisForm form)
        {
            var tesis = tesisMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(tesis, form, Title.New, "Tesis"))
            {
                ((GenericViewData<TesisForm>)ViewData.Model).Form = SetupNewForm();
                return ViewNew();
            }

            tesisService.SaveTesis(tesis);

            return RedirectToIndex(String.Format("{0} ha sido creada", tesis.Titulo));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TesisForm form)
        {
            var tesis = tesisMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(tesis, form, Title.Edit))
            {
                var tesisForm = tesisMapper.Map(tesis);
                ((GenericViewData<TesisForm>)ViewData.Model).Form = SetupNewForm(tesisForm);
                FormSetCombos(tesisForm);
                return ViewEdit();   
            }

            tesisService.SaveTesis(tesis);

            return RedirectToIndex(String.Format("{0} ha sido modificada", tesis.Titulo));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tesis = tesisService.GetTesisById(id);

            if (tesis.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            tesis.Activo = true;
            tesis.ModificadoPor = CurrentUser();
            tesisService.SaveTesis(tesis);

            var form = tesisMapper.Map(tesis);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tesis = tesisService.GetTesisById(id);

            if (tesis.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            tesis.Activo = false;
            tesis.ModificadoPor = CurrentUser();
            tesisService.SaveTesis(tesis);

            var form = tesisMapper.Map(tesis);

            return Rjs("Activate", form);
        }

        TesisForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        TesisForm SetupNewForm(TesisForm form)
        {
            form = form ?? new TesisForm();

                //Lista de Catalogos Pendientes
            form.GradosAcademicos = gradoAcademicoMapper.Map(catalogoService.GetActiveGrados());
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            form.FormasParticipaciones = formaParticipacionMapper.Map(catalogoService.GetActiveFormaParticipaciones());
            form.Instituciones = institucionMapper.Map(catalogoService.GetActiveInstituciones());
            form.ProgramasEstudios = programaEstudioMapper.Map(catalogoService.GetActiveProgramaEstudios());
            form.LineasTematicas = lineaTematicaMapper.Map(catalogoService.GetActiveLineaTematicas());
            form.PeriodosReferencias = periodoReferenciaMapper.Map(catalogoService.GetActivePeriodoReferencias());
            form.Sectores = sectorMapper.Map(catalogoService.GetActiveSectores());
            form.Dependencias = dependenciaMapper.Map(catalogoService.GetActiveDependencias());
            form.Departamentos = departamentoMapper.Map(catalogoService.GetActiveDepartamentos());
            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = disciplinaMapper.Map(catalogoService.GetActiveDisciplinas());
            form.Subdisciplinas = subdisciplinaMapper.Map(catalogoService.GetActiveSubdisciplinas());

            return form;

        }

        private void FormSetCombos(TesisForm form)
        {
            ViewData["GradoAcademico"] = form.GradoAcademicoId;
            ViewData["Pais"] = form.PaisId;
            ViewData["FormaParticipacion"] = form.FormaParticipacionId;
            ViewData["Institucion"] = form.InstitucionId;
            ViewData["ProgramaEstudio"] = form.ProgramaEstudioId;
            ViewData["LineaTematica"] = form.LineaTematicaId;
            ViewData["PeriodoReferencia"] = form.PeriodoReferenciaId;


            ViewData["Sector"] = form.SectorId;
            ViewData["Dependencia"] = form.DependenciaId;
            ViewData["Departamento"] = form.DepartamentoId;
            ViewData["Area"] = form.AreaId;
            ViewData["Disciplina"] = form.DisciplinaId;
            ViewData["Subdisciplina"] = form.SubdisciplinaId;
        }
    }
}
