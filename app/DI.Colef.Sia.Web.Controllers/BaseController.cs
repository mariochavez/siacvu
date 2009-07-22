using System.Web.Mvc;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    public class BaseController : Controller
    {
        protected void SetMessage(string message)
        {
            TempData["message"] = message;
        }
    }
}
