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
    [HandleError]
    public class LibroController : BaseController<Libro, LibroForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ICoautorExternoLibroMapper coautorExternoLibroMapper;
        readonly ICoautorInternoLibroMapper coautorInternoLibroMapper;
        readonly IEventoMapper eventoMapper;
        readonly IEventoService eventoService;
        readonly IEditorialLibroMapper editorialLibroMapper;
        readonly ICustomCollection customCollection;
        readonly IAreaTematicaMapper areaTematicaMapper;
        readonly ILibroMapper libroMapper;
        readonly ILibroService libroService;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IRevistaPublicacionMapper revistaPublicacionMapper;
        readonly IAreaMapper areaMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;

        public LibroController(ILibroService libroService,
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
                               IInvestigadorExternoMapper investigadorExternoMapper)
            : base(usuarioService, searchService, catalogoService, disciplinaMapper, subdisciplinaMapper)
        {
            this.catalogoService = catalogoService;
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
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var libros = new Libro[] {};

            if (User.IsInRole("Investigadores"))
                libros = libroService.GetAllLibros(CurrentUser());
            if (User.IsInRole("DGAA"))
                libros = libroService.GetAllLibros();

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
            data.Form.PosicionAutor = 1;

            ViewData["Edicion"] = (from e in data.Form.Ediciones where e.Nombre == "Primera edición" select e.Id).FirstOrDefault();

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            CoautorInternoLibro coautorInternoLibro;
            int posicionAutor;
            var data = CreateViewDataWithTitle(Title.Edit);

            var libro = libroService.GetLibroById(id);

            if (libro == null)
                return RedirectToIndex("no ha sido encontrado", true);

            var coautorExists =
                libro.CoautorInternoLibros.Where(
                    x => x.Investigador.Id == CurrentInvestigador().Id).Count();

            if (libro.Usuario.Id != CurrentUser().Id && coautorExists == 0)
                return RedirectToIndex("no lo puede modificar", true);

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

            if (!IsValidateModel(libro, form, Title.New, "Libro"))
            {
                var libroForm = libroMapper.Map(libro);

                ((GenericViewData<LibroForm>) ViewData.Model).Form = SetupNewForm(libroForm);
                FormSetCombos(libroForm);
                return ViewNew();
            }

            libroService.SaveLibro(libro);

            return RedirectToIndex(String.Format("Libro {0} ha sido creado", libro.Nombre));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(LibroForm form)
        {
            var libro = libroMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(libro, form, Title.Edit))
            {
                var libroForm = libroMapper.Map(libro);

                ((GenericViewData<LibroForm>) ViewData.Model).Form = SetupNewForm(libroForm);
                FormSetCombos(libroForm);
                return ViewEdit();
            }

            libroService.SaveLibro(libro);

            return RedirectToIndex(String.Format("Libro {0} ha sido modificado", libro.Nombre));
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
            var lineaTematicaForm =
                lineaTematicaMapper.Map(catalogoService.GetLineaTematicaById(areaTematicaForm.LineaTematicaId));

            var form = new ShowFieldsForm
                           {
                               AreaTematicaLineaTematicaNombre = lineaTematicaForm.Nombre,
                               AreaTematicaId = areaTematicaForm.Id
                           };

            return Rjs("ChangeAreaTematica", form);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id)
        {
            var libro = libroService.GetLibroById(id);
            var form = new CoautorForm { Controller = "Libro", IdName = "LibroId", InvestigadorExterno = new InvestigadorExternoForm() };

            if (libro != null)
                form.Id = libro.Id;

            return Rjs("NewCoautorExterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorExterno([Bind(Prefix = "CoautorExterno")] CoautorExternoProductoForm form,
                                              int libroId)
        {
            var investigadorExternoForm = new InvestigadorExternoForm
                                              {
                                                  Nombre = form.InvestigadorExternoNombre,
                                                  ApellidoPaterno = form.InvestigadorExternoApellidoPaterno,
                                                  ApellidoMaterno = form.InvestigadorExternoApellidoMaterno
                                              };

            var investigadorExterno = investigadorExternoMapper.Map(investigadorExternoForm);

            ModelState.AddModelErrors(investigadorExterno.ValidationResults(), false, "CoautorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            investigadorExterno.CreadorPor = CurrentUser();
            investigadorExterno.ModificadoPor = CurrentUser();

            catalogoService.SaveInvestigadorExterno(investigadorExterno);

            investigadorExternoForm = investigadorExternoMapper.Map(investigadorExterno);

            form.InvestigadorExternoId = investigadorExternoForm.Id;
            var coautorExternoLibro = coautorExternoLibroMapper.Map(form);

            ModelState.AddModelErrors(coautorExternoLibro.ValidationResults(), false, "CoautorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (libroId != 0)
            {
                coautorExternoLibro.CreadorPor = CurrentUser();
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
        [Authorize(Roles = "Investigadores")]
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

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorInterno(int id)
        {
            var libro = libroService.GetLibroById(id);
            var form = new CoautorForm {Controller = "Libro", IdName = "LibroId"};

            if (libro != null)
                form.Id = libro.Id;

            return Rjs("NewCoautorInterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
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

            coautorInternoLibro.CreadorPor = CurrentUser();
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
        [Authorize(Roles = "Investigadores")]
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

        [Authorize(Roles = "Investigadores")]
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
        [Authorize(Roles = "Investigadores")]
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
                editorialLibro.CreadorPor = CurrentUser();
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
        [Authorize(Roles = "Investigadores")]
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

        [Authorize(Roles = "Investigadores")]
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
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddEvento([Bind(Prefix = "Evento")] EventoForm form, int libroId)
        {
            var evento = eventoMapper.Map(form, CurrentUser(), CurrentInvestigador());

            ModelState.AddModelErrors(evento.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            evento.CreadorPor = CurrentUser();
            evento.ModificadoPor = CurrentUser();
            evento.Activo = true;

            eventoService.SaveEvento(evento);

            var eventoForm = eventoMapper.Map(evento);

            return Rjs("AddEvento", eventoForm);
        }

        LibroForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        LibroForm SetupNewForm(LibroForm form)
        {
            form = form ?? new LibroForm();
            form.Ediciones = customCollection.EdicionCustomCollection();
            form.TiposProductos = customCollection.TipoProductoCustomCollection(3);
            form.EstadosProductos = customCollection.EstadoProductoCustomCollection();
            form.FormatosPublicaciones = customCollection.FormatoPublicacionCustomCollection();
            form.ContenidosLibros = customCollection.ContenidoLibroCustomCollection();
            form.Reimpresiones = customCollection.ReimpresionCustomCollection();

            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            var subdisciplina = subdisciplinaMapper.Map(catalogoService.GetSubdisciplinaById(form.SubdisciplinaId));
            form.Disciplinas = GetDisciplinas(subdisciplina.DisciplinaAreaId);
            form.Subdisciplinas = GetSubdisciplinas(subdisciplina.DisciplinaId);

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

            var subdisciplina = subdisciplinaMapper.Map(catalogoService.GetSubdisciplinaById(form.SubdisciplinaId));
            ViewData["AreaId"] = subdisciplina.DisciplinaAreaId;
            ViewData["DisciplinaId"] = subdisciplina.DisciplinaId;
            ViewData["SubdisciplinaId"] = form.SubdisciplinaId;
        }

        static LibroForm SetupShowForm(LibroForm form)
        {
            form = form ?? new LibroForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      RevistaPublicacionTitulo = form.RevistaPublicacion.Titulo,
                                      RevistaPublicacionInstitucionNombre = form.RevistaPublicacion.InstitucionNombre,
                                      RevistaPublicacionPaisNombre = form.RevistaPublicacion.PaisNombre,
                                      RevistaPublicacionIndice1Nombre = form.RevistaPublicacion.Indice1Nombre,
                                      RevistaPublicacionIndice2Nombre = form.RevistaPublicacion.Indice2Nombre,
                                      RevistaPublicacionIndice3Nombre = form.RevistaPublicacion.Indice3Nombre,
                                      AreaTematicaNombre = form.AreaTematica.Nombre,
                                      AreaTematicaLineaTematicaNombre = form.AreaTematica.LineaTematicaNombre,

                                      ProyectoNombre = form.Proyecto.Nombre,

                                      SubdisciplinaNombre = form.Subdisciplina.Nombre,
                                      SubdisciplinaDisciplinaNombre = form.Subdisciplina.DisciplinaNombre,
                                      SubdisciplinaDisciplinaAreaNombre = form.Subdisciplina.DisciplinaAreaNombre,

                                      IsShowForm = true,
                                      RevistaLabel = "Nombre de la revista"
                                  };

            return form;
        }
    }
}