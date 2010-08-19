using System;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Security;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos
{
    [HandleError]
    public class DictamenController : BaseController<Dictamen, DictamenForm>
    {
        readonly IDictamenMapper dictamenMapper;
        readonly IDictamenService dictamenService;
        readonly IEditorialProductoMapper<EditorialDictamen> editorialDictamenMapper;
        readonly IFondoConacytMapper fondoConacytMapper;
        readonly IProductoService productoService;
        readonly IRevistaPublicacionMapper revistaPublicacionMapper;
        readonly ITipoDictamenMapper tipoDictamenMapper;

        public DictamenController(IDictamenService dictamenService,
                                  IDictamenMapper dictamenMapper,
                                  ICatalogoService catalogoService,
                                  IArchivoService archivoService,
                                  IUsuarioService usuarioService,
                                  IEditorialProductoMapper<EditorialDictamen> editorialDictamenMapper,
                                  ITipoDictamenMapper tipoDictamenMapper,
                                  IFondoConacytMapper fondoConacytMapper,
                                  IRevistaPublicacionMapper revistaPublicacionMapper,
                                  ISearchService searchService, IPaisMapper paisMapper,
                                  IProductoService productoService)
            : base(usuarioService, searchService, catalogoService)
        {
            base.catalogoService = catalogoService;
            base.paisMapper = paisMapper;

            this.editorialDictamenMapper = editorialDictamenMapper;
            this.dictamenService = dictamenService;
            this.dictamenMapper = dictamenMapper;
            this.fondoConacytMapper = fondoConacytMapper;
            this.revistaPublicacionMapper = revistaPublicacionMapper;
            this.productoService = productoService;
            this.tipoDictamenMapper = tipoDictamenMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<DictamenForm>();
            var productos = productoService.GetProductosByUsuario<Dictamen>(CurrentUser(), x => x.Nombre,
                                                                            x => x.TipoDictamen);
            data.ProductList = productos;

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            if (CurrentInvestigador() == null)
                return NoInvestigadorProfile("Por tal motivo no puede crear nuevos productos.");

            var data = new GenericViewData<DictamenForm> {Form = SetupNewForm()};

            return View(data);
        }

        [Authorize(Roles = "Investigadores, DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<DictamenForm>();

            var dictamen = dictamenService.GetDictamenById(id);

            if (dictamen.Firma.Aceptacion1 == 1 && dictamen.Firma.Aceptacion2 == 0 && User.IsInRole("Investigadores"))
                return
                    RedirectToHomeIndex(String.Format("El dictamen {0} esta en firma y no puede ser editado",
                                                      dictamen.Nombre));

            if (User.IsInRole("DGAA"))
            {
                if ((dictamen.Firma.Aceptacion1 == 1 && dictamen.Firma.Aceptacion2 == 1) ||
                    (dictamen.Firma.Aceptacion1 == 0 && dictamen.Firma.Aceptacion2 == 0) ||
                    (dictamen.Firma.Aceptacion1 == 0 && dictamen.Firma.Aceptacion2 == 2)
                    )
                    return
                        RedirectToHomeIndex(String.Format(
                            "El dictamen {0} ya fue aceptado o no ha sido enviado a firma",
                            dictamen.Nombre));
            }

            if (User.IsInRole("Investigadores"))
            {
                if (dictamen.Usuario.Id != CurrentUser().Id)
                    return RedirectToHomeIndex("no lo puede modificar");
            }

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
            var data = new GenericViewData<DictamenForm>();

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
            editorial = editorial ?? new EditorialProductoForm[] {};

            var dictamen = dictamenMapper.Map(form, CurrentUser(), CurrentInvestigador(), editorial);
            ModelState.AddModelErrors(dictamen.ValidationResults(), true, "Dictamen");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            dictamenService.SaveDictamen(dictamen);
            SetMessage(String.Format("Dictamen {0} ha sido registrado", dictamen.Nombre));

            return Rjs("Save", dictamen.Id);
        }

        [Authorize]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(DictamenForm form)
        {
            var dictamen = new Dictamen();

            if (User.IsInRole("Investigadores"))
                dictamen = dictamenMapper.Map(form, CurrentUser(), CurrentInvestigador());
            if (User.IsInRole("DGAA"))
                dictamen = dictamenMapper.Map(form, CurrentUser());

            ModelState.AddModelErrors(dictamen.ValidationResults(), true, "Dictamen");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            dictamenService.SaveDictamen(dictamen, true);
            SetMessage(String.Format("Dictamen {0} ha sido modificado", dictamen.Nombre));

            return Rjs("Save", dictamen.Id);
        }

        [CookieLessAuthorize]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddFile(FormCollection form)
        {
            var id = Convert.ToInt32(form["Id"]);
            var dictamen = dictamenService.GetDictamenById(id);

            var archivo = MapArchivo<ArchivoDictamen>();
            dictamen.AddArchivo(archivo);

            dictamenService.SaveDictamen(dictamen);

            return Content("Uploaded");
        }

        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DgaaValidateProduct(FirmaForm firmaForm)
        {
            var dictamen = dictamenService.GetDictamenById(firmaForm.ProductoId);

            dictamen.Firma.Aceptacion2 = 1;
            dictamen.Firma.Usuario2 = CurrentUser();

            dictamenService.SaveDictamen(dictamen);

            var data = new FirmaForm
                           {
                               TipoProducto = firmaForm.TipoProducto,
                               Aceptacion2 = 1
                           };

            return Rjs("DgaaSign", data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DgaaRejectProduct(FirmaForm firmaForm)
        {
            var dictamen = dictamenService.GetDictamenById(firmaForm.ProductoId);
            dictamen.Firma.Aceptacion1 = 0;
            dictamen.Firma.Aceptacion2 = 2;
            dictamen.Firma.Descripcion = firmaForm.Descripcion;
            dictamen.Firma.Usuario1 = CurrentUser();
            dictamen.Firma.Usuario2 = CurrentUser();

            ModelState.AddModelErrors(dictamen.ValidationResults(), false, "Firma");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            dictamenService.SaveDictamen(dictamen, true);

            var data = new FirmaForm
                           {
                               TipoProducto = firmaForm.TipoProducto,
                               Aceptacion2 = 2
                           };

            return Rjs("DgaaSign", data);
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

        static DictamenForm SetupShowForm(DictamenForm form)
        {
            form = form ?? new DictamenForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      RevistaPublicacionTitulo = form.RevistaPublicacion.Titulo,
                                      RevistaPublicacionInstitucionNombre = form.RevistaPublicacion.InstitucionNombre,
                                      RevistaPublicacionIndice1Nombre = form.RevistaPublicacion.Indice1Nombre,
                                      RevistaPublicacionIndice2Nombre = form.RevistaPublicacion.Indice2Nombre,
                                      RevistaPublicacionIndice3Nombre = form.RevistaPublicacion.Indice3Nombre,
                                      IsShowForm = true,
                                      RevistaLabel = "Nombre de la revista"
                                  };

            return form;
        }

        protected override void DeleteEditorialInModel(Dictamen model, int editorialId)
        {
            if (model != null)
            {
                var editorial = model.EditorialDictamenes.Where(x => x.Id == editorialId).First();
                model.DeleteEditorial(editorial);

                dictamenService.SaveDictamen(model);
            }
        }

        protected override bool SaveEditorialToModel(Dictamen model, EditorialProducto editorialProducto)
        {
            var editorialId = editorialProducto.Editorial != null ? editorialProducto.Editorial.Id : 0;

            var alreadyHasIt =
                model.EditorialDictamenes.Where(
                    x => ((x.Editorial != null && editorialId > 0 && x.Editorial.Id == editorialId) ||
                          (x.EditorialNombre == editorialProducto.EditorialNombre))
                         && x.Pais.Id == editorialProducto.Pais.Id).Count();

            if (alreadyHasIt == 0)
            {
                model.AddEditorial(editorialProducto);
                dictamenService.SaveDictamen(model, true);
            }

            return alreadyHasIt == 0;
        }

        protected override EditorialProducto MapEditorialMessage(EditorialProductoForm form)
        {
            return editorialDictamenMapper.Map(form);
        }

        protected override EditorialProductoForm MapEditorialModel(EditorialProducto model, int parentId)
        {
            var editorialDictamenForm = editorialDictamenMapper.Map(model as EditorialDictamen);
            editorialDictamenForm.ParentId = parentId;

            return editorialDictamenForm;
        }

        protected override Dictamen GetModelById(int id)
        {
            return dictamenService.GetDictamenById(id);
        }
    }
}