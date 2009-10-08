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
        readonly IAreaMapper areaMapper;
        readonly IArticuloMapper articuloMapper;
        readonly IArticuloService articuloService;
        readonly ICatalogoService catalogoService;
        readonly ICoautorExternoArticuloMapper coautorExternoArticuloMapper;
        readonly ICoautorInternoArticuloMapper coautorInternoArticuloMapper;
        readonly IDisciplinaMapper disciplinaMapper;
        readonly IEstadoProductoMapper estadoProductoMapper;
        readonly IIdiomaMapper idiomaMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly IInvestigadorMapper investigadorMapper;
        readonly IInvestigadorService investigadorService;
        readonly ILineaInvestigacionMapper lineaInvestigacionMapper;
        readonly IPaisMapper paisMapper;
        readonly ISubdisciplinaMapper subdisciplinaMapper;
        readonly ITipoActividadMapper tipoActividadMapper;
        readonly ITipoArchivoMapper tipoArchivoMapper;
        readonly ITipoArticuloMapper tipoArticuloMapper;
        readonly ITipoParticipacionMapper tipoParticipacionMapper;
        readonly IRevistaPublicacionMapper revistaPublicacionMapper;
        readonly IProyectoService proyectoService;
        readonly IProyectoMapper proyectoMapper;

        public ArticuloController(IArticuloService articuloService, IInvestigadorService investigadorService,
                                  IArticuloMapper articuloMapper, ICatalogoService catalogoService,
                                  IUsuarioService usuarioService, ITipoArticuloMapper tipoArticuloMapper,
                                  IIdiomaMapper idiomaMapper, IPaisMapper paisMapper,
                                  ILineaInvestigacionMapper lineaInvestigacionMapper,
                                  ITipoActividadMapper tipoActividadMapper,
                                  ITipoParticipacionMapper tipoParticipacionMapper, IAreaMapper areaMapper,
                                  IDisciplinaMapper disciplinaMapper, ISubdisciplinaMapper subdisciplinaMapper,
                                  IInvestigadorExternoMapper investigadorExternoMapper,
                                  IInvestigadorMapper investigadorMapper,
                                  ICoautorExternoArticuloMapper coautorExternoArticuloMapper,
                                  ICoautorInternoArticuloMapper coautorInternoArticuloMapper,
                                  IEstadoProductoMapper estadoProductoMapper, ISearchService searchService,
                                  ITipoArchivoMapper tipoArchivoMapper, IRevistaPublicacionMapper revistaPublicacionMapper,
                                  IProyectoService proyectoService, IProyectoMapper proyectoMapper)
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
            this.lineaInvestigacionMapper = lineaInvestigacionMapper;
            this.tipoActividadMapper = tipoActividadMapper;
            this.tipoParticipacionMapper = tipoParticipacionMapper;
            this.areaMapper = areaMapper;
            this.disciplinaMapper = disciplinaMapper;
            this.subdisciplinaMapper = subdisciplinaMapper;
            this.coautorExternoArticuloMapper = coautorExternoArticuloMapper;
            this.estadoProductoMapper = estadoProductoMapper;
            this.tipoArchivoMapper = tipoArchivoMapper;
            this.revistaPublicacionMapper = revistaPublicacionMapper;
            this.proyectoService = proyectoService;
            this.proyectoMapper = proyectoMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var articulos = new Articulo[] {};

            if (User.IsInRole("Investigadores"))
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
            ViewData["Idioma"] = (from p in data.Form.Idiomas where p.Nombre == "Español" select p.Id).FirstOrDefault();
            data.Form.PeriodoReferenciaPeriodo = CurrentPeriodo().Periodo;
            data.Form.PosicionAutor = 1;

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
        public ActionResult Create([Bind(Prefix = "CoautorInterno")] CoautorInternoProductoForm[] coautorInterno,
            [Bind(Prefix = "CoautorExterno")] CoautorExternoProductoForm[] coautorExterno,
                                   ArticuloForm form)
        {
            coautorExterno = coautorExterno ?? new CoautorExternoProductoForm[] {};
            coautorInterno = coautorInterno ?? new CoautorInternoProductoForm[] {};

            var articulo = articuloMapper.Map(form, CurrentUser(), CurrentPeriodo(), CurrentInvestigador(),
                                              coautorExterno, coautorInterno);

            if (!IsValidateModel(articulo, form, Title.New, "Articulo"))
            {
                var articuloForm = articuloMapper.Map(articulo);

                ((GenericViewData<ArticuloForm>) ViewData.Model).Form = SetupNewForm(articuloForm);
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
            var articulo = articuloMapper.Map(form, CurrentUser(), CurrentPeriodo(), CurrentInvestigador());

            if (!IsValidateModel(articulo, form, Title.Edit))
            {
                var articuloForm = articuloMapper.Map(articulo);

                ((GenericViewData<ArticuloForm>) ViewData.Model).Form = SetupNewForm(articuloForm);
                FormSetCombos(articuloForm);
                return ViewEdit();
            }

            articuloService.SaveArticulo(articulo);

            return RedirectToIndex(String.Format("Artículo {0} ha sido modificado", articulo.Titulo));
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeRevista(int select)
        {
            var articuloForm = new ArticuloForm();
            var revistaPublicacionForm = revistaPublicacionMapper.Map(catalogoService.GetRevistaPublicacionById(select));

            articuloForm.RevistaPublicacionIndice1Nombre = revistaPublicacionForm.Indice1Nombre;
            articuloForm.RevistaPublicacionIndice2Nombre = revistaPublicacionForm.Indice2Nombre;
            articuloForm.RevistaPublicacionIndice3Nombre = revistaPublicacionForm.Indice3Nombre;
            articuloForm.RevistaPublicacionId = revistaPublicacionForm.Id;

            return Rjs("ChangeRevista", articuloForm);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeProyecto(int select)
        {
            var articuloForm = new ArticuloForm();
            var proyectoForm = proyectoMapper.Map(proyectoService.GetProyectoById(select));

            articuloForm.ProyectoLineaTematicaNombre = proyectoForm.LineaTematicaNombre;
            articuloForm.ProyectoAreaTematicaNombre = proyectoForm.AreaTematicaNombre;
            articuloForm.ProyectoId = proyectoForm.Id;

            return Rjs("ChangeProyecto", articuloForm);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeArea(int select)
        {
            var list = new List<DisciplinaForm> {new DisciplinaForm {Id = 0, Nombre = "Seleccione ..."}};

            list.AddRange(disciplinaMapper.Map(catalogoService.GetDisciplinasByAreaId(select)));

            var form = new ArticuloForm
                           {
                               Disciplinas = list.ToArray(),
                               Subdisciplinas = new[] {new SubdisciplinaForm {Id = 0, Nombre = "Seleccione ..."}}
                           };

            return Rjs("ChangeArea", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeDisciplina(int select)
        {
            var list = new List<SubdisciplinaForm> {new SubdisciplinaForm {Id = 0, Nombre = "Seleccione ..."}};

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
        public ActionResult NewCoautorInterno(int id)
        {
            var articulo = articuloService.GetArticuloById(id);
            var form = new CoautorForm {Controller = "Articulo", IdName = "ArticuloId"};

            if (articulo != null)
                form.Id = articulo.Id;

            return Rjs("NewCoautorInterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorInterno([Bind(Prefix = "CoautorInterno")] CoautorInternoProductoForm form,
                                              int articuloId)
        {
            var coautorInternoArticulo = coautorInternoArticuloMapper.Map(form);

            ModelState.AddModelErrors(coautorInternoArticulo.ValidationResults(), false, "CoautorInterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (articuloId != 0)
            {
                coautorInternoArticulo.CreadorPor = CurrentUser();
                coautorInternoArticulo.ModificadoPor = CurrentUser();

                var articulo = articuloService.GetArticuloById(articuloId);
                var alreadyHasIt =
                    articulo.CoautorInternoArticulos.Where(
                        x => x.Investigador.Id == coautorInternoArticulo.Investigador.Id).Count();

                if (alreadyHasIt == 0)
                {
                    articulo.AddCoautorInterno(coautorInternoArticulo);
                    articuloService.SaveArticulo(articulo);
                }
            }

            var coautorInternoArticuloForm = coautorInternoArticuloMapper.Map(coautorInternoArticulo);
            coautorInternoArticuloForm.ParentId = articuloId;

            return Rjs("AddCoautorInterno", coautorInternoArticuloForm);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteCoautorInterno(int id, int investigadorId)
        {
            var articulo = articuloService.GetArticuloById(id);

            if (articulo != null)
            {
                var coautor = articulo.CoautorInternoArticulos.Where(x => x.Investigador.Id == investigadorId).First();
                articulo.DeleteCoautorInterno(coautor);

                articuloService.SaveArticulo(articulo);
            }

            return Rjs("DeleteCoautorInterno", investigadorId);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id)
        {
            var articulo = articuloService.GetArticuloById(id);
            var form = new CoautorForm { Controller = "Articulo", IdName = "ArticuloId" };

            if (articulo != null)
                form.Id = articulo.Id;

            return Rjs("NewCoautorExterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorExterno([Bind(Prefix = "CoautorExterno")] CoautorExternoProductoForm form,
                                              int articuloId)
        {
            var coautorExternoArticulo = coautorExternoArticuloMapper.Map(form);

            ModelState.AddModelErrors(coautorExternoArticulo.ValidationResults(), false, "CoautorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (articuloId != 0)
            {
                coautorExternoArticulo.CreadorPor = CurrentUser();
                coautorExternoArticulo.ModificadoPor = CurrentUser();

                var articulo = articuloService.GetArticuloById(articuloId);

                var alreadyHasIt =
                    articulo.CoautorExternoArticulos.Where(
                        x => x.InvestigadorExterno.Id == coautorExternoArticulo.InvestigadorExterno.Id).Count();

                if (alreadyHasIt == 0)
                {
                    articulo.AddCoautorExterno(coautorExternoArticulo);
                    articuloService.SaveArticulo(articulo);
                }
            }

            var coautorExternoArticuloForm = coautorExternoArticuloMapper.Map(coautorExternoArticulo);
            coautorExternoArticuloForm.ParentId = articuloId;

            return Rjs("AddCoautorExterno", coautorExternoArticuloForm);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteCoautorExterno(int id, int investigadorExternoId)
        {
            var articulo = articuloService.GetArticuloById(id);

            if (articulo != null)
            {
                var coautor = articulo.CoautorExternoArticulos.Where(x => x.InvestigadorExterno.Id == investigadorExternoId).First();
                articulo.DeleteCoautorExterno(coautor);

                articuloService.SaveArticulo(articulo);
            }

            return Rjs("DeleteCoautorExterno", investigadorExternoId);
        }

        ArticuloForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        ArticuloForm SetupNewForm(ArticuloForm form)
        {
            form = form ?? new ArticuloForm();

            form.ArchivoArticulo = new ArchivoForm
                                       {
                                           TipoArchivos = tipoArchivoMapper.Map(catalogoService.GetActiveTipoArchivos())
                                       };

            //Lista de Catalogos
            form.TiposArticulos = tipoArticuloMapper.Map(catalogoService.GetActiveArticulos());
            form.Idiomas = idiomaMapper.Map(catalogoService.GetActiveIdiomas());
            form.EstadosProductos = estadoProductoMapper.Map(catalogoService.GetActiveEstadoProductos());
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            form.LineasInvestigaciones = lineaInvestigacionMapper.Map(catalogoService.GetActiveLineaInvestigaciones());
            form.TiposActividades = tipoActividadMapper.Map(catalogoService.GetActiveActividades());
            form.TiposParticipantes = tipoParticipacionMapper.Map(catalogoService.GetActiveTipoParticipaciones());

            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = disciplinaMapper.Map(catalogoService.GetDisciplinasByAreaId(form.AreaId));
            form.Subdisciplinas =
                subdisciplinaMapper.Map(catalogoService.GetSubdisciplinasByDisciplinaId(form.DisciplinaId));

            return form;
        }

        void FormSetCombos(ArticuloForm form)
        {
            ViewData["TipoArticulo"] = form.TipoArticuloId;
            ViewData["Idioma"] = form.IdiomaId;
            ViewData["EstadoProducto"] = form.EstadoProductoId;

            ViewData["Pais"] = form.PaisId;

            ViewData["LineaInvestigacion"] = form.LineaInvestigacionId;
            ViewData["TipoActividad"] = form.TipoActividadId;
            ViewData["TipoParticipante"] = form.TipoParticipanteId;
            ViewData["Area"] = form.AreaId;
            ViewData["Disciplina"] = form.DisciplinaId;
            ViewData["Subdisciplina"] = form.SubdisciplinaId;
        }
    }
}