using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    public class ArchivoController : Controller
    {
        readonly IArchivoService archivoService;

        public ArchivoController(IArchivoService archivoService)
        {
            this.archivoService = archivoService;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public DownloadResult Show(int id)
        {
            var archivo = archivoService.GetArchivoById(id);
            return new DownloadResult
                       {
                           Archivo = archivo
                       };
        }
    }

    public class DownloadResult : ActionResult
    {
        public Archivo Archivo { get; set; }
        public override void ExecuteResult(ControllerContext context)
        {
            context.HttpContext.Response.AddHeader("content-disposition",
                                                   "attachment; filename=" + Archivo.Nombre);

            context.HttpContext.Response.AddHeader("content-type",
                                                   "attachment; filename=" + Archivo.Contenido);

            context.HttpContext.Response.BinaryWrite(Archivo.Datos);
        }
    }
}
