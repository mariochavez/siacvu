using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class SNIController : BaseController
    {
        readonly ICatalogoService catalogoService;
        readonly ISNIMapper sNIMapper;

        public SNIController(ICatalogoService catalogoService, ISNIMapper sNIMapper) 
        {
            this.catalogoService = catalogoService;
            this.sNIMapper = sNIMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = new GenericViewData<SNIForm> { Title = "Administracion de SNIs" };
            var sNIs = catalogoService.GetAllSNIs();
            data.List = sNIMapper.Map(sNIs);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
			var data = new GenericViewData<SNIForm> {Title = "Nuevo SNI", Form = new SNIForm()};
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<SNIForm> { Title = "Modificar SNI" };

            var sNI = catalogoService.GetSNIById(id);
            data.Form = sNIMapper.Map(sNI);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = new GenericViewData<SNIForm> { Title = "Informacion de SNI" };

            var sNI = catalogoService.GetSNIById(id);
            data.Form = sNIMapper.Map(sNI);

            return View(data);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(SNIForm form)
        {
            var sNI = sNIMapper.Map(form);
            
            ModelState.AddModelErrors(sNI.ValidationResults());
            if (!ModelState.IsValid)
            {
                SetMessage("Se ha generado un error al crear el SNI");
                return View("New", form);
            }

            catalogoService.SaveSNI(sNI);
            SetMessage(string.Format("El SNI {0} ha sido creado", sNI.Id));

            return RedirectToAction("Index");
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(SNIForm form)
        {
            var sNI = sNIMapper.Map(form);

            ModelState.AddModelErrors(sNI.ValidationResults());
            if (!ModelState.IsValid)
            {
                SetMessage("Se ha generado un error al actualizar el SNI");
                return View("Edit", form);
            }

            catalogoService.SaveSNI(sNI);
            SetMessage(string.Format("El SNI {0} ha sido modificado", sNI.Id));

            return RedirectToAction("Index");
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var sNI = catalogoService.GetSNIById(id);
            sNI.Activo = true;
            catalogoService.SaveSNI(sNI);

            var form = sNIMapper.Map(sNI);
            
            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var sNI = catalogoService.GetSNIById(id);
            sNI.Activo = false;
            catalogoService.SaveSNI(sNI);

            var form = sNIMapper.Map(sNI);
            
            return Rjs("Activate", form);
        }
    }
}
