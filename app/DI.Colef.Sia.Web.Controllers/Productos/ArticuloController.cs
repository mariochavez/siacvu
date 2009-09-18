using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos
{
    public class ArticuloController : BaseController<Articulo, ArticuloForm>
    {
        readonly IArticuloService articuloService;
        readonly IInvestigadorService investigadorService;
        readonly IArticuloMapper articuloMapper;
        readonly ICatalogoService catalogoService;
        readonly ITipoArticuloMapper tipoArticuloMapper;
        readonly IIdiomaMapper idiomaMapper;
        readonly IPaisMapper paisMapper;
        readonly IRevistaPublicacionMapper revistaPublicacionMapper;
        readonly IIndiceMapper indiceMapper;
        readonly IInvestigadorMapper investigadorMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly ILineaInvestigacionMapper lineaInvestigacionMapper;
        readonly ITipoActividadMapper tipoActividadMapper;
        readonly ITipoParticipacionMapper tipoParticipacionMapper; 
        readonly IAreaMapper areaMapper;
        readonly IDisciplinaMapper disciplinaMapper;
        readonly ISubdisciplinaMapper subdisciplinaMapper;
        readonly ICoautorExternoArticuloMapper coautorExternoArticuloMapper;
        readonly ICoautorInternoArticuloMapper coautorInternoArticuloMapper;
        readonly IEstadoProductoMapper estadoProductoMapper;
        readonly IProyectoMapper proyectoMapper;
        readonly IProyectoService proyectoService;

        public ArticuloController(IArticuloService articuloService, IInvestigadorService investigadorService, 
                                  IArticuloMapper articuloMapper, ICatalogoService catalogoService, 
                                  IUsuarioService usuarioService, ITipoArticuloMapper tipoArticuloMapper, 
                                  IIdiomaMapper idiomaMapper, IPaisMapper paisMapper, IRevistaPublicacionMapper revistaPublicacionMapper, 
                                  IIndiceMapper indiceMapper, ILineaInvestigacionMapper lineaInvestigacionMapper, 
                                  ITipoActividadMapper tipoActividadMapper, ITipoParticipacionMapper tipoParticipacionMapper, 
                                  IAreaMapper areaMapper, IDisciplinaMapper disciplinaMapper, ISubdisciplinaMapper subdisciplinaMapper, 
                                  IInvestigadorExternoMapper investigadorExternoMapper, IInvestigadorMapper investigadorMapper, 
                                  ICoautorExternoArticuloMapper coautorExternoArticuloMapper, 
                                  ICoautorInternoArticuloMapper coautorInternoArticuloMapper, 
                                  IEstadoProductoMapper estadoProductoMapper, ISearchService searchService,
                                  IProyectoMapper proyectoMapper, IProyectoService proyectoService)
            : base(usuarioService, searchService, catalogoService)
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
            this.paisMapper = paisMapper;
            this.revistaPublicacionMapper = revistaPublicacionMapper;
            this.indiceMapper = indiceMapper;
            this.lineaInvestigacionMapper = lineaInvestigacionMapper;
            this.tipoActividadMapper = tipoActividadMapper;
            this.tipoParticipacionMapper = tipoParticipacionMapper;
            this.areaMapper = areaMapper;
            this.disciplinaMapper = disciplinaMapper;
            this.subdisciplinaMapper = subdisciplinaMapper;
            this.coautorExternoArticuloMapper = coautorExternoArticuloMapper;
            this.estadoProductoMapper = estadoProductoMapper;
            this.proyectoMapper = proyectoMapper;
            this.proyectoService = proyectoService;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var articulos = new Articulo[] {};

            if(User.IsInRole("Investigadores"))
                articulos = articuloService.GetAllArticulos(CurrentUser());
            if (User.IsInRole("DGAA"))
                articulos = articuloService.GetAllArticulos();

            data.List = articuloMapper.Map(articulos);

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
            ViewData["Pais"] = (from p in data.Form.Paises where p.Nombre == "México" select p.Id).FirstOrDefault();
            data.Form.PeriodoReferenciaPeriodo = CurrentPeriodo().Periodo;

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var articulo = articuloService.GetArticuloById(id);

            if (articulo == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (articulo.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var articuloForm = articuloMapper.Map(articulo);

            data.Form = SetupNewForm(articuloForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var articulo = articuloService.GetArticuloById(id);
            data.Form = articuloMapper.Map(articulo);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
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

            var articulo = articuloMapper.Map(form, CurrentUser(), CurrentPeriodo(),
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

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ArticuloForm form)
        {
            var articulo = articuloMapper.Map(form, CurrentUser(), CurrentPeriodo());

            if(!IsValidateModel(articulo, form, Title.Edit))
            {
                var articuloForm = articuloMapper.Map(articulo);

                ((GenericViewData<ArticuloForm>)ViewData.Model).Form = SetupNewForm(articuloForm);
                FormSetCombos(articuloForm);
                return ViewEdit();
            }

            articuloService.SaveArticulo(articulo);

            return RedirectToIndex(String.Format("Artículo {0} ha sido modificado", articulo.Titulo));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var articulo = articuloService.GetArticuloById(id);

            if (articulo.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            articulo.Activo = true;
            articulo.ModificadoPor = CurrentUser();
            articuloService.SaveArticulo(articulo);

            var form = articuloMapper.Map(articulo);

            return Rjs(form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var articulo = articuloService.GetArticuloById(id);

            if (articulo.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            articulo.Activo = false;
            articulo.ModificadoPor = CurrentUser();
            articuloService.SaveArticulo(articulo);

            var form = articuloMapper.Map(articulo);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeArea(int select)
        {
            var list = new List<DisciplinaForm> { new DisciplinaForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(disciplinaMapper.Map(catalogoService.GetDisciplinasByAreaId(select)));

            var form = new ArticuloForm
                           {
                               Disciplinas = list.ToArray(),
                               Subdisciplinas = new[] { new SubdisciplinaForm { Id = 0, Nombre = "Seleccione ..." } }
                           };

            return Rjs("ChangeArea", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeDisciplina(int select)
        {
            var list = new List<SubdisciplinaForm> { new SubdisciplinaForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(subdisciplinaMapper.Map(catalogoService.GetSubdisciplinasByDisciplinaId(select)));

            var form = new ArticuloForm
                           {
                               Subdisciplinas = list.ToArray()
                           };

            return Rjs("ChangeDisciplina", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Articulo>(x => x.Titulo, q);
            return Content(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewRevistaPublicacion(int id)
        {
            var articulo = articuloService.GetArticuloById(id);

            var form = new ArticuloForm
                           {
                               RevistaPublicacion = new RevistaPublicacionForm()
                           };

            if (articulo != null)
                form.Id = articulo.Id;

            return Rjs("NewRevistaPublicacion", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddRevistaPublicacion([Bind(Prefix = "RevistaPublicacion")]RevistaPublicacionForm form, int articuloId)
        {
            var revistaPublicacion = revistaPublicacionMapper.Map(form);

            ModelState.AddModelErrors(revistaPublicacion.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            revistaPublicacion.Activo = true;
            revistaPublicacion.CreadorPor = CurrentUser();
            revistaPublicacion.ModificadoPor = CurrentUser();

            catalogoService.SaveRevistaPublicacion(revistaPublicacion);

            var revistaPublicacionForm = revistaPublicacionMapper.Map(revistaPublicacion);

            return Rjs("AddRevistaPublicacion", revistaPublicacionForm);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorInterno(int id)
        {
            var articulo = articuloService.GetArticuloById(id);
            var form = new ArticuloForm();

            if (articulo != null)
                form.Id = articulo.Id;

            form.CoautorInternoArticulo = new CoautorInternoArticuloForm();
            form.CoautoresInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores(CurrentUser()));

            return Rjs("NewCoautorInterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
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

        [Authorize(Roles = "Investigadores")]
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

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
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
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            form.Indices1 = indiceMapper.Map(catalogoService.GetActiveIndices());
            form.Indices2 = indiceMapper.Map(catalogoService.GetActiveIndices());
            form.Indices3 = indiceMapper.Map(catalogoService.GetActiveIndices());
            form.CoautoresExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());
            form.CoautoresInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());
            form.LineasInvestigaciones = lineaInvestigacionMapper.Map(catalogoService.GetActiveLineaInvestigaciones());
            form.TiposActividades = tipoActividadMapper.Map(catalogoService.GetActiveActividades());
            form.TiposParticipantes = tipoParticipacionMapper.Map(catalogoService.GetActiveTipoParticipaciones());
            form.Proyectos = proyectoMapper.Map(proyectoService.GetActiveProyectos());

            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = disciplinaMapper.Map(catalogoService.GetDisciplinasByAreaId(form.AreaId));
            form.Subdisciplinas = subdisciplinaMapper.Map(catalogoService.GetSubdisciplinasByDisciplinaId(form.DisciplinaId));

            return form;
        }

        private void FormSetCombos(ArticuloForm form)
        {
            ViewData["TipoArticulo"] = form.TipoArticuloId;
            ViewData["Idioma"] = form.IdiomaId;
            ViewData["EstadoProducto"] = form.EstadoProductoId;
            ViewData["Proyecto"] = form.ProyectoId;

            ViewData["Pais"] = form.PaisId;
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