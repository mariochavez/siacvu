using System;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos
{
    [HandleError]
    public class DictamenController : BaseController<Dictamen, DictamenForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IDictamenMapper dictamenMapper;
        readonly IDictamenService dictamenService;
        readonly ITipoDictamenMapper tipoDictamenMapper;
        readonly IFondoConacytMapper fondoConacytMapper;
        readonly IEditorialDictamenMapper editorialDictamenMapper;
        readonly IRevistaPublicacionMapper revistaPublicacionMapper;

        public DictamenController(IDictamenService dictamenService,
                                  IDictamenMapper dictamenMapper,
                                  ICatalogoService catalogoService,
                                  IUsuarioService usuarioService,
                                  IEditorialDictamenMapper editorialDictamenMapper,
                                  ITipoDictamenMapper tipoDictamenMapper,
                                  IFondoConacytMapper fondoConacytMapper,
                                  IRevistaPublicacionMapper revistaPublicacionMapper,
                                  ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.editorialDictamenMapper = editorialDictamenMapper;
            this.catalogoService = catalogoService;
            this.dictamenService = dictamenService;
            this.dictamenMapper = dictamenMapper;
            this.fondoConacytMapper = fondoConacytMapper;
            this.revistaPublicacionMapper = revistaPublicacionMapper;
            this.tipoDictamenMapper = tipoDictamenMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var dictamens = new Dictamen[] { };

            if (User.IsInRole("Investigadores"))
                dictamens = dictamenService.GetAllDictamenes(CurrentUser());
            if (User.IsInRole("DGAA"))
                dictamens = dictamenService.GetAllDictamenes();

            data.List = dictamenMapper.Map(dictamens);

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            if (CurrentInvestigador() == null)
                return NoInvestigadorProfile("Por tal motivo no puede crear nuevos productos.");

            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
            
            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var dictamen = dictamenService.GetDictamenById(id);

            if (dictamen == null)
                return RedirectToIndex("no ha sido encontrado", true);

            if (dictamen.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var dictamenForm = dictamenMapper.Map(dictamen);

            data.Form = SetupNewForm(dictamenForm);
            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var dictamen = dictamenService.GetDictamenById(id);

            var dictamenForm = dictamenMapper.Map(dictamen);

            data.Form = SetupShowForm(dictamenForm);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create([Bind(Prefix = "Editorial")] EditorialProductoForm[] editorial,
                                    DictamenForm form)
        {
            editorial = editorial ?? new EditorialProductoForm[] { };

            var dictamen = dictamenMapper.Map(form, CurrentUser(), CurrentInvestigador(), editorial);

            if (!IsValidateModel(dictamen, form, Title.New, "Dictamen"))
            {
                var dictamenForm = dictamenMapper.Map(dictamen);

                ((GenericViewData<DictamenForm>)ViewData.Model).Form = SetupNewForm(dictamenForm);
                return ViewNew();
            }

            dictamenService.SaveDictamen(dictamen);

            return RedirectToIndex(String.Format("Dictamen {0} ha sido creado", dictamen.Nombre));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(DictamenForm form)
        {
            var dictamen = dictamenMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(dictamen, form, Title.Edit))
            {
                var dictamenForm = dictamenMapper.Map(dictamen);

                ((GenericViewData<DictamenForm>) ViewData.Model).Form = SetupNewForm(dictamenForm);
                FormSetCombos(dictamenForm);
                return ViewEdit();
            }

            dictamenService.SaveDictamen(dictamen);

            return RedirectToIndex(String.Format("Dictamen {0} ha sido modificado", dictamen.Nombre));
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewEditorial(int id)
        {
            var dictamen = dictamenService.GetDictamenById(id);

            var form = new EditorialForm { Controller = "Dictamen", IdName = "DictamenId" };

            if (dictamen != null)
                form.Id = dictamen.Id;

            return Rjs("NewEditorial", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddEditorial([Bind(Prefix = "Editorial")] EditorialProductoForm form, int dictamenId)
        {
            var editorialDictamen = editorialDictamenMapper.Map(form);

            ModelState.AddModelErrors(editorialDictamen.ValidationResults(), false, "Editorial", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (dictamenId != 0)
            {
                editorialDictamen.CreadoPor = CurrentUser();
                editorialDictamen.ModificadoPor = CurrentUser();

                var dictamen = dictamenService.GetDictamenById(dictamenId);

                var alreadyHasIt =
                    dictamen.EditorialDictamenes.Where(
                        x => x.Editorial.Id == editorialDictamen.Editorial.Id).Count();

                if (alreadyHasIt == 0)
                {
                    dictamen.AddEditorial(editorialDictamen);
                    dictamenService.SaveDictamen(dictamen);
                }
            }

            var editorialDictamenForm = editorialDictamenMapper.Map(editorialDictamen);
            editorialDictamenForm.ParentId = dictamenId;

            return Rjs("AddEditorial", editorialDictamenForm);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteEditorial(int id, int editorialId)
        {
            var dictamen = dictamenService.GetDictamenById(id);

            if (dictamen != null)
            {
                var editorial = dictamen.EditorialDictamenes.Where(x => x.Editorial.Id == editorialId).First();
                dictamen.DeleteEditorial(editorial);

                dictamenService.SaveDictamen(dictamen);
            }

            var form = new EditorialForm { ModelId = id, EditorialId = editorialId };

            return Rjs("DeleteEditorial", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Dictamen>(x => x.TipoDictamen, q);
            return Content(data);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeRevista(int select)
        {
            var revistaForm = revistaPublicacionMapper.Map(catalogoService.GetRevistaPublicacionById(select));

            var form = new ShowFieldsForm
            {
                RevistaPublicacionId = revistaForm.Id,

                RevistaPublicacionInstitucionNombre = revistaForm.InstitucionNombre,
                RevistaPublicacionPaisNombre = revistaForm.PaisNombre,
                RevistaPublicacionIndice1Nombre = revistaForm.Indice1Nombre,
                RevistaPublicacionIndice2Nombre = revistaForm.Indice2Nombre,
                RevistaPublicacionIndice3Nombre = revistaForm.Indice3Nombre
            };

            return Rjs("ChangeRevista", form);
        }

        DictamenForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        DictamenForm SetupNewForm(DictamenForm form)
        {
            form = form ?? new DictamenForm();

            form.TiposDictamenes = tipoDictamenMapper.Map(catalogoService.GetActiveTipoDictamenes());
            form.FondosConacyt = fondoConacytMapper.Map(catalogoService.GetActiveFondoConacyts());
            
            return form;
        }

        void FormSetCombos(DictamenForm form)
        {
            ViewData["TipoDictamen"] = form.TipoDictamenId;
            ViewData["FondoConacyt"] = form.FondoConacytId;
        }

        private DictamenForm SetupShowForm(DictamenForm form)
        {
            form = form ?? new DictamenForm();

            form.ShowFields = new ShowFieldsForm
            {
                RevistaPublicacionTitulo = form.RevistaPublicacion.Titulo,
                RevistaPublicacionInstitucionNombre = form.RevistaPublicacion.InstitucionNombre,
                RevistaPublicacionPaisNombre = form.RevistaPublicacion.PaisNombre,
                RevistaPublicacionIndice1Nombre = form.RevistaPublicacion.Indice1Nombre,
                RevistaPublicacionIndice2Nombre = form.RevistaPublicacion.Indice2Nombre,
                RevistaPublicacionIndice3Nombre = form.RevistaPublicacion.Indice3Nombre,
                
                IsShowForm = true,
                RevistaLabel = "Nombre de la revista"
            };

            return form;
        }
    }
}