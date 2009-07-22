using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

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
            var data = new GenericViewData<RolForm> {Title = "nuevo rol", Form = new RolForm()};

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<RolForm> { Title = "Modificar rol" };

            var rol = userService.GetRolById(id);
            data.Form = rolMapper.Map(rol);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = new GenericViewData<RolForm> { Title = "Informacion de rol" };

            var rol = userService.GetRolById(id);
            data.Form = rolMapper.Map(rol);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(RolForm form)
        {
            var rol = rolMapper.Map(form);
            
            ModelState.AddModelErrors(rol.ValidationResults());
            if (!ModelState.IsValid)
            {
                SetMessage("Se ha generado un error al crear el Rol");
                return View("New", form);
            }

            userService.SaveRol(rol);
            SetMessage(string.Format("El Rol {0} ha sido creado", rol.Nombre));

            return RedirectToAction("Index");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(RolForm form)
        {
            var rol = rolMapper.Map(form);

            ModelState.AddModelErrors(rol.ValidationResults());
            if (!ModelState.IsValid)
            {
                SetMessage("Se ha generado un error al actualizar el Rol");
                return View("Edit", form);
            }

            userService.SaveRol(rol);
            SetMessage(string.Format("El Rol {0} ha sido modificado", rol.Nombre));

            return RedirectToAction("Index");
        }

        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var rol = userService.GetRolById(id);
            rol.Activo = true;
            userService.SaveRol(rol);

            return RedirectToAction("Index");
        }

        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var rol = userService.GetRolById(id);
            rol.Activo = false;
            userService.SaveRol(rol);

            return RedirectToAction("Index");
        }
    }
}
