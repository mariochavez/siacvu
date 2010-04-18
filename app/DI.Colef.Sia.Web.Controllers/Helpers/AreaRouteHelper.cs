using System;
using System.Web.Mvc;
using System.Web.Routing;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers
{
    public class AreaRouteHelper
    {
        public static string BuildUrl(ControllerContext context, RouteValueDictionary routingValues, string controllerUrlName, string areaUrl)
        {
            string routeFromMvc = RouteTable.Routes.GetVirtualPath(context.RequestContext, routingValues).VirtualPath;

            var route = routeFromMvc;
            var indexOfController = routeFromMvc.IndexOf(controllerUrlName);
            var includeArea = routeFromMvc.IndexOf(areaUrl);
            if (indexOfController > 0 && includeArea < 0)
            {
                route = routeFromMvc.Substring(0, indexOfController) + areaUrl + "/" +
                        routeFromMvc.Substring(indexOfController);
            }
            return route;
        }

        internal static string GetUrlNameEquivalentOf(Type controllerType)
        {
            return controllerType.Name.Substring(0, controllerType.Name.Length - "Controller".Length);
        }

        internal static string ConvertNamespaceIntoAreaUrl(Type controllerType)
        {
            return controllerType.Namespace
                .Replace(controllerType.Module.Name.Substring(0, controllerType.Module.Name.Length - LENGTH_OF_DOT_DLL), "")
                .TrimStart('.').Replace('.', '/');
        }

        const int LENGTH_OF_DOT_DLL = 4;
    }
}