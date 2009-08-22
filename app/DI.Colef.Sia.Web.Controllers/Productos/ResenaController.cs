using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos
{
    [HandleError]
    public class ResenaController : BaseController<Resena, ResenaForm>
    {
        readonly IAreaMapper areaMapper;
        readonly ICatalogoService catalogoService;
        readonly ICoautorExternoResenaMapper coautorExternoResenaMapper;
        readonly ICoautorInternoResenaMapper coautorInternoResenaMapper;
        readonly IDisciplinaMapper disciplinaMapper;
        readonly IEstadoProductoMapper estadoProductoMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly IInvestigadorMapper investigadorMapper;
        readonly IInvestigadorService investigadorService;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IPaisMapper paisMapper;
        readonly IPeriodoReferenciaMapper periodoReferenciaMapper;
        readonly IProyectoMapper proyectoMapper;
        readonly IResenaMapper resenaMapper;
        readonly IResenaService resenaService;
        readonly ISubdisciplinaMapper subdisciplinaMapper;

        public ResenaController(IResenaService resenaService, IResenaMapper resenaMapper,
                                ICatalogoService catalogoService,
                                IUsuarioService usuarioService, IEstadoProductoMapper estadoProductoMapper,
                                IPeriodoReferenciaMapper periodoReferenciaMapper,
                                IProyectoMapper proyectoMapper, ILineaTematicaMapper lineaTematicaMapper,
                                IInvestigadorExternoMapper investigadorExternoMapper,
                                IInvestigadorMapper investigadorMapper, IPaisMapper paisMapper, IAreaMapper areaMapper,
                                IDisciplinaMapper disciplinaMapper,
                                ISubdisciplinaMapper subdisciplinaMapper, IInvestigadorService investigadorService,
                                ICoautorExternoResenaMapper coautorExternoResenaMapper,
                                ICoautorInternoResenaMapper coautorInternoResenaMapper, ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.resenaService = resenaService;
            this.resenaMapper = resenaMapper;
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
            this.coautorExternoResenaMapper = coautorExternoResenaMapper;
            this.coautorInternoResenaMapper = coautorInternoResenaMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var resenas = resenaService.GetAllResenas();
            data.List = resenaMapper.Map(resenas);

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

            var resena = resenaService.GetResenaById(id);

            if (resena == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (resena.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var resenaForm = resenaMapper.Map(resena);

            data.Form = SetupNewForm(resenaForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var resena = resenaService.GetResenaById(id);
            data.Form = resenaMapper.Map(resena);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ResenaForm form,
                                   FormCollection formCollection)
        {
            var coautoresExternos = new string[] { };
            var coautoresInternos = new string[] { };

            if (formCollection["CoautorExternoResena.InvestigadorExternoId_New"] != null &&
                    formCollection["CoautorExternoResena.InvestigadorExternoId_New"].Split(',').Length > 0)
                coautoresExternos = formCollection["CoautorExternoResena.InvestigadorExternoId_New"].Split(',');

            if (formCollection["CoautorInternoResena.InvestigadorId_New"] != null &&
                    formCollection["CoautorInternoResena.InvestigadorId_New"].Split(',').Length > 0)
                coautoresInternos = formCollection["CoautorInternoResena.InvestigadorId_New"].Split(',');

            var resena = resenaMapper.Map(form, CurrentUser(), CurrentInvestigador(), CurrentPeriodo(),
                                          coautoresExternos, coautoresInternos);

            if (!IsValidateModel(resena, form, Title.New, "Resena"))
            {
                var resenaForm = resenaMapper.Map(resena);

                ((GenericViewData<ResenaForm>) ViewData.Model).Form = SetupNewForm(resenaForm);
                return ViewNew();
            }

            resenaService.SaveResena(resena);

            return RedirectToIndex(String.Format("Reseña {0} ha sido creada", resena.NombreRevista));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ResenaForm form)
        {
            var resena = resenaMapper.Map(form, CurrentUser(), CurrentInvestigador(), CurrentPeriodo());

            if (!IsValidateModel(resena, form, Title.Edit))
            {
                var resenaForm = resenaMapper.Map(resena);

                ((GenericViewData<ResenaForm>) ViewData.Model).Form = SetupNewForm(resenaForm);
                FormSetCombos(resenaForm);
                return ViewEdit();
            }

            resenaService.SaveResena(resena);

            return RedirectToIndex(String.Format("Reseña {0} ha sido modificada", resena.NombreRevista));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var resena = resenaService.GetResenaById(id);

            if (resena.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            resena.Activo = true;
            resena.ModificadoPor = CurrentUser();
            resenaService.SaveResena(resena);

            var form = resenaMapper.Map(resena);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var resena = resenaService.GetResenaById(id);

            if (resena.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            resena.Activo = false;
            resena.ModificadoPor = CurrentUser();
            resenaService.SaveResena(resena);

            var form = resenaMapper.Map(resena);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Resena>(x => x.NombreRevista, q);
            return Content(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorInterno(int id)
        {
            var resena = resenaService.GetResenaById(id);
            var form = new ResenaForm();

            if (resena != null)
                form.Id = resena.Id;

            form.CoautorInternoResena = new CoautorInternoResenaForm();
            form.CoautoresInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());

            return Rjs("NewCoautorInterno", form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorInterno([Bind(Prefix = "CoautorInternoResena")] CoautorInternoResenaForm form,
                                              int resenaId)
        {
            var coautorInternoResena = coautorInternoResenaMapper.Map(form);

            ModelState.AddModelErrors(coautorInternoResena.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            coautorInternoResena.CreadorPor = CurrentUser();
            coautorInternoResena.ModificadoPor = CurrentUser();

            if (resenaId != 0)
            {
                var resena = resenaService.GetResenaById(resenaId);
                resena.AddCoautorInterno(coautorInternoResena);
                resenaService.SaveResena(resena);
            }

            var coautorInternoResenaForm = coautorInternoResenaMapper.Map(coautorInternoResena);

            return Rjs("AddCoautorInterno", coautorInternoResenaForm);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id)
        {
            var resena = resenaService.GetResenaById(id);
            var form = new ResenaForm();

            if (resena != null)
                form.Id = resena.Id;

            form.CoautorExternoResena = new CoautorExternoResenaForm();
            form.CoautoresExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());

            return Rjs("NewCoautorExterno", form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorExterno([Bind(Prefix = "CoautorExternoResena")] CoautorExternoResenaForm form,
                                              int resenaId)
        {
            var coautorExternoResena = coautorExternoResenaMapper.Map(form);

            ModelState.AddModelErrors(coautorExternoResena.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            coautorExternoResena.CreadorPor = CurrentUser();
            coautorExternoResena.ModificadoPor = CurrentUser();

            if (resenaId != 0)
            {
                var resena = resenaService.GetResenaById(resenaId);
                resena.AddCoautorExterno(coautorExternoResena);
                resenaService.SaveResena(resena);
            }

            var coautorExternoResenaForm = coautorExternoResenaMapper.Map(coautorExternoResena);

            return Rjs("AddCoautorExterno", coautorExternoResenaForm);
        }

        ResenaForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        ResenaForm SetupNewForm(ResenaForm form)
        {
            form = form ?? new ResenaForm();


            form.CoautorExternoResena = new CoautorExternoResenaForm();
            form.CoautorInternoResena = new CoautorInternoResenaForm();

            //Lista de Catalogos Pendientes
            form.EstadosProductos = estadoProductoMapper.Map(catalogoService.GetActiveEstadoProductos());
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

        void FormSetCombos(ResenaForm form)
        {
            ViewData["EstadoProducto"] = form.EstadoProductoId;
            ViewData["Proyecto"] = form.ProyectoId;
            ViewData["LineaTematica"] = form.LineaTematicaId;
            ViewData["Pais"] = form.PaisId;

            ViewData["Area"] = form.AreaId;
            ViewData["Disciplina"] = form.DisciplinaId;
            ViewData["Subdisciplina"] = form.SubdisciplinaId;
        }
    }
}