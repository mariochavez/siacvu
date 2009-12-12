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
            return CustomActionLink(helper, controller, action, linkText, id, tipoProducto, null);
        }

        public static string CustomActionLink(this HtmlHelper helper, string controller, string action, string linkText, int id, int tipoProducto, object htmlAttributes)
        {
            // Instantiate a UrlHelper   
            var urlHelper = new UrlHelper(helper.ViewContext.RequestContext);

            // Create tag builder  
            var builder = new TagBuilder("a");
            var url = "/sia/" + controller + "/" + id + "/" + action + "?tipoProducto=" + tipoProducto;

            // Add attributes  
            builder.MergeAttribute("href", urlHelper.Content(url));
            builder.SetInnerText(linkText);
            builder.MergeAttributes(new RouteValueDictionary(htmlAttributes));

            // Render tag  
            return builder.ToString();
        }
    }
}
