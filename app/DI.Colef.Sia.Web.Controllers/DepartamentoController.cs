using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class DepartamentoController : BaseController
    {
        readonly ICatalogoService catalogoService;
        readonly IDepartamentoMapper departamentoMapper;
    
        public DepartamentoController(ICatalogoService catalogoService, IDepartamentoMapper departamentoMapper) 
        {
            this.catalogoService = catalogoService;
            this.departamentoMapper = departamentoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = new GenericViewData<DepartamentoForm> { Title = "Administracion de Departamentos" };
            var departamentos = catalogoService.GetAllDepartamentos();
            data.List = departamentoMapper.Map(departamentos);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
			var data = new GenericViewData<DepartamentoForm> {Title = "Nuevo Departamento", Form = new DepartamentoForm()};
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<DepartamentoForm> { Title = "Modificar Departamento" };

            var departamento = catalogoService.GetDepartamentoById(id);
            data.Form = departamentoMapper.Map(departamento);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = new GenericViewData<DepartamentoForm> { Title = "Informacion de Departamento" };

            var departamento = catalogoService.GetDepartamentoById(id);
            data.Form = departamentoMapper.Map(departamento);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(DepartamentoForm form)
        {
            var departamento = departamentoMapper.Map(form);
            
            ModelState.AddModelErrors(departamento.ValidationResults());
            if (!ModelState.IsValid)
            {
                SetMessage("Se ha generado un error al crear el Departamento");
                return View("New", form);
            }

            catalogoService.SaveDepartamento(departamento);
            SetMessage(string.Format("El Departamento {0} ha sido creado", departamento.Id));

            return RedirectToAction("Index");
        }
        
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(DepartamentoForm form)
        {
            var departamento = departamentoMapper.Map(form);

            ModelState.AddModelErrors(departamento.ValidationResults());
            if (!ModelState.IsValid)
            {
                SetMessage("Se ha generado un error al actualizar el Departamento");
                return View("Edit", form);
            }

            catalogoService.SaveDepartamento(departamento);
            SetMessage(string.Format("El Departamento {0} ha sido modificado", departamento.Id));

            return RedirectToAction("Index");
        }
        
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var departamento = catalogoService.GetDepartamentoById(id);
            departamento.Activo = true;
            catalogoService.SaveDepartamento(departamento);

            var form = departamentoMapper.Map(departamento);
            
            return Rjs(form);
        }
        
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var departamento = catalogoService.GetDepartamentoById(id);
            departamento.Activo = false;
            catalogoService.SaveDepartamento(departamento);

            var form = departamentoMapper.Map(departamento);
            
            return Rjs("Activate", form);
        }
    }
}
