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
    public class CapituloController : BaseController<Capitulo, CapituloForm>
    {
        readonly IAreaMapper areaMapper;
        readonly ICapituloService capituloService;
        readonly ICatalogoService catalogoService;
        readonly ICoautorExternoCapituloMapper coautorExternoCapituloMapper;
        readonly ICoautorInternoCapituloMapper coautorInternoCapituloMapper;
        readonly IDisciplinaMapper disciplinaMapper;
        readonly IFormaParticipacionMapper formaParticipacionMapper;
        readonly IIdiomaMapper idiomaMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly IInvestigadorMapper investigadorMapper;
        readonly IInvestigadorService investigadorService;
        readonly ICapituloMapper capituloMapper;
        readonly ITipoCapituloMapper tipoCapituloMapper;
        readonly IPeriodoReferenciaMapper periodoReferenciaMapper;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IPaisMapper paisMapper;
        readonly IResponsableExternoCapituloMapper responsableExternoCapituloMapper;
        readonly IResponsableInternoCapituloMapper responsableInternoCapituloMapper;
        readonly IEstadoProductoMapper estadoProductoMapper;
        readonly ISubdisciplinaMapper subdisciplinaMapper;
        readonly ITipoParticipacionMapper tipoParticipacionMapper;
        readonly ITipoParticipanteMapper tipoParticipanteMapper;
        readonly IProyectoMapper proyectoMapper;

        public CapituloController(ICapituloService capituloService, ICapituloMapper capituloMapper,
                                  ICatalogoService catalogoService, IUsuarioService usuarioService,
                                  ITipoCapituloMapper tipoCapituloMapper,
                                  IPeriodoReferenciaMapper periodoReferenciaMapper,
                                  ILineaTematicaMapper lineaTematicaMapper, IIdiomaMapper idiomaMapper,
                                  IPaisMapper paisMapper, IInvestigadorMapper investigadorMapper,
                                  IInvestigadorExternoMapper investigadorExternoMapper,
                                  IFormaParticipacionMapper formaParticipacionMapper,
                                  ITipoParticipacionMapper tipoParticipacionMapper,
                                  ITipoParticipanteMapper tipoParticipanteMapper, IAreaMapper areaMapper,
                                  IDisciplinaMapper disciplinaMapper, ISubdisciplinaMapper subdisciplinaMapper,
                                  ICoautorExternoCapituloMapper coautorExternoCapituloMapper,
                                  ICoautorInternoCapituloMapper coautorInternoCapituloMapper,
                                  IResponsableExternoCapituloMapper responsableExternoCapituloMapper,
                                  IResponsableInternoCapituloMapper responsableInternoCapituloMapper,
                                  IInvestigadorService investigadorService, IEstadoProductoMapper estadoProductoMapper,
                                  ISearchService searchService, IProyectoMapper proyectoMapper)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.capituloService = capituloService;
            this.investigadorService = investigadorService;
            this.estadoProductoMapper = estadoProductoMapper;
            this.capituloMapper = capituloMapper;
            this.tipoCapituloMapper = tipoCapituloMapper;
            this.periodoReferenciaMapper = periodoReferenciaMapper;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.idiomaMapper = idiomaMapper;
            this.paisMapper = paisMapper;
            this.investigadorMapper = investigadorMapper;
            this.investigadorExternoMapper = investigadorExternoMapper;
            this.formaParticipacionMapper = formaParticipacionMapper;
            this.tipoParticipacionMapper = tipoParticipacionMapper;
            this.tipoParticipanteMapper = tipoParticipanteMapper;
            this.areaMapper = areaMapper;
            this.disciplinaMapper = disciplinaMapper;
            this.subdisciplinaMapper = subdisciplinaMapper;
            this.coautorExternoCapituloMapper = coautorExternoCapituloMapper;
            this.coautorInternoCapituloMapper = coautorInternoCapituloMapper;
            this.responsableExternoCapituloMapper = responsableExternoCapituloMapper;
            this.responsableInternoCapituloMapper = responsableInternoCapituloMapper;
            this.proyectoMapper = proyectoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var capitulos = capituloService.GetAllCapitulos();
            data.List = capituloMapper.Map(capitulos);

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

            var capitulo = capituloService.GetCapituloById(id);

            if (capitulo == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (capitulo.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var capituloForm = capituloMapper.Map(capitulo);

            data.Form = SetupNewForm(capituloForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var capitulo = capituloService.GetCapituloById(id);
            data.Form = capituloMapper.Map(capitulo);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(CapituloForm form, 
                                   FormCollection formCollection)
        {
            var coautoresExternos = new string[] { };
            var coautoresInternos = new string[] { };
            var responsablesExternos = new string[] { };
            var responsablesInternos = new string[] { };

            if (formCollection["CoautorExternoCapitulo.InvestigadorExternoId_New"] != null &&
                    formCollection["CoautorExternoCapitulo.InvestigadorExternoId_New"].Split(',').Length > 0)
                coautoresExternos = formCollection["CoautorExternoCapitulo.InvestigadorExternoId_New"].Split(',');

            if (formCollection["CoautorInternoCapitulo.InvestigadorId_New"] != null &&
                    formCollection["CoautorInternoCapitulo.InvestigadorId_New"].Split(',').Length > 0)
                coautoresInternos = formCollection["CoautorInternoCapitulo.InvestigadorId_New"].Split(',');

            if (formCollection["ResponsableExternoCapitulo.InvestigadorExternoId_New"] != null &&
                    formCollection["ResponsableExternoCapitulo.InvestigadorExternoId_New"].Split(',').Length > 0)
                responsablesExternos = formCollection["ResponsableExternoCapitulo.InvestigadorExternoId_New"].Split(',');

            if (formCollection["ResponsableInternoCapitulo.InvestigadorId_New"] != null &&
                    formCollection["ResponsableInternoCapitulo.InvestigadorId_New"].Split(',').Length > 0)
                responsablesInternos = formCollection["ResponsableInternoCapitulo.InvestigadorId_New"].Split(',');

            var capitulo = capituloMapper.Map(form, CurrentUser(), CurrentInvestigador(), CurrentPeriodo(),
                coautoresExternos, coautoresInternos, responsablesExternos, responsablesInternos);

            if (!IsValidateModel(capitulo, form, Title.New, "Capitulo"))
            {
                var capituloForm = capituloMapper.Map(capitulo);

                ((GenericViewData<CapituloForm>)ViewData.Model).Form = SetupNewForm(capituloForm);
                return ViewNew();
            }

            capituloService.SaveCapitulo(capitulo);

            return RedirectToIndex(String.Format("Capítulo {0} ha sido creado", capitulo.NombreCapitulo));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(CapituloForm form)
        {
            var capitulo = capituloMapper.Map(form, CurrentUser(), CurrentInvestigador(), CurrentPeriodo());

            if (!IsValidateModel(capitulo, form, Title.Edit))
            {
                var capituloForm = capituloMapper.Map(capitulo);

                ((GenericViewData<CapituloForm>) ViewData.Model).Form = SetupNewForm(capituloForm);
                FormSetCombos(capituloForm);
                return ViewEdit();
            }

            capituloService.SaveCapitulo(capitulo);

            return RedirectToIndex(String.Format("Capítulo {0} ha sido modificado", capitulo.NombreCapitulo));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var capitulo = capituloService.GetCapituloById(id);

            if (capitulo.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            capitulo.Activo = true;
            capitulo.ModificadoPor = CurrentUser();
            capituloService.SaveCapitulo(capitulo);

            var form = capituloMapper.Map(capitulo);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var capitulo = capituloService.GetCapituloById(id);

            if (capitulo.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            capitulo.Activo = false;
            capitulo.ModificadoPor = CurrentUser();
            capituloService.SaveCapitulo(capitulo);

            var form = capituloMapper.Map(capitulo);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Capitulo>(x => x.NombreCapitulo, q);
            return Content(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorInterno(int id)
        {
            var capitulo = capituloService.GetCapituloById(id);
            var form = new CapituloForm();

            if (capitulo != null)
                form.Id = capitulo.Id;

            form.CoautorInternoCapitulo = new CoautorInternoCapituloForm();
            form.CoautoresInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());

            return Rjs("NewCoautorInterno", form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorInterno([Bind(Prefix = "CoautorInternoCapitulo")] CoautorInternoCapituloForm form,
                                              int capituloId)
        {
            var coautorInternoCapitulo = coautorInternoCapituloMapper.Map(form);

            ModelState.AddModelErrors(coautorInternoCapitulo.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            coautorInternoCapitulo.CreadorPor = CurrentUser();
            coautorInternoCapitulo.ModificadoPor = CurrentUser();

            if (capituloId != 0)
            {
                var capitulo = capituloService.GetCapituloById(capituloId);
                capitulo.AddCoautorInterno(coautorInternoCapitulo);
                capituloService.SaveCapitulo(capitulo);
            }

            var coautorInternoCapituloForm = coautorInternoCapituloMapper.Map(coautorInternoCapitulo);

            return Rjs("AddCoautorInterno", coautorInternoCapituloForm);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id)
        {
            var capitulo = capituloService.GetCapituloById(id);

            var form = new CapituloForm();

            if (capitulo != null)
                form.Id = capitulo.Id;

            form.CoautorExternoCapitulo = new CoautorExternoCapituloForm();
            form.CoautoresExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());

            return Rjs("NewCoautorExterno", form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorExterno([Bind(Prefix = "CoautorExternoCapitulo")] CoautorExternoCapituloForm form,
                                              int capituloId)
        {
            var coautorExternoCapitulo = coautorExternoCapituloMapper.Map(form);

            ModelState.AddModelErrors(coautorExternoCapitulo.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            coautorExternoCapitulo.CreadorPor = CurrentUser();
            coautorExternoCapitulo.ModificadoPor = CurrentUser();

            if (capituloId != 0)
            {
                var capitulo = capituloService.GetCapituloById(capituloId);
                capitulo.AddCoautorExterno(coautorExternoCapitulo);
                capituloService.SaveCapitulo(capitulo);
            }

            var coautorExternoCapituloForm = coautorExternoCapituloMapper.Map(coautorExternoCapitulo);

            return Rjs("AddCoautorExterno", coautorExternoCapituloForm);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewResponsableInterno(int id)
        {
            var capitulo = capituloService.GetCapituloById(id);

            var form = new CapituloForm();

            if (capitulo != null)
                form.Id = capitulo.Id;

            form.ResponsableInternoCapitulo = new ResponsableInternoCapituloForm();
            form.ResponsablesInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());

            return Rjs("NewResponsableInterno", form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddResponsableInterno(
            [Bind(Prefix = "ResponsableInternoCapitulo")] ResponsableInternoCapituloForm form, int capituloId)
        {
            var responsableInternoCapitulo = responsableInternoCapituloMapper.Map(form);

            ModelState.AddModelErrors(responsableInternoCapitulo.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            responsableInternoCapitulo.CreadorPor = CurrentUser();
            responsableInternoCapitulo.ModificadoPor = CurrentUser();

            if (capituloId != 0)
            {
                var capitulo = capituloService.GetCapituloById(capituloId);
                capitulo.AddResponsableInterno(responsableInternoCapitulo);
                capituloService.SaveCapitulo(capitulo);
            }

            var responsableInternoCapituloForm = responsableInternoCapituloMapper.Map(responsableInternoCapitulo);

            return Rjs("AddResponsableInterno", responsableInternoCapituloForm);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewResponsableExterno(int id)
        {
            var capitulo = capituloService.GetCapituloById(id);

            var form = new CapituloForm();

            if (capitulo != null)
                form.Id = capitulo.Id;

            form.ResponsableExternoCapitulo = new ResponsableExternoCapituloForm();
            form.ResponsablesExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());

            return Rjs("NewResponsableExterno", form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddResponsableExterno(
            [Bind(Prefix = "ResponsableExternoCapitulo")] ResponsableExternoCapituloForm form, int capituloId)
        {
            var responsableExternoCapitulo = responsableExternoCapituloMapper.Map(form);

            ModelState.AddModelErrors(responsableExternoCapitulo.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            responsableExternoCapitulo.CreadorPor = CurrentUser();
            responsableExternoCapitulo.ModificadoPor = CurrentUser();

            if (capituloId != 0)
            {
                var capitulo = capituloService.GetCapituloById(capituloId);
                capitulo.AddResponsableExterno(responsableExternoCapitulo);
                capituloService.SaveCapitulo(capitulo);
            }

            var responsableExternoCapituloForm = responsableExternoCapituloMapper.Map(responsableExternoCapitulo);

            return Rjs("AddResponsableExterno", responsableExternoCapituloForm);
        }

        CapituloForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        CapituloForm SetupNewForm(CapituloForm form)
        {
            form = form ?? new CapituloForm();

            form.CoautorExternoCapitulo = new CoautorExternoCapituloForm();
            form.CoautorInternoCapitulo = new CoautorInternoCapituloForm();
            form.ResponsableInternoCapitulo = new ResponsableInternoCapituloForm();
            form.ResponsableExternoCapitulo = new ResponsableExternoCapituloForm();

            //Lista de Catalogos Pendientes
            form.TiposCapitulos = tipoCapituloMapper.Map(catalogoService.GetActiveTipoCapitulos());
            form.EstadosProductos = estadoProductoMapper.Map(catalogoService.GetActiveEstadoProductos());
            form.Idiomas = idiomaMapper.Map(catalogoService.GetActiveIdiomas());
            form.CoautoresExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());
            form.CoautoresInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            form.ResponsablesInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());
            form.ResponsablesExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());
            form.FormasParticipaciones = formaParticipacionMapper.Map(catalogoService.GetActiveFormaParticipaciones());
            form.TiposParticipaciones = tipoParticipacionMapper.Map(catalogoService.GetActiveTipoParticipaciones());
            form.TiposParticipantes = tipoParticipanteMapper.Map(catalogoService.GetActiveParticipantes());
            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = disciplinaMapper.Map(catalogoService.GetActiveDisciplinas());
            form.Subdisciplinas = subdisciplinaMapper.Map(catalogoService.GetActiveSubdisciplinas());
            form.Proyectos = proyectoMapper.Map(catalogoService.GetActiveProyectos());

            return form;
        }

        void FormSetCombos(CapituloForm form)
        {
            ViewData["TipoCapitulo"] = form.TipoCapituloId;
            ViewData["Idioma"] = form.IdiomaId;
            ViewData["EstadoProducto"] = form.EstadoProductoId;
            ViewData["Pais"] = form.PaisId;
            ViewData["FormaParticipacion"] = form.FormaParticipacionId;
            ViewData["TipoParticipacion"] = form.TipoParticipacionId;
            ViewData["TipoParticipante"] = form.TipoParticipanteId;
            ViewData["Area"] = form.AreaId;
            ViewData["Disciplina"] = form.DisciplinaId;
            ViewData["Subdisciplina"] = form.SubdisciplinaId;
            ViewData["Proyecto"] = form.ProyectoId;
        }
    }
}