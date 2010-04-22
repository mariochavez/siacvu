using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Security;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class SessionController : Controller
    {
        readonly IFormsAuthentication formsAuthentication;
        readonly IAuthenticationService authenticationService;
        readonly IProductoService productoService;

        public SessionController(IFormsAuthentication formsAuthentication, 
            IAuthenticationService authenticationService, IProductoService productoService)
        {
            this.formsAuthentication = formsAuthentication;
            this.authenticationService = authenticationService;
            this.productoService = productoService;
        }

        public ActionResult Index()
        {
            if(Request.IsAuthenticated)
                return Redirect(Url.Action("Index", "Home"));

            return View();   
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(string username, string password, bool rememberMe, string returnUrl)
        {
            BasicValidation(username, password);

            if (ModelState.IsValid)
            {
                // Attempt to login
                var currentUser = authenticationService.Authenticate(username, password);

                if (currentUser != null)
                {
                    var roles = FlatRoles(currentUser);

                    formsAuthentication.SetAuthCookie(HttpContext, username, roles, rememberMe);

                    if (!String.IsNullOrEmpty(returnUrl))
                        return Redirect(returnUrl);

                    Session["puntos"] = productoService.GetPuntosSieva(currentUser);
                    Session["nombreCompleto"] = string.Format("{0} {1} {2}", currentUser.Nombre,
                                                               currentUser.ApellidoPaterno, currentUser.ApellidoMaterno);
                    return Redirect(Url.Action("Index", "Home"));
                }

                ModelState.AddModelError("_FORM", "El usuario o clave especificados no son válidos.");
            }

            // If we got this far, something failed, redisplay form
            ViewData["rememberMe"] = rememberMe;
            ViewData["username"] = username;
            
            return View("Index");
        }

        public ActionResult Destroy()
        {
            formsAuthentication.LogOut();

            return Redirect(Url.Action("Index", "Home"));
        }

        string FlatRoles(Usuario usuario)
        {
            if (usuario.Roles == null)
                return String.Empty;

            string roles = String.Empty;
            foreach (var rol in usuario.Roles)
            {
                roles += String.Format("{0},", rol.Nombre);
            }

            if (roles.EndsWith(","))
                roles = roles.Remove(roles.Length-1);

            return roles;
        }

        void BasicValidation(string username, string password)
        {
            if (String.IsNullOrEmpty(username))
            {
                ModelState.AddModelError("username", "Usted debe de especificar un nombre de usuario.");
            }
            if (String.IsNullOrEmpty(password))
            {
                ModelState.AddModelError("password", "Usted debe de especificar una clave de acceso.");
            }
        }
    }
}
