using System;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Security;
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
        readonly ICustomCollection customCollection;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IAreaMapper areaMapper;
        readonly IRevistaPublicacionMapper revistaPublicacionMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly IArchivoService archivoService;
        readonly IInvestigadorService investigadorService;

        public ArticuloController(IArticuloService articuloService,
                                  IArticuloMapper articuloMapper,
                                  ICatalogoService catalogoService,
                                  IUsuarioService usuarioService,
                                  ICoautorExternoArticuloMapper coautorExternoArticuloMapper,
                                  ICoautorInternoArticuloMapper coautorInternoArticuloMapper,
                                  ISearchService searchService, ITipoArchivoMapper tipoArchivoMapper,
                                  IAreaTematicaMapper areaTematicaMapper, ICustomCollection customCollection,
                                  ILineaTematicaMapper lineaTematicaMapper, IAreaMapper areaMapper,
                                  IDisciplinaMapper disciplinaMapper, ISubdisciplinaMapper subdisciplinaMapper,
                                  IRevistaPublicacionMapper revistaPublicacionMapper,
                                  IInvestigadorExternoMapper investigadorExternoMapper,
                                  IArchivoService archivoService,
                                  IInvestigadorService investigadorService
            ) : base(usuarioService, searchService, catalogoService, null, null, disciplinaMapper, subdisciplinaMapper
            , null,null, null,null)
        {
            this.coautorInternoArticuloMapper = coautorInternoArticuloMapper;
            this.articuloService = articuloService;
            this.articuloMapper = articuloMapper;
            this.coautorExternoArticuloMapper = coautorExternoArticuloMapper;
            this.tipoArchivoMapper = tipoArchivoMapper;
            base.areaTematicaMapper = areaTematicaMapper;
            this.customCollection = customCollection;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.areaMapper = areaMapper;
            this.revistaPublicacionMapper = revistaPublicacionMapper;
            this.investigadorExternoMapper = investigadorExternoMapper;
            this.archivoService = archivoService;
            this.investigadorService = investigadorService;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<ArticuloForm>();
            var articulos = new Articulo[] { };

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
            if (CurrentInvestigador() == null)
                return NoInvestigadorProfile("Por tal motivo no puede crear nuevos productos.");

            var data = new GenericViewData<ArticuloForm> {Form = SetupNewForm()};

            return View(data);
        }

        [Authorize(Roles = "Investigadores, DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<ArticuloForm>();
            var articulo = articuloService.GetArticuloById(id);

            var verifyMessage = VerifyProductoStatus(articulo.Firma, articulo.Titulo);
            if (!String.IsNullOrEmpty(verifyMessage))
                return RedirectToHomeIndex(verifyMessage);

            CoautorInternoArticulo coautorInternoArticulo;
            int posicionAutor;
            var coautorExists = 0;

            if (User.IsInRole("Investigadores"))
            {
                coautorExists =
                    articulo.CoautorInternoArticulos.Where(
                        x => x.Investigador.Id == CurrentInvestigador().Id).Count();

                if (articulo.Usuario.Id != CurrentUser().Id && coautorExists == 0)
                    return RedirectToHomeIndex("no lo puede modificar");
            }

            var articuloForm = articuloMapper.Map(articulo);
            if(articulo.AreaTematica != null)
                articuloForm.LineaTematicaId = articulo.AreaTematica.LineaTematica.Id;

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
                posicionAutor = data.Form.PosicionCoautor;

            data.Form.PosicionCoautor = posicionAutor;

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = new GenericViewData<ArticuloForm>();

            var articulo = articuloService.GetArticuloById(id);
            var articuloForm = articuloMapper.Map(articulo);

            data.Form = SetupShowForm(articuloForm);

            ViewData.Model = data;
            return View();
        }

        [CookieLessAuthorize]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddFile(FormCollection form)
        {
            var id = Convert.ToInt32(form["Id"]);
            var articulo = articuloService.GetArticuloById(id);

            var archivo = MapArchivo();

            if (form["TipoArchivo"] == "Aceptado")
            {
                archivo.TipoProducto = articulo.TipoProducto;
                archivoService.Save(archivo);
                articulo.ComprobanteAceptado = archivo;
            }
            else if (form["TipoArchivo"] == "ComprobanteArticulo")
            {
                archivo.TipoProducto = articulo.TipoProducto;
                archivoService.Save(archivo);
                articulo.ComprobanteArticulo = archivo;
            }

            articuloService.SaveArticulo(articulo);

            return Content("Uploaded");
        }

        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DgaaValidateProduct(FirmaForm firmaForm)
        {
            var articulo = articuloService.GetArticuloById(firmaForm.ProductoId);

            articulo.Firma.Aceptacion2 = 1;
            articulo.Firma.Usuario2 = CurrentUser();

            articuloService.SaveArticulo(articulo);

            var data = new FirmaForm
                           {
                               TipoProducto = firmaForm.TipoProducto,
                               Aceptacion2 = 1
                           };

            return Rjs("DgaaSign", data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DgaaRejectProduct(FirmaForm firmaForm)
        {
            var articulo = articuloService.GetArticuloById(firmaForm.ProductoId);
            articulo.Firma.Aceptacion1 = 0;
            articulo.Firma.Aceptacion2 = 2;
            articulo.Firma.Descripcion = firmaForm.Descripcion;
            articulo.Firma.Usuario1 = CurrentUser();
            articulo.Firma.Usuario2 = CurrentUser();

            ModelState.AddModelErrors(articulo.ValidationResults(), false, "Firma");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            articuloService.SaveArticulo(articulo, true);

            var data = new FirmaForm
                           {
                               TipoProducto = firmaForm.TipoProducto,
                               Aceptacion2 = 2
                           };

            return Rjs("DgaaSign", data);
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

            ModelState.AddModelErrors(articulo.ValidationResults(), true, "Articulo");

            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            articuloService.SaveArticulo(articulo);
            SetMessage(String.Format("Artículo en revistas de investigación {0} ha sido creado", articulo.Titulo));

            return Rjs("Save", articulo.Id);
        }

        [Authorize]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ArticuloForm form)
        {
            var articulo = new Articulo();

            if (User.IsInRole("Investigadores"))
                articulo = articuloMapper.Map(form, CurrentUser(), CurrentInvestigador());
            if (User.IsInRole("DGAA"))
                articulo = articuloMapper.Map(form, CurrentUser());

            ModelState.AddModelErrors(articulo.ValidationResults(), true, "Articulo");

            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            articuloService.SaveArticulo(articulo, true);
            SetMessage(String.Format("Artículo en revistas de investigación {0} ha sido modificado", articulo.Titulo));

            return Rjs("Save", articulo.Id);
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
                               RevistaPublicacionIndice1Nombre = revistaForm.Indice1Nombre,
                               RevistaPublicacionIndice2Nombre = revistaForm.Indice2Nombre,
                               RevistaPublicacionIndice3Nombre = revistaForm.Indice3Nombre
                           };

            return Rjs("ChangeRevista", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorInterno(int id, bool esAlfabeticamente)
        {
            var articulo = articuloService.GetArticuloById(id);
            var form = new CoautorForm
                           {
                               Controller = "Articulo", 
                               IdName = "ArticuloId", 
                               CoautorSeOrdenaAlfabeticamente = esAlfabeticamente
                           };

            if (User.IsInRole("Investigadores"))
                form.CreadoPorId = CurrentInvestigador().Id;

            if (articulo != null)
            {
                form.Id = articulo.Id;
                var investigador = investigadorService.GetInvestigadorByUsuario(articulo.CreadoPor.UsuarioNombre);
                form.CreadoPorId = investigador.Id;
            }

            return Rjs("NewCoautorInterno", form);
        }

        [CustomTransaction]
        [Authorize]
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
        [Authorize]
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

            var form = new CoautorForm {ModelId = id, InvestigadorId = investigadorId};

            return Rjs("DeleteCoautorInterno", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id, bool esAlfabeticamente)
        {
            var articulo = articuloService.GetArticuloById(id);
            var form = new CoautorForm
                           {
                               Controller = "Articulo",
                               IdName = "ArticuloId",
                               InvestigadorExterno = new InvestigadorExternoForm(), 
                               CoautorSeOrdenaAlfabeticamente = esAlfabeticamente
                           };

            if (articulo != null)
                form.Id = articulo.Id;

            return Rjs("NewCoautorExterno", form);
        }

        [CustomTransaction]
        [Authorize]
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
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteCoautorExterno(int id, int investigadorExternoId)
        {
            var articulo = articuloService.GetArticuloById(id);

            if (articulo != null)
            {
                var coautor =
                    articulo.CoautorExternoArticulos.Where(x => x.InvestigadorExterno.Id == investigadorExternoId).First
                        ();
                articulo.DeleteCoautorExterno(coautor);

                articuloService.SaveArticulo(articulo);
            }

            var form = new CoautorForm {ModelId = id, InvestigadorExternoId = investigadorExternoId};

            return Rjs("DeleteCoautorExterno", form);
        }

        private ArticuloForm SetupNewForm()
       { 
            return SetupNewForm(null);
        }

        private ArticuloForm SetupNewForm(ArticuloForm form)
        {
            form = form ?? new ArticuloForm();

            form.LineasTematicas = lineaTematicaMapper.Map(catalogoService.GetActiveLineaTematicas());

            form.TipoArchivos = tipoArchivoMapper.Map(catalogoService.GetActiveTipoArchivos());
            form.TiposArticulos = customCollection.TipoProductoCustomCollection(1);
            form.EstadosProductos = customCollection.EstadoProductoCustomCollection();

            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = GetDisciplinasByAreaId(form.AreaId);
            form.Subdisciplinas = GetSubdisciplinasByDisciplinaId(form.DisciplinaId);

            if (form.Id == 0)
            {
                form.CoautorExternoArticulos = new CoautorExternoProductoForm[] { };
                form.CoautorInternoArticulos = new CoautorInternoProductoForm[] { };

                if (User.IsInRole("Investigadores"))
                {
                    form.UsuarioNombre = CurrentInvestigador().Usuario.Nombre;
                    form.UsuarioApellidoPaterno = CurrentInvestigador().Usuario.ApellidoPaterno;
                    form.UsuarioApellidoMaterno = CurrentInvestigador().Usuario.ApellidoMaterno;
                }

                form.PosicionCoautor = 1;
            } else
            {
                form.AreasTematicas =
                    areaTematicaMapper.Map(catalogoService.GetAreaTematicasByLineaTematicaId(form.LineaTematicaId));
            }

            return form;
        }

        private void FormSetCombos(ArticuloForm form)
        {
            ViewData["TipoArticulo"] = form.TipoArticulo;
            ViewData["EstadoProducto"] = form.EstadoProducto;

            ViewData["AreaId"] = form.AreaId;
            ViewData["DisciplinaId"] = form.DisciplinaId;
            ViewData["SubdisciplinaId"] = form.SubdisciplinaId;

            ViewData["LineaTematicaId"] = form.LineaTematicaId;
            ViewData["AreaTematicaId"] = form.AreaTematicaId;
        }

        private static ArticuloForm SetupShowForm(ArticuloForm form)
        {
            form = form ?? new ArticuloForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      RevistaPublicacionTitulo = form.RevistaPublicacion.Titulo,
                                      RevistaPublicacionInstitucionNombre = form.RevistaPublicacion.InstitucionNombre,
                                      RevistaPublicacionIndice1Nombre = form.RevistaPublicacion.Indice1Nombre,
                                      RevistaPublicacionIndice2Nombre = form.RevistaPublicacion.Indice2Nombre,
                                      RevistaPublicacionIndice3Nombre = form.RevistaPublicacion.Indice3Nombre,
                                      SubdisciplinaNombre = form.SubdisciplinaNombre,
                                      DisciplinaNombre = form.DisciplinaNombre,
                                      AreaNombre = form.AreaNombre,
                                      ProyectoNombre = form.Proyecto.Nombre,
                                      EstadoProducto = form.EstadoProducto,
                                      FechaAceptacion = form.FechaAceptacion,
                                      FechaPublicacion = form.FechaPublicacion,
                                      ModelId = form.Id,
                                      ComprobanteAceptadoId = form.ComprobanteAceptadoId,
                                      ComprobanteAceptadoNombre = form.ComprobanteAceptadoNombre,
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