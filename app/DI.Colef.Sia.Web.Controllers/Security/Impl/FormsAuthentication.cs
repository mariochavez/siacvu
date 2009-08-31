using System;
using System.Web;
using System.Web.Security;

namespace DecisionesInteligentes.Colef.Sia.Web.Security
{
    public class FormsAuthentication : IFormsAuthentication
    {
        public void SetAuthCookie(HttpContextBase currentContext, string username, string roles, bool rememberMe)
        {
            var issued = DateTime.Now;
            var expires = issued.AddHours(8);

            var ticket = new FormsAuthenticationTicket(1, username, issued, expires, rememberMe, roles);
            var encryptedTicket = System.Web.Security.FormsAuthentication.Encrypt(ticket);
            var authCookie = new HttpCookie(System.Web.Security.FormsAuthentication.FormsCookieName, encryptedTicket) { Expires = ticket.Expiration };

            currentContext.Response.Cookies.Add(authCookie);
        }

        public void LogOut()
        {
            System.Web.Security.FormsAuthentication.SignOut();
        }
    }
}