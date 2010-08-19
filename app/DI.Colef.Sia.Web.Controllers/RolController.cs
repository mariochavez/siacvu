using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    public class RolController : BaseController<Rol, RolForm>
    {
        new readonly IUsuarioService usuarioService;
        readonly IRolMapper rolMapper;

        public RolController(IUsuarioService usuarioService, IRolMapper rolMapper,
            ISearchService searchService, ICatalogoService catalogoService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.usuarioService = usuarioService;
            this.rolMapper = rolMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<RolForm>();

            var roles = usuarioService.GetAllRoles();
            data.List = rolMapper.Map(roles);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = new GenericViewData<RolForm> {Form = new RolForm()};

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<RolForm>();

            var rol = usuarioService.GetRolById(id);
            data.Form = rolMapper.Map(rol);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
	    [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(RolForm form)
        {
            var rol = rolMapper.Map(form);

            rol.CreadoPor = CurrentUser();
            rol.ModificadoPor = CurrentUser();

            if(!IsValidateModel(rol, form, Title.New))
                return ViewNew();

            usuarioService.SaveRol(rol);

            return RedirectToIndex(String.Format("{0} ha sido registrado", rol.Nombre));
        }

        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(RolForm form)
        {
            var rol = rolMapper.Map(form);

            rol.ModificadoPor = CurrentUser();

            if (!IsValidateModel(rol, form, Title.Edit))
                return ViewEdit();

            usuarioService.SaveRol(rol);

            return RedirectToIndex(String.Format("{0} ha sido modificado", rol.Nombre));
        }

        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var rol = usuarioService.GetRolById(id);
            rol.Activo = true;
            rol.ModificadoPor = CurrentUser();
            usuarioService.SaveRol(rol);

            var form = rolMapper.Map(rol);

            return Rjs(form);
        }

        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var rol = usuarioService.GetRolById(id);
            rol.Activo = false;
            rol.ModificadoPor = CurrentUser();
            usuarioService.SaveRol(rol);

            var form = rolMapper.Map(rol);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Rol>(x => x.Nombre, q);
            return Content(data);
        }
    }
}
