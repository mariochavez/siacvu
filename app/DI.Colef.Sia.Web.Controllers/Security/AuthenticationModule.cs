using System;
using System.Security.Principal;
using System.Web;
using System.Web.Security;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Security
{
    public class AuthenticationModule : IHttpModule
    {
        public void Init(HttpApplication context)
        {
            context.AuthenticateRequest += AuthenticateRequest;
        }

        private void AuthenticateRequest(object sender, EventArgs e)
        {
            var context = ((HttpApplication)sender).Context;
            if (context.User == null || !context.User.Identity.IsAuthenticated) return;

            if (!(context.User.Identity is FormsIdentity)) return;

            var formsIdentity = (FormsIdentity)context.User.Identity;
            var ticket = formsIdentity.Ticket;
            var roles = ticket.UserData.Split(',');

            context.User = new GenericPrincipal(formsIdentity, roles);
        }

        public void Dispose()
        {
        }
    }
}