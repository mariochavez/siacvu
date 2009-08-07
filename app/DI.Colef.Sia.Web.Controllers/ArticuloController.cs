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


        public ArticuloController(IArticuloService articuloService, IInvestigadorService investigadorService,
            IArticuloMapper articuloMapper, ICatalogoService catalogoService, IUsuarioService usuarioService,
            ITipoArticuloMapper tipoArticuloMapper, IIdiomaMapper idiomaMapper, IEstadoMapper estadoMapper,
            IPeriodoReferenciaMapper periodoReferenciaMapper, ILineaTematicaMapper lineaTematicaMapper, IPaisMapper paisMapper,
            IRevistaPublicacionMapper revistaPublicacionMapper, IInstitucionMapper institucionMapper, IIndiceMapper indiceMapper, 
            ILineaInvestigacionMapper lineaInvestigacionMapper, ITipoActividadMapper tipoActividadMapper, 
            ITipoParticipanteMapper tipoParticipanteMapper, IAreaMapper areaMapper, IDisciplinaMapper disciplinaMapper, ISubdisciplinaMapper subdisciplinaMapper, 
            IInvestigadorExternoMapper investigadorExternoMapper, IInvestigadorMapper investigadorMapper,
            ICoautorExternoArticuloMapper coautorExternoArticuloMapper, ICoautorInternoArticuloMapper coautorInternoArticuloMapper
            )
            : base(usuarioService)
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
            data.Form = SetupNewForm(new ArticuloForm());

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var articulo = articuloService.GetArticuloById(id);
            if (articulo == null)
                return RedirectToIndex("no ha sido encontrado", true);

            var articuloForm = articuloMapper.Map(articulo);

            data.Form = SetupNewForm(articuloForm);

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
        public ActionResult Create(ArticuloForm form)
        {
            var articulo = articuloMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(articulo, form, Title.New, "Articulo"))
            {
                ((GenericViewData<ArticuloForm>)ViewData.Model).Form = SetupNewForm();
                return ViewNew();
            }

            articuloService.SaveArticulo(articulo);

            return RedirectToIndex(String.Format("{0} ha sido creado", articulo.Titulo));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ArticuloForm form)
        {
            var articulo = articuloMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(articulo, form, Title.Edit))
                return ViewEdit();

            articuloService.SaveArticulo(articulo);

            return RedirectToIndex(String.Format("{0} ha sido modificado", articulo.Titulo));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var articulo = articuloService.GetArticuloById(id);
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
            articulo.Activo = false;
            articulo.ModificadoPor = CurrentUser();
            articuloService.SaveArticulo(articulo);

            var form = articuloMapper.Map(articulo);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorInterno(int id)
        {
            var articulo = articuloService.GetArticuloById(id);

            var form = new ArticuloForm
                           {
                               Id = articulo.Id,
                               CoautorInternoArticulo = new CoautorInternoArticuloForm(),
                               CoautoresInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadorInternos())
                           };

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

            var articulo = articuloService.GetArticuloById(articuloId);
            articulo.AddCoautorInterno(coautorInternoArticulo);
            articuloService.SaveArticulo(articulo);

            var coautorInternoArticuloForm = coautorInternoArticuloMapper.Map(coautorInternoArticulo);

            return Rjs("AddCoautorInterno", coautorInternoArticuloForm);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id)
        {
            var articulo = articuloService.GetArticuloById(id);

            var form = new ArticuloForm
            {
                Id = articulo.Id,
                CoautorExternoArticulo = new CoautorExternoArticuloForm(),
                CoautoresExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos())
            };

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

            var articulo = articuloService.GetArticuloById(articuloId);
            articulo.AddCoautorExterno(coautorExternoArticulo);
            articuloService.SaveArticulo(articulo);

            var coautorExternoArticuloForm = coautorExternoArticuloMapper.Map(coautorExternoArticulo);

            return Rjs("AddCoautorExterno", coautorExternoArticuloForm);
        }


        private ArticuloForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        ArticuloForm SetupNewForm(ArticuloForm form)
        {
            //var forms = form ?? new ArticuloForm();

            return new ArticuloForm
            {
                Id = form.Id,
                Activo = form.Activo,
                Modificacion = form.Modificacion,
                Titulo = form.Titulo,
                FechaAceptacion = form.FechaAceptacion,
                FechaEdicion = form.FechaEdicion,
                FechaPublicacion = form.FechaPublicacion,
                Volumen = form.Volumen,
                Numero = form.Numero,
                PaginaInicial = form.PaginaInicial,
                PaginaFinal = form.PaginaFinal,
                Participantes = form.Participantes,
                PalabrasClaves = form.PalabrasClaves,
                CoautorExternoArticulos = form.CoautorExternoArticulos,
                CoautorInternoArticulos = form.CoautorInternoArticulos,

                CoautorExternoArticulo = new CoautorExternoArticuloForm(),
                CoautorInternoArticulo = new CoautorInternoArticuloForm(),

                //Lista de Catalogos
                TiposArticulos = tipoArticuloMapper.Map(catalogoService.GetActiveArticulos()),
                Idiomas = idiomaMapper.Map(catalogoService.GetActiveIdiomas()),
                Estados = estadoMapper.Map(catalogoService.GetActiveEstados()),
                PeriodosReferencias = periodoReferenciaMapper.Map(catalogoService.GetActivePeriodoReferencias()),
                LineasTematicas = lineaTematicaMapper.Map(catalogoService.GetActiveLineaTematicas()),
                Paises = paisMapper.Map(catalogoService.GetActivePaises()),
                RevistasPublicaciones = revistaPublicacionMapper.Map(catalogoService.GetActiveRevistaPublicaciones()),
                Instituciones = institucionMapper.Map(catalogoService.GetActiveInstituciones()),
                Indices1 = indiceMapper.Map(catalogoService.GetActiveIndices()),
                Indices2 = indiceMapper.Map(catalogoService.GetActiveIndices()),
                Indices3 = indiceMapper.Map(catalogoService.GetActiveIndices()),
                CoautoresExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos()),
                CoautoresInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadorInternos()),
                LineasInvestigaciones = lineaInvestigacionMapper.Map(catalogoService.GetActiveLineaInvestigaciones()),
                TiposActividades = tipoActividadMapper.Map(catalogoService.GetActiveActividades()),
                TiposParticipantes = tipoParticipanteMapper.Map(catalogoService.GetActiveParticipantes()),
                Areas = areaMapper.Map(catalogoService.GetActiveAreas()),
                Disciplinas = disciplinaMapper.Map(catalogoService.GetActiveDisciplinas()),
                Subdisciplinas = subdisciplinaMapper.Map(catalogoService.GetActiveSubdisciplinas())
            };
        }
    }
}
