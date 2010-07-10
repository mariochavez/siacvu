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
    [HandleError]
    public class LibroController : BaseController<Libro, LibroForm>
    {
        readonly IAreaMapper areaMapper;
        readonly ICoautorExternoLibroMapper coautorExternoLibroMapper;
        readonly ICoautorInternoLibroMapper coautorInternoLibroMapper;
        readonly ICustomCollection customCollection;
        readonly IEditorialProductoMapper<EditorialLibro> editorialLibroMapper;
        readonly IEventoMapper eventoMapper;
        readonly IEventoService eventoService;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly IInvestigadorService investigadorService;
        readonly ILibroMapper libroMapper;
        readonly ILibroService libroService;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IProductoService productoService;
        readonly IRevistaPublicacionMapper revistaPublicacionMapper;
        readonly IIdiomaMapper idiomaMapper;

        public LibroController(ILibroService libroService,
                               IArchivoService archivoService,
                               ICustomCollection customCollection, ILibroMapper libroMapper,
                               ICatalogoService catalogoService,
                               IUsuarioService usuarioService,
                               ICoautorExternoLibroMapper coautorExternoLibroMapper,
                               ICoautorInternoLibroMapper coautorInternoLibroMapper,
                               ISearchService searchService,
                               IRevistaPublicacionMapper revistaPublicacionMapper,
                               IEventoMapper eventoMapper,
                               IEventoService eventoService,
                               IEditorialProductoMapper<EditorialLibro> editorialLibroMapper,
                               IAreaTematicaMapper areaTematicaMapper,
                               ILineaTematicaMapper lineaTematicaMapper,
                               IAreaMapper areaMapper,
                               IDisciplinaMapper disciplinaMapper,
                               IPaisMapper paisMapper,
                               ISubdisciplinaMapper subdisciplinaMapper,
                               IInvestigadorExternoMapper investigadorExternoMapper,
                               IInvestigadorService investigadorService,
                               IProductoService productoService,
                               IIdiomaMapper idiomaMapper)
            : base(usuarioService, searchService, catalogoService, disciplinaMapper, subdisciplinaMapper)
        {
            base.catalogoService = catalogoService;
            base.paisMapper = paisMapper;

            this.editorialLibroMapper = editorialLibroMapper;
            this.revistaPublicacionMapper = revistaPublicacionMapper;
            this.customCollection = customCollection;
            this.libroService = libroService;
            this.libroMapper = libroMapper;
            this.coautorExternoLibroMapper = coautorExternoLibroMapper;
            this.coautorInternoLibroMapper = coautorInternoLibroMapper;
            this.eventoMapper = eventoMapper;
            this.eventoService = eventoService;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.areaMapper = areaMapper;
            this.investigadorExternoMapper = investigadorExternoMapper;
            this.areaTematicaMapper = areaTematicaMapper;
            this.investigadorService = investigadorService;
            this.productoService = productoService;
            this.idiomaMapper = idiomaMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<LibroForm>();
            var productos = productoService.GetProductosByUsuario<Libro>(CurrentUser(), x => x.Nombre,
                                                                         x => x.ContenidoLibro);

            data.ProductList = productos;

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            if (CurrentInvestigador() == null)
                return NoInvestigadorProfile("Por tal motivo no puede crear nuevos productos.");

            var data = new GenericViewData<LibroForm> {Form = SetupNewForm()};
            ViewData["Idioma"] = (from e in data.Form.Idiomas where e.Nombre == "Español" select e.Id).FirstOrDefault();

            ViewData["Edicion"] =
                (from e in data.Form.Ediciones where e.Nombre == "Primera edición" select e.Id).FirstOrDefault();

            return View(data);
        }

        [Authorize(Roles = "Investigadores, DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<LibroForm>();
            var libro = libroService.GetLibroById(id);

            var verifyMessage = VerifyProductoStatus(libro.Firma, libro.Nombre);
            if (!String.IsNullOrEmpty(verifyMessage))
                return RedirectToHomeIndex(verifyMessage);

            var verifyOwnershipMessage = VerifyProductoOwnership(CurrentUser().Investigador, libro.Usuario.Id,
                                                                 CurrentUser().Id);
            if (!String.IsNullOrEmpty(verifyOwnershipMessage))
                return RedirectToHomeIndex(verifyOwnershipMessage);

            CoautorInternoLibro coautorInternoLibro;
            int posicionAutor;
            var coautorExists = 0;

            if (User.IsInRole("Investigadores"))
            {
                coautorExists =
                    libro.CoautorInternoLibros.Where(
                        x => x.Investigador.Id == CurrentInvestigador().Id).Count();

                if (libro.Usuario.Id != CurrentUser().Id && coautorExists == 0)
                    return RedirectToHomeIndex("no lo puede modificar");
            }

            var libroForm = libroMapper.Map(libro);

            data.Form = SetupNewForm(libroForm);
            FormSetCombos(data.Form);

            if (coautorExists != 0)
            {
                coautorInternoLibro =
                    libro.CoautorInternoLibros.Where(x => x.Investigador.Id == CurrentInvestigador().Id).
                        FirstOrDefault();

                posicionAutor = coautorInternoLibro.Posicion;
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
            var data = new GenericViewData<LibroForm>();

            var libro = libroService.GetLibroById(id);
            var libroForm = libroMapper.Map(libro);

            data.Form = SetupShowForm(libroForm);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create([Bind(Prefix = "CoautorInterno")] CoautorInternoProductoForm[] coautorInterno,
                                   [Bind(Prefix = "CoautorExterno")] CoautorExternoProductoForm[] coautorExterno,
                                   [Bind(Prefix = "Editorial")] EditorialProductoForm[] editorial,
                                   LibroForm form)
        {
            coautorExterno = coautorExterno ?? new CoautorExternoProductoForm[] {};
            coautorInterno = coautorInterno ?? new CoautorInternoProductoForm[] {};
            editorial = editorial ?? new EditorialProductoForm[] {};

            var libro = libroMapper.Map(form, CurrentUser(), CurrentInvestigador(),
                                        coautorExterno, coautorInterno, editorial);

            ModelState.AddModelErrors(libro.ValidationResults(), true, "Libro");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            libroService.SaveLibro(libro);
            SetMessage(String.Format("Libro {0} ha sido creado", libro.Nombre));

            return Rjs("Save", libro.Id);
        }

        [Authorize]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(LibroForm form)
        {
            var libro = new Libro();

            if (User.IsInRole("Investigadores"))
                libro = libroMapper.Map(form, CurrentUser(), CurrentInvestigador());
            if (User.IsInRole("DGAA"))
                libro = libroMapper.Map(form, CurrentUser());

            ModelState.AddModelErrors(libro.ValidationResults(), true, "Libro");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            libroService.SaveLibro(libro, true);
            SetMessage(String.Format("Libro {0} ha sido modificado", libro.Nombre));

            return Rjs("Save", libro.Id);
        }

        [CookieLessAuthorize]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddFile(FormCollection form)
        {
            var id = Convert.ToInt32(form["Id"]);
            var libro = libroService.GetLibroById(id);

            var archivo = MapArchivo<ArchivoLibro>();
            libro.AddArchivo(archivo);

            libroService.SaveLibro(libro);

            return Content("Uploaded");
        }

        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DgaaValidateProduct(FirmaForm firmaForm)
        {
            var libro = libroService.GetLibroById(firmaForm.ProductoId);

            libro.Firma.Aceptacion2 = 1;
            libro.Firma.Usuario2 = CurrentUser();

            libroService.SaveLibro(libro);

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
            var libro = libroService.GetLibroById(firmaForm.ProductoId);
            libro.Firma.Aceptacion1 = 0;
            libro.Firma.Aceptacion2 = 2;
            libro.Firma.Descripcion = firmaForm.Descripcion;
            libro.Firma.Usuario1 = CurrentUser();
            libro.Firma.Usuario2 = CurrentUser();

            ModelState.AddModelErrors(libro.ValidationResults(), false, "Firma");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            libroService.SaveLibro(libro, true);

            var data = new FirmaForm
                           {
                               TipoProducto = firmaForm.TipoProducto,
                               Aceptacion2 = 2
                           };

            return Rjs("DgaaSign", data);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Libro>(x => x.Nombre, q);
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
        public ActionResult NewCoautorExterno(int id, bool esAlfabeticamente)
        {
            var libro = libroService.GetLibroById(id);
            var form = new CoautorForm
                           {
                               Controller = "Libro",
                               IdName = "LibroId",
                               InvestigadorExterno = new InvestigadorExternoForm(),
                               CoautorSeOrdenaAlfabeticamente = esAlfabeticamente
                           };

            if (libro != null)
                form.Id = libro.Id;

            return Rjs("NewCoautorExterno", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorExterno([Bind(Prefix = "CoautorExterno")] CoautorExternoProductoForm form,
                                              int libroId)
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
            var coautorExternoLibro = coautorExternoLibroMapper.Map(form);

            ModelState.AddModelErrors(coautorExternoLibro.ValidationResults(), false, "CoautorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (libroId != 0)
            {
                coautorExternoLibro.CreadoPor = CurrentUser();
                coautorExternoLibro.ModificadoPor = CurrentUser();

                var libro = libroService.GetLibroById(libroId);

                var alreadyHasIt =
                    libro.CoautorExternoLibros.Where(
                        x => x.InvestigadorExterno.Id == coautorExternoLibro.InvestigadorExterno.Id).Count();

                if (alreadyHasIt == 0)
                {
                    libro.AddCoautorExterno(coautorExternoLibro);
                    libroService.SaveLibro(libro);
                }
            }

            var coautorExternoLibroForm = coautorExternoLibroMapper.Map(coautorExternoLibro);
            coautorExternoLibroForm.ParentId = libroId;

            return Rjs("AddCoautorExterno", coautorExternoLibroForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteCoautorExterno(int id, int investigadorExternoId)
        {
            var libro = libroService.GetLibroById(id);

            if (libro != null)
            {
                var coautor =
                    libro.CoautorExternoLibros.Where(x => x.InvestigadorExterno.Id == investigadorExternoId).First();
                libro.DeleteCoautorExterno(coautor);

                libroService.SaveLibro(libro);
            }

            var form = new CoautorForm {ModelId = id, InvestigadorExternoId = investigadorExternoId};

            return Rjs("DeleteCoautorExterno", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorInterno(int id, bool esAlfabeticamente)
        {
            var libro = libroService.GetLibroById(id);
            var form = new CoautorForm
                           {
                               Controller = "Libro",
                               IdName = "LibroId",
                               CoautorSeOrdenaAlfabeticamente = esAlfabeticamente
                           };

            if (User.IsInRole("Investigadores"))
                form.CreadoPorId = CurrentInvestigador().Id;

            if (libro != null)
            {
                form.Id = libro.Id;
                var investigador = investigadorService.GetInvestigadorByUsuario(libro.CreadoPor.UsuarioNombre);
                form.CreadoPorId = investigador.Id;
            }

            return Rjs("NewCoautorInterno", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorInterno([Bind(Prefix = "CoautorInterno")] CoautorInternoProductoForm form,
                                              int libroId)
        {
            var coautorInternoLibro = coautorInternoLibroMapper.Map(form);

            ModelState.AddModelErrors(coautorInternoLibro.ValidationResults(), false, "CoautorInterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            coautorInternoLibro.CreadoPor = CurrentUser();
            coautorInternoLibro.ModificadoPor = CurrentUser();

            if (libroId != 0)
            {
                var libro = libroService.GetLibroById(libroId);

                var alreadyHasIt =
                    libro.CoautorInternoLibros.Where(
                        x => x.Investigador.Id == coautorInternoLibro.Investigador.Id).Count();

                if (alreadyHasIt == 0)
                {
                    libro.AddCoautorInterno(coautorInternoLibro);
                    libroService.SaveLibro(libro);
                }
            }

            var coautorInternoLibroForm = coautorInternoLibroMapper.Map(coautorInternoLibro);
            coautorInternoLibroForm.ParentId = libroId;

            return Rjs("AddCoautorInterno", coautorInternoLibroForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteCoautorInterno(int id, int investigadorId)
        {
            var libro = libroService.GetLibroById(id);

            if (libro != null)
            {
                var coautor = libro.CoautorInternoLibros.Where(x => x.Investigador.Id == investigadorId).First();
                libro.DeleteCoautorInterno(coautor);

                libroService.SaveLibro(libro);
            }

            var form = new CoautorForm {ModelId = id, InvestigadorId = investigadorId};


            return Rjs("DeleteCoautorInterno", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewEvento(int id)
        {
            var libro = libroService.GetLibroById(id);

            var form = new LibroForm
                           {
                               Evento = new EventoForm()
                           };

            if (libro != null)
                form.Id = libro.Id;

            return Rjs("NewEvento", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddEvento([Bind(Prefix = "Evento")] EventoForm form, int libroId)
        {
            var evento = eventoMapper.Map(form, CurrentUser(), CurrentInvestigador());

            ModelState.AddModelErrors(evento.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            evento.CreadoPor = CurrentUser();
            evento.ModificadoPor = CurrentUser();
            evento.Activo = true;

            eventoService.SaveEvento(evento, false);

            var eventoForm = eventoMapper.Map(evento);

            return Rjs("AddEvento", eventoForm);
        }

        protected override void DeleteEditorialInModel(Libro model, int editorialId)
        {
            if (model != null)
            {
                var editorial = model.EditorialLibros.Where(x => x.Id == editorialId).First();
                model.DeleteEditorial(editorial);

                libroService.SaveLibro(model);
            }
        }

        protected override bool SaveEditorialToModel(Libro model, EditorialProducto editorialProducto)
        {
            ModelState.AddModelErrors(model.ValidationResults(), true, "Libro");
            if (!ModelState.IsValid)
            {
                return false;
            }

            var editorialId = editorialProducto.Editorial != null ? editorialProducto.Editorial.Id : 0;

            var alreadyHasIt =
                model.EditorialLibros.Where(
                    x => ((x.Editorial != null && editorialId > 0 && x.Editorial.Id == editorialId) ||
                          (x.EditorialNombre == editorialProducto.EditorialNombre))
                         && x.Pais.Id == editorialProducto.Pais.Id).Count();

            if (alreadyHasIt == 0)
            {
                model.AddEditorial(editorialProducto);
                libroService.SaveLibro(model, true);
            }

            return alreadyHasIt == 0;
        }

        protected override EditorialProducto MapEditorialMessage(EditorialProductoForm form)
        {
            return editorialLibroMapper.Map(form);
        }

        protected override EditorialProductoForm MapEditorialModel(EditorialProducto model, int parentId)
        {
            var editorialLibroForm = editorialLibroMapper.Map(model as EditorialLibro);
            editorialLibroForm.ParentId = parentId;

            return editorialLibroForm;
        }

        protected override Libro GetModelById(int id)
        {
            return libroService.GetLibroById(id);
        }

        LibroForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        LibroForm SetupNewForm(LibroForm form)
        {
            form = form ?? new LibroForm();

            form.LineasTematicas = lineaTematicaMapper.Map(catalogoService.GetActiveLineaTematicas());

            form.Ediciones = customCollection.EdicionCustomCollection();
            form.TiposProductos = customCollection.TipoProductoCustomCollection(7);
            form.EstadosProductos = customCollection.EstadoProductoCustomCollection();
            form.FormatosPublicaciones = customCollection.FormatoPublicacionCustomCollection();
            form.ContenidosLibros = customCollection.ContenidoLibroCustomCollection();
            form.Reimpresiones = customCollection.ReimpresionCustomCollection();

            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = GetDisciplinasByAreaId(form.AreaId);
            form.Subdisciplinas = GetSubdisciplinasByDisciplinaId(form.DisciplinaId);
            form.Idiomas = idiomaMapper.Map(catalogoService.GetActiveIdiomas());

            if (form.Id == 0)
            {
                form.CoautorExternoLibros = new CoautorExternoProductoForm[] {};
                form.CoautorInternoLibros = new CoautorInternoProductoForm[] {};

                if (User.IsInRole("Investigadores"))
                {
                    form.UsuarioNombre = CurrentInvestigador().Usuario.Nombre;
                    form.UsuarioApellidoPaterno = CurrentInvestigador().Usuario.ApellidoPaterno;
                    form.UsuarioApellidoMaterno = CurrentInvestigador().Usuario.ApellidoMaterno;
                }
                form.PosicionCoautor = 1;
            }
            else
            {
                form.AreasTematicas =
                    areaTematicaMapper.Map(catalogoService.GetAreaTematicasByLineaTematicaId(form.LineaTematicaId));
            }

            return form;
        }

        void FormSetCombos(LibroForm form)
        {
            ViewData["TipoProducto"] = form.TipoProducto;
            ViewData["FormatoPublicacion"] = form.FormatoPublicacion;
            ViewData["Edicion"] = form.Edicion;
            ViewData["EstadoProducto"] = form.EstadoProducto;
            ViewData["ContenidoLibro"] = form.ContenidoLibro;
            ViewData["Reimpresion"] = form.Reimpresion;

            ViewData["AreaId"] = form.AreaId;
            ViewData["DisciplinaId"] = form.DisciplinaId;
            ViewData["SubdisciplinaId"] = form.SubdisciplinaId;

            ViewData["LineaTematicaId"] = form.LineaTematicaId;
            ViewData["AreaTematicaId"] = form.AreaTematicaId;

            ViewData["Idioma"] = form.IdiomaId;
        }

        static LibroForm SetupShowForm(LibroForm form)
        {
            form = form ?? new LibroForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      RevistaPublicacionTitulo = form.RevistaPublicacion.Titulo,
                                      RevistaPublicacionInstitucionNombre = form.RevistaPublicacion.InstitucionNombre,
                                      RevistaPublicacionIndice1Nombre = form.RevistaPublicacion.Indice1Nombre,
                                      RevistaPublicacionIndice2Nombre = form.RevistaPublicacion.Indice2Nombre,
                                      RevistaPublicacionIndice3Nombre = form.RevistaPublicacion.Indice3Nombre,
                                      ProyectoNombre = form.Proyecto.Nombre,
                                      SubdisciplinaNombre = form.SubdisciplinaNombre,
                                      DisciplinaNombre = form.DisciplinaNombre,
                                      AreaNombre = form.AreaNombre,
                                      EstadoProducto = form.EstadoProducto,
                                      FechaAceptacion = form.FechaAceptacion,
                                      FechaPublicacion = form.FechaPublicacion,
                                      ModelId = form.Id,
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