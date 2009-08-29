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
    public class MovilidadAcademicaController : BaseController<MovilidadAcademica, MovilidadAcademicaForm>
    {
        readonly IMovilidadAcademicaService movilidadAcademicaService;
        readonly IMovilidadAcademicaMapper movilidadAcademicaMapper;
        readonly ICatalogoService catalogoService;
        readonly ITipoEstanciaMapper tipoEstanciaMapper;
        readonly ITipoInstitucionMapper tipoInstitucionMapper;
        readonly IInstitucionMapper institucionMapper;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IConvenioMapper convenioMapper;
        readonly ITipoActividadMapper tipoActividadMapper;
        readonly ITipoActividadMovilidadAcademicaMapper tipoActividadMovilidadAcademicaMapper;
        readonly IProductoDerivadoMapper productoDerivadoMapper;
        readonly IProductoDerivadoMovilidadAcademicaMapper productoDerivadoMovilidadAcademicaMapper;
        readonly IProyectoMapper proyectoMapper;
        readonly IProyectoMovilidadAcademicaMapper proyectoMovilidadAcademicaMapper;


        public MovilidadAcademicaController(IMovilidadAcademicaService movilidadAcademicaService,
                                            IMovilidadAcademicaMapper movilidadAcademicaMapper,
                                            ICatalogoService catalogoService, IUsuarioService usuarioService, 
                                            ITipoEstanciaMapper tipoEstanciaMapper, 
                                            ITipoInstitucionMapper tipoInstitucionMapper, 
                                            IInstitucionMapper institucionMapper, 
                                            ILineaTematicaMapper lineaTematicaMapper, 
                                            IConvenioMapper convenioMapper, 
                                            ITipoActividadMapper tipoActividadMapper, 
                                            ITipoActividadMovilidadAcademicaMapper tipoActividadMovilidadAcademicaMapper, 
                                            IProductoDerivadoMapper productoDerivadoMapper, 
                                            IProductoDerivadoMovilidadAcademicaMapper productoDerivadoMovilidadAcademicaMapper, 
                                            IProyectoMapper proyectoMapper, 
                                            IProyectoMovilidadAcademicaMapper proyectoMovilidadAcademicaMapper,
                                            ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.movilidadAcademicaService = movilidadAcademicaService;
            this.movilidadAcademicaMapper = movilidadAcademicaMapper;
            this.tipoEstanciaMapper = tipoEstanciaMapper;
            this.tipoInstitucionMapper = tipoInstitucionMapper;
            this.institucionMapper = institucionMapper;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.convenioMapper = convenioMapper;
            this.tipoActividadMapper = tipoActividadMapper;
            this.tipoActividadMovilidadAcademicaMapper = tipoActividadMovilidadAcademicaMapper;
            this.productoDerivadoMapper = productoDerivadoMapper;
            this.productoDerivadoMovilidadAcademicaMapper = productoDerivadoMovilidadAcademicaMapper;
            this.proyectoMapper = proyectoMapper;
            this.proyectoMovilidadAcademicaMapper = proyectoMovilidadAcademicaMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var movilidadAcademicas = movilidadAcademicaService.GetAllMovilidadAcademicas();
            data.List = movilidadAcademicaMapper.Map(movilidadAcademicas);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var movilidadAcademica = movilidadAcademicaService.GetMovilidadAcademicaById(id);

            if (movilidadAcademica == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (movilidadAcademica.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var movilidadAcademicaForm = movilidadAcademicaMapper.Map(movilidadAcademica);

            data.Form = SetupNewForm(movilidadAcademicaForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var movilidadAcademica = movilidadAcademicaService.GetMovilidadAcademicaById(id);
            data.Form = movilidadAcademicaMapper.Map(movilidadAcademica);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(MovilidadAcademicaForm form,
                                   FormCollection formCollection)
        {
            var tiposActividad = new string[] { };
            var proyectos = new string[] { };
            var productoDerivados = new string[] { };

            if (formCollection["TipoActividadMovilidadAcademica.TipoActividadId_New"] != null &&
                    formCollection["TipoActividadMovilidadAcademica.TipoActividadId_New"].Split(',').Length > 0)
                tiposActividad = formCollection["TipoActividadMovilidadAcademica.TipoActividadId_New"].Split(',');

            if (formCollection["ProyectoMovilidadAcademica.ProyectoId_New"] != null &&
                    formCollection["ProyectoMovilidadAcademica.ProyectoId_New"].Split(',').Length > 0)
                proyectos = formCollection["ProyectoMovilidadAcademica.ProyectoId_New"].Split(',');

            if (formCollection["ProductoDerivadoMovilidadAcademica.ProductoDerivadoId_New"] != null &&
                    formCollection["ProductoDerivadoMovilidadAcademica.ProductoDerivadoId_New"].Split(',').Length > 0)
                productoDerivados = formCollection["ProductoDerivadoMovilidadAcademica.ProductoDerivadoId_New"].Split(',');
            
            var movilidadAcademica = movilidadAcademicaMapper.Map(form, CurrentUser(),
                tiposActividad, proyectos, productoDerivados);

            if (!IsValidateModel(movilidadAcademica, form, Title.New, "MovilidadAcademica"))
            {
                var movilidadAcademicaForm = movilidadAcademicaMapper.Map(movilidadAcademica);

                ((GenericViewData<MovilidadAcademicaForm>)ViewData.Model).Form = SetupNewForm(movilidadAcademicaForm);
                return ViewNew();
            }

            movilidadAcademicaService.SaveMovilidadAcademica(movilidadAcademica);

            return RedirectToIndex(String.Format("Movilidad Académica {0} ha sido creada", movilidadAcademica.Institucion.Nombre));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(MovilidadAcademicaForm form)
        {
            var movilidadAcademica = movilidadAcademicaMapper.Map(form, CurrentUser());

            if (!IsValidateModel(movilidadAcademica, form, Title.Edit))
            {
                var movilidadAcademicaForm = movilidadAcademicaMapper.Map(movilidadAcademica);

                ((GenericViewData<MovilidadAcademicaForm>)ViewData.Model).Form = SetupNewForm(movilidadAcademicaForm);
                FormSetCombos(movilidadAcademicaForm);
                return ViewEdit();
            }

            movilidadAcademicaService.SaveMovilidadAcademica(movilidadAcademica);

            return RedirectToIndex(String.Format("Movilidad Académica {0} ha sido modificada", movilidadAcademica.LineaTematica.Nombre));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var movilidadAcademica = movilidadAcademicaService.GetMovilidadAcademicaById(id);

            if (movilidadAcademica.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            movilidadAcademica.Activo = true;
            movilidadAcademica.ModificadoPor = CurrentUser();
            movilidadAcademicaService.SaveMovilidadAcademica(movilidadAcademica);

            var form = movilidadAcademicaMapper.Map(movilidadAcademica);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var movilidadAcademica = movilidadAcademicaService.GetMovilidadAcademicaById(id);

            if (movilidadAcademica.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            movilidadAcademica.Activo = false;
            movilidadAcademica.ModificadoPor = CurrentUser();
            movilidadAcademicaService.SaveMovilidadAcademica(movilidadAcademica);

            var form = movilidadAcademicaMapper.Map(movilidadAcademica);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.SearchMovilidadAcademica(q);
            return Content(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewTipoActividad(int id)
        {
            var movilidadAcademica = movilidadAcademicaService.GetMovilidadAcademicaById(id);
            var form = new MovilidadAcademicaForm();

            if (movilidadAcademica != null)
                form.Id = movilidadAcademica.Id;

            form.TipoActividadMovilidadAcademica = new TipoActividadMovilidadAcademicaForm();
            form.TiposActividades = tipoActividadMapper.Map(catalogoService.GetActiveActividades());

            return Rjs("NewTipoActividad", form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddTipoActividad([Bind(Prefix = "TipoActividadMovilidadAcademica")]TipoActividadMovilidadAcademicaForm form, int movilidadAcademicaId)
        {
            var tipoActividadMovilidadAcademica = tipoActividadMovilidadAcademicaMapper.Map(form);

            ModelState.AddModelErrors(tipoActividadMovilidadAcademica.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            tipoActividadMovilidadAcademica.CreadorPor = CurrentUser();
            tipoActividadMovilidadAcademica.ModificadoPor = CurrentUser();

            if (movilidadAcademicaId != 0)
            {
                var movilidadAcademica = movilidadAcademicaService.GetMovilidadAcademicaById(movilidadAcademicaId);
                movilidadAcademica.AddTipoActividad(tipoActividadMovilidadAcademica);
                movilidadAcademicaService.SaveMovilidadAcademica(movilidadAcademica);
            }

            var tipoActividadMovilidadAcademicaForm = tipoActividadMovilidadAcademicaMapper.Map(tipoActividadMovilidadAcademica);

            return Rjs("AddTipoActividad", tipoActividadMovilidadAcademicaForm);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewProductoDerivado(int id)
        {
            var movilidadAcademica = movilidadAcademicaService.GetMovilidadAcademicaById(id);
            var form = new MovilidadAcademicaForm();

            if (movilidadAcademica != null)
                form.Id = movilidadAcademica.Id;

            form.ProductoDerivadoMovilidadAcademica = new ProductoDerivadoMovilidadAcademicaForm();
            form.ProductosDerivados = productoDerivadoMapper.Map(catalogoService.GetActiveProductoDerivados());

            return Rjs("NewProductoDerivado", form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddProductoDerivado([Bind(Prefix = "ProductoDerivadoMovilidadAcademica")]ProductoDerivadoMovilidadAcademicaForm form, int movilidadAcademicaId)
        {
            var productoDerivadoMovilidadAcademica = productoDerivadoMovilidadAcademicaMapper.Map(form);

            ModelState.AddModelErrors(productoDerivadoMovilidadAcademica.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            productoDerivadoMovilidadAcademica.CreadorPor = CurrentUser();
            productoDerivadoMovilidadAcademica.ModificadoPor = CurrentUser();

            if (movilidadAcademicaId != 0)
            {
                var movilidadAcademica = movilidadAcademicaService.GetMovilidadAcademicaById(movilidadAcademicaId);
                movilidadAcademica.AddProductoDerivado(productoDerivadoMovilidadAcademica);
                movilidadAcademicaService.SaveMovilidadAcademica(movilidadAcademica);
            }

            var productoDerivadoMovilidadAcademicaForm = productoDerivadoMovilidadAcademicaMapper.Map(productoDerivadoMovilidadAcademica);

            return Rjs("AddProductoDerivado", productoDerivadoMovilidadAcademicaForm);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewProyecto(int id)
        {
            var movilidadAcademica = movilidadAcademicaService.GetMovilidadAcademicaById(id);
            var form = new MovilidadAcademicaForm();

            if (movilidadAcademica != null)
                form.Id = movilidadAcademica.Id;

            form.ProyectoMovilidadAcademica = new ProyectoMovilidadAcademicaForm();
            form.Proyectos = proyectoMapper.Map(catalogoService.GetActiveProyectos());

            return Rjs("NewProyecto", form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddProyecto([Bind(Prefix = "ProyectoMovilidadAcademica")]ProyectoMovilidadAcademicaForm form, int movilidadAcademicaId)
        {
            var proyectoMovilidadAcademica = proyectoMovilidadAcademicaMapper.Map(form);

            ModelState.AddModelErrors(proyectoMovilidadAcademica.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            proyectoMovilidadAcademica.CreadorPor = CurrentUser();
            proyectoMovilidadAcademica.ModificadoPor = CurrentUser();

            if (movilidadAcademicaId != 0)
            {
                var movilidadAcademica = movilidadAcademicaService.GetMovilidadAcademicaById(movilidadAcademicaId);
                movilidadAcademica.AddProyecto(proyectoMovilidadAcademica);
                movilidadAcademicaService.SaveMovilidadAcademica(movilidadAcademica);
            }

            var proyectoMovilidadAcademicaForm = proyectoMovilidadAcademicaMapper.Map(proyectoMovilidadAcademica);

            return Rjs("AddProyecto", proyectoMovilidadAcademicaForm);
        }

        MovilidadAcademicaForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        MovilidadAcademicaForm SetupNewForm(MovilidadAcademicaForm form)
        {
            form = form ?? new MovilidadAcademicaForm();

            form.TipoActividadMovilidadAcademica = new TipoActividadMovilidadAcademicaForm();
            form.ProductoDerivadoMovilidadAcademica = new ProductoDerivadoMovilidadAcademicaForm();
            form.ProyectoMovilidadAcademica = new ProyectoMovilidadAcademicaForm();

            //Lista de Catalogos Pendientes
            form.TiposEstancias = tipoEstanciaMapper.Map(catalogoService.GetActiveTipoEstancias());
            form.TiposInstituciones = tipoInstitucionMapper.Map(catalogoService.GetActiveTipoInstituciones());
            form.Convenios = convenioMapper.Map(catalogoService.GetActiveConvenios());
            form.TiposActividades = tipoActividadMapper.Map(catalogoService.GetActiveActividades());
            form.ProductosDerivados = productoDerivadoMapper.Map(catalogoService.GetActiveProductoDerivados());
            form.Proyectos = proyectoMapper.Map(catalogoService.GetActiveProyectos());
            return form;
        }

        private void FormSetCombos(MovilidadAcademicaForm form)
        {
            ViewData["TipoEstancia"] = form.TipoEstanciaId;
            ViewData["TipoInstitucion"] = form.TipoInstitucionId;
            ViewData["Convenio"] = form.ConvenioId;
        }
    }
}
