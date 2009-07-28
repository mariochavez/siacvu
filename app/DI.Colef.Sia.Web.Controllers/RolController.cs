using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    public class RolController : BaseController<Rol, RolForm>
    {
        readonly IUsuarioService usuarioService;
        readonly IRolMapper rolMapper;

        public RolController(IUsuarioService usuarioService, IRolMapper rolMapper)
        {
            this.usuarioService = usuarioService;
            this.rolMapper = rolMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var roles = usuarioService.GetAllRoles();
            data.List = rolMapper.Map(roles);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new RolForm();

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var rol = usuarioService.GetRolById(id);
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

            if(!IsValidateModel(rol, form, Title.New))
                return ViewNew();

            usuarioService.SaveRol(rol);

            return RedirectToIndex(String.Format("{0} ha sido creado", rol.Nombre));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(RolForm form)
        {
            var rol = rolMapper.Map(form);

            if (!IsValidateModel(rol, form, Title.Edit))
                return ViewEdit();

            usuarioService.SaveRol(rol);

            return RedirectToIndex(String.Format("{0} ha sido modificado", rol.Nombre));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var rol = usuarioService.GetRolById(id);
            rol.Activo = true;
            usuarioService.SaveRol(rol);

            var form = rolMapper.Map(rol);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var rol = usuarioService.GetRolById(id);
            rol.Activo = false;
            usuarioService.SaveRol(rol);

            var form = rolMapper.Map(rol);

            return Rjs("Activate", form);
        }
    }
}
