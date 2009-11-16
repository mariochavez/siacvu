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
        readonly ILibroService libroService;
        readonly ICatalogoService catalogoService;
        readonly ILibroMapper libroMapper;
        readonly ITipoPublicacionMapper tipoPublicacionMapper;
        readonly IIdiomaMapper idiomaMapper;
        readonly ICoautorExternoLibroMapper coautorExternoLibroMapper;
        readonly ICoautorInternoLibroMapper coautorInternoLibroMapper;
        readonly IEventoMapper eventoMapper;
        readonly IEventoService eventoService;
        readonly IFormatoPublicacionMapper formatoPublicacionMapper;
        readonly IEditorialMapper editorialMapper;
        readonly IEditorialLibroMapper editorialLibroMapper;
        readonly ICustomCollection customCollection;
        readonly IAreaTematicaMapper areaTematicaMapper;

        public LibroController(ILibroService libroService, 
                               ICustomCollection customCollection,
                               ILibroMapper libroMapper,
                               ICatalogoService catalogoService,
                               IUsuarioService usuarioService,
                               IAreaTematicaMapper areaTematicaMapper,
                               ITipoPublicacionMapper tipoPublicacionMapper,
                               IIdiomaMapper idiomaMapper,
                               ICoautorExternoLibroMapper coautorExternoLibroMapper,
                               ICoautorInternoLibroMapper coautorInternoLibroMapper,
                               ISearchService searchService,
                               IEventoMapper eventoMapper,
                               IEventoService eventoService,
                               IFormatoPublicacionMapper formatoPublicacionMapper,
                               IEditorialMapper editorialMapper,
                               IEditorialLibroMapper editorialLibroMapper)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.areaTematicaMapper = areaTematicaMapper;
            this.customCollection = customCollection;
            this.libroService = libroService;
            this.libroMapper = libroMapper;
            this.tipoPublicacionMapper = tipoPublicacionMapper;
            this.idiomaMapper = idiomaMapper;
            this.coautorExternoLibroMapper = coautorExternoLibroMapper;
            this.coautorInternoLibroMapper = coautorInternoLibroMapper;
            this.eventoMapper = eventoMapper;
            this.eventoService = eventoService;
            this.formatoPublicacionMapper = formatoPublicacionMapper;
            this.editorialMapper = editorialMapper;
            this.editorialLibroMapper = editorialLibroMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var libros = new Libro[] { };

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
            ViewData["Idioma"] = (from p in data.Form.Idiomas where p.Nombre == "Español" select p.Id).FirstOrDefault();
            ViewData["Edicion"] = (from e in data.Form.Ediciones where e.Nombre == "Primera edición" select e.Id).FirstOrDefault();

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
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
                                   [Bind(Prefix = "EditorialLibro")] EditorialLibroForm[] editorial, 
                                   LibroForm form)
        {
            coautorExterno = coautorExterno ?? new CoautorExternoProductoForm[] { };
            coautorInterno = coautorInterno ?? new CoautorInternoProductoForm[] { };
            editorial = editorial ?? new EditorialLibroForm[] { };

            var libro = libroMapper.Map(form, CurrentUser(), CurrentInvestigador(),
                                        coautorExterno, coautorInterno, editorial);
            
            if (!IsValidateModel(libro, form, Title.New, "Libro"))
            {
                var libroForm = libroMapper.Map(libro);

                ((GenericViewData<LibroForm>)ViewData.Model).Form = SetupNewForm(libroForm);
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

                ((GenericViewData<LibroForm>)ViewData.Model).Form = SetupNewForm(libroForm);
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

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id)
        {
            var libro = libroService.GetLibroById(id);
            var form = new CoautorForm { Controller = "Libro", IdName = "LibroId" };

            if (libro != null)
                form.Id = libro.Id;

            return Rjs("NewCoautorExterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorExterno([Bind(Prefix = "CoautorExterno")]CoautorExternoProductoForm form, int libroId)
        {
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
                var coautor = libro.CoautorExternoLibros.Where(x => x.InvestigadorExterno.Id == investigadorExternoId).First();
                libro.DeleteCoautorExterno(coautor);

                libroService.SaveLibro(libro);
            }

            var form = new CoautorForm { ModelId = id, InvestigadorExternoId = investigadorExternoId };

            return Rjs("DeleteCoautorExterno", form);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorInterno(int id)
        {
            var libro = libroService.GetLibroById(id);
            var form = new CoautorForm { Controller = "Libro", IdName = "LibroId" };

            if (libro != null)
                form.Id = libro.Id;

            return Rjs("NewCoautorInterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorInterno([Bind(Prefix = "CoautorInterno")]CoautorInternoProductoForm form, int libroId)
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

            var form = new CoautorForm { ModelId = id, InvestigadorId = investigadorId };


            return Rjs("DeleteCoautorInterno", form);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewEditorial(int id)
        {
            var libro = libroService.GetLibroById(id);
            var form = new LibroForm();

            if (libro != null)
                form.Id = libro.Id;

            form.EditorialLibro = new EditorialLibroForm();
            form.Editoriales = editorialMapper.Map(catalogoService.GetActiveEditorials());

            return Rjs("NewEditorialLibro", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddEditorial([Bind(Prefix = "EditorialLibro")] EditorialLibroForm form,
                                              int libroId)
        {
            var editorialLibro = editorialLibroMapper.Map(form);

            ModelState.AddModelErrors(editorialLibro.ValidationResults(), true, String.Empty);
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

            return Rjs("AddEditorialLibro", editorialLibroForm);
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

            var form = new EditorialLibroForm {EditorialId = editorialId};

            return Rjs("DeleteEditorialLibro", form);
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
        public ActionResult AddEvento([Bind(Prefix = "Evento")]EventoForm form, int libroId)
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
            
            form.Volumenes = customCollection.VolumenCustomCollection();
            form.Ediciones = customCollection.EdicionCustomCollection();
            form.TiposProductos = customCollection.TipoProductoCustomCollection();
            form.EstadosProductos = customCollection.EstadoProductoCustomCollection();

            form.TiposPublicaciones = tipoPublicacionMapper.Map(catalogoService.GetActiveTipoPublicacions());
            form.FormatosPublicaciones = formatoPublicacionMapper.Map(catalogoService.GetActiveFormatoPublicacions());
            form.Idiomas = idiomaMapper.Map(catalogoService.GetActiveIdiomas());
            form.Editoriales = editorialMapper.Map(catalogoService.GetActiveEditorials());
            form.Reimpresiones = customCollection.ReimpresionCustomCollection();
            form.AreasTematicas = areaTematicaMapper.Map(catalogoService.GetActiveAreaTematicas());
			
            return form;
        }
        
        private void FormSetCombos(LibroForm form)
        {
            ViewData["TipoPublicacion"] = form.TipoPublicacionId;
            ViewData["TipoProducto"] = form.TipoProducto;
            ViewData["Volumen"] = form.Volumen;
            ViewData["FormatoPublicacion"] = form.FormatoPublicacionId;
            ViewData["Edicion"] = form.Edicion;
            ViewData["EstadoProducto"] = form.EstadoProducto;
            ViewData["Idioma"] = form.IdiomaId;
            ViewData["AreaTematicaId"] = form.AreaTematicaId;
            ViewData["Reimpresion"] = form.Reimpresion;
        }

        private LibroForm SetupShowForm(LibroForm form)
        {
            form = form ?? new LibroForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      RevistaPublicacionInstitucionNombre = form.NombreRevista.InstitucionNombre,
                                      RevistaPublicacionPaisNombre = form.NombreRevista.PaisNombre,

                                      ProyectoAreaTematicaLineaTematicaNombre = form.Proyecto.AreaTematicaLineaTematicaNombre,
                                      ProyectoAreaTematicaNombre = form.Proyecto.AreaTematicaNombre,
                                      ProyectoAreaTematicaSubdisciplinaDisciplinaAreaNombre = form.Proyecto.AreaTematicaSubdisciplinaDisciplinaAreaNombre,
                                      ProyectoAreaTematicaSubdisciplinaDisciplinaNombre = form.Proyecto.AreaTematicaSubdisciplinaDisciplinaNombre,
                                      ProyectoAreaTematicaSubdisciplinaNombre = form.Proyecto.AreaTematicaSubdisciplinaNombre,

                                      AreaTematicaNombre = form.AreaTematica.Nombre,
                                      AreaTematicaLineaTematicaNombre = form.AreaTematica.LineaTematicaNombre,
                                      AreaTematicaSubdisciplinaDisciplinaAreaNombre = form.AreaTematica.SubdisciplinaDisciplinaAreaNombre,
                                      AreaTematicaSubdisciplinaDisciplinaNombre = form.AreaTematica.SubdisciplinaDisciplinaNombre,
                                      AreaTematicaSubdisciplinaNombre = form.AreaTematica.SubdisciplinaNombre
                                  };

            return form;
        }
    }
}