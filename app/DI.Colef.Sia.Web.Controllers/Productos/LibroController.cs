using System;
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
    public class LibroController : BaseController<Libro, LibroForm>
    {
        readonly ILibroService libroService;
        readonly IInvestigadorService investigadorService;
        readonly ICatalogoService catalogoService;
        readonly ILibroMapper libroMapper;
        readonly ITipoPublicacionMapper tipoPublicacionMapper;
        readonly IEstadoProductoMapper estadoProductoMapper;
        readonly IPeriodoReferenciaMapper periodoReferenciaMapper;
        readonly IProyectoMapper proyectoMapper;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IPaisMapper paisMapper;
        readonly IIdiomaMapper idiomaMapper;
        readonly IFormaParticipacionMapper formaParticipacionMapper;
        readonly IInvestigadorMapper investigadorMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly ICoautorExternoLibroMapper coautorExternoLibroMapper;
        readonly ICoautorInternoLibroMapper coautorInternoLibroMapper;
        readonly IIdentificadorLibroMapper identificadorLibroMapper;
        readonly IAreaMapper areaMapper;
        readonly IDisciplinaMapper disciplinaMapper;
        readonly ISubdisciplinaMapper subdisciplinaMapper;

        public LibroController(ILibroService libroService, 
                               ILibroMapper libroMapper, 
                               ICatalogoService catalogoService,
                               IUsuarioService usuarioService,
                               ITipoPublicacionMapper tipoPublicacionMapper,
                               IEstadoProductoMapper estadoProductoMapper,
                               IPeriodoReferenciaMapper periodoReferenciaMapper,
                               IProyectoMapper proyectoMapper,
                               ILineaTematicaMapper lineaTematicaMapper,
                               IPaisMapper paisMapper,
                               IIdiomaMapper idiomaMapper,
                               IFormaParticipacionMapper formaParticipacionMapper,
                               ICoautorExternoLibroMapper coautorExternoLibroMapper,
                               ICoautorInternoLibroMapper coautorInternoLibroMapper,
                               IIdentificadorLibroMapper identificadorLibroMapper,
                               IAreaMapper areaMapper,
                               IInvestigadorMapper investigadorMapper,
                               IInvestigadorExternoMapper investigadorExternoMapper,
                               IDisciplinaMapper disciplinaMapper,
                               IInvestigadorService investigadorService,
                               ISubdisciplinaMapper subdisciplinaMapper,
                               ISearchService searchService
            )
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.libroService = libroService;
            this.libroMapper = libroMapper;
            this.tipoPublicacionMapper = tipoPublicacionMapper;
            this.estadoProductoMapper = estadoProductoMapper;
            this.periodoReferenciaMapper = periodoReferenciaMapper;
            this.proyectoMapper = proyectoMapper;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.paisMapper = paisMapper;
            this.idiomaMapper = idiomaMapper;
            this.formaParticipacionMapper = formaParticipacionMapper;
            this.investigadorMapper = investigadorMapper;
            this.coautorExternoLibroMapper = coautorExternoLibroMapper;
            this.investigadorExternoMapper = investigadorExternoMapper;
            this.investigadorService = investigadorService;
            this.coautorInternoLibroMapper = coautorInternoLibroMapper;
            this.identificadorLibroMapper = identificadorLibroMapper;
            this.areaMapper = areaMapper;
            this.disciplinaMapper = disciplinaMapper;
            this.subdisciplinaMapper = subdisciplinaMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);
			
            var libros = libroService.GetAllLibros();
            data.List = libroMapper.Map(libros);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
            data.Form.PeriodoReferenciaPeriodo = CurrentPeriodo().Periodo;

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {

            var data = CreateViewDataWithTitle(Title.Edit);

            var libro = libroService.GetLibroById(id);

            if (libro == null)
                return RedirectToIndex("no ha sido encontrado", true);

            if (libro.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);
                        
            var libroForm = libroMapper.Map(libro);

            data.Form = SetupNewForm(libroForm);

            FormSetCombos(data.Form);
            
            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var libro = libroService.GetLibroById(id);
            data.Form = libroMapper.Map(libro);
            
            ViewData.Model = data;
            return View();
        }
        
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(LibroForm form, 
                                   FormCollection formCollection)
        {
            var coautoresExternos = new string[] { };
            var coautoresInternos = new string[] { };

            if (formCollection["CoautorExternoLibro.InvestigadorExternoId_New"] != null &&
                    formCollection["CoautorExternoLibro.InvestigadorExternoId_New"].Split(',').Length > 0)
                coautoresExternos = formCollection["CoautorExternoLibro.InvestigadorExternoId_New"].Split(',');

            if (formCollection["CoautorInternoLibro.InvestigadorId_New"] != null &&
                    formCollection["CoautorInternoLibro.InvestigadorId_New"].Split(',').Length > 0)
                coautoresInternos = formCollection["CoautorInternoLibro.InvestigadorId_New"].Split(',');

            var libro = libroMapper.Map(form, CurrentUser(), CurrentPeriodo(),
                                        coautoresExternos, coautoresInternos);
            
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
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(LibroForm form)
        {
            var libro = libroMapper.Map(form, CurrentUser(), CurrentPeriodo());
            
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
        
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {            
            var libro = libroService.GetLibroById(id);

            if (libro.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            libro.Activo = true;
            libro.ModificadoPor = CurrentUser();
            libroService.SaveLibro(libro);

            var form = libroMapper.Map(libro);
            
            return Rjs(form);
        }
        
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var libro = libroService.GetLibroById(id);

            if (libro.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            libro.Activo = false;
            libro.ModificadoPor = CurrentUser();
            libroService.SaveLibro(libro);

            var form = libroMapper.Map(libro);
            
            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Libro>(x => x.Nombre, q);
            return Content(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id)
        {
            var libro = libroService.GetLibroById(id);
            var form = new LibroForm();

            if (libro != null)
                form.Id = libro.Id;

            form.CoautorExternoLibro = new CoautorExternoLibroForm();
            form.CoautoresExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());

            return Rjs("NewCoautorExterno", form);
        }

        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorExterno([Bind(Prefix = "CoautorExternoLibro")]CoautorExternoLibroForm form, int libroId)
        {
            var coautorExternoLibro = coautorExternoLibroMapper.Map(form);

            ModelState.AddModelErrors(coautorExternoLibro.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            coautorExternoLibro.CreadorPor = CurrentUser();
            coautorExternoLibro.ModificadoPor = CurrentUser();

            if (libroId != 0)
            {
                var libro = libroService.GetLibroById(libroId);
                libro.AddCoautorExterno(coautorExternoLibro);
                libroService.SaveLibro(libro);
            }

            var coautorExternoLibroForm = coautorExternoLibroMapper.Map(coautorExternoLibro);

            return Rjs("AddCoautorExterno", coautorExternoLibroForm);
        }
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorInterno(int id)
        {
            var libro = libroService.GetLibroById(id);
            var form = new LibroForm();

            if (libro != null)
                form.Id = libro.Id;

            form.CoautorInternoLibro = new CoautorInternoLibroForm();
            form.CoautoresInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());

            return Rjs("NewCoautorInterno", form);
        }

        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorInterno([Bind(Prefix = "CoautorInternoLibro")]CoautorInternoLibroForm form, int libroId)
        {
            var coautorInternoLibro = coautorInternoLibroMapper.Map(form);

            ModelState.AddModelErrors(coautorInternoLibro.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            coautorInternoLibro.CreadorPor = CurrentUser();
            coautorInternoLibro.ModificadoPor = CurrentUser();

            if (libroId != 0)
            {
                var libro = libroService.GetLibroById(libroId);
                libro.AddCoautorInterno(coautorInternoLibro);
                libroService.SaveLibro(libro);
            }

            var coautorInternoLibroForm = coautorInternoLibroMapper.Map(coautorInternoLibro);

            return Rjs("AddCoautorInterno", coautorInternoLibroForm);
        }
                
        LibroForm SetupNewForm()
        {
            return SetupNewForm(null);
        }
        
        LibroForm SetupNewForm(LibroForm form)
        {
            form = form ?? new LibroForm();
            
            form.CoautorExternoLibro = new CoautorExternoLibroForm();
            form.CoautorInternoLibro = new CoautorInternoLibroForm();

            form.TiposPublicaciones = tipoPublicacionMapper.Map(catalogoService.GetActiveTipoPublicacions());
            form.EstadosProductos = estadoProductoMapper.Map(catalogoService.GetActiveEstadoProductos());
            form.Proyectos = proyectoMapper.Map(catalogoService.GetActiveProyectos());
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            form.Idiomas = idiomaMapper.Map(catalogoService.GetActiveIdiomas());
            form.FormasParticipaciones = formaParticipacionMapper.Map(catalogoService.GetActiveFormaParticipaciones());
            form.CoautoresExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());
            form.CoautoresInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());
            form.IdentificadoresLibros = identificadorLibroMapper.Map(catalogoService.GetActiveIdentificadorLibros());
            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = disciplinaMapper.Map(catalogoService.GetActiveDisciplinas());
            form.Subdisciplinas = subdisciplinaMapper.Map(catalogoService.GetActiveSubdisciplinas());
			
            return form;
        }
        
        private void FormSetCombos(LibroForm form)
        {
            ViewData["TipoPublicacion"] = form.TipoPublicacionId;
            ViewData["EstadoProducto"] = form.EstadoProductoId;
            ViewData["Proyecto"] = form.ProyectoId;
            ViewData["Pais"] = form.PaisId;
            ViewData["Idioma"] = form.IdiomaId;
            ViewData["FormaParticipacion"] = form.FormaParticipacionId;
            ViewData["IdentificadorLibro"] = form.IdentificadorLibroId;
            ViewData["Area"] = form.AreaId;
            ViewData["Disciplina"] = form.DisciplinaId;
            ViewData["Subdisciplina"] = form.SubdisciplinaId;
        }
    }
}