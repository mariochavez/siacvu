using System;
using System.Linq.Expressions;
using System.Web.Mvc;
using System.Web.Routing;
using Microsoft.Web.Mvc.Internal;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    public class RedirectToAreaRouteResult : ActionResult
    {
        readonly string area;
        readonly string controllerName;
        readonly string action;
        readonly RouteValueDictionary routingValues;

        public RedirectToAreaRouteResult(string area, string controllerName, string action, object routeValues)
        {
            this.area = area;
            this.controllerName = controllerName;
            this.action = action;
            routingValues = new RouteValueDictionary(routeValues);
        }

        public RedirectToAreaRouteResult(string area, string controllerName, string action, RouteValueDictionary routingValues)
        {
            this.controllerName = controllerName;
            this.action = action;
            this.routingValues = routingValues;
        }

        public override void ExecuteResult(ControllerContext context)
        {
            if (context == null)
                throw new ArgumentNullException("context");

            if (!routingValues.ContainsValue("controller"))
                routingValues.Add("controller", controllerName);

            if (!routingValues.ContainsValue("action"))
                routingValues.Add("action", action);

            string route = AreaRouteHelper.BuildUrl(context, routingValues, controllerName, area);

            context.HttpContext.Response.Redirect(route, false /* endResponse */);
        }
    }

    public class RedirectToAreaRouteResult<TController> : ActionResult where TController : Controller
    {
        readonly Expression<Action<TController>> action;

        public RedirectToAreaRouteResult(Expression<Action<TController>> action)
        {
            this.action = action;
        }

        public override void ExecuteResult(ControllerContext context)
        {
            if (context == null)
                throw new ArgumentNullException("context");

            Type controllerType = typeof(TController);
            string controllerUrlName = AreaRouteHelper.GetUrlNameEquivalentOf(controllerType);
            string areaUrl = AreaRouteHelper.ConvertNamespaceIntoAreaUrl(controllerType);

            RouteValueDictionary routingValues = ExpressionHelper.GetRouteValuesFromExpression(action);
            string route = AreaRouteHelper.BuildUrl(context, routingValues, controllerUrlName, areaUrl);

            context.HttpContext.Response.Redirect(route, false /* endResponse */);
        }

    }

    internal class AreaRouteHelper
    {
        internal static string BuildUrl(ControllerContext context, RouteValueDictionary routingValues, string controllerUrlName, string areaUrl)
        {
            string routeFromMvc = RouteTable.Routes.GetVirtualPath(context.RequestContext, routingValues).VirtualPath;

            var route = routeFromMvc;
            var indexOfController = routeFromMvc.IndexOf(controllerUrlName);
            if (indexOfController > 0)
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