using System;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    public class UsuarioController : BaseController<Usuario, UsuarioForm>
    {
        new readonly IUsuarioService usuarioService;
        readonly IUsuarioMapper usuarioMapper;
        readonly IRolMapper rolMapper;

        public UsuarioController(IUsuarioService usuarioService, IUsuarioMapper usuarioMapper,
            ISearchService searchService, ICatalogoService catalogoService,
            IRolMapper rolMapper)
            : base(usuarioService, searchService, catalogoService)
        {
            this.usuarioService = usuarioService;
            this.usuarioMapper = usuarioMapper;
            this.rolMapper = rolMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);
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
            var data = CreateViewDataWithTitle(Title.Edit);

            var usuario = usuarioService.GetUsuarioById(id);
            data.Form = usuarioMapper.Map(usuario);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

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

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.SearchUsuario(q);
            return Content(data);
        }
    }
}
