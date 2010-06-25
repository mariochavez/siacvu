using System;
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
        readonly ICustomCollection customCollection;

        public UsuarioController(IUsuarioService usuarioService, IUsuarioMapper usuarioMapper,
            ISearchService searchService, ICatalogoService catalogoService,
            IRolMapper rolMapper, ITelefonoMapper telefonoMapper,
            ICustomCollection customCollection)
            : base(usuarioService, searchService, catalogoService)
        {
            this.usuarioService = usuarioService;
            this.usuarioMapper = usuarioMapper;
            this.rolMapper = rolMapper;
            this.telefonoMapper = telefonoMapper;
            this.customCollection = customCollection;
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

            data.Form = usuarioForm;

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

            var telefonoUsuarioFom = telefonoMapper.Map(telefono);
            telefonoUsuarioFom.UsuarioId = usuarioId;

            return Rjs("AddTelefono", telefonoUsuarioFom);
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

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.SearchUsuario(q);
            return Content(data);
        }

        UsuarioForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        UsuarioForm SetupNewForm(UsuarioForm form)
        {
            form = form ?? new UsuarioForm();

            form.TipoTelefonos = customCollection.TipoTelefonoCustomCollection();

            return form;
        }
    }
}
