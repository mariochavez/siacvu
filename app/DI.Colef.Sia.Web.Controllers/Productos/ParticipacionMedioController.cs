using System;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos
{
    [HandleError]
    public class ParticipacionMedioController : BaseController<ParticipacionMedio, ParticipacionMedioForm>
    {
        readonly IAmbitoMapper ambitoMapper;
        readonly ICatalogoService catalogoService;
        readonly IEstadoPaisMapper estadoPaisMapper;
        readonly IGeneroMapper generoMapper;
        readonly IMedioElectronicoMapper medioElectronicoMapper;
        readonly IMedioImpresoMapper medioImpresoMapper;
        readonly IPaisMapper paisMapper;
        readonly IParticipacionMedioMapper participacionMedioMapper;
        readonly IParticipacionMedioService participacionMedioService;
        readonly IProyectoMapper proyectoMapper;
        readonly IProyectoService proyectoService;

        public ParticipacionMedioController(IParticipacionMedioService participacionMedioService,
                                            IParticipacionMedioMapper participacionMedioMapper,
                                            ICatalogoService catalogoService,
                                            IUsuarioService usuarioService,
                                            IMedioImpresoMapper medioImpresoMapper,
                                            IMedioElectronicoMapper medioElectronicoMapper,
                                            IGeneroMapper generoMapper,
                                            IProyectoMapper proyectoMapper,
                                            IAmbitoMapper ambitoMapper,
                                            IPaisMapper paisMapper,
                                            IEstadoPaisMapper estadoPaisMapper, ISearchService searchService,
                                            IProyectoService proyectoService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.participacionMedioService = participacionMedioService;
            this.participacionMedioMapper = participacionMedioMapper;
            this.medioImpresoMapper = medioImpresoMapper;
            this.medioElectronicoMapper = medioElectronicoMapper;
            this.generoMapper = generoMapper;
            this.proyectoMapper = proyectoMapper;
            this.ambitoMapper = ambitoMapper;
            this.paisMapper = paisMapper;
            this.estadoPaisMapper = estadoPaisMapper;
            this.proyectoService = proyectoService;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var participacionMedios = new ParticipacionMedio[] { };

            if (User.IsInRole("Investigadores"))
                participacionMedios = participacionMedioService.GetAllParticipacionMedios(CurrentUser());
            if (User.IsInRole("DGAA"))
                participacionMedios = participacionMedioService.GetAllParticipacionMedios();

            data.List = participacionMedioMapper.Map(participacionMedios);

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
            ViewData["Pais"] = (from p in data.Form.Paises where p.Nombre == "México" select p.Id).FirstOrDefault();
            data.Form.PeriodoReferenciaPeriodo = CurrentPeriodo().Periodo;

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var participacionMedio = participacionMedioService.GetParticipacionMedioById(id);
            if (participacionMedio == null)
                return RedirectToIndex("no ha sido encontrado", true);

            if (participacionMedio.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var participacionMedioForm = participacionMedioMapper.Map(participacionMedio);

            data.Form = SetupNewForm(participacionMedioForm);
            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var participacionMedio = participacionMedioService.GetParticipacionMedioById(id);
            data.Form = participacionMedioMapper.Map(participacionMedio);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ParticipacionMedioForm form)
        {
            var participacionMedio = participacionMedioMapper.Map(form, CurrentUser(), CurrentPeriodo());

            if (!IsValidateModel(participacionMedio, form, Title.New, "ParticipacionMedio"))
            {
                var participacionMedioForm = participacionMedioMapper.Map(participacionMedio);

                ((GenericViewData<ParticipacionMedioForm>)ViewData.Model).Form = SetupNewForm(participacionMedioForm);
                return ViewNew();
            }

            participacionMedioService.SaveParticipacionMedio(participacionMedio);

            return RedirectToIndex(String.Format("Participación en Medio {0} ha sido creada", participacionMedio.Nombre));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ParticipacionMedioForm form)
        {
            var participacionMedio = participacionMedioMapper.Map(form, CurrentUser(), CurrentPeriodo());

            if (!IsValidateModel(participacionMedio, form, Title.Edit))
            {
                var participacionMedioForm = participacionMedioMapper.Map(participacionMedio);

                ((GenericViewData<ParticipacionMedioForm>) ViewData.Model).Form = SetupNewForm(participacionMedioForm);
                FormSetCombos(participacionMedioForm);
                return ViewEdit();
            }

            participacionMedioService.SaveParticipacionMedio(participacionMedio);

            return RedirectToIndex(String.Format("Participación en Medio {0} ha sido modificada", participacionMedio.Nombre));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var participacionMedio = participacionMedioService.GetParticipacionMedioById(id);

            if (participacionMedio.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            participacionMedio.Activo = true;
            participacionMedio.ModificadoPor = CurrentUser();
            participacionMedioService.SaveParticipacionMedio(participacionMedio);

            var form = participacionMedioMapper.Map(participacionMedio);

            return Rjs(form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var participacionMedio = participacionMedioService.GetParticipacionMedioById(id);

            if (participacionMedio.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            participacionMedio.Activo = false;
            participacionMedio.ModificadoPor = CurrentUser();
            participacionMedioService.SaveParticipacionMedio(participacionMedio);

            var form = participacionMedioMapper.Map(participacionMedio);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<ParticipacionMedio>(x => x.Nombre, q);
            return Content(data);
        }

        ParticipacionMedioForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        ParticipacionMedioForm SetupNewForm(ParticipacionMedioForm form)
        {
            form = form ?? new ParticipacionMedioForm();

            form.MediosImpresos = medioImpresoMapper.Map(catalogoService.GetActiveMedioImpresos());
            form.MediosElectronicos = medioElectronicoMapper.Map(catalogoService.GetActiveMedioElectronicos());
            form.Generos = generoMapper.Map(catalogoService.GetActiveGeneros());
            form.Proyectos = proyectoMapper.Map(proyectoService.GetActiveProyectos());
            form.Ambitos = ambitoMapper.Map(catalogoService.GetActiveAmbitos());
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            form.EstadosPaises = estadoPaisMapper.Map(catalogoService.GetActiveEstadoPaises());

            return form;
        }

        void FormSetCombos(ParticipacionMedioForm form)
        {
            ViewData["MedioImpreso"] = form.MedioImpresoId;
            ViewData["MedioElectronico"] = form.MedioElectronicoId;
            ViewData["Genero"] = form.GeneroId;
            ViewData["Proyecto"] = form.ProyectoId;
            ViewData["Ambito"] = form.AmbitoId;
            ViewData["Pais"] = form.PaisId;
            ViewData["EstadoPais"] = form.EstadoPaisId;
        }
    }
}