using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Security;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class InvestigadorController : BaseController<Investigador, InvestigadorForm>
    {
        readonly ICargoInvestigadorMapper cargoInvestigadorMapper;
        readonly ICategoriaInvestigadorMapper categoriaInvestigadorMapper;
        readonly ICategoriaMapper categoriaMapper;
        readonly IDepartamentoMapper departamentoMapper;
        readonly IEstadoInvestigadorMapper estadoInvestigadorMapper;
        readonly IEstadoMapper estadoMapper;
        readonly IGradoAcademicoInvestigadorMapper gradoAcademicoInvestigadorMapper;
        readonly IGradoAcademicoMapper gradoAcademicoMapper;
        readonly IInvestigadorMapper investigadorMapper;
        readonly IInvestigadorService investigadorService;
        readonly IPuestoMapper puestoMapper;
        readonly IArchivoService archivoService;
        readonly ISNIInvestigadorMapper sniInvestigadorMapper;
        readonly ISNIMapper sniMapper;
        readonly IUsuarioMapper usuarioMapper;
        readonly ICurriculumService curriculumService;
        readonly ILineaTematicaMapper lineaTematicaMapper;

        public InvestigadorController(IInvestigadorService investigadorService, IUsuarioService usuarioService,
                                      ICatalogoService catalogoService, IInvestigadorMapper investigadorMapper,
                                      IUsuarioMapper usuarioMapper, IEstadoMapper estadoMapper,
                                      IGradoAcademicoMapper gradoAcademicoMapper, ICategoriaMapper categoriaMapper,
                                      IDepartamentoMapper departamentoMapper,
                                      ISNIMapper sniMapper, IEstadoInvestigadorMapper estadoInvestigadorMapper,
                                      IGradoAcademicoInvestigadorMapper gradoAcademicoInvestigadorMapper,
                                      ICategoriaInvestigadorMapper categoriaInvestigadorMapper,
                                      ICargoInvestigadorMapper cargoInvestigadorMapper,
                                      ISNIInvestigadorMapper sniInvestigadorMapper, 
                                      IPuestoMapper puestoMapper,
                                      ISearchService searchService, IArchivoService archivoService,
                                      IInstitucionMapper institucionMapper, ISedeMapper sedeMapper, ICurriculumService curriculumService,
                                      IAreaTematicaMapper areaTematicaMapper,
                                      ILineaTematicaMapper lineaTematicaMapper)
            : base(usuarioService, searchService, catalogoService, institucionMapper, sedeMapper)
        {
            this.investigadorService = investigadorService;
            this.investigadorMapper = investigadorMapper;
            this.usuarioMapper = usuarioMapper;
            this.estadoMapper = estadoMapper;
            this.gradoAcademicoMapper = gradoAcademicoMapper;
            this.categoriaMapper = categoriaMapper;
            this.departamentoMapper = departamentoMapper;
            this.sniMapper = sniMapper;
            this.estadoInvestigadorMapper = estadoInvestigadorMapper;
            this.gradoAcademicoInvestigadorMapper = gradoAcademicoInvestigadorMapper;
            this.categoriaInvestigadorMapper = categoriaInvestigadorMapper;
            this.cargoInvestigadorMapper = cargoInvestigadorMapper;
            this.sniInvestigadorMapper = sniInvestigadorMapper;
            this.puestoMapper = puestoMapper;
            this.archivoService = archivoService;
            this.curriculumService = curriculumService;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.areaTematicaMapper = areaTematicaMapper;
        }

        [Authorize(Roles = "Dgaa")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var investigadors = investigadorService.GetAllInvestigadores();
            data.List = investigadorMapper.Map(investigadors);

            return View(data);
        }

        [Authorize(Roles = "Dgaa")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            //var data = CreateViewDataWithTitle(Title.New);
            var data = new GenericViewData<InvestigadorForm> { Form = SetupNewForm(0) };

            return View(data);
        }

        [Authorize(Roles = "Dgaa")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<InvestigadorForm>();
            var investigador = investigadorService.GetInvestigadorById(id);

            if (investigador == null)
                return RedirectToIndex("no ha sido encontrado", true);

            var investigadorForm = investigadorMapper.Map(investigador);

            data.Form = SetupNewForm(id, investigadorForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            if(!User.IsInRole("Dgaa") && CurrentUser().Id != id)
                return NotAuthorized();

            var data = CreateViewDataWithTitle(Title.Show);

            var investigador = investigadorService.GetInvestigadorById(id);
            data.Form = investigadorMapper.Map(investigador);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult CV(int id)
        {
            var data = CreateViewDataWithTitle(Title.CV);

            var investigador = investigadorService.GetInvestigadorById(id);

            if (investigador != null)
            {
                data.Form = investigadorMapper.Map(investigador);
                data.Form.ListaProductos = curriculumService.GetListaProductos(investigador.Usuario);

                ViewData.Model = data;
                return View("CV");
            }

            return RedirectToIndex(String.Format("El investigador con el Id = {0} no existe", id));
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Perfil()
        {
            var investigador = CurrentInvestigador();
            if (investigador == null)
                return NoInvestigadorProfile();

            var data = CreateViewDataWithTitle(Title.Show);

            data.Form = investigadorMapper.Map(investigador);

            ViewData.Model = data;
            return View("Show");
        }

        [Authorize(Roles = "Dgaa")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(InvestigadorForm form)
        {
            var investigador = investigadorMapper.Map(form, CurrentUser());
            ModelState.AddModelErrors(investigador.ValidationResults(), true, "Investigador");

            if(!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            investigadorService.SaveInvestigador(investigador);
            SetMessage(String.Format("{0} {1} {2} ha sido creado", investigador.Usuario.Nombre,
                                     investigador.Usuario.ApellidoPaterno,
                                     investigador.Usuario.ApellidoMaterno));

            return Rjs("Save", investigador.Id);
        }

        [CookieLessAuthorize(Roles = "Dgaa")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddFile(FormCollection form)
        {
            var id = Convert.ToInt32(form["Id"]);
            var investigador = investigadorService.GetInvestigadorById(id);

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

            if (form["TipoArchivo"] == "GradoAcademicoInvestigador")
            {
                archivo.TipoProducto = investigador.GradosAcademicosInvestigador[0].TipoProducto;
                archivoService.Save(archivo);
                investigador.GradosAcademicosInvestigador[0].Comprobante = archivo;
            }
            else if (form["TipoArchivo"] == "EstadoInvestigador")
            {
                archivo.TipoProducto = investigador.EstadosInvestigador[0].TipoProducto;
                archivoService.Save(archivo);
                investigador.EstadosInvestigador[0].Comprobante = archivo;
            }
            else if (form["TipoArchivo"] == "CargoInvestigador")
            {
                archivo.TipoProducto = investigador.CargosInvestigador[0].TipoProducto;
                archivoService.Save(archivo);
                investigador.CargosInvestigador[0].Comprobante = archivo;
            }
            else if (form["TipoArchivo"] == "CategoriaInvestigador")
            {
                archivo.TipoProducto = investigador.CategoriasInvestigador[0].TipoProducto;
                archivoService.Save(archivo);
                investigador.CategoriasInvestigador[0].Comprobante = archivo;
            }
            else if (form["TipoArchivo"] == "SniInvestigador")
            {
                archivo.TipoProducto = investigador.SNIsInvestigador[0].TipoProducto;
                archivoService.Save(archivo);
                investigador.SNIsInvestigador[0].Comprobante = archivo;
            }

            investigadorService.SaveInvestigador(investigador);

            return Content("Uploaded");
        }

        //[Authorize(Roles = "Dgaa")]
        //[CustomTransaction]
        //[ValidateAntiForgeryToken]
        //[AcceptVerbs(HttpVerbs.Post)]
        //public ActionResult Create(InvestigadorForm form)
        //{
        //    var investigador = investigadorMapper.Map(form, CurrentUser());

        //    if (!IsValidateModel(investigador, form, Title.New, "Investigador"))
        //    {
        //        ((GenericViewData<InvestigadorForm>) ViewData.Model).Form = SetupNewForm(form.Usuario);

        //        return ViewNew();
        //    }

        //    investigadorService.SaveInvestigador(investigador);

        //    return RedirectToIndex(String.Format("{0} {1} {2} ha sido creado", investigador.Usuario.Nombre,
        //                                         investigador.Usuario.ApellidoPaterno,
        //                                         investigador.Usuario.ApellidoMaterno));
        //}

        [Authorize(Roles = "Dgaa")]
        //[CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(InvestigadorForm form)
        {
            var investigador = investigadorMapper.Map(form, CurrentUser());
            ModelState.AddModelErrors(investigador.ValidationResults(), true, "Investigador");

            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            investigadorService.SaveInvestigador(investigador, true);
            SetMessage(String.Format("{0} {1} {2} ha sido actualizado", investigador.Usuario.Nombre,
                                     investigador.Usuario.ApellidoPaterno,
                                     investigador.Usuario.ApellidoMaterno));

            return Rjs("Save", investigador.Id);
        }

        //[Authorize(Roles = "Dgaa")]
        //[CustomTransaction]
        //[ValidateAntiForgeryToken]
        //[AcceptVerbs(HttpVerbs.Post)]
        //public ActionResult Update(InvestigadorForm form)
        //{
        //    var investigador = investigadorMapper.Map(form, CurrentUser());

        //    if (!IsValidateModel(investigador, form, Title.Edit))
        //        return ViewEdit();

        //    investigadorService.SaveInvestigador(investigador);

        //    return RedirectToIndex(String.Format("{0} {1} {2} ha sido actualizado", investigador.Usuario.Nombre,
        //                                         investigador.Usuario.ApellidoPaterno,
        //                                         investigador.Usuario.ApellidoMaterno));
        //}

        [Authorize(Roles = "Dgaa")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var investigador = investigadorService.GetInvestigadorById(id);
            investigador.Activo = true;
            investigadorService.SaveInvestigador(investigador);

            var form = investigadorMapper.Map(investigador);

            return Rjs(form);
        }

        [Authorize(Roles = "Dgaa")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var investigador = investigadorService.GetInvestigadorById(id);
            investigador.Activo = false;
            investigadorService.SaveInvestigador(investigador);

            var form = investigadorMapper.Map(investigador);

            return Rjs("Activate", form);
        }

        [Authorize(Roles = "Dgaa")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeUser(int select)
        {
            var usuario = usuarioService.GetUsuarioById(select);
            var form = usuarioMapper.Map(usuario);

            return Rjs("ChangeUser", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeAreaTematica(int select)
        {
            // TODO: Dependencias
            return Rjs("", null);
        }

        [Authorize(Roles = "Dgaa")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewEstado(int id)
        {
            var investigador = investigadorService.GetInvestigadorById(id);
            var form = new InvestigadorForm
                           {
                               Id = investigador.Id,
                               EstadoInvestigador = new EstadoInvestigadorForm(),
                               Estados = estadoMapper.Map(catalogoService.GetActiveEstados())
                           };

            return Rjs("NewEstado", form);
        }

        [Authorize(Roles = "Dgaa")]
        //[CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddEstado([Bind(Prefix = "EstadoInvestigador")] EstadoInvestigadorForm form,
                                      int investigadorId)
        {
            var estadoInvestigador = estadoInvestigadorMapper.Map(form);

            ModelState.AddModelErrors(estadoInvestigador.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            estadoInvestigador.CreadoPor = CurrentUser();
            estadoInvestigador.ModificadoPor = CurrentUser();

            var investigador = investigadorService.GetInvestigadorById(investigadorId);
            investigador.AddEstado(estadoInvestigador);
            investigadorService.SaveInvestigador(investigador, true);

            var estadoInvestigadorForm = estadoInvestigadorMapper.Map(estadoInvestigador);

            return Rjs("AddEstado", estadoInvestigadorForm);
        }

        [Authorize(Roles = "Dgaa")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewGrado(int id)
        {
            var investigador = investigadorService.GetInvestigadorById(id);
            var form = new InvestigadorForm
                           {
                               Id = investigador.Id,
                               GradoAcademicoInvestigador = new GradoAcademicoInvestigadorForm(),
                               GradosAcademicos = gradoAcademicoMapper.Map(catalogoService.GetActiveGrados())
                           };

            return Rjs("NewGrado", form);
        }

        [Authorize(Roles = "Dgaa")]
        //[CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddGrado([Bind(Prefix = "GradoAcademicoInvestigador")] GradoAcademicoInvestigadorForm form,
                                     int investigadorId)
        {
            var gradoAcademicoInvestigador = gradoAcademicoInvestigadorMapper.Map(form);

            ModelState.AddModelErrors(gradoAcademicoInvestigador.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            gradoAcademicoInvestigador.CreadoPor = CurrentUser();
            gradoAcademicoInvestigador.ModificadoPor = CurrentUser();

            var investigador = investigadorService.GetInvestigadorById(investigadorId);
            investigador.AddGrado(gradoAcademicoInvestigador);
            investigadorService.SaveInvestigador(investigador, true);

            var gradoAcademicoInvestigadorForm = gradoAcademicoInvestigadorMapper.Map(gradoAcademicoInvestigador);

            return Rjs("AddGrado", gradoAcademicoInvestigadorForm);
        }

        [Authorize(Roles = "Dgaa")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCategoria(int id)
        {
            var investigador = investigadorService.GetInvestigadorById(id);
            var form = new InvestigadorForm
                           {
                               Id = investigador.Id,
                               CategoriaInvestigador = new CategoriaInvestigadorForm(),
                               Categorias = categoriaMapper.Map(catalogoService.GetActiveCategorias())
                           };

            return Rjs("NewCategoria", form);
        }

        [Authorize(Roles = "Dgaa")]
        //[CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCategoria([Bind(Prefix = "CategoriaInvestigador")] CategoriaInvestigadorForm form,
                                         int investigadorId)
        {
            var categoriaInvestigador = categoriaInvestigadorMapper.Map(form);

            ModelState.AddModelErrors(categoriaInvestigador.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            categoriaInvestigador.CreadoPor = CurrentUser();
            categoriaInvestigador.ModificadoPor = CurrentUser();

            var investigador = investigadorService.GetInvestigadorById(investigadorId);
            investigador.AddCategoria(categoriaInvestigador);
            investigadorService.SaveInvestigador(investigador, true);

            var categoriaInvestigadorForm = categoriaInvestigadorMapper.Map(categoriaInvestigador);

            return Rjs("AddCategoria", categoriaInvestigadorForm);
        }

        [Authorize(Roles = "Dgaa")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCargo(int id)
        {
            var investigador = investigadorService.GetInvestigadorById(id);
            var form = new InvestigadorForm
                           {
                               Id = investigador.Id,
                               CargoInvestigador = new CargoInvestigadorForm(),
                               Puestos = puestoMapper.Map(catalogoService.GetActivePuestos()),
                               Sedes = sedeMapper.Map(catalogoService.GetActiveSedes()),
                               Departamentos = departamentoMapper.Map(catalogoService.GetActiveDepartamentos())
                           };

            return Rjs("NewCargo", form);
        }

        [Authorize(Roles = "Dgaa")]
        //[CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCargo([Bind(Prefix = "CargoInvestigador")] CargoInvestigadorForm form, int investigadorId)
        {
            var cargoInvestigador = cargoInvestigadorMapper.Map(form);

            ModelState.AddModelErrors(cargoInvestigador.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            cargoInvestigador.CreadoPor = CurrentUser();
            cargoInvestigador.ModificadoPor = CurrentUser();

            var investigador = investigadorService.GetInvestigadorById(investigadorId);
            investigador.AddCargo(cargoInvestigador);
            investigadorService.SaveInvestigador(investigador, true);

            var cargoInvestigadorForm = cargoInvestigadorMapper.Map(cargoInvestigador);

            return Rjs("AddCargo", cargoInvestigadorForm);
        }

        [Authorize(Roles = "Dgaa")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewSni(int id)
        {
            var investigador = investigadorService.GetInvestigadorById(id);
            var form = new InvestigadorForm
                           {
                               Id = investigador.Id,
                               SNIInvestigador = new SNIInvestigadorForm(),
                               SNIs = sniMapper.Map(catalogoService.GetActiveSNIs())
                           };

            return Rjs("NewSni", form);
        }

        [Authorize(Roles = "Dgaa")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddSni([Bind(Prefix = "SNIInvestigador")] SNIInvestigadorForm form, int investigadorId)
        {
            var sniInvestigador = sniInvestigadorMapper.Map(form);

            ModelState.AddModelErrors(sniInvestigador.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            sniInvestigador.CreadoPor = CurrentUser();
            sniInvestigador.ModificadoPor = CurrentUser();

            var investigador = investigadorService.GetInvestigadorById(investigadorId);
            investigador.AddSNI(sniInvestigador);
            investigadorService.SaveInvestigador(investigador);

            var sniInvestigadorForm = sniInvestigadorMapper.Map(sniInvestigador);

            return Rjs("AddSni", sniInvestigadorForm);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.SearchInvestigador(q);

            return Content(data);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult FilteredInvestigador(string q, int extraParam)
        {
            var data = searchService.SearchInvestigador(q, extraParam);

            return Content(data);
        }

        InvestigadorForm SetupNewForm(int usuarioId, InvestigadorForm form = null)
        {
            var usuario = usuarioId == 0 ? null : usuarioService.GetUsuarioById(usuarioId);

            form = form ?? new InvestigadorForm();

            form.LineasTematicas = lineaTematicaMapper.Map(catalogoService.GetActiveLineaTematicas());

            form.EstadoInvestigador = new EstadoInvestigadorForm();
            form.GradoAcademicoInvestigador = new GradoAcademicoInvestigadorForm();
            form.CategoriaInvestigador = new CategoriaInvestigadorForm();
            form.CargoInvestigador = new CargoInvestigadorForm();
            form.SNIInvestigador = new SNIInvestigadorForm();
            form.Usuarios = usuarioMapper.Map(investigadorService.FindUsuariosToBeInvestigador());
            form.Estados = estadoMapper.Map(catalogoService.GetActiveEstados());
            form.GradosAcademicos = gradoAcademicoMapper.Map(catalogoService.GetActiveGrados());
            form.Categorias = categoriaMapper.Map(catalogoService.GetActiveCategorias());
            form.Puestos = puestoMapper.Map(catalogoService.GetActivePuestos());
            form.Sedes = sedeMapper.Map(catalogoService.GetActiveSedes());
            form.Departamentos = departamentoMapper.Map(catalogoService.GetActiveDepartamentos());
            form.SNIs = sniMapper.Map(catalogoService.GetActiveSNIs());
            form.UsuarioApellidoMaterno = usuario != null ? usuario.ApellidoMaterno : String.Empty;
            form.UsuarioApellidoPaterno = usuario != null ? usuario.ApellidoPaterno : String.Empty;
            form.UsuarioNombre = usuario != null ? usuario.UsuarioNombre : String.Empty;
            form.UsuarioCedulaProfesional = usuario != null ? usuario.CedulaProfesional : String.Empty;
            form.UsuarioCodigoRH = usuario != null ? usuario.CodigoRH : String.Empty;
            form.UsuarioCorreoElectronico = usuario != null ? usuario.CorreoElectronico : String.Empty;
            form.UsuarioCURP = usuario != null ? usuario.CURP : String.Empty;
            form.UsuarioDireccion = usuario != null ? usuario.Direccion : String.Empty;
            form.UsuarioDocumentosIdentidad = usuario != null ? usuario.DocumentosIdentidad : String.Empty;
            form.UsuarioEstadoCivil = usuario != null ? usuario.EstadoCivil : String.Empty;
            form.UsuarioFechaIngreso = usuario != null ? usuario.FechaIngreso.ToCustomShortDateString() : String.Empty;
            form.UsuarioFechaNacimiento = usuario != null ? usuario.FechaNacimiento.ToCustomShortDateString() : String.Empty;
            form.UsuarioNacionalidad = usuario != null ? usuario.Nacionalidad : String.Empty;
            form.UsuarioRFC = usuario != null ? usuario.RFC : String.Empty;
            form.UsuarioSexo = usuario != null ? usuario.Sexo : String.Empty;
            form.UsuarioTelefono = usuario != null ? usuario.Telefono : String.Empty;

            if (form.Id == 0)
            {
            }
            else
            {
                form.AreasTematicas =
                    areaTematicaMapper.Map(catalogoService.GetAreaTematicasByLineaTematicaId(form.LineaTematicaId));
            }
            return form;
        }

        void FormSetCombos(InvestigadorForm form)
        {
            ViewData["LineaTematicaId"] = form.LineaTematicaId;
            ViewData["AreaTematicaId"] = form.AreaTematicaId;
        }
    }
}