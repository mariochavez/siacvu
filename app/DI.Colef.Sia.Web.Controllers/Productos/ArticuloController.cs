using System;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos
{
    public class ArticuloController : BaseController<Articulo, ArticuloForm>
    {   
        readonly IArticuloMapper articuloMapper;
        readonly IArticuloService articuloService;
        readonly ICoautorExternoArticuloMapper coautorExternoArticuloMapper;
        readonly ICoautorInternoArticuloMapper coautorInternoArticuloMapper;
        readonly ITipoArchivoMapper tipoArchivoMapper;
        readonly IAreaTematicaMapper areaTematicaMapper;
        readonly ICustomCollection customCollection;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IAreaMapper areaMapper;
        readonly IRevistaPublicacionMapper revistaPublicacionMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;

        public ArticuloController(IArticuloService articuloService,
                                  IArticuloMapper articuloMapper,
                                  ICatalogoService catalogoService,
                                  IUsuarioService usuarioService,
                                  ICoautorExternoArticuloMapper coautorExternoArticuloMapper,
                                  ICoautorInternoArticuloMapper coautorInternoArticuloMapper,
                                  ISearchService searchService,
                                  ITipoArchivoMapper tipoArchivoMapper,
                                  IAreaTematicaMapper areaTematicaMapper,
                                  ICustomCollection customCollection,
                                  ILineaTematicaMapper lineaTematicaMapper,
                                  IAreaMapper areaMapper,
                                  IDisciplinaMapper disciplinaMapper,
                                  ISubdisciplinaMapper subdisciplinaMapper,
                                  IRevistaPublicacionMapper revistaPublicacionMapper,
                                  IInvestigadorExternoMapper investigadorExternoMapper
            ) : base(usuarioService, searchService, catalogoService, disciplinaMapper, subdisciplinaMapper)
        {
            this.coautorInternoArticuloMapper = coautorInternoArticuloMapper;
            this.articuloService = articuloService;
            this.articuloMapper = articuloMapper;
            this.coautorExternoArticuloMapper = coautorExternoArticuloMapper;
            this.tipoArchivoMapper = tipoArchivoMapper;
            this.areaTematicaMapper = areaTematicaMapper;
            this.customCollection = customCollection;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.areaMapper = areaMapper;
            this.revistaPublicacionMapper = revistaPublicacionMapper;
            this.investigadorExternoMapper = investigadorExternoMapper;
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
            if(CurrentInvestigador() == null)
                return NoInvestigadorProfile("Por tal motivo no puede crear nuevos productos.");
                
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
            data.Form.PosicionAutor = 1;

            return View(data);
        }

        [Authorize(Roles = "Investigadores, DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            CoautorInternoArticulo coautorInternoArticulo;
            int posicionAutor;
            var coautorExists = 0;
            var data = CreateViewDataWithTitle(Title.Edit);

            var articulo = articuloService.GetArticuloById(id);

            if (articulo.Firma.Aceptacion1 == 1 && articulo.Firma.Aceptacion2 == 0 && User.IsInRole("Investigadores"))
                return RedirectHomeToIndex(String.Format("El artículo {0} esta en firma y no puede ser editado", articulo.Titulo));
            if (User.IsInRole("DGAA"))
            {
                if ((articulo.Firma.Aceptacion1 == 1 && articulo.Firma.Aceptacion2 == 1) ||
                    (articulo.Firma.Aceptacion1 == 0 && articulo.Firma.Aceptacion2 == 0) ||
                    (articulo.Firma.Aceptacion1 == 0 && articulo.Firma.Aceptacion2 == 2)
                   )
                    return
                        RedirectHomeToIndex(String.Format(
                                                "El artículo {0} ya fue aceptado o no ha sido enviado a firma",
                                                articulo.Titulo));
            }

            if (User.IsInRole("Investigadores"))
            {
                coautorExists =
                    articulo.CoautorInternoArticulos.Where(
                        x => x.Investigador.Id == CurrentInvestigador().Id).Count();

                if (articulo.Usuario.Id != CurrentUser().Id && coautorExists == 0)
                    return RedirectToIndex("no lo puede modificar", false);
            }

            var articuloForm = articuloMapper.Map(articulo);

            data.Form = SetupNewForm(articuloForm);

            FormSetCombos(data.Form);

            if (coautorExists != 0)
            {
                coautorInternoArticulo =
                    articulo.CoautorInternoArticulos.Where(x => x.Investigador.Id == CurrentInvestigador().Id).
                        FirstOrDefault();

                posicionAutor = coautorInternoArticulo.Posicion;
            }
            else
                posicionAutor = data.Form.PosicionAutor;

            data.Form.PosicionAutor = posicionAutor;

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var articulo = articuloService.GetArticuloById(id);

            var articuloForm = articuloMapper.Map(articulo);

            data.Form = SetupShowForm(articuloForm);

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

            var articulo = articuloMapper.Map(form, CurrentUser(), CurrentInvestigador(),
                                              coautorExterno, coautorInterno);

            if (!IsValidateModel(articulo, form, Title.New, "Articulo"))
            {
                var articuloForm = articuloMapper.Map(articulo);

                ((GenericViewData<ArticuloForm>) ViewData.Model).Form = SetupNewForm(articuloForm);
                FormSetCombos(articuloForm);
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
            var articulo = articuloMapper.Map(form, CurrentUser(), CurrentInvestigador());

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
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Articulo>(x => x.Titulo, q);
            return Content(data);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeRevista(int select)
        {
            var revistaForm = revistaPublicacionMapper.Map(catalogoService.GetRevistaPublicacionById(select));

            var form = new ShowFieldsForm
                           {
                               RevistaPublicacionId = revistaForm.Id,

                               RevistaPublicacionInstitucionNombre = revistaForm.InstitucionNombre,
                               RevistaPublicacionPaisNombre = revistaForm.PaisNombre,
                               RevistaPublicacionIndice1Nombre = revistaForm.Indice1Nombre,
                               RevistaPublicacionIndice2Nombre = revistaForm.Indice2Nombre,
                               RevistaPublicacionIndice3Nombre = revistaForm.Indice3Nombre
                           };

            return Rjs("ChangeRevista", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeAreaTematica(int select)
        {
            var areaTematicaForm = areaTematicaMapper.Map(catalogoService.GetAreaTematicaById(select));
            var lineaTematicaForm = lineaTematicaMapper.Map(catalogoService.GetLineaTematicaById(areaTematicaForm.LineaTematicaId));

            var form = new ShowFieldsForm
                           {
                               AreaTematicaLineaTematicaNombre = lineaTematicaForm.Nombre,
                               AreaTematicaId = areaTematicaForm.Id
                           };

            return Rjs("ChangeAreaTematica", form);
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
                coautorInternoArticulo.CreadoPor = CurrentUser();
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

            var form = new CoautorForm { ModelId = id, InvestigadorId = investigadorId };

            return Rjs("DeleteCoautorInterno", form);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id)
        {
            var articulo = articuloService.GetArticuloById(id);
            var form = new CoautorForm { Controller = "Articulo", IdName = "ArticuloId", InvestigadorExterno = new InvestigadorExternoForm()};

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
            var investigadorExternoForm = new InvestigadorExternoForm
                                              {
                                                  Nombre = form.Nombre,
                                                  ApellidoPaterno = form.ApellidoPaterno,
                                                  ApellidoMaterno = form.ApellidoMaterno
                                              };

            var investigadorExterno = investigadorExternoMapper.Map(investigadorExternoForm);

            ModelState.AddModelErrors(investigadorExterno.ValidationResults(), false, "CoautorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            investigadorExterno.CreadoPor = CurrentUser();
            investigadorExterno.ModificadoPor = CurrentUser();

            catalogoService.SaveInvestigadorExterno(investigadorExterno);

            form.InvestigadorExternoId = investigadorExterno.Id;
            var coautorExternoArticulo = coautorExternoArticuloMapper.Map(form);

            ModelState.AddModelErrors(coautorExternoArticulo.ValidationResults(), false, "CoautorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (articuloId != 0)
            {
                coautorExternoArticulo.CreadoPor = CurrentUser();
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

            var form = new CoautorForm {ModelId = id, InvestigadorExternoId = investigadorExternoId};

            return Rjs("DeleteCoautorExterno", form);
        }

        ArticuloForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        ArticuloForm SetupNewForm(ArticuloForm form)
        {
            form = form ?? new ArticuloForm();

            form.TipoArchivos = tipoArchivoMapper.Map(catalogoService.GetActiveTipoArchivos());
            form.TiposArticulos = customCollection.TipoProductoCustomCollection(1);
            form.EstadosProductos = customCollection.EstadoProductoCustomCollection();

            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = GetDisciplinasByAreaId(form.AreaId);
            form.Subdisciplinas = GetSubdisciplinasByDisciplinaId(form.DisciplinaId);

            return form;
        }

        void FormSetCombos(ArticuloForm form)
        {
            ViewData["TipoArticulo"] = form.TipoArticulo;
            ViewData["EstadoProducto"] = form.EstadoProducto;

            ViewData["AreaId"] = form.AreaId;
            ViewData["DisciplinaId"] = form.DisciplinaId;
            ViewData["SubdisciplinaId"] = form.SubdisciplinaId;
        }

        private static ArticuloForm SetupShowForm(ArticuloForm form)
        {
            form = form ?? new ArticuloForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      RevistaPublicacionTitulo = form.RevistaPublicacion.Titulo,
                                      RevistaPublicacionInstitucionNombre = form.RevistaPublicacion.InstitucionNombre,
                                      RevistaPublicacionPaisNombre = form.RevistaPublicacion.PaisNombre,
                                      RevistaPublicacionIndice1Nombre = form.RevistaPublicacion.Indice1Nombre,
                                      RevistaPublicacionIndice2Nombre = form.RevistaPublicacion.Indice2Nombre,
                                      RevistaPublicacionIndice3Nombre = form.RevistaPublicacion.Indice3Nombre,

                                      SubdisciplinaNombre = form.SubdisciplinaNombre,
                                      DisciplinaNombre = form.DisciplinaNombre,
                                      AreaNombre = form.AreaNombre,

                                      ProyectoNombre = form.Proyecto.Nombre,

                                      AreaTematicaNombre = form.AreaTematica.Nombre,
                                      AreaTematicaLineaTematicaNombre = form.AreaTematica.LineaTematicaNombre,

                                      EstadoProducto = form.EstadoProducto,
                                      FechaAceptacion = form.FechaAceptacion,
                                      FechaPublicacion = form.FechaPublicacion,

                                      PalabraClave1 = form.PalabraClave1,
                                      PalabraClave2 = form.PalabraClave2,
                                      PalabraClave3 = form.PalabraClave3,

                                      IsShowForm = true,
                                      RevistaLabel = "Nombre de la revista"
                                  };

            return form;
        }
    }
}