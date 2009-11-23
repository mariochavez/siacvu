using System;
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
        readonly IParticipacionMedioMapper participacionMedioMapper;
        readonly IParticipacionMedioService participacionMedioService;
        readonly IDirigidoAMapper dirigidoAMapper;
        readonly IAreaTematicaMapper areaTematicaMapper;
        readonly ITipoParticipacionMapper tipoParticipacionMapper;

        public ParticipacionMedioController(IParticipacionMedioService participacionMedioService,
                                            IParticipacionMedioMapper participacionMedioMapper,
                                            ICatalogoService catalogoService,
                                            IUsuarioService usuarioService,
                                            IAmbitoMapper ambitoMapper,
                                            ITipoParticipacionMapper tipoParticipacionMapper,
                                            IAreaTematicaMapper areaTematicaMapper,
                                            IDirigidoAMapper dirigidoAMapper,
                                            ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.areaTematicaMapper = areaTematicaMapper;
            this.tipoParticipacionMapper = tipoParticipacionMapper;
            this.participacionMedioService = participacionMedioService;
            this.participacionMedioMapper = participacionMedioMapper;
            this.ambitoMapper = ambitoMapper;
            this.dirigidoAMapper = dirigidoAMapper;
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
            var participacionMedio = participacionMedioMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(participacionMedio, form, Title.New, "ParticipacionMedio"))
            {
                var participacionMedioForm = participacionMedioMapper.Map(participacionMedio);

                ((GenericViewData<ParticipacionMedioForm>)ViewData.Model).Form = SetupNewForm(participacionMedioForm);
                return ViewNew();
            }

            participacionMedioService.SaveParticipacionMedio(participacionMedio);

            return RedirectToIndex(String.Format("Participación en Medio {0} ha sido creada", participacionMedio.Titulo));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ParticipacionMedioForm form)
        {
            var participacionMedio = participacionMedioMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(participacionMedio, form, Title.Edit))
            {
                var participacionMedioForm = participacionMedioMapper.Map(participacionMedio);

                ((GenericViewData<ParticipacionMedioForm>) ViewData.Model).Form = SetupNewForm(participacionMedioForm);
                FormSetCombos(participacionMedioForm);
                return ViewEdit();
            }

            participacionMedioService.SaveParticipacionMedio(participacionMedio);

            return RedirectToIndex(String.Format("Participación en Medio {0} ha sido modificada", participacionMedio.Titulo));
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<ParticipacionMedio>(x => x.Titulo, q);
            return Content(data);
        }

        ParticipacionMedioForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        ParticipacionMedioForm SetupNewForm(ParticipacionMedioForm form)
        {
            form = form ?? new ParticipacionMedioForm();

            form.Ambitos = ambitoMapper.Map(catalogoService.GetActiveAmbitos());
            form.DirigidosA = dirigidoAMapper.Map(catalogoService.GetActiveDirigidoAs());
            form.TiposParticipaciones = tipoParticipacionMapper.Map(catalogoService.GetTipoParticipacionParticipacionMedios());
            form.AreasTematicas = areaTematicaMapper.Map(catalogoService.GetActiveAreaTematicas());

            return form;
        }

        void FormSetCombos(ParticipacionMedioForm form)
        {
            ViewData["Ambito"] = form.AmbitoId;
            ViewData["DirigidoA"] = form.DirigidoAId;
            ViewData["TipoParticipacion"] = form.TipoParticipacionId;
            ViewData["AreaTematicaId"] = form.AreaTematicaId;
        }
    }
}