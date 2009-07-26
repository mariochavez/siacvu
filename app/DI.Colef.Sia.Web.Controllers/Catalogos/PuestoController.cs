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
    public class PuestoController : BaseController
    {
        readonly ICatalogoService catalogoService;
        readonly IPuestoMapper puestoMapper;

        public PuestoController(ICatalogoService catalogoService, IPuestoMapper puestoMapper) 
        {
            this.catalogoService = catalogoService;
            this.puestoMapper = puestoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = new GenericViewData<PuestoForm> { Title = "Administracion de Puestos" };
            var puestos = catalogoService.GetAllPuestos();
            data.List = puestoMapper.Map(puestos);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
			var data = new GenericViewData<PuestoForm> {Title = "Nuevo Puesto", Form = new PuestoForm()};
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<PuestoForm> { Title = "Modificar Puesto" };

            var puesto = catalogoService.GetPuestoById(id);
            data.Form = puestoMapper.Map(puesto);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = new GenericViewData<PuestoForm> { Title = "Informacion de Puesto" };

            var puesto = catalogoService.GetPuestoById(id);
            data.Form = puestoMapper.Map(puesto);

            return View(data);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(PuestoForm form)
        {
            var puesto = puestoMapper.Map(form);
            
            ModelState.AddModelErrors(puesto.ValidationResults());
            if (!ModelState.IsValid)
            {
                SetMessage("Se ha generado un error al crear el Puesto");
                return View("New", form);
            }

            catalogoService.SavePuesto(puesto);
            SetMessage(string.Format("El Puesto {0} ha sido creado", puesto.Id));

            return RedirectToAction("Index");
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(PuestoForm form)
        {
            var puesto = puestoMapper.Map(form);

            ModelState.AddModelErrors(puesto.ValidationResults());
            if (!ModelState.IsValid)
            {
                SetMessage("Se ha generado un error al actualizar el Puesto");
                return View("Edit", form);
            }

            catalogoService.SavePuesto(puesto);
            SetMessage(string.Format("El Puesto {0} ha sido modificado", puesto.Id));

            return RedirectToAction("Index");
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var puesto = catalogoService.GetPuestoById(id);
            puesto.Activo = true;
            catalogoService.SavePuesto(puesto);

            var form = puestoMapper.Map(puesto);
            
            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var puesto = catalogoService.GetPuestoById(id);
            puesto.Activo = false;
            catalogoService.SavePuesto(puesto);

            var form = puestoMapper.Map(puesto);
            
            return Rjs("Activate", form);
        }
    }
}
