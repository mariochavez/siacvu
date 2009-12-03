using System;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    public class RevistaPublicacionController : BaseController<RevistaPublicacion, RevistaPublicacionForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IRevistaPublicacionMapper revistaPublicacionMapper;
        readonly IPaisMapper paisMapper;
        readonly ICustomCollection customCollection;
        readonly IAreaInvestigacionMapper areaInvestigacionMapper;
        readonly IIndiceMapper indiceMapper;

        public RevistaPublicacionController(IUsuarioService usuarioService,
                                        ICatalogoService catalogoService,
                                        ICustomCollection customCollection,
                                        IAreaInvestigacionMapper areaInvestigacionMapper,
                                        IRevistaPublicacionMapper revistaPublicacionMapper,
                                        ISearchService searchService, IPaisMapper paisMapper,
                                        IIndiceMapper indiceMapper)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.customCollection = customCollection;
            this.areaInvestigacionMapper = areaInvestigacionMapper;
            this.revistaPublicacionMapper = revistaPublicacionMapper;
            this.paisMapper = paisMapper;
            this.indiceMapper = indiceMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var revistaPublicacions = catalogoService.GetAllRevistaPublicaciones();
            data.List = revistaPublicacionMapper.Map(revistaPublicacions);

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

            var revistaPublicacion = catalogoService.GetRevistaPublicacionById(id);
            var revistaPublicacionForm = revistaPublicacionMapper.Map(revistaPublicacion);

            data.Form = SetupNewForm(revistaPublicacionForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var revistaPublicacion = catalogoService.GetRevistaPublicacionById(id);
            data.Form = revistaPublicacionMapper.Map(revistaPublicacion);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(RevistaPublicacionForm form)
        {
            var revistaPublicacion = revistaPublicacionMapper.Map(form);

            revistaPublicacion.CreadoPor = CurrentUser();
            revistaPublicacion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(revistaPublicacion, form, Title.New))
            {
                var revistaPublicacionForm = revistaPublicacionMapper.Map(revistaPublicacion);

                ((GenericViewData<RevistaPublicacionForm>)ViewData.Model).Form = SetupNewForm(revistaPublicacionForm);
                return ViewNew();
            }

            catalogoService.SaveRevistaPublicacion(revistaPublicacion);

            return RedirectToIndex(String.Format("Revista de publicación {0} ha sido creada", revistaPublicacion.Titulo));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(RevistaPublicacionForm form)
        {
            var revistaPublicacion = revistaPublicacionMapper.Map(form);

            revistaPublicacion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(revistaPublicacion, form, Title.Edit))
            {
                var revistaPublicacionForm = revistaPublicacionMapper.Map(revistaPublicacion);

                ((GenericViewData<RevistaPublicacionForm>)ViewData.Model).Form = SetupNewForm(revistaPublicacionForm);
                FormSetCombos(revistaPublicacionForm);
                return ViewEdit();
            }

            catalogoService.SaveRevistaPublicacion(revistaPublicacion);

            return RedirectToIndex(String.Format("Revista de publicación {0} ha sido modificada", revistaPublicacion.Titulo));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var revistaPublicacion = catalogoService.GetRevistaPublicacionById(id);
            revistaPublicacion.Activo = true;
            revistaPublicacion.ModificadoPor = CurrentUser();
            catalogoService.SaveRevistaPublicacion(revistaPublicacion);

            var form = revistaPublicacionMapper.Map(revistaPublicacion);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var revistaPublicacion = catalogoService.GetRevistaPublicacionById(id);
            revistaPublicacion.Activo = false;
            revistaPublicacion.ModificadoPor = CurrentUser();
            catalogoService.SaveRevistaPublicacion(revistaPublicacion);

            var form = revistaPublicacionMapper.Map(revistaPublicacion);

            return Rjs("Activate", form);
        }

        [Authorize] 
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<RevistaPublicacion>(x => x.Titulo, q);
            return Content(data);
        }

        RevistaPublicacionForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        RevistaPublicacionForm SetupNewForm(RevistaPublicacionForm form)
        {
            form = form ?? new RevistaPublicacionForm();

            //Lista de Catalogos
            form.Periodicidades = customCollection.PeriodicidadCustomCollection();
            form.TipoRevistas = customCollection.TipoRevistaCustomCollection();
            form.ClasificacionesSieva = customCollection.ClasificacionSievaCustomCollection();
            form.FormatoRevistas = customCollection.FormatoRevistaCustomCollection();

            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            form.AreasInvestigacion = areaInvestigacionMapper.Map(catalogoService.GetActiveAreaInvestigacions());
            form.Indices1 = indiceMapper.Map(catalogoService.GetActiveIndices());
            form.Indices2 = indiceMapper.Map(catalogoService.GetActiveIndices());
            form.Indices3 = indiceMapper.Map(catalogoService.GetActiveIndices());
            form.Indices4 = indiceMapper.Map(catalogoService.GetActiveIndices());

            return form;
        }

        private void FormSetCombos(RevistaPublicacionForm form)
        {
            ViewData["Periodicidad"] = form.Periodicidad;
            ViewData["TipoRevista"] = form.TipoRevista;
            ViewData["ClasificacionSieva"] = form.ClasificacionSieva;
            ViewData["FormatoRevista"] = form.FormatoRevista;
            ViewData["Pais"] = form.PaisId;
            ViewData["Indice1"] = form.Indice1Id;
            ViewData["Indice2"] = form.Indice2Id;
            ViewData["Indice3"] = form.Indice3Id;
            ViewData["Indice4"] = form.Indice4Id;
            ViewData["AreaInvestigacion"] = form.AreaInvestigacionId;
        }
    }
}