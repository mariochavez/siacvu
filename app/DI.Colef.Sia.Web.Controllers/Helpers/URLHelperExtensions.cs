using System;
using System.Linq.Expressions;
using System.Web.Mvc;
using System.Web.Routing;
using Microsoft.Web.Mvc.Internal;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers
{
    public static class URLHelperExtensions
    {
        public static string AreaUrl<TController>(this HtmlHelper html, Expression<Action<TController>> action) where TController : Controller
        {
            ControllerContext context = html.ViewContext.Controller.ControllerContext;
            Type controllerType = typeof(TController);

            string controllerUrlName = AreaRouteHelper.GetUrlNameEquivalentOf(controllerType);
            string areaUrl = AreaRouteHelper.ConvertNamespaceIntoAreaUrl(controllerType);

            RouteValueDictionary routingValues = ExpressionHelper.GetRouteValuesFromExpression(action);
            string route = AreaRouteHelper.BuildUrl(context, routingValues, controllerUrlName, areaUrl);

            return route;
        }

        public static string AreaUrl<TController>(this HtmlHelper html, string action) where TController : Controller
        {
            ControllerContext context = html.ViewContext.Controller.ControllerContext;
            Type controllerType = typeof(TController);

            string controllerUrlName = AreaRouteHelper.GetUrlNameEquivalentOf(controllerType);
            string areaUrl = AreaRouteHelper.ConvertNamespaceIntoAreaUrl(controllerType);

            RouteValueDictionary routingValues = new RouteValueDictionary
                                                     {
                                                         {"controller", controllerUrlName},
                                                         {"action", action}
                                                     };

            string route = AreaRouteHelper.BuildUrl(context, routingValues, controllerUrlName, areaUrl);

            return route;
        }

        private static RouteValueDictionary BuildRoute<TController>(this HtmlHelper html, string action) where TController : Controller
        {
            Type controllerType = typeof(TController);

            string controllerUrlName = AreaRouteHelper.GetUrlNameEquivalentOf(controllerType);
            //string areaUrl = AreaRouteHelper.ConvertNamespaceIntoAreaUrl(controllerType);

            return new RouteValueDictionary
                       {
                           {"controller", controllerUrlName},
                           {"action", action}
                       };       
        }

        //public static string UrlToName(this string value)
        //{

        //    return value.StartsWith("/") ? value.Remove(0, 1).Replace('/', '_') : value.Replace('/', '_');
        //}

        //public static string CustomActionLink(this HtmlHelper helper, string controller, string action, string linkText, int id, int tipoProducto)
        //{
        //    return CustomActionLink(helper, controller, action, linkText, id, tipoProducto, 0, null);
        //}

        //public static string CustomActionLink(this HtmlHelper helper, string controller, string action, string linkText, int id, int tipoProducto, int guidNumber, object htmlAttributes)
        //{
        //    // Instantiate a UrlHelper   
        //    var urlHelper = new UrlHelper(helper.ViewContext.RequestContext);

        //    // Create tag builder  
        //    var builder = new TagBuilder("a");

        //    var url = "~/" + controller + "/" + id + "/" + action + "?tipoProducto=" + tipoProducto;

        //    url = guidNumber != 0 ? url + ("&guidNumber=" + guidNumber) : url;

        //    // Add attributes  
        //    builder.MergeAttribute("href", urlHelper.Content(url));
        //    builder.SetInnerText(linkText);
        //    builder.MergeAttributes(new RouteValueDictionary(htmlAttributes));

        //    // Render tag  
        //    return builder.ToString();
        //}
    }
}
