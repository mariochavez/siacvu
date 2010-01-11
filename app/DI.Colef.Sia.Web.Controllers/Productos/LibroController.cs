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
        readonly ICatalogoService catalogoService;
        readonly ICoautorExternoLibroMapper coautorExternoLibroMapper;
        readonly ICoautorInternoLibroMapper coautorInternoLibroMapper;
        readonly IEventoMapper eventoMapper;
        readonly IEventoService eventoService;
        readonly IArchivoService archivoService;
        readonly IEditorialLibroMapper editorialLibroMapper;
        readonly ICustomCollection customCollection;
        readonly IAreaTematicaMapper areaTematicaMapper;
        readonly ILibroMapper libroMapper;
        readonly ILibroService libroService;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IRevistaPublicacionMapper revistaPublicacionMapper;
        readonly IAreaMapper areaMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly IInvestigadorService investigadorService;

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
                               IEditorialLibroMapper editorialLibroMapper,
                               ILineaTematicaMapper lineaTematicaMapper, 
                               IDisciplinaMapper disciplinaMapper,
                               ISubdisciplinaMapper subdisciplinaMapper, IAreaMapper areaMapper,
                               IInvestigadorExternoMapper investigadorExternoMapper, IAreaTematicaMapper areaTematicaMapper,
                               IInvestigadorService investigadorService)
            : base(usuarioService, searchService, catalogoService, disciplinaMapper, subdisciplinaMapper)
        {
            this.catalogoService = catalogoService;
            this.archivoService = archivoService;
            this.revistaPublicacionMapper = revistaPublicacionMapper;
            this.customCollection = customCollection;
            this.libroService = libroService;
            this.libroMapper = libroMapper;
            this.coautorExternoLibroMapper = coautorExternoLibroMapper;
            this.coautorInternoLibroMapper = coautorInternoLibroMapper;
            this.eventoMapper = eventoMapper;
            this.eventoService = eventoService;
            this.editorialLibroMapper = editorialLibroMapper;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.areaMapper = areaMapper;
            this.investigadorExternoMapper = investigadorExternoMapper;
            this.areaTematicaMapper = areaTematicaMapper;
            this.investigadorService = investigadorService;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var libros = libroService.GetAllLibros();

            data.List = libroMapper.Map(libros);
            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            if (CurrentInvestigador() == null)
                return NoInvestigadorProfile("Por tal motivo no puede crear nuevos productos.");

            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
            data.Form.PosicionCoautor = 1;

            ViewData["Edicion"] = (from e in data.Form.Ediciones where e.Nombre == "Primera edición" select e.Id).FirstOrDefault();

            return View(data);
        }

        [Authorize(Roles = "Investigadores, DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            CoautorInternoLibro coautorInternoLibro;
            int posicionAutor;
            var coautorExists = 0;
            var data = CreateViewDataWithTitle(Title.Edit);

            var libro = libroService.GetLibroById(id);

            if (libro.Firma.Aceptacion1 == 1 && libro.Firma.Aceptacion2 == 0 && User.IsInRole("Investigadores"))
                return RedirectToHomeIndex(String.Format("El libro {0} esta en firma y no puede ser editado", libro.Nombre));
            if (User.IsInRole("DGAA"))
            {
                if ((libro.Firma.Aceptacion1 == 1 && libro.Firma.Aceptacion2 == 1) ||
                    (libro.Firma.Aceptacion1 == 0 && libro.Firma.Aceptacion2 == 0) ||
                    (libro.Firma.Aceptacion1 == 0 && libro.Firma.Aceptacion2 == 2)
                   )
                    return
                        RedirectToHomeIndex(String.Format(
                                                "El libro {0} ya fue aceptado o no ha sido enviado a firma",
                                                libro.Nombre));
            }

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
            var data = CreateViewDataWithTitle(Title.Show);

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
            coautorExterno = coautorExterno ?? new CoautorExternoProductoForm[] { };
            coautorInterno = coautorInterno ?? new CoautorInternoProductoForm[] { };
            editorial = editorial ?? new EditorialProductoForm[] { };

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

            var file = Request.Files["fileData"];

            var archivo = new Archivo
                              {
                                  Activo = true,
                                  Contenido = file.ContentType,
                                  CreadoEl = DateTime.Now,
                                  CreadoPor = CurrentUser(),
                                  ModificadoEl = DateTime.Now,
                                  ModificadoPor = CurrentUser(),
                                  Nombre = file.FileName,
                                  Tamano = file.ContentLength
                              };

            var datos = new byte[file.ContentLength];
            file.InputStream.Read(datos, 0, datos.Length);
            archivo.Datos = datos;

            if (form["TipoArchivo"] == "Aceptado")
            {
                archivo.TipoProducto = libro.TipoProductoLibro;
                archivoService.Save(archivo);
                libro.ComprobanteAceptado = archivo;
            }
            else if (form["TipoArchivo"] == "ComprobanteLibro")
            {
                archivo.TipoProducto = libro.TipoProductoLibro;
                archivoService.Save(archivo);
                libro.ComprobanteLibro = archivo;
            }

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
        public ActionResult ChangeAreaTematica(int select)
        {
            var areaTematicaForm = areaTematicaMapper.Map(catalogoService.GetAreaTematicaById(select));
            var lineaTematicaForm =
                lineaTematicaMapper.Map(catalogoService.GetLineaTematicaById(areaTematicaForm.LineaTematicaId));

            var form = new ShowFieldsForm
                           {
                               AreaTematicaLineaTematicaNombre = lineaTematicaForm.Nombre,
                               AreaTematicaId = areaTematicaForm.Id
                           };

            return Rjs("ChangeAreaTematica", form);
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
        public ActionResult NewEditorial(int id)
        {
            var libro = libroService.GetLibroById(id);

            var form = new EditorialForm { Controller = "Libro", IdName = "LibroId" };

            if (libro != null)
                form.Id = libro.Id;

            return Rjs("NewEditorial", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddEditorial([Bind(Prefix = "Editorial")] EditorialProductoForm form, int libroId)
        {
            var editorialLibro = editorialLibroMapper.Map(form);

            ModelState.AddModelErrors(editorialLibro.ValidationResults(), false, "Editorial", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (libroId != 0)
            {
                editorialLibro.CreadoPor = CurrentUser();
                editorialLibro.ModificadoPor = CurrentUser();

                var libro = libroService.GetLibroById(libroId);
                var alreadyHasIt =
                    libro.EditorialLibros.Where(
                        x => x.Editorial.Id == editorialLibro.Editorial.Id).Count();

                if (alreadyHasIt == 0)
                {
                    libro.AddEditorial(editorialLibro);
                    libroService.SaveLibro(libro);
                }
            }

            var editorialLibroForm = editorialLibroMapper.Map(editorialLibro);
            editorialLibroForm.ParentId = libroId;

            return Rjs("AddEditorial", editorialLibroForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteEditorial(int id, int editorialId)
        {
            var libro = libroService.GetLibroById(id);

            if (libro != null)
            {
                var editorial = libro.EditorialLibros.Where(x => x.Editorial.Id == editorialId).First();
                libro.DeleteEditorial(editorial);

                libroService.SaveLibro(libro);
            }

            var form = new EditorialForm {EditorialId = editorialId};

            return Rjs("DeleteEditorial", form);
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

        private LibroForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        private LibroForm SetupNewForm(LibroForm form)
        {
            form = form ?? new LibroForm();
            var nombreInvestigador = String.Empty;

            if (form.Id == 0)
            {
                form.CoautorExternoLibros = new CoautorExternoProductoForm[] { };
                form.CoautorInternoLibros = new CoautorInternoProductoForm[] { };

                if (User.IsInRole("Investigadores"))
                    nombreInvestigador = String.Format("{0} {1} {2}", CurrentInvestigador().Usuario.Nombre,
                                                       CurrentInvestigador().Usuario.ApellidoPaterno,
                                                       CurrentInvestigador().Usuario.ApellidoMaterno);
            }
            else
                nombreInvestigador = String.Format("{0}", form.InvestigadorNombre);

            form.InvestigadorNombre = nombreInvestigador;

            form.Ediciones = customCollection.EdicionCustomCollection();
            form.TiposProductos = customCollection.TipoProductoCustomCollection(7);
            form.EstadosProductos = customCollection.EstadoProductoCustomCollection();
            form.FormatosPublicaciones = customCollection.FormatoPublicacionCustomCollection();
            form.ContenidosLibros = customCollection.ContenidoLibroCustomCollection();
            form.Reimpresiones = customCollection.ReimpresionCustomCollection();

            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = GetDisciplinasByAreaId(form.AreaId);
            form.Subdisciplinas = GetSubdisciplinasByDisciplinaId(form.DisciplinaId);

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
                                      AreaTematicaNombre = form.AreaTematica.Nombre,
                                      AreaTematicaLineaTematicaNombre = form.AreaTematica.LineaTematicaNombre,

                                      ProyectoNombre = form.Proyecto.Nombre,

                                      SubdisciplinaNombre = form.SubdisciplinaNombre,
                                      DisciplinaNombre = form.DisciplinaNombre,
                                      AreaNombre = form.AreaNombre,

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