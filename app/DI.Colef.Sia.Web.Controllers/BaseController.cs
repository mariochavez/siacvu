using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    public class BaseController : Controller
    {
        protected void SetMessage(string message)
        {
            TempData["message"] = message;
        }

        protected ContentResult Rjs(string viewName, object model)
        {
            var output = this.RenderPartialToString(viewName, model);
            output = output.Replace("\n", " ");
            output = output.Replace("\r", " ");

            output = "try { " + output + " } catch(e) { alert(e); }";
            return Content(output);
        }

        protected ContentResult Rjs(string viewName)
        {
            return Rjs(viewName, null);
        }

        protected ContentResult Rjs(object model)
        {
            var viewName = ControllerContext.RouteData.Values["action"].ToString();
            return Rjs(viewName, model);
        }
    }
}
