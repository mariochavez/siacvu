using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class GradoAcademicoController : BaseController
    {
        readonly ICatalogoService catalogoService;
        readonly IGradoAcademicoMapper gradoAcademicoMapper;

        public GradoAcademicoController(ICatalogoService catalogoService, IGradoAcademicoMapper gradoAcademicoMapper) 
        {
            this.catalogoService = catalogoService;
            this.gradoAcademicoMapper = gradoAcademicoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = new GenericViewData<GradoAcademicoForm> { Title = "Administracion de GradoAcademicos" };
            var gradoAcademicos = catalogoService.GetAllGradoAcademicos();
            data.List = gradoAcademicoMapper.Map(gradoAcademicos);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
			var data = new GenericViewData<GradoAcademicoForm> {Title = "Nuevo GradoAcademico", Form = new GradoAcademicoForm()};
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<GradoAcademicoForm> { Title = "Modificar GradoAcademico" };

            var gradoAcademico = catalogoService.GetGradoAcademicoById(id);
            data.Form = gradoAcademicoMapper.Map(gradoAcademico);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = new GenericViewData<GradoAcademicoForm> { Title = "Informacion de GradoAcademico" };

            var gradoAcademico = catalogoService.GetGradoAcademicoById(id);
            data.Form = gradoAcademicoMapper.Map(gradoAcademico);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(GradoAcademicoForm form)
        {
            var gradoAcademico = gradoAcademicoMapper.Map(form);
            
            ModelState.AddModelErrors(gradoAcademico.ValidationResults());
            if (!ModelState.IsValid)
            {
                SetMessage("Se ha generado un error al crear el GradoAcademico");
                return View("New", form);
            }

            catalogoService.SaveGradoAcademico(gradoAcademico);
            SetMessage(string.Format("El GradoAcademico {0} ha sido creado", gradoAcademico.Id));

            return RedirectToAction("Index");
        }
        
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(GradoAcademicoForm form)
        {
            var gradoAcademico = gradoAcademicoMapper.Map(form);

            ModelState.AddModelErrors(gradoAcademico.ValidationResults());
            if (!ModelState.IsValid)
            {
                SetMessage("Se ha generado un error al actualizar el GradoAcademico");
                return View("Edit", form);
            }

            catalogoService.SaveGradoAcademico(gradoAcademico);
            SetMessage(string.Format("El GradoAcademico {0} ha sido modificado", gradoAcademico.Id));

            return RedirectToAction("Index");
        }
        
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var gradoAcademico = catalogoService.GetGradoAcademicoById(id);
            gradoAcademico.Activo = true;
            catalogoService.SaveGradoAcademico(gradoAcademico);

            var form = gradoAcademicoMapper.Map(gradoAcademico);
            
            return Rjs(form);
        }
        
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var gradoAcademico = catalogoService.GetGradoAcademicoById(id);
            gradoAcademico.Activo = false;
            catalogoService.SaveGradoAcademico(gradoAcademico);

            var form = gradoAcademicoMapper.Map(gradoAcademico);
            
            return Rjs("Activate", form);
        }
    }
}
