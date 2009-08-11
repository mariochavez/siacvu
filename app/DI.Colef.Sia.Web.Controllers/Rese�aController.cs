using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class ReseñaController : BaseController<Reseña, ReseñaForm>
    {
        readonly IAreaMapper areaMapper;
        readonly ICatalogoService catalogoService;
        readonly ICoautorExternoReseñaMapper coautorExternoReseñaMapper;
        readonly ICoautorInternoReseñaMapper coautorInternoReseñaMapper;
        readonly IDisciplinaMapper disciplinaMapper;
        readonly IEstadoProductoMapper estadoProductoMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly IInvestigadorMapper investigadorMapper;
        readonly IInvestigadorService investigadorService;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IPaisMapper paisMapper;
        readonly IPeriodoReferenciaMapper periodoReferenciaMapper;
        readonly IProyectoMapper proyectoMapper;
        readonly IReseñaMapper reseñaMapper;
        readonly IReseñaService reseñaService;
        readonly ISubdisciplinaMapper subdisciplinaMapper;


        public ReseñaController(IReseñaService reseñaService, IReseñaMapper reseñaMapper,
                                ICatalogoService catalogoService,
                                IUsuarioService usuarioService, IEstadoProductoMapper estadoProductoMapper,
                                IPeriodoReferenciaMapper periodoReferenciaMapper,
                                IProyectoMapper proyectoMapper, ILineaTematicaMapper lineaTematicaMapper,
                                IInvestigadorExternoMapper investigadorExternoMapper,
                                IInvestigadorMapper investigadorMapper, IPaisMapper paisMapper, IAreaMapper areaMapper,
                                IDisciplinaMapper disciplinaMapper,
                                ISubdisciplinaMapper subdisciplinaMapper, IInvestigadorService investigadorService,
                                ICoautorExternoReseñaMapper coautorExternoReseñaMapper,
                                ICoautorInternoReseñaMapper coautorInternoReseñaMapper, ISearchService searchService)
            : base(usuarioService, searchService)
        {
            this.catalogoService = catalogoService;
            this.reseñaService = reseñaService;
            this.reseñaMapper = reseñaMapper;
            this.estadoProductoMapper = estadoProductoMapper;
            this.periodoReferenciaMapper = periodoReferenciaMapper;
            this.proyectoMapper = proyectoMapper;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.investigadorExternoMapper = investigadorExternoMapper;
            this.investigadorMapper = investigadorMapper;
            this.paisMapper = paisMapper;
            this.areaMapper = areaMapper;
            this.disciplinaMapper = disciplinaMapper;
            this.subdisciplinaMapper = subdisciplinaMapper;
            this.investigadorService = investigadorService;
            this.coautorExternoReseñaMapper = coautorExternoReseñaMapper;
            this.coautorInternoReseñaMapper = coautorInternoReseñaMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var reseñas = reseñaService.GetAllReseñas();
            data.List = reseñaMapper.Map(reseñas);

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

            var reseña = reseñaService.GetReseñaById(id);

            if (reseña == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (reseña.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var reseñaForm = reseñaMapper.Map(reseña);

            data.Form = SetupNewForm(reseñaForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var reseña = reseñaService.GetReseñaById(id);
            data.Form = reseñaMapper.Map(reseña);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ReseñaForm form)
        {
            var reseña = reseñaMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(reseña, form, Title.New, "Reseña"))
            {
                ((GenericViewData<ReseñaForm>) ViewData.Model).Form = SetupNewForm();
                return ViewNew();
            }

            reseñaService.SaveReseña(reseña);

            return RedirectToIndex(String.Format("{0} ha sido creado", reseña.NombreRevista));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ReseñaForm form)
        {
            var reseña = reseñaMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(reseña, form, Title.Edit))
            {
                var reseñaForm = reseñaMapper.Map(reseña);

                ((GenericViewData<ReseñaForm>) ViewData.Model).Form = SetupNewForm(reseñaForm);
                FormSetCombos(reseñaForm);
                return ViewEdit();
            }

            reseñaService.SaveReseña(reseña);

            return RedirectToIndex(String.Format("{0} ha sido modificado", reseña.NombreRevista));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var reseña = reseñaService.GetReseñaById(id);

            if (reseña.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            reseña.Activo = true;
            reseña.ModificadoPor = CurrentUser();
            reseñaService.SaveReseña(reseña);

            var form = reseñaMapper.Map(reseña);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var reseña = reseñaService.GetReseñaById(id);

            if (reseña.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            reseña.Activo = false;
            reseña.ModificadoPor = CurrentUser();
            reseñaService.SaveReseña(reseña);

            var form = reseñaMapper.Map(reseña);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorInterno(int id)
        {
            var reseña = reseñaService.GetReseñaById(id);
            var form = new ReseñaForm();

            if (reseña != null)
                form.Id = reseña.Id;

            form.CoautorInternoReseña = new CoautorInternoReseñaForm();
            form.CoautoresInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());

            return Rjs("NewCoautorInterno", form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorInterno([Bind(Prefix = "CoautorInternoReseña")] CoautorInternoReseñaForm form,
                                              int reseñaId)
        {
            var coautorInternoReseña = coautorInternoReseñaMapper.Map(form);

            ModelState.AddModelErrors(coautorInternoReseña.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            coautorInternoReseña.CreadorPor = CurrentUser();
            coautorInternoReseña.ModificadoPor = CurrentUser();

            if (reseñaId != 0)
            {
                var reseña = reseñaService.GetReseñaById(reseñaId);
                reseña.AddCoautorInterno(coautorInternoReseña);
                reseñaService.SaveReseña(reseña);
            }

            var coautorInternoReseñaForm = coautorInternoReseñaMapper.Map(coautorInternoReseña);

            return Rjs("AddCoautorInterno", coautorInternoReseñaForm);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id)
        {
            var reseña = reseñaService.GetReseñaById(id);
            var form = new ReseñaForm();

            if (reseña != null)
                form.Id = reseña.Id;

            form.CoautorExternoReseña = new CoautorExternoReseñaForm();
            form.CoautoresExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());

            return Rjs("NewCoautorExterno", form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorExterno([Bind(Prefix = "CoautorExternoReseña")] CoautorExternoReseñaForm form,
                                              int reseñaId)
        {
            var coautorExternoReseña = coautorExternoReseñaMapper.Map(form);

            ModelState.AddModelErrors(coautorExternoReseña.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            coautorExternoReseña.CreadorPor = CurrentUser();
            coautorExternoReseña.ModificadoPor = CurrentUser();

            if (reseñaId != 0)
            {
                var reseña = reseñaService.GetReseñaById(reseñaId);
                reseña.AddCoautorExterno(coautorExternoReseña);
                reseñaService.SaveReseña(reseña);
            }

            var coautorExternoReseñaForm = coautorExternoReseñaMapper.Map(coautorExternoReseña);

            return Rjs("AddCoautorExterno", coautorExternoReseñaForm);
        }

        ReseñaForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        ReseñaForm SetupNewForm(ReseñaForm form)
        {
            form = form ?? new ReseñaForm();


            form.CoautorExternoReseña = new CoautorExternoReseñaForm();
            form.CoautorInternoReseña = new CoautorInternoReseñaForm();

            //Lista de Catalogos Pendientes
            form.EstadosProductos = estadoProductoMapper.Map(catalogoService.GetActiveEstadoProductos());
            form.PeriodosReferencias = periodoReferenciaMapper.Map(catalogoService.GetActivePeriodoReferencias());
            form.Proyectos = proyectoMapper.Map(catalogoService.GetActiveProyectos());
            form.LineasTematicas = lineaTematicaMapper.Map(catalogoService.GetActiveLineaTematicas());
            form.CoautoresExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());
            form.CoautoresInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = disciplinaMapper.Map(catalogoService.GetActiveDisciplinas());
            form.Subdisciplinas = subdisciplinaMapper.Map(catalogoService.GetActiveSubdisciplinas());

            return form;
        }

        void FormSetCombos(ReseñaForm form)
        {
            ViewData["EstadoProducto"] = form.EstadoProductoId;
            ViewData["PeriodoReferencia"] = form.PeriodoReferenciaId;
            ViewData["Proyecto"] = form.ProyectoId;
            ViewData["LineaTematica"] = form.LineaTematicaId;
            ViewData["Pais"] = form.PaisId;

            ViewData["Area"] = form.AreaId;
            ViewData["Disciplina"] = form.DisciplinaId;
            ViewData["Subdisciplina"] = form.SubdisciplinaId;
        }
    }
}