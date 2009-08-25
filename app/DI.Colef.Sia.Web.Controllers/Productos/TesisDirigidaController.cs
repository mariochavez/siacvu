using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos
{
    [HandleError]
    public class TesisDirigidaController : BaseController<TesisDirigida, TesisDirigidaForm>
    {
        readonly IAreaMapper areaMapper;
        readonly ICatalogoService catalogoService;
        readonly IDepartamentoMapper departamentoMapper;
        readonly IDependenciaMapper dependenciaMapper;
        readonly IDisciplinaMapper disciplinaMapper;
        readonly IFormaParticipacionMapper formaParticipacionMapper;
        readonly IGradoAcademicoMapper gradoAcademicoMapper;
        readonly IPaisMapper paisMapper;
        readonly ISectorMapper sectorMapper;
        readonly ISubdisciplinaMapper subdisciplinaMapper;
        readonly ITesisDirigidaMapper tesisDirigidaMapper;
        readonly ITesisDirigidaService tesisDirigidaService;


        public TesisDirigidaController(ITesisDirigidaService tesisDirigidaService, ITesisDirigidaMapper tesisDirigidaMapper, ICatalogoService catalogoService,
                               IUsuarioService usuarioService, IGradoAcademicoMapper gradoAcademicoMapper,
                               IPaisMapper paisMapper,
                               IFormaParticipacionMapper formaParticipacionMapper,
                               ISectorMapper sectorMapper,
                               IDependenciaMapper dependenciaMapper, IDepartamentoMapper departamentoMapper,
                               IAreaMapper areaMapper, IDisciplinaMapper disciplinaMapper,
                               ISubdisciplinaMapper subdisciplinaMapper
                               , ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.tesisDirigidaService = tesisDirigidaService;
            this.tesisDirigidaMapper = tesisDirigidaMapper;
            this.gradoAcademicoMapper = gradoAcademicoMapper;
            this.paisMapper = paisMapper;
            this.formaParticipacionMapper = formaParticipacionMapper;
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

            var tesisDirigidas = tesisDirigidaService.GetAllTesisDirigidas();
            data.List = tesisDirigidaMapper.Map(tesisDirigidas);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
            data.Form.PeriodoReferenciaPeriodo = CurrentPeriodo().Periodo;

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tesisDirigida = tesisDirigidaService.GetTesisDirigidaById(id);

            if (tesisDirigida == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (tesisDirigida.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var tesisDirigidaForm = tesisDirigidaMapper.Map(tesisDirigida);

            data.Form = SetupNewForm(tesisDirigidaForm);
            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var tesisDirigida = tesisDirigidaService.GetTesisDirigidaById(id);
            data.Form = tesisDirigidaMapper.Map(tesisDirigida);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TesisDirigidaForm form)
        {
            var tesisDirigida = tesisDirigidaMapper.Map(form, CurrentUser(), CurrentInvestigador(), CurrentPeriodo());

            if (!IsValidateModel(tesisDirigida, form, Title.New, "TesisDirigida"))
            {
                ((GenericViewData<TesisDirigidaForm>) ViewData.Model).Form = SetupNewForm();
                return ViewNew();
            }

            tesisDirigidaService.SaveTesisDirigida(tesisDirigida);

            return RedirectToIndex(String.Format("Tesis dirigida {0} ha sido creada", tesisDirigida.Titulo));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TesisDirigidaForm form)
        {
            var tesisDirigida = tesisDirigidaMapper.Map(form, CurrentUser(), CurrentInvestigador(), CurrentPeriodo());

            if (!IsValidateModel(tesisDirigida, form, Title.Edit))
            {
                var tesisDirigidaForm = tesisDirigidaMapper.Map(tesisDirigida);
                ((GenericViewData<TesisDirigidaForm>) ViewData.Model).Form = SetupNewForm(tesisDirigidaForm);
                FormSetCombos(tesisDirigidaForm);
                return ViewEdit();
            }

            tesisDirigidaService.SaveTesisDirigida(tesisDirigida);

            return RedirectToIndex(String.Format("Tesis dirigida {0} ha sido modificada", tesisDirigida.Titulo));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tesisDirigida = tesisDirigidaService.GetTesisDirigidaById(id);

            if (tesisDirigida.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            tesisDirigida.Activo = true;
            tesisDirigida.ModificadoPor = CurrentUser();
            tesisDirigidaService.SaveTesisDirigida(tesisDirigida);

            var form = tesisDirigidaMapper.Map(tesisDirigida);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tesisDirigida = tesisDirigidaService.GetTesisDirigidaById(id);

            if (tesisDirigida.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            tesisDirigida.Activo = false;
            tesisDirigida.ModificadoPor = CurrentUser();
            tesisDirigidaService.SaveTesisDirigida(tesisDirigida);

            var form = tesisDirigidaMapper.Map(tesisDirigida);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<TesisDirigida>(x => x.Titulo, q);
            return Content(data);
        }

        TesisDirigidaForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        TesisDirigidaForm SetupNewForm(TesisDirigidaForm form)
        {
            form = form ?? new TesisDirigidaForm();

            //Lista de Catalogos Pendientes
            form.GradosAcademicos = gradoAcademicoMapper.Map(catalogoService.GetActiveGrados());
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            form.FormasParticipaciones = formaParticipacionMapper.Map(catalogoService.GetActiveFormaParticipaciones());
            form.Sectores = sectorMapper.Map(catalogoService.GetActiveSectores());
            form.Dependencias = dependenciaMapper.Map(catalogoService.GetActiveDependencias());
            form.Departamentos = departamentoMapper.Map(catalogoService.GetActiveDepartamentos());
            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = disciplinaMapper.Map(catalogoService.GetActiveDisciplinas());
            form.Subdisciplinas = subdisciplinaMapper.Map(catalogoService.GetActiveSubdisciplinas());

            return form;
        }

        void FormSetCombos(TesisDirigidaForm form)
        {
            ViewData["GradoAcademico"] = form.GradoAcademicoId;
            ViewData["Pais"] = form.PaisId;
            ViewData["FormaParticipacion"] = form.FormaParticipacionId;
            ViewData["Sector"] = form.SectorId;
            ViewData["Dependencia"] = form.DependenciaId;
            ViewData["Departamento"] = form.DepartamentoId;
            ViewData["Area"] = form.AreaId;
            ViewData["Disciplina"] = form.DisciplinaId;
            ViewData["Subdisciplina"] = form.SubdisciplinaId;
        }
    }
}