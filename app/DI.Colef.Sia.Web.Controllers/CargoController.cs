using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class CargoController : BaseController
    {
        readonly ICatalogoService catalogoService;
        readonly ICargoMapper cargoMapper;
    
        public CargoController(ICatalogoService catalogoService, ICargoMapper cargoMapper) 
        {
            this.catalogoService = catalogoService;
            this.cargoMapper = cargoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = new GenericViewData<CargoForm> { Title = "Administracion de Cargos" };
			var cargos = catalogoService.GetAllCargos();
            data.List = cargoMapper.Map(cargos);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
			var data = new GenericViewData<CargoForm> {Title = "Nuevo Cargo", Form = new CargoForm()};
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<CargoForm> { Title = "Modificar Cargo" };

            var cargo = catalogoService.GetCargoById(id);
            data.Form = cargoMapper.Map(cargo);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = new GenericViewData<CargoForm> { Title = "Informacion de Cargo" };

            var cargo = catalogoService.GetCargoById(id);
            data.Form = cargoMapper.Map(cargo);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(CargoForm form)
        {
            var cargo = cargoMapper.Map(form);
            
            ModelState.AddModelErrors(cargo.ValidationResults());
            if (!ModelState.IsValid)
            {
                SetMessage("Se ha generado un error al crear el Cargo");
                return View("New", form);
            }

            catalogoService.SaveCargo(cargo);
            SetMessage(string.Format("El Cargo {0} ha sido creado", cargo.Id));

            return RedirectToAction("Index");
        }
        
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(CargoForm form)
        {
            var cargo = cargoMapper.Map(form);

            ModelState.AddModelErrors(cargo.ValidationResults());
            if (!ModelState.IsValid)
            {
                SetMessage("Se ha generado un error al actualizar el Cargo");
                return View("Edit", form);
            }

            catalogoService.SaveCargo(cargo);
            SetMessage(string.Format("El Cargo {0} ha sido modificado", cargo.Id));

            return RedirectToAction("Index");
        }
        
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var cargo = catalogoService.GetCargoById(id);
            cargo.Activo = true;
            catalogoService.SaveCargo(cargo);

            var form = cargoMapper.Map(cargo);
            
            return Rjs(form);
        }
        
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var cargo = catalogoService.GetCargoById(id);
            cargo.Activo = false;
            catalogoService.SaveCargo(cargo);

            var form = cargoMapper.Map(cargo);
            
            return Rjs("Activate", form);
        }
    }
}
