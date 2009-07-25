using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class SedeController : BaseController
    {
		readonly ICatalogoService catalogoService;
        readonly ISedeMapper sedeMapper;

        public SedeController(ICatalogoService catalogoService, ISedeMapper sedeMapper) 
        {
            this.catalogoService = catalogoService;
            this.sedeMapper = sedeMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = new GenericViewData<SedeForm> { Title = "Administracion de Sedes" };
            var sedes = catalogoService.GetAllSedes();
            data.List = sedeMapper.Map(sedes);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
			var data = new GenericViewData<SedeForm> {Title = "Nuevo Sede", Form = new SedeForm()};
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<SedeForm> { Title = "Modificar Sede" };

            var sede = catalogoService.GetSedeById(id);
            data.Form = sedeMapper.Map(sede);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = new GenericViewData<SedeForm> { Title = "Informacion de Sede" };

            var sede = catalogoService.GetSedeById(id);
            data.Form = sedeMapper.Map(sede);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(SedeForm form)
        {
            var sede = sedeMapper.Map(form);
            
            ModelState.AddModelErrors(sede.ValidationResults());
            if (!ModelState.IsValid)
            {
                SetMessage("Se ha generado un error al crear el Sede");
                return View("New", form);
            }

            catalogoService.SaveSede(sede);
            SetMessage(string.Format("El Sede {0} ha sido creado", sede.Id));

            return RedirectToAction("Index");
        }
        
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(SedeForm form)
        {
            var sede = sedeMapper.Map(form);

            ModelState.AddModelErrors(sede.ValidationResults());
            if (!ModelState.IsValid)
            {
                SetMessage("Se ha generado un error al actualizar el Sede");
                return View("Edit", form);
            }

            catalogoService.SaveSede(sede);
            SetMessage(string.Format("El Sede {0} ha sido modificado", sede.Id));

            return RedirectToAction("Index");
        }
        
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var sede = catalogoService.GetSedeById(id);
            sede.Activo = true;
            catalogoService.SaveSede(sede);

            var form = sedeMapper.Map(sede);
            
            return Rjs(form);
        }
        
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var sede = catalogoService.GetSedeById(id);
            sede.Activo = false;
            catalogoService.SaveSede(sede);

            var form = sedeMapper.Map(sede);
            
            return Rjs("Activate", form);
        }
    }
}
