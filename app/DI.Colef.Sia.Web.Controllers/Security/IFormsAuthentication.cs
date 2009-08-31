using System.Web;

namespace DecisionesInteligentes.Colef.Sia.Web.Security
{
    public interface IFormsAuthentication
    {
        void SetAuthCookie(HttpContextBase currentContext, string username, string roles, bool rememberMe);
        void LogOut();
    }
}