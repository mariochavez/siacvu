using System;
using System.Web.Mvc;
using System.Web.Routing;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers
{
    public static class URLHelperExtensions
    {
        public static string UrlToName(this string value)
        {

            return value.StartsWith("/") ? value.Remove(0, 1).Replace('/', '_') : value.Replace('/', '_');
        }

        public static string CustomActionLink(this HtmlHelper helper, string controller, string action, string linkText, int id, int tipoProducto)
        {
            return String.Format("<a href=\"/sia/" + controller + "/" + id + "/" + action + "?tipoProducto=" + tipoProducto + "\">" + linkText + "</a>");
        }
    }
}
