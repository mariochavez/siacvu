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
    public class EventoController : BaseController<Evento, EventoForm>
    {
        readonly IAmbitoMapper ambitoMapper;
        readonly ICatalogoService catalogoService;
        readonly ICoautorExternoEventoMapper coautorExternoEventoMapper;
        readonly ICoautorInternoEventoMapper coautorInternoEventoMapper;
        readonly IEventoMapper eventoMapper;
        readonly IEventoService eventoService;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly IInvestigadorMapper investigadorMapper;
        readonly IInvestigadorService investigadorService;
        readonly ITipoEventoMapper tipoEventoMapper;
        readonly ITipoFinanciamientoMapper tipoFinanciamientoMapper;
        readonly ITipoParticipacionMapper tipoParticipacionMapper;
        readonly IEstadoPaisMapper estadoPaisMapper;
        readonly IPaisMapper paisMapper;

        public EventoController(IEventoService eventoService, IEventoMapper eventoMapper,
                                ICatalogoService catalogoService,
                                IEstadoPaisMapper estadoPaisMapper,
                                IPaisMapper paisMapper,
                                IUsuarioService usuarioService, IAmbitoMapper ambitoMapper,
                                ITipoEventoMapper tipoEventoMapper,
                                ITipoParticipacionMapper tipoParticipacionMapper,
                                IInvestigadorExternoMapper investigadorExternoMapper,
                                IInvestigadorMapper investigadorMapper,
                                ITipoFinanciamientoMapper tipoFinanciamientoMapper,
                                IInvestigadorService investigadorService,
                                ICoautorExternoEventoMapper coautorExternoEventoMapper,
                                ICoautorInternoEventoMapper coautorInternoEventoMapper,
                                ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.estadoPaisMapper = estadoPaisMapper;
            this.paisMapper = paisMapper;
            this.investigadorService = investigadorService;
            this.eventoService = eventoService;
            this.eventoMapper = eventoMapper;
            this.ambitoMapper = ambitoMapper;
            this.tipoEventoMapper = tipoEventoMapper;
            this.tipoParticipacionMapper = tipoParticipacionMapper;
            this.investigadorExternoMapper = investigadorExternoMapper;
            this.investigadorMapper = investigadorMapper;
            this.tipoFinanciamientoMapper = tipoFinanciamientoMapper;
            this.coautorExternoEventoMapper = coautorExternoEventoMapper;
            this.coautorInternoEventoMapper = coautorInternoEventoMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var eventos = new Evento[] { };

            if (User.IsInRole("Investigadores"))
                eventos = eventoService.GetAllEventos(CurrentUser());
            if (User.IsInRole("DGAA"))
                eventos = eventoService.GetAllEventos();

            data.List = eventoMapper.Map(eventos);

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
            data.Form.PeriodoReferenciaPeriodo = CurrentPeriodo().Periodo;
            ViewData["Pais"] = (from p in data.Form.Paises where p.Nombre == "México" select p.Id).FirstOrDefault();

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var evento = eventoService.GetEventoById(id);

            if (evento == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (evento.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var eventoForm = eventoMapper.Map(evento);

            data.Form = SetupNewForm(eventoForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var evento = eventoService.GetEventoById(id);
            data.Form = eventoMapper.Map(evento);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(EventoForm form,
                                   FormCollection formCollection)
        {
            var coautoresExternos = new string[] {};
            var coautoresInternos = new string[] {};

            if (formCollection["CoautorExternoEvento.InvestigadorExternoId_New"] != null &&
                formCollection["CoautorExternoEvento.InvestigadorExternoId_New"].Split(',').Length > 0)
                coautoresExternos = formCollection["CoautorExternoEvento.InvestigadorExternoId_New"].Split(',');

            if (formCollection["CoautorInternoEvento.InvestigadorId_New"] != null &&
                formCollection["CoautorInternoEvento.InvestigadorId_New"].Split(',').Length > 0)
                coautoresInternos = formCollection["CoautorInternoEvento.InvestigadorId_New"].Split(',');

            var evento = eventoMapper.Map(form, CurrentUser(), CurrentPeriodo(),
                                          coautoresExternos, coautoresInternos);

            if (!IsValidateModel(evento, form, Title.New, "Evento"))
            {
                var eventoForm = eventoMapper.Map(evento);

                ((GenericViewData<EventoForm>)ViewData.Model).Form = SetupNewForm(eventoForm);
                return ViewNew();
            }

            eventoService.SaveEvento(evento);

            return RedirectToIndex(String.Format("Evento {0} ha sido creado", evento.Nombre));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(EventoForm form)
        {
            var evento = eventoMapper.Map(form, CurrentUser(), CurrentPeriodo());

            if (!IsValidateModel(evento, form, Title.Edit))
            {
                var eventoForm = eventoMapper.Map(evento);

                ((GenericViewData<EventoForm>) ViewData.Model).Form = SetupNewForm(eventoForm);
                FormSetCombos(eventoForm);
                return ViewEdit();
            }

            eventoService.SaveEvento(evento);

            return RedirectToIndex(String.Format("Evento {0} ha sido modificado", evento.Nombre));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var evento = eventoService.GetEventoById(id);

            if (evento.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            evento.Activo = true;
            evento.ModificadoPor = CurrentUser();
            eventoService.SaveEvento(evento);

            var form = eventoMapper.Map(evento);

            return Rjs(form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var evento = eventoService.GetEventoById(id);

            if (evento.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            evento.Activo = false;
            evento.ModificadoPor = CurrentUser();
            eventoService.SaveEvento(evento);

            var form = eventoMapper.Map(evento);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Evento>(x => x.Nombre, q);
            return Content(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorInterno(int id)
        {
            var evento = eventoService.GetEventoById(id);
            var form = new EventoForm();

            if (evento != null)
                form.Id = evento.Id;

            form.CoautorInternoEvento = new CoautorInternoEventoForm();
            form.CoautoresInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());

            return Rjs("NewCoautorInterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorInterno([Bind(Prefix = "CoautorInternoEvento")] CoautorInternoEventoForm form,
                                              int eventoId)
        {
            var coautorInternoEvento = coautorInternoEventoMapper.Map(form);

            ModelState.AddModelErrors(coautorInternoEvento.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            coautorInternoEvento.CreadorPor = CurrentUser();
            coautorInternoEvento.ModificadoPor = CurrentUser();

            if (eventoId != 0)
            {
                var evento = eventoService.GetEventoById(eventoId);
                evento.AddCoautorInterno(coautorInternoEvento);
                eventoService.SaveEvento(evento);
            }

            var coautorInternoEventoForm = coautorInternoEventoMapper.Map(coautorInternoEvento);

            return Rjs("AddCoautorInterno", coautorInternoEventoForm);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id)
        {
            var evento = eventoService.GetEventoById(id);
            var form = new EventoForm();

            if (evento != null)
                form.Id = evento.Id;

            form.CoautorExternoEvento = new CoautorExternoEventoForm();
            form.CoautoresExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());

            return Rjs("NewCoautorExterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorExterno([Bind(Prefix = "CoautorExternoEvento")] CoautorExternoEventoForm form,
                                              int eventoId)
        {
            CoautorExternoEventoForm coautorExternoEventoForm;
            var coautorExternoEvento = coautorExternoEventoMapper.Map(form);

            ModelState.AddModelErrors(coautorExternoEvento.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            coautorExternoEvento.CreadorPor = CurrentUser();
            coautorExternoEvento.ModificadoPor = CurrentUser();

            if (eventoId != 0)
            {
                var evento = eventoService.GetEventoById(eventoId);
                foreach (var coautorExterno in evento.CoautorExternoEventos)
                {
                    if (coautorExterno.InvestigadorExterno.Id == coautorExternoEvento.InvestigadorExterno.Id)
                    {
                        coautorExternoEventoForm = coautorExternoEventoMapper.Map(coautorExternoEvento);
                        return Rjs("AddCoautorExterno", coautorExternoEventoForm);
                    }
                }

                evento.AddCoautorExterno(coautorExternoEvento);
                eventoService.SaveEvento(evento);
            }

            coautorExternoEventoForm = coautorExternoEventoMapper.Map(coautorExternoEvento);

            return Rjs("AddCoautorExterno", coautorExternoEventoForm);
        }

        EventoForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        EventoForm SetupNewForm(EventoForm form)
        {
            form = form ?? new EventoForm();
            
            form.CoautorExternoEvento = new CoautorExternoEventoForm();
            form.CoautorInternoEvento = new CoautorInternoEventoForm();

            //Lista de Catalogos Pendientes
            form.Ambitos = ambitoMapper.Map(catalogoService.GetActiveAmbitos());
            form.TiposParticipaciones = tipoParticipacionMapper.Map(catalogoService.GetActiveTipoParticipaciones());
            form.TiposEventos = tipoEventoMapper.Map(catalogoService.GetActiveTipoEventos());
            form.TiposParticipaciones = tipoParticipacionMapper.Map(catalogoService.GetActiveTipoParticipaciones());
            form.CoautoresExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());
            form.CoautoresInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());
            form.TiposFinanciamientos = tipoFinanciamientoMapper.Map(catalogoService.GetActiveTipoFinanciamientos());
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            form.EstadoPaises = estadoPaisMapper.Map(catalogoService.GetActiveEstadoPaises());

            return form;
        }

        void FormSetCombos(EventoForm form)
        {
            ViewData["Ambito"] = form.AmbitoId;
            ViewData["TipoEvento"] = form.TipoEventoId;
            ViewData["TipoFinanciamiento"] = form.TipoFinanciamientoId;
            ViewData["TipoParticipacion"] = form.TipoParticipacionId;
            ViewData["Pais"] = form.PaisId;
            ViewData["EstadoPais"] = form.EstadoPaisId;
        }
    }
}