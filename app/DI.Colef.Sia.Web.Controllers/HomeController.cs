using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        [Authorize]
        public ActionResult Index()
        {
            var data = new GenericViewData<HomeForm>
                           {
                               Title = "Sistema de administración académica"
                           };

            return View(data);
        }
    }
}