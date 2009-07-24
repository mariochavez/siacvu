using System.IO;
using System.Web.Mvc;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers
{
    public static class PartialViewExtensions
    {
        public static string RenderPartialToString(this Controller controller, string partialView, ViewDataDictionary viewData, TempDataDictionary tempData)
        {
            ControllerContext controllerContext = controller.ControllerContext;
            var viewEngines = ViewEngines.Engines;
            var viewEngineResult = viewEngines.FindPartialView(controllerContext, partialView);

            ViewContext viewContext = new ViewContext(controllerContext, viewEngineResult.View, viewData,
                                                      tempData);

            var response = viewContext.HttpContext.Response;
            response.Flush();
            var oldFilter = response.Filter;
            Stream filter = null;
            try
            {
                filter = new MemoryStream();
                response.Filter = filter;
                viewContext.View.Render(viewContext, viewContext.HttpContext.Response.Output);
                response.Flush();
                filter.Position = 0;
                var reader = new StreamReader(filter, response.ContentEncoding);
                return reader.ReadToEnd();
            }
            finally
            {
                if (filter != null)
                {
                    filter.Dispose();
                }
                response.Filter = oldFilter;
            }

        }

        public static string RenderPartialToString(this Controller controller, string partialView, ViewDataDictionary viewData)
        {
            return RenderPartialToString(controller, partialView, viewData, new TempDataDictionary());
        }

        public static string RenderPartialToString(this Controller controller, string partialView)
        {
            return RenderPartialToString(controller, partialView, new ViewDataDictionary(), new TempDataDictionary());
        }

        public static string RenderPartialToString(this Controller controller, string partialView, object model)
        {
            return RenderPartialToString(controller, partialView, new ViewDataDictionary(model), new TempDataDictionary());
        }
    }
}
