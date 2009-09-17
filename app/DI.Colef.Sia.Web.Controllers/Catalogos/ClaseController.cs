using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    public class ClaseController : BaseController<Clase, ClaseForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IClaseMapper claseMapper;
        readonly IRamaMapper ramaMapper;
    
        public ClaseController(IUsuarioService usuarioService, 
                               ICatalogoService catalogoService, 
                               IClaseMapper claseMapper,
                               ISearchService searchService, IRamaMapper ramaMapper) 
            : base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.claseMapper = claseMapper;
            this.ramaMapper = ramaMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var clases = catalogoService.GetAllClases();
            data.List = claseMapper.Map(clases);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
			
            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var clase = catalogoService.GetClaseById(id);

            var claseForm = claseMapper.Map(clase);

            data.Form = SetupNewForm(claseForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ClaseForm form)
        {
        
            var clase = claseMapper.Map(form);
            
            clase.CreadorPor = CurrentUser();
            clase.ModificadoPor = CurrentUser();

            if (!IsValidateModel(clase, form, Title.New, "Clase"))
            {
                var claseForm = claseMapper.Map(clase);

                ((GenericViewData<ClaseForm>)ViewData.Model).Form = SetupNewForm(claseForm);
                return ViewNew();
            }

            catalogoService.SaveClase(clase);

            return RedirectToIndex(String.Format("Clase {0} ha sido creada", clase.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ClaseForm form)
        {

            var clase = claseMapper.Map(form);

            clase.ModificadoPor = CurrentUser();

            if (!IsValidateModel(clase, form, Title.Edit))
            {
                var claseForm = claseMapper.Map(clase);

                ((GenericViewData<ClaseForm>) ViewData.Model).Form = SetupNewForm(claseForm);
                FormSetCombos(claseForm);
                return ViewEdit();
            }

            catalogoService.SaveClase(clase);

            return RedirectToIndex(String.Format("Clase {0} ha sido modificada", clase.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var clase = catalogoService.GetClaseById(id);
            clase.Activo = true;
            clase.ModificadoPor = CurrentUser();
            catalogoService.SaveClase(clase);

            var form = claseMapper.Map(clase);
            
            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var clase = catalogoService.GetClaseById(id);
            clase.Activo = false;
            clase.ModificadoPor = CurrentUser();
            catalogoService.SaveClase(clase);

            var form = claseMapper.Map(clase);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Clase>(x => x.Nombre, q);
            return Content(data);
        }

        ClaseForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        ClaseForm SetupNewForm(ClaseForm form)
        {
            form = form ?? new ClaseForm();

            form.Ramas = ramaMapper.Map(catalogoService.GetActiveRamas());

            return form;
        }

        private void FormSetCombos(ClaseForm form)
        {
            ViewData["Rama"] = form.RamaId;
        }
    }
}