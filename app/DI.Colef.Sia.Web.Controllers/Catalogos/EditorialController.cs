using System;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    public class EditorialController : BaseController<Editorial, EditorialForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IEditorialMapper editorialMapper;
        readonly IPaisMapper paisMapper;
        readonly ICustomCollection customCollection;
    
        public EditorialController(IUsuarioService usuarioService, ICatalogoService catalogoService, 
                                   IEditorialMapper editorialMapper, ISearchService searchService,
                                   ICustomCollection customCollection,
                                   IPaisMapper paisMapper)
            : base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.customCollection = customCollection;
            this.paisMapper = paisMapper;
            this.editorialMapper = editorialMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);
			
            var editorials = catalogoService.GetAllEditorials();
            data.List = editorialMapper.Map(editorials);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
            ViewData["Pais"] = (from p in data.Form.Paises where p.Nombre == "México" select p.Id).FirstOrDefault();
            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var editorial = catalogoService.GetEditorialById(id);
            var editorialForm = editorialMapper.Map(editorial);

            data.Form = SetupNewForm(editorialForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(EditorialForm form)
        {
            var editorial = editorialMapper.Map(form);
            
            editorial.CreadoPor = CurrentUser();
            editorial.ModificadoPor = CurrentUser();

            if(!IsValidateModel(editorial, form, Title.New))
            {
                var editorialForm = editorialMapper.Map(editorial);

                ((GenericViewData<EditorialForm>)ViewData.Model).Form = SetupNewForm(editorialForm);
                return ViewNew();
            }

            catalogoService.SaveEditorial(editorial);

            return RedirectToIndex(String.Format("Editorial {0} ha sido creada", editorial.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(EditorialForm form)
        {
            var editorial = editorialMapper.Map(form);
            
            editorial.ModificadoPor = CurrentUser();

            if (!IsValidateModel(editorial, form, Title.Edit))
            {
                var editorialForm = editorialMapper.Map(editorial);

                ((GenericViewData<EditorialForm>)ViewData.Model).Form = SetupNewForm(editorialForm);
                FormSetCombos(editorialForm);
                return ViewEdit();
            }

            catalogoService.SaveEditorial(editorial);

            return RedirectToIndex(String.Format("Editorial {0} ha sido modificada", editorial.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var editorial = catalogoService.GetEditorialById(id);
            editorial.Activo = true;
            editorial.ModificadoPor = CurrentUser();
            catalogoService.SaveEditorial(editorial);

            var form = editorialMapper.Map(editorial);
            
            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var editorial = catalogoService.GetEditorialById(id);
            editorial.Activo = false;
            editorial.ModificadoPor = CurrentUser();
            catalogoService.SaveEditorial(editorial);

            var form = editorialMapper.Map(editorial);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Editorial>(x => x.Nombre, q);
            return Content(data);
        }

        EditorialForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        EditorialForm SetupNewForm(EditorialForm form)
        {
            form = form ?? new EditorialForm();
            
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            form.TipoEditoriales = customCollection.TipoEditorialCustomCollection();

            return form;
        }

        private void FormSetCombos(EditorialForm form)
        {
            ViewData["Pais"] = form.PaisId;
        }
    }
}