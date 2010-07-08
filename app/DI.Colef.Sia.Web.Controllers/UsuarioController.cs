using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    public class UsuarioController : BaseController<Usuario, UsuarioForm>
    {
        new readonly IUsuarioService usuarioService;
        readonly IUsuarioMapper usuarioMapper;
        readonly IRolMapper rolMapper;
        readonly ITelefonoMapper telefonoMapper;
        readonly ICorreoElectronicoMapper correoElectronicoMapper;
        readonly IDireccionMapper direccionMapper;
        readonly ICustomCollection customCollection;
        readonly IEstadoPaisMapper estadoPaisMapper;

        public UsuarioController(IUsuarioService usuarioService, IUsuarioMapper usuarioMapper,
            ISearchService searchService, ICatalogoService catalogoService,
            IRolMapper rolMapper, ITelefonoMapper telefonoMapper, ICorreoElectronicoMapper correoElectronicoMapper,
            IDireccionMapper direccionMapper,
            IEstadoPaisMapper estadoPaisMapper,
            ICustomCollection customCollection,
            IPaisMapper paisMapper)
            : base(usuarioService, searchService, catalogoService)
        {
            this.usuarioService = usuarioService;
            this.usuarioMapper = usuarioMapper;
            this.rolMapper = rolMapper;
            this.telefonoMapper = telefonoMapper;
            this.correoElectronicoMapper = correoElectronicoMapper;
            this.direccionMapper = direccionMapper;
            this.estadoPaisMapper = estadoPaisMapper;
            this.customCollection = customCollection;
            this.paisMapper = paisMapper;
            this.estadoPaisMapper = estadoPaisMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<UsuarioForm>();
            var usuarios = new Usuario[] {};

            if (User.IsInRole("DGAA"))
                usuarios = usuarioService.GetAllUsuarios();

            data.List = usuarioMapper.Map(usuarios);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<UsuarioForm>();

            var usuario = usuarioService.GetUsuarioById(id);
            var usuarioForm = usuarioMapper.Map(usuario);

            data.Form = SetupNewForm(usuarioForm);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = new GenericViewData<UsuarioForm>();

            var usuario = usuarioService.GetUsuarioById(id);
            data.Form = usuarioMapper.Map(usuario);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(UsuarioForm form)
        {
            var usuario = usuarioMapper.Map(form , CurrentUser());

            if (!IsValidateModel(usuario, form, Title.Edit))
                return ViewEdit();

            usuarioService.SaveUsuario(usuario);

            return RedirectToIndex(String.Format("Usuario {0} ha sido modificado", usuario.UsuarioNombre));
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewRol(int id)
        {
            var usuario = usuarioService.GetUsuarioById(id);
            var form = new UsuarioForm
                           {
                               Id = usuario.Id,
                               Rol = new RolForm(),
                               RolesUsuario = rolMapper.Map(usuarioService.GetActiveRoles())
                           };

            return Rjs("NewRol", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddRol([Bind(Prefix = "Rol")]RolForm form, int usuarioId)
        {
            var rol = usuarioService.GetRolById(form.Id);
            var usuario = usuarioService.GetUsuarioById(usuarioId);

            var alreadyHasIt =
                    usuario.Roles.Where(
                        x => x.Id == rol.Id).Count();

            if (alreadyHasIt == 0)
            {
                usuario.AddRole(rol);
                usuarioService.SaveUsuario(usuario);
            }

            var rolUsuarioForm = rolMapper.Map(rol);
            rolUsuarioForm.UsuarioId = usuarioId;

            return Rjs("AddRol", rolUsuarioForm);
        }

        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteRol(int id, int usuarioId)
        {
            var rol = usuarioService.GetRolById(id);

            var usuario = usuarioService.GetUsuarioById(usuarioId);
            usuario.DeleteRole(rol);
            usuarioService.SaveUsuario(usuario);

            return Rjs("DeleteRol", id);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewTelefono(int id)
        {
            var usuario = usuarioService.GetUsuarioById(id);
            var form = new UsuarioForm
                           {
                               Id = usuario.Id,
                               Telefono = new TelefonoForm()
                           };

            form = SetupNewForm(form);

            return Rjs("NewTelefono", form);
        }

        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddTelefono([Bind(Prefix = "Telefono")]TelefonoForm form, int usuarioId)
        {
            var telefono = new Telefono { Numero = form.Numero, TipoTelefono = form.TipoTelefono };
            var usuario = usuarioService.GetUsuarioById(usuarioId);
            

            var alreadyHasIt =
                    usuario.Telefonos.Where(
                        x => x.Numero == telefono.Numero && x.TipoTelefono == telefono.TipoTelefono).Count();

            if (alreadyHasIt == 0)
            {
                telefono.CreadoPor = CurrentUser();
                telefono.ModificadoPor = CurrentUser();

                usuarioService.SaveTelefono(telefono);

                form.Id = telefono.Id;

                usuario.AddTelefono(telefono);
                usuarioService.SaveUsuario(usuario);
            }

            var telefonoUsuarioForm = telefonoMapper.Map(telefono);
            telefonoUsuarioForm.UsuarioId = usuarioId;

            return Rjs("AddTelefono", telefonoUsuarioForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteTelefono(int id, int usuarioId)
        {
            var telefono = usuarioService.GetTelefonoById(id);

            var usuario = usuarioService.GetUsuarioById(usuarioId);
            usuario.DeleteTelefono(telefono);
            usuarioService.SaveUsuario(usuario);

            return Rjs("DeleteTelefono", id);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCorreoElectronico(int id)
        {
            var usuario = usuarioService.GetUsuarioById(id);
            var form = new UsuarioForm
                           {
                               Id = usuario.Id,
                               CorreoElectronico = new CorreoElectronicoForm()
                           };

            form = SetupNewForm(form);

            return Rjs("NewCorreoElectronico", form);
        }

        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCorreoElectronico([Bind(Prefix = "CorreoElectronico")]CorreoElectronicoForm form, int usuarioId)
        {
            var correoElectronico = new CorreoElectronico
                                        {Direccion = form.Direccion, TipoCorreoElectronico = form.TipoCorreo};
            var usuario = usuarioService.GetUsuarioById(usuarioId);


            var alreadyHasIt =
                    usuario.CorreosElectronicos.Where(
                        x => x.Direccion == correoElectronico.Direccion && x.TipoCorreoElectronico == correoElectronico.TipoCorreoElectronico).Count();

            if (alreadyHasIt == 0)
            {
                correoElectronico.CreadoPor = CurrentUser();
                correoElectronico.ModificadoPor = CurrentUser();

                usuarioService.SaveCorreoElectronico(correoElectronico);

                form.Id = correoElectronico.Id;

                usuario.AddCorreoElectronico(correoElectronico);
                usuarioService.SaveUsuario(usuario);
            }

            var correoElectronicoUsuarioForm = correoElectronicoMapper.Map(correoElectronico);
            correoElectronicoUsuarioForm.UsuarioId = usuarioId;

            return Rjs("AddCorreoElectronico", correoElectronicoUsuarioForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteCorreoElectronico(int id, int usuarioId)
        {
            var correoElectronico = usuarioService.GetCorreoElectronicoById(id);

            var usuario = usuarioService.GetUsuarioById(usuarioId);
            usuario.DeleteCorreoElectronico(correoElectronico);
            usuarioService.SaveUsuario(usuario);

            return Rjs("DeleteCorreoElectronico", id);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewDireccion(int id)
        {
            var usuario = usuarioService.GetUsuarioById(id);
            var form = new UsuarioForm
                           {
                               Id = usuario.Id,
                               Direccion = new DireccionForm()
                           };

            form = SetupNewForm(form);

            return Rjs("NewDireccion", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddDireccion([Bind(Prefix = "Direccion")]DireccionForm form, int usuarioId)
        {
            var direccion = direccionMapper.Map(form);

            var usuario = usuarioService.GetUsuarioById(usuarioId);

            direccion.ModificadoPor = CurrentUser();
            direccion.CreadoPor = CurrentUser();

            usuarioService.SaveDireccion(direccion);

            form.Id = direccion.Id;

            usuario.AddDireccion(direccion);
            usuarioService.SaveUsuario(usuario);

            var direccionUsuarioForm = direccionMapper.Map(direccion);
            direccionUsuarioForm.UsuarioId = usuarioId;

            return Rjs("AddDireccion", direccionUsuarioForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteDireccion(int id, int usuarioId)
        {
            var direccion = usuarioService.GetDireccionById(id);

            var usuario = usuarioService.GetUsuarioById(usuarioId);
            usuario.DeleteDireccion(direccion);
            usuarioService.SaveUsuario(usuario);

            return Rjs("DeleteDireccion", id);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.SearchUsuario(q);
            return Content(data);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangePais(int select)
        {
            var list = new List<EstadoPaisForm> { new EstadoPaisForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(estadoPaisMapper.Map(catalogoService.GetEstadoPaisesByPaisId(select)));

            var form = new FormacionAcademicaForm
            {
                EstadosPaises = list.ToArray()
            };

            return Rjs("ChangePais", form);
        }

        UsuarioForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        UsuarioForm SetupNewForm(UsuarioForm form)
        {
            form = form ?? new UsuarioForm();

            form.TipoContacto = customCollection.TipoContactoCustomCollection();

            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            if (form.Id == 0)
            {
                var pais = (from p in form.Paises where p.Nombre == "México" select p.Id).FirstOrDefault();
                form.EstadosPaises = estadoPaisMapper.Map(catalogoService.GetEstadoPaisesByPaisId(pais));
            }

            else
                form.EstadosPaises = estadoPaisMapper.Map(catalogoService.GetEstadoPaisesByPaisId(form.PaisId));

            return form;
        }
    }
}
