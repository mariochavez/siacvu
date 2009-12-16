using System;
using System.Collections.Generic;
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
    public class DistincionController : BaseController<Distincion, DistincionForm>
    {
        readonly IAmbitoMapper ambitoMapper;
        readonly ICatalogoService catalogoService;
        readonly IDistincionMapper distincionMapper;
        readonly IDistincionService distincionService;
        readonly IEstadoPaisMapper estadoPaisMapper;
        readonly IPaisMapper paisMapper;
        readonly ITipoDistincionMapper tipoDistincionMapper;
        readonly IArchivoService archivoService;

        public DistincionController(IDistincionService distincionService, IDistincionMapper distincionMapper,
                                    ICatalogoService catalogoService, IUsuarioService usuarioService,
                                    ITipoDistincionMapper tipoDistincionMapper,
                                    IArchivoService archivoService,
                                    IAmbitoMapper ambitoMapper, IPaisMapper paisMapper,
                                    IEstadoPaisMapper estadoPaisMapper, ISearchService searchService,
                                    IInstitucionMapper institucionMapper, ISedeMapper sedeMapper)
            : base(usuarioService, searchService, catalogoService, institucionMapper, sedeMapper)
        {
            this.catalogoService = catalogoService;
            this.distincionService = distincionService;
            this.distincionMapper = distincionMapper;
            this.tipoDistincionMapper = tipoDistincionMapper;
            this.ambitoMapper = ambitoMapper;
            this.archivoService = archivoService;
            this.paisMapper = paisMapper;
            this.estadoPaisMapper = estadoPaisMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var distincions = new Distincion[] { };

            if (User.IsInRole("Investigadores"))
                distincions = distincionService.GetAllDistinciones(CurrentUser());
            if (User.IsInRole("DGAA"))
                distincions = distincionService.GetAllDistinciones();

            data.List = distincionMapper.Map(distincions);

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

            var distincion = distincionService.GetDistincionById(id);

            if (distincion == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (distincion.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var distincionForm = distincionMapper.Map(distincion);

            data.Form = SetupNewForm(distincionForm);
            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var distincion = distincionService.GetDistincionById(id);

            data.Form = distincionMapper.Map(distincion);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(DistincionForm form)
        {
            var distincion = distincionMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsInternacionalOrBinacional(distincionMapper.Map(distincion).AmbitoNombre, new[] { "Internacional", "Binacional", "" }))
                distincion.Pais = GetDefaultPais();

            ModelState.AddModelErrors(distincion.ValidationResults(), true, "Distincion");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }
            //if (!IsValidateModel(distincion, form, Title.New, "Distincion"))
            //{
            //    var distincionForm = distincionMapper.Map(distincion);

            //    ((GenericViewData<DistincionForm>) ViewData.Model).Form = SetupNewForm(distincionForm);
            //    return ViewNew();
            //}

            distincionService.SaveDistincion(distincion);
            SetMessage(String.Format("Distinción {0} ha sido creada", distincion.Titulo));

            return Rjs("Save", distincion.Id);
        }

        //[CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(DistincionForm form)
        {
            var distincion = distincionMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsInternacionalOrBinacional(distincionMapper.Map(distincion).AmbitoNombre, new[] { "Internacional", "Binacional", "" }))
                distincion.Pais = GetDefaultPais();

            ModelState.AddModelErrors(distincion.ValidationResults(), true, "Distincion");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            //if (!IsValidateModel(distincion, form, Title.Edit))
            //{
            //    var distincionForm = distincionMapper.Map(distincion);
            //    ((GenericViewData<DistincionForm>) ViewData.Model).Form = SetupNewForm(distincionForm);
            //    FormSetCombos(distincionForm);
            //    return ViewEdit();
            //}

            distincionService.SaveDistincion(distincion, true);
            SetMessage(String.Format("Distinción {0} ha sido modificada", distincion.Titulo));

            return Rjs("Save", distincion.Id);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Distincion>(x => x.Titulo, q);
            return Content(data);
        }

        DistincionForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        DistincionForm SetupNewForm(DistincionForm form)
        {
            form = form ?? new DistincionForm();

            form.TiposDistinciones = tipoDistincionMapper.Map(catalogoService.GetActiveTipoDistinciones());
            form.Ambitos = ambitoMapper.Map(catalogoService.GetActiveAmbitos());

            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            if (form.Id == 0)
            {
                var pais = (from p in form.Paises where p.Nombre == "México" select p.Id).FirstOrDefault();
                form.EstadosPaises = estadoPaisMapper.Map(catalogoService.GetEstadoPaisesByPaisId(pais));
            }
            else
                form.EstadosPaises = estadoPaisMapper.Map(catalogoService.GetEstadoPaisesByPaisId(form.PaisId));

            return form;
        }

        void FormSetCombos(DistincionForm form)
        {
            ViewData["TipoDistincion"] = form.TipoDistincionId;
            ViewData["Ambito"] = form.AmbitoId;
            ViewData["Pais"] = form.PaisId;
            ViewData["EstadoPais"] = form.EstadoPaisId;
        }
    }
}