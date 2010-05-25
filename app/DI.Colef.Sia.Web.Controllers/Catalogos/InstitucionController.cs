using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    public class InstitucionController : BaseController<Institucion, InstitucionForm>
    {
        readonly IEstadoPaisMapper estadoPaisMapper;
        readonly IAmbitoMapper ambitoMapper;
        readonly ISectorMapper sectorMapper;

        public InstitucionController(IUsuarioService usuarioService,
                                    ICatalogoService catalogoService,
                                    IInstitucionMapper institucionMapper,
                                    ISearchService searchService,
                                    IEstadoPaisMapper estadoPaisMapper,
                                    IAmbitoMapper ambitoMapper,
                                    ISectorMapper sectorMapper,
                                    IPaisMapper paisMapper)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.institucionMapper = institucionMapper;
            this.paisMapper = paisMapper;
            this.estadoPaisMapper = estadoPaisMapper;
            this.ambitoMapper = ambitoMapper;
            this.sectorMapper = sectorMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<InstitucionForm>();

            var institucions = catalogoService.GetAllInstituciones();
            data.List = institucionMapper.Map(institucions);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = new GenericViewData<InstitucionForm> {Form = SetupNewForm()};
            ViewData["Pais"] = (from p in data.Form.Paises where p.Nombre == "México" select p.Id).FirstOrDefault();

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<InstitucionForm>();

            var institucion = catalogoService.GetInstitucionById(id);
            var institucionForm = institucionMapper.Map(institucion);

            data.Form = SetupNewForm(institucionForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = new GenericViewData<InstitucionForm>();

            var institucion = catalogoService.GetInstitucionById(id);
            data.Form = institucionMapper.Map(institucion);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(InstitucionForm form)
        {
            var institucion = institucionMapper.Map(form);

            institucion.CreadoPor = CurrentUser();
            institucion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(institucion, form, Title.New))
            {
                var institucionForm = institucionMapper.Map(institucion);

                ((GenericViewData<InstitucionForm>)ViewData.Model).Form = SetupNewForm(institucionForm);
                return ViewNew();
            }

            catalogoService.SaveInstitucion(institucion);

            return RedirectToIndex(String.Format("Institución {0} ha sido creada", institucion.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(InstitucionForm form)
        {
            var institucion = institucionMapper.Map(form);

            institucion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(institucion, form, Title.Edit))
            {
                var institucionForm = institucionMapper.Map(institucion);

                ((GenericViewData<InstitucionForm>)ViewData.Model).Form = SetupNewForm(institucionForm);
                FormSetCombos(institucionForm);
                return ViewEdit();
            }

            catalogoService.SaveInstitucion(institucion);

            return RedirectToIndex(String.Format("Institución {0} ha sido modificada", institucion.Nombre));
        }
        
        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangePais(int select)
        {
            var list = new List<EstadoPaisForm> { new EstadoPaisForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(estadoPaisMapper.Map(catalogoService.GetEstadoPaisesByPaisId(select)));

            var form = new InstitucionForm
            {
                EstadosPaises = list.ToArray()
            };

            return Rjs("ChangePais", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Institucion>(x => x.Nombre, q);
            return Content(data);
        }

        InstitucionForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        InstitucionForm SetupNewForm(InstitucionForm form)
        {
            form = form ?? new InstitucionForm();

            //Lista de Catalogos
            form.Ambitos = ambitoMapper.Map(catalogoService.GetActiveAmbitos());
            form.Sectores = sectorMapper.Map(catalogoService.GetActiveSectoresOrganosExternos());
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            var pais = (from p in form.Paises where p.Nombre == "México" select p.Id).FirstOrDefault();

            if (form.Id == 0)
                form.EstadosPaises = estadoPaisMapper.Map(catalogoService.GetEstadoPaisesByPaisId(pais));
            else
                form.EstadosPaises = estadoPaisMapper.Map(catalogoService.GetEstadoPaisesByPaisId(form.PaisId));

            return form;
        }

        private void FormSetCombos(InstitucionForm form)
        {
            ViewData["Pais"] = form.PaisId;
            ViewData["EstadoPais"] = form.EstadoPaisId;
            ViewData["Ambito"] = form.AmbitoId;
            ViewData["Sector"] = form.SectorId;
        }
    }
}