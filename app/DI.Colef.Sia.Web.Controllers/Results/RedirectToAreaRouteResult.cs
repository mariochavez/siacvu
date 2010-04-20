using System;
using System.Linq.Expressions;
using System.Web.Mvc;
using System.Web.Routing;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using Microsoft.Web.Mvc.Internal;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Results
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
}