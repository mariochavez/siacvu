using System;
using System.Linq;
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
    public class ArticuloController : BaseController<Articulo, ArticuloForm>
    {
        readonly IArticuloService articuloService;
        readonly IInvestigadorService investigadorService;
        readonly IArticuloMapper articuloMapper;
        readonly ICatalogoService catalogoService;
        readonly ITipoArticuloMapper tipoArticuloMapper;
        readonly IIdiomaMapper idiomaMapper;
        readonly IEstadoMapper estadoMapper;
        readonly IPeriodoReferenciaMapper periodoReferenciaMapper;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IPaisMapper paisMapper;
        readonly IRevistaPublicacionMapper revistaPublicacionMapper;
        readonly IInstitucionMapper institucionMapper;
        readonly IIndiceMapper indiceMapper;
        readonly IInvestigadorMapper investigadorMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly ILineaInvestigacionMapper lineaInvestigacionMapper;
        readonly ITipoActividadMapper tipoActividadMapper;
        readonly ITipoParticipanteMapper tipoParticipanteMapper;
        readonly IAreaMapper areaMapper;
        readonly IDisciplinaMapper disciplinaMapper;
        readonly ISubdisciplinaMapper subdisciplinaMapper;
        readonly ICoautorExternoArticuloMapper coautorExternoArticuloMapper;
        readonly ICoautorInternoArticuloMapper coautorInternoArticuloMapper;
        readonly IEstadoProductoMapper estadoProductoMapper;
        readonly IProyectoMapper proyectoMapper;


        public ArticuloController(IArticuloService articuloService, IInvestigadorService investigadorService,
                                  IArticuloMapper articuloMapper, ICatalogoService catalogoService, IUsuarioService usuarioService,
                                  ITipoArticuloMapper tipoArticuloMapper, IIdiomaMapper idiomaMapper, IEstadoMapper estadoMapper,
                                  IPeriodoReferenciaMapper periodoReferenciaMapper, ILineaTematicaMapper lineaTematicaMapper, IPaisMapper paisMapper,
                                  IRevistaPublicacionMapper revistaPublicacionMapper, IInstitucionMapper institucionMapper, IIndiceMapper indiceMapper, 
                                  ILineaInvestigacionMapper lineaInvestigacionMapper, ITipoActividadMapper tipoActividadMapper, 
                                  ITipoParticipanteMapper tipoParticipanteMapper, IAreaMapper areaMapper, IDisciplinaMapper disciplinaMapper, ISubdisciplinaMapper subdisciplinaMapper, 
                                  IInvestigadorExternoMapper investigadorExternoMapper, IInvestigadorMapper investigadorMapper,
                                  ICoautorExternoArticuloMapper coautorExternoArticuloMapper, ICoautorInternoArticuloMapper coautorInternoArticuloMapper,
                                  IEstadoProductoMapper estadoProductoMapper, ISearchService searchService, IProyectoMapper proyectoMapper)
            : base(usuarioService, searchService)
        {
            this.coautorInternoArticuloMapper = coautorInternoArticuloMapper;
            this.investigadorExternoMapper = investigadorExternoMapper;
            this.investigadorMapper = investigadorMapper;
            this.catalogoService = catalogoService;
            this.articuloService = articuloService;
            this.investigadorService = investigadorService;
            this.articuloMapper = articuloMapper;
            this.tipoArticuloMapper = tipoArticuloMapper;
            this.idiomaMapper = idiomaMapper;
            this.estadoMapper = estadoMapper;
            this.periodoReferenciaMapper = periodoReferenciaMapper;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.paisMapper = paisMapper;
            this.revistaPublicacionMapper = revistaPublicacionMapper;
            this.institucionMapper = institucionMapper;
            this.indiceMapper = indiceMapper;
            this.lineaInvestigacionMapper = lineaInvestigacionMapper;
            this.tipoActividadMapper = tipoActividadMapper;
            this.tipoParticipanteMapper = tipoParticipanteMapper;
            this.areaMapper = areaMapper;
            this.disciplinaMapper = disciplinaMapper;
            this.subdisciplinaMapper = subdisciplinaMapper;
            this.coautorExternoArticuloMapper = coautorExternoArticuloMapper;
            this.estadoProductoMapper = estadoProductoMapper;
            this.proyectoMapper = proyectoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var articulos = articuloService.GetAllArticulos();
            data.List = articuloMapper.Map(articulos);

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

            var articulo = articuloService.GetArticuloById(id);

            if (articulo == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (articulo.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var articuloForm = articuloMapper.Map(articulo);

            data.Form = SetupNewForm(articuloForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var articulo = articuloService.GetArticuloById(id);
            data.Form = articuloMapper.Map(articulo);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ArticuloForm form,
                                   FormCollection formCollection)
        {
            var coautoresExternos = new string[] {};
            var coautoresInternos = new string[] {};

            if(formCollection["CoautorExternoArticulo.InvestigadorExternoId_New"] != null &&
                    formCollection["CoautorExternoArticulo.InvestigadorExternoId_New"].Split(',').Length > 0)
                coautoresExternos = formCollection["CoautorExternoArticulo.InvestigadorExternoId_New"].Split(',');

            if (formCollection["CoautorInternoArticulo.InvestigadorId_New"] != null &&
                    formCollection["CoautorInternoArticulo.InvestigadorId_New"].Split(',').Length > 0)
                coautoresInternos = formCollection["CoautorInternoArticulo.InvestigadorId_New"].Split(',');

            var articulo = articuloMapper.Map(form, CurrentUser(), CurrentInvestigador(),
                              coautoresExternos, coautoresInternos);

            if (!IsValidateModel(articulo, form, Title.New, "Articulo"))
            {
                var articuloForm = articuloMapper.Map(articulo);

                ((GenericViewData<ArticuloForm>)ViewData.Model).Form = SetupNewForm(articuloForm);
                return ViewNew();
            }

            articuloService.SaveArticulo(articulo);

            return RedirectToIndex(String.Format("Artículo {0} ha sido creado", articulo.Titulo));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ArticuloForm form)
        {
            var articulo = articuloMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(articulo, form, Title.Edit))
            {
                var articuloForm = articuloMapper.Map(articulo);

                ((GenericViewData<ArticuloForm>)ViewData.Model).Form = SetupNewForm(articuloForm);
                FormSetCombos(articuloForm);
                return ViewEdit();
            }

            articuloService.SaveArticulo(articulo);

            return RedirectToIndex(String.Format("Artículo {0} ha sido modificado", articulo.Titulo));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var articulo = articuloService.GetArticuloById(id);

            if (articulo.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            articulo.Activo = true;
            articulo.ModificadoPor = CurrentUser();
            articuloService.SaveArticulo(articulo);

            var form = articuloMapper.Map(articulo);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var articulo = articuloService.GetArticuloById(id);

            if (articulo.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            articulo.Activo = false;
            articulo.ModificadoPor = CurrentUser();
            articuloService.SaveArticulo(articulo);

            var form = articuloMapper.Map(articulo);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Articulo>(x => x.Titulo, q);
            return Content(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorInterno(int id)
        {
            var articulo = articuloService.GetArticuloById(id);
            var form = new ArticuloForm();

            if (articulo != null)
                form.Id = articulo.Id;

            form.CoautorInternoArticulo = new CoautorInternoArticuloForm();
            form.CoautoresInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());

            return Rjs("NewCoautorInterno", form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorInterno([Bind(Prefix = "CoautorInternoArticulo")]CoautorInternoArticuloForm form, int articuloId)
        {
            var coautorInternoArticulo = coautorInternoArticuloMapper.Map(form);

            ModelState.AddModelErrors(coautorInternoArticulo.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            coautorInternoArticulo.CreadorPor = CurrentUser();
            coautorInternoArticulo.ModificadoPor = CurrentUser();

            if (articuloId != 0)
            {
                var articulo = articuloService.GetArticuloById(articuloId);
                articulo.AddCoautorInterno(coautorInternoArticulo);
                articuloService.SaveArticulo(articulo);
            }

            var coautorInternoArticuloForm = coautorInternoArticuloMapper.Map(coautorInternoArticulo);

            return Rjs("AddCoautorInterno", coautorInternoArticuloForm);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id)
        {
            var articulo = articuloService.GetArticuloById(id);
            var form = new ArticuloForm();

            if (articulo != null)
                form.Id = articulo.Id;

            form.CoautorExternoArticulo = new CoautorExternoArticuloForm();
            form.CoautoresExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());

            return Rjs("NewCoautorExterno", form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorExterno([Bind(Prefix = "CoautorExternoArticulo")]CoautorExternoArticuloForm form, int articuloId)
        {
            var coautorExternoArticulo = coautorExternoArticuloMapper.Map(form);

            ModelState.AddModelErrors(coautorExternoArticulo.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            coautorExternoArticulo.CreadorPor = CurrentUser();
            coautorExternoArticulo.ModificadoPor = CurrentUser();

            if (articuloId != 0)
            {
                var articulo = articuloService.GetArticuloById(articuloId);
                articulo.AddCoautorExterno(coautorExternoArticulo);
                articuloService.SaveArticulo(articulo);
            }

            var coautorExternoArticuloForm = coautorExternoArticuloMapper.Map(coautorExternoArticulo);

            return Rjs("AddCoautorExterno", coautorExternoArticuloForm);
        }

        ArticuloForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        ArticuloForm SetupNewForm(ArticuloForm form)
        {
            form = form ?? new ArticuloForm();

            form.CoautorExternoArticulo = new CoautorExternoArticuloForm();
            form.CoautorInternoArticulo = new CoautorInternoArticuloForm();

            //Lista de Catalogos
            form.TiposArticulos = tipoArticuloMapper.Map(catalogoService.GetActiveArticulos());
            form.Idiomas = idiomaMapper.Map(catalogoService.GetActiveIdiomas());
            form.EstadosProductos = estadoProductoMapper.Map(catalogoService.GetActiveEstadoProductos());
            form.PeriodoReferencia = periodoReferenciaMapper.Map(catalogoService.GetCurrentPeriodoReferencia());
            form.LineasTematicas = lineaTematicaMapper.Map(catalogoService.GetActiveLineaTematicas());
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            form.RevistasPublicaciones = revistaPublicacionMapper.Map(catalogoService.GetActiveRevistaPublicaciones());
            form.Instituciones = institucionMapper.Map(catalogoService.GetActiveInstituciones());
            form.Indices1 = indiceMapper.Map(catalogoService.GetActiveIndices());
            form.Indices2 = indiceMapper.Map(catalogoService.GetActiveIndices());
            form.Indices3 = indiceMapper.Map(catalogoService.GetActiveIndices());
            form.CoautoresExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());
            form.CoautoresInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());
            form.LineasInvestigaciones = lineaInvestigacionMapper.Map(catalogoService.GetActiveLineaInvestigaciones());
            form.TiposActividades = tipoActividadMapper.Map(catalogoService.GetActiveActividades());
            form.TiposParticipantes = tipoParticipanteMapper.Map(catalogoService.GetActiveParticipantes());
            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = disciplinaMapper.Map(catalogoService.GetActiveDisciplinas());
            form.Subdisciplinas = subdisciplinaMapper.Map(catalogoService.GetActiveSubdisciplinas());
            form.Proyectos = proyectoMapper.Map(catalogoService.GetActiveProyectos());

            return form;
        }

        private void FormSetCombos(ArticuloForm form)
        {
            ViewData["TipoArticulo"] = form.TipoArticuloId;
            ViewData["Idioma"] = form.IdiomaId;
            ViewData["EstadoProducto"] = form.EstadoProductoId;
            ViewData["LineaTematica"] = form.LineaTematicaId;
            ViewData["Proyecto"] = form.ProyectoId;

            ViewData["Pais"] = form.PaisId;
            ViewData["RevistaPublicacion"] = form.RevistaPublicacionId;
            ViewData["Institucion"] = form.InstitucionId;
            ViewData["Indice1"] = form.Indice1Id;
            ViewData["Indice2"] = form.Indice2Id;
            ViewData["Indice3"] = form.Indice3Id;

            ViewData["LineaInvestigacion"] = form.LineaInvestigacionId;
            ViewData["TipoActividad"] = form.TipoActividadId;
            ViewData["TipoParticipante"] = form.TipoParticipanteId;
            ViewData["Area"] = form.AreaId;
            ViewData["Disciplina"] = form.DisciplinaId;
            ViewData["Subdisciplina"] = form.SubdisciplinaId;
        }
    }
}