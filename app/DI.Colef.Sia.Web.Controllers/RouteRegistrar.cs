using System.Web.Mvc;
using System.Web.Routing;
using SharpArch.Web.Areas;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    public class RouteRegistrar
    {
        public static void RegisterRoutesTo(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.IgnoreRoute("{*favicon}", new { favicon = @"(.*/)?favicon.ico(/.*)?" });

            // The areas below must be registered from greater subareas to fewer;
            // i.e., the root area should be the last area registered

            // Example illustrative routes with a nested area - note that the order of registration is important
            //routes.CreateArea("Organization/Department", "DI.Colef.Sia.Web.Controllers.Organization.Department",
            //    routes.MapRoute(null, "Organization/Department/{controller}/{action}", new { action = "Index" }),
            //    routes.MapRoute(null, "Organization/Department/{controller}/{action}/{id}")
            //);
            routes.CreateArea("Catalogos", "DI.Colef.Sia.Web.Controllers.Catalogos",
                              routes.MapRoute(null, "Catalogos/{controller}/{action}", new { action = "Index" }),
                              routes.MapRoute(null, "Catalogos/{controller}/{id}/{action}")
                );

            // Routing config for the root area
            routes.CreateArea("Root", "DI.Colef.Sia.Web.Controllers",
                              routes.MapRoute(null, "{controller}/{action}", new { controller = "Home", action = "Index" }),
                              routes.MapRoute(null, "{controller}/{id}/{action}")
                );
        }
    }
}