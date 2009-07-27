using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    public class RolController : BaseController
    {
        readonly IUserService userService;
        readonly IRolMapper rolMapper;

        public RolController(IUserService userService, IRolMapper rolMapper)
        {
            this.userService = userService;
            this.rolMapper = rolMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<RolForm> { Title = "Administracion de roles" };

            var roles = userService.GetAllRoles();
            data.List = rolMapper.Map(roles);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = new GenericViewData<RolForm> {Title = "Crear nuevo rol", Form = new RolForm()};

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<RolForm> { Title = "Modificacion de rol" };

            var rol = userService.GetRolById(id);
            data.Form = rolMapper.Map(rol);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = new GenericViewData<RolForm> { Title = "Informacion de rol" };

            var rol = userService.GetRolById(id);
            data.Form = rolMapper.Map(rol);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
	[ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(RolForm form)
        {
            var rol = rolMapper.Map(form);
            
            ModelState.AddModelErrors(rol.ValidationResults());
            if (!ModelState.IsValid)
            {
                var data = new GenericViewData<RolForm> { Title = "Modificacion de rol", Form = form };
                SetError(string.Format("Se ha generado un error al actualizar el Rol, por favor corrija los siguientes errores.\n{0}",
                    ModelState.ContainsKey("Entity") ? ModelState["Entity"].Errors[0].ErrorMessage : String.Empty));

                ViewData.Model = data;
                return View("New");
            }

            userService.SaveRol(rol);
            SetMessage(string.Format("El Rol {0} ha sido creado", rol.Nombre));

            return RedirectToAction("Index");
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(RolForm form)
        {
            var rol = rolMapper.Map(form);

            ModelState.AddModelErrors(rol.ValidationResults());
            if (!ModelState.IsValid)
            {
                var data = new GenericViewData<RolForm> { Title = "Modificacion de rol", Form = form };
                SetError("Se ha generado un error al actualizar el Rol, por favor corrija los siguientes errores");

                ViewData.Model = data;
                return View("Edit");
            }

            userService.SaveRol(rol);
            SetMessage(string.Format("El Rol {0} ha sido modificado", rol.Nombre));

            return RedirectToAction("Index");
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var rol = userService.GetRolById(id);
            rol.Activo = true;
            userService.SaveRol(rol);

            var form = rolMapper.Map(rol);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var rol = userService.GetRolById(id);
            rol.Activo = false;
            userService.SaveRol(rol);

            var form = rolMapper.Map(rol);

            return Rjs("Activate", form);
        }
    }
}
