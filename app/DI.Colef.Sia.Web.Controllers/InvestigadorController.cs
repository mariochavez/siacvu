using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Security;
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
        readonly IDireccionRegionalMapper direccionRegionalMapper;
        readonly IAreaTematicaMapper areaTematicaMapper;
        readonly IEstadoInvestigadorMapper estadoInvestigadorMapper;
        readonly IEstadoMapper estadoMapper;
        readonly IGradoAcademicoInvestigadorMapper gradoAcademicoInvestigadorMapper;
        readonly IGradoAcademicoMapper gradoAcademicoMapper;
        readonly IInvestigadorMapper investigadorMapper;
        readonly IInvestigadorService investigadorService;
        readonly IPuestoMapper puestoMapper;
        readonly ISNIInvestigadorMapper sniInvestigadorMapper;
        readonly ISNIMapper sniMapper;
        readonly IUsuarioMapper usuarioMapper;

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
                                      IDireccionRegionalMapper direccionRegionalMapper, ISearchService searchService,
            IInstitucionMapper institucionMapper, IAreaTematicaMapper areaTematicaMapper, ISedeMapper sedeMapper)
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
            this.direccionRegionalMapper = direccionRegionalMapper;
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
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm(0);

            return View(data);
        }

        [Authorize(Roles = "Dgaa")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var investigador = investigadorService.GetInvestigadorById(id);
            if (investigador == null)
                return RedirectToIndex("no ha sido encontrado", true);

            data.Form = investigadorMapper.Map(investigador);

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

            ViewData["Rollback"] = true;
            return Rjs("Create", investigador.Id);
        }

        [CookieLessAuthorize(Roles = "Dgaa")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddFile(FormCollection form)
        {
            var id = Convert.ToInt32(form["Id"]);
            var investigador = investigadorService.GetInvestigadorById(1);

            var file = Request.Files["fileData"];
            var archivo = new ArchivoInvestigador
                              {
                                  Activo = true,
                                  Contenido = file.ContentType,
                                  CreadorEl = DateTime.Now,
                                  CreadorPor = CurrentUser(),
                                  ModificadoEl = DateTime.Now,
                                  ModificadoPor = CurrentUser(),
                                  Nombre = file.FileName,
                                  Tamano = file.ContentLength,
                                  TipoProducto = 1
                              };
            var datos = new byte[file.ContentLength];
            file.InputStream.Read(datos, 0, datos.Length);
            archivo.Datos = datos;

            investigador.AddArchivo(archivo);
            investigadorService.SaveInvestigador(investigador);

            return Content("Hi");
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
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(InvestigadorForm form)
        {
            var investigador = investigadorMapper.Map(form, CurrentUser());

            if (!IsValidateModel(investigador, form, Title.Edit))
                return ViewEdit();

            investigadorService.SaveInvestigador(investigador);

            return RedirectToIndex(String.Format("{0} {1} {2} ha sido actualizado", investigador.Usuario.Nombre,
                                                 investigador.Usuario.ApellidoPaterno,
                                                 investigador.Usuario.ApellidoMaterno));
        }

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
            if (areaTematicaMapper == null)
                return Content("Action not supported");

            var areaTematicaForm = areaTematicaMapper.Map(catalogoService.GetAreaTematicaById(select));

            var form = new ShowFieldsForm
            {
                AreaTematicaId = areaTematicaForm.Id,
                AreaTematicaNombre = areaTematicaForm.LineaTematicaNombre
            };

            return Rjs("ChangeAreaTematica", form);
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
        [CustomTransaction]
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

            estadoInvestigador.CreadorPor = CurrentUser();
            estadoInvestigador.ModificadoPor = CurrentUser();

            var investigador = investigadorService.GetInvestigadorById(investigadorId);
            investigador.AddEstado(estadoInvestigador);
            investigadorService.SaveInvestigador(investigador);

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
        [CustomTransaction]
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

            gradoAcademicoInvestigador.CreadorPor = CurrentUser();
            gradoAcademicoInvestigador.ModificadoPor = CurrentUser();

            var investigador = investigadorService.GetInvestigadorById(investigadorId);
            investigador.AddGrado(gradoAcademicoInvestigador);
            investigadorService.SaveInvestigador(investigador);

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
        [CustomTransaction]
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

            categoriaInvestigador.CreadorPor = CurrentUser();
            categoriaInvestigador.ModificadoPor = CurrentUser();

            var investigador = investigadorService.GetInvestigadorById(investigadorId);
            investigador.AddCategoria(categoriaInvestigador);
            investigadorService.SaveInvestigador(investigador);

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
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCargo([Bind(Prefix = "CargoInvestigador")] CargoInvestigadorForm form, int investigadorId)
        {
            var cargoInvestigador = cargoInvestigadorMapper.Map(form);

            ModelState.AddModelErrors(cargoInvestigador.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            cargoInvestigador.CreadorPor = CurrentUser();
            cargoInvestigador.ModificadoPor = CurrentUser();

            var investigador = investigadorService.GetInvestigadorById(investigadorId);
            investigador.AddCargo(cargoInvestigador);
            investigadorService.SaveInvestigador(investigador);

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

            sniInvestigador.CreadorPor = CurrentUser();
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
            string data;

            if (User.IsInRole("Investigadores"))
                data = searchService.SearchInvestigador(q, CurrentInvestigador() ?? new Investigador());
            else
                data = searchService.SearchInvestigador(q);

            return Content(data);
        }

        InvestigadorForm SetupNewForm(int usuarioId)
        {
            Usuario usuario = usuarioId == 0 ? null : usuarioService.GetUsuarioById(usuarioId);

            return new InvestigadorForm
                       {
                           EstadoInvestigador = new EstadoInvestigadorForm(),
                           GradoAcademicoInvestigador = new GradoAcademicoInvestigadorForm(),
                           CategoriaInvestigador = new CategoriaInvestigadorForm(),
                           CargoInvestigador = new CargoInvestigadorForm(),
                           SNIInvestigador = new SNIInvestigadorForm(),
                           Usuarios = usuarioMapper.Map(investigadorService.FindUsuariosToBeInvestigador()),
                           Estados = estadoMapper.Map(catalogoService.GetActiveEstados()),
                           GradosAcademicos = gradoAcademicoMapper.Map(catalogoService.GetActiveGrados()),
                           Categorias = categoriaMapper.Map(catalogoService.GetActiveCategorias()),
                           Puestos = puestoMapper.Map(catalogoService.GetActivePuestos()),
                           Sedes = sedeMapper.Map(catalogoService.GetActiveSedes()),
                           Departamentos = departamentoMapper.Map(catalogoService.GetActiveDepartamentos()),
                           SNIs = sniMapper.Map(catalogoService.GetActiveSNIs()),
                           AreasTematicas = areaTematicaMapper.Map(catalogoService.GetActiveAreaTematicas()),
                           UsuarioApellidoMaterno = usuario != null ? usuario.ApellidoMaterno : String.Empty,
                           UsuarioApellidoPaterno = usuario != null ? usuario.ApellidoPaterno : String.Empty,
                           UsuarioNombre = usuario != null ? usuario.Nombre : String.Empty,
                           UsuarioCedulaProfesional = usuario != null ? usuario.CedulaProfesional : String.Empty,
                           UsuarioCodigoRH = usuario != null ? usuario.CodigoRH : String.Empty,
                           UsuarioCorreoElectronico = usuario != null ? usuario.CorreoElectronico : String.Empty,
                           UsuarioCURP = usuario != null ? usuario.CURP : String.Empty,
                           UsuarioDireccion = usuario != null ? usuario.Direccion : String.Empty,
                           UsuarioDocumentosIdentidad = usuario != null ? usuario.DocumentosIdentidad : String.Empty,
                           UsuarioEstadoCivil = usuario != null ? usuario.EstadoCivil : String.Empty,
                           UsuarioFechaIngreso =
                               usuario != null ? usuario.FechaIngreso.ToCustomShortDateString() : String.Empty,
                           UsuarioFechaNacimiento =
                               usuario != null ? usuario.FechaNacimiento.ToCustomShortDateString() : String.Empty,
                           UsuarioNacionalidad = usuario != null ? usuario.Nacionalidad : String.Empty,
                           UsuarioRFC = usuario != null ? usuario.RFC : String.Empty,
                           UsuarioSexo = usuario != null ? usuario.Sexo : String.Empty,
                           UsuarioTelefono = usuario != null ? usuario.Telefono : String.Empty
                       };
        }
    }
}