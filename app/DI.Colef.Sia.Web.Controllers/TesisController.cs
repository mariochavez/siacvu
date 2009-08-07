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


        public TesisController(ITesisService tesisService,
            ITesisMapper tesisMapper,
            ICatalogoService catalogoService, IUsuarioService usuarioService
            , IGradoAcademicoMapper gradoAcademicoMapper
, IPaisMapper paisMapper
, IFormaParticipacionMapper formaParticipacionMapper
, IInstitucionMapper institucionMapper
, IProgramaEstudioMapper programaEstudioMapper
, ILineaTematicaMapper lineaTematicaMapper
, IPeriodoReferenciaMapper periodoReferenciaMapper
, ISectorMapper sectorMapper
, IDependenciaMapper dependenciaMapper
, IDepartamentoMapper departamentoMapper
, IAreaMapper areaMapper
, IDisciplinaMapper disciplinaMapper
, ISubdisciplinaMapper subdisciplinaMapper
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
            data.Form = tesisMapper.Map(tesis);

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
            var tesis = tesisMapper.Map(form);

            tesis.CreadorPor = CurrentUser();
            tesis.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tesis, form, Title.New, "Tesis"))
            {
                ((GenericViewData<TesisForm>)ViewData.Model).Form = SetupNewForm();
                return ViewNew();
            }

            tesisService.SaveTesis(tesis);

            return RedirectToIndex(String.Format("{0} ha sido creado", "tesis.Nombre"));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TesisForm form)
        {
            var tesis = tesisMapper.Map(form);

            tesis.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tesis, form, Title.Edit))
                return ViewEdit();

            tesisService.SaveTesis(tesis);

            return RedirectToIndex(String.Format("{0} ha sido modificado", "tesis.Nombre"));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tesis = tesisService.GetTesisById(id);
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
            tesis.Activo = false;
            tesis.ModificadoPor = CurrentUser();
            tesisService.SaveTesis(tesis);

            var form = tesisMapper.Map(tesis);

            return Rjs("Activate", form);
        }

        TesisForm SetupNewForm()
        {
            return new TesisForm
            {
                //Lista de Catalogos Pendientes
                GradosAcademicos = gradoAcademicoMapper.Map(catalogoService.GetActiveGrados()),
                Paises = paisMapper.Map(catalogoService.GetActivePaises()),
                FormasParticipaciones = formaParticipacionMapper.Map(catalogoService.GetActiveFormaParticipaciones()),
                Instituciones = institucionMapper.Map(catalogoService.GetActiveInstituciones()),
                ProgramasEstudios = programaEstudioMapper.Map(catalogoService.GetActiveProgramaEstudios()),
                LineasTematicas = lineaTematicaMapper.Map(catalogoService.GetActiveLineaTematicas()),
                PeriodosReferencias = periodoReferenciaMapper.Map(catalogoService.GetActivePeriodoReferencias()),
                Sectores = sectorMapper.Map(catalogoService.GetActiveSectores()),
                Dependencias = dependenciaMapper.Map(catalogoService.GetActiveDependencias()),
                Departamentos = departamentoMapper.Map(catalogoService.GetActiveDepartamentos()),
                Areas = areaMapper.Map(catalogoService.GetActiveAreas()),
                Disciplinas = disciplinaMapper.Map(catalogoService.GetActiveDisciplinas()),
                Subdisciplinas = subdisciplinaMapper.Map(catalogoService.GetActiveSubdisciplinas()),
            };
        }
    }
}
