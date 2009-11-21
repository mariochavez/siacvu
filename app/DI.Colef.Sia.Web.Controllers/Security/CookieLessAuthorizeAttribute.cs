using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web.Mvc;
using System.Web.Security;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Data.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Security
{
    [AttributeUsage(AttributeTargets.Method | AttributeTargets.Class, Inherited = true, AllowMultiple = true)]
    public class CookieLessAuthorizeAttribute : FilterAttribute, IAuthorizationFilter
    {
        Repository<Usuario> repositoryUsuario;
        string[] RolesArray { get; set; }
        string[] UsersArray { get; set; }

        public string Roles { get; set; }
        public string Users { get; set; }

        string[] usuarioRoles;

        public CookieLessAuthorizeAttribute()
        {
            RolesArray = new string[0];
            UsersArray = new string[0];

            usuarioRoles = new string[0];

            repositoryUsuario = new Repository<Usuario>();
        }

        public void OnAuthorization(AuthorizationContext filterContext)
        {
            var token = filterContext.HttpContext.Request.Form["token"];
            var ticket = FormsAuthentication.Decrypt(token);

            if(ticket ==null)
                filterContext.Result = new HttpUnauthorizedResult();

            var identity = new FormsIdentity(ticket);
            if(!identity.IsAuthenticated)
                filterContext.Result = new HttpUnauthorizedResult();

            UsersArray = SplitString(Users);
            if(UsersArray.Length > 0 && !UsersArray.Contains(identity.Name, StringComparer.OrdinalIgnoreCase))
                filterContext.Result = new HttpUnauthorizedResult();

            RolesArray = SplitString(Roles);
            usuarioRoles = FindCurrentUserRoles(identity);

            if(RolesArray.Length > 0 && !RolesArray.Any(IsInRole))
                filterContext.Result = new HttpUnauthorizedResult();

            filterContext.HttpContext.User = new GenericPrincipal(identity, usuarioRoles);
        }

        bool IsInRole(string rol)
        {
            return usuarioRoles.Contains(rol, StringComparer.OrdinalIgnoreCase);
        }

        string[] FindCurrentUserRoles(IIdentity identity)
        {
            var usuario = repositoryUsuario.FindOne(new Dictionary<string, object> {{"UsuarioNombre", identity.Name}});
            return SimplifyRoles(usuario.Roles.ToArray());
        }

        internal static string[] SimplifyRoles(Rol[] roles)
        {
            return (from r in roles
                    select r.Nombre).ToArray();
        }

        internal static string[] SplitString(string original)
        {
            if (string.IsNullOrEmpty(original))
            {
                return new string[0];
            }

            return (from value in original.Split(new[] {','})
                    where !String.IsNullOrEmpty(value.Trim())
                    select value.Trim()).ToArray();
        }
    }
}
