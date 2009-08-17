using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;
using SharpArch.Web.NHibernate;

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
        readonly IInstitucionMapper institucionMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly IInvestigadorMapper investigadorMapper;
        readonly IInvestigadorService investigadorService;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly ITipoEventoMapper tipoEventoMapper;
        readonly ITipoFinanciamientoMapper tipoFinanciamientoMapper;
        readonly ITipoParticipacionEventoMapper tipoParticipacionEventoMapper;
        readonly ITipoParticipacionMapper tipoParticipacionMapper;

        public EventoController(IEventoService eventoService, IEventoMapper eventoMapper,
                                ICatalogoService catalogoService,
                                IUsuarioService usuarioService, IAmbitoMapper ambitoMapper,
                                ITipoEventoMapper tipoEventoMapper,
                                ITipoParticipacionMapper tipoParticipacionMapper,
                                IInvestigadorExternoMapper investigadorExternoMapper,
                                IInvestigadorMapper investigadorMapper, IInstitucionMapper institucionMapper,
                                ILineaTematicaMapper lineaTematicaMapper,
                                ITipoFinanciamientoMapper tipoFinanciamientoMapper,
                                IInvestigadorService investigadorService,
                                ICoautorExternoEventoMapper coautorExternoEventoMapper,
                                ICoautorInternoEventoMapper coautorInternoEventoMapper,
                                ITipoParticipacionEventoMapper tipoParticipacionEventoMapper,
                                ISearchService searchService) : base(usuarioService, searchService)
        {
            this.catalogoService = catalogoService;
            this.investigadorService = investigadorService;
            this.eventoService = eventoService;
            this.eventoMapper = eventoMapper;
            this.ambitoMapper = ambitoMapper;
            this.tipoEventoMapper = tipoEventoMapper;
            this.tipoParticipacionMapper = tipoParticipacionMapper;
            this.investigadorExternoMapper = investigadorExternoMapper;
            this.investigadorMapper = investigadorMapper;
            this.institucionMapper = institucionMapper;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.tipoFinanciamientoMapper = tipoFinanciamientoMapper;
            this.coautorExternoEventoMapper = coautorExternoEventoMapper;
            this.coautorInternoEventoMapper = coautorInternoEventoMapper;
            this.tipoParticipacionEventoMapper = tipoParticipacionEventoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var eventos = eventoService.GetAllEventos();
            data.List = eventoMapper.Map(eventos);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var evento = eventoService.GetEventoById(id);

            if (evento == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (evento.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var eventoForm = eventoMapper.Map(evento);

            data.Form = SetupNewForm(eventoForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var evento = eventoService.GetEventoById(id);
            data.Form = eventoMapper.Map(evento);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(EventoForm form)
        {
            var evento = eventoMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(evento, form, Title.New, "Evento"))
            {
                ((GenericViewData<EventoForm>) ViewData.Model).Form = SetupNewForm();
                return ViewNew();
            }

            eventoService.SaveEvento(evento);

            return RedirectToIndex(String.Format("Evento {0} ha sido creado", evento.Nombre));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(EventoForm form)
        {
            var evento = eventoMapper.Map(form, CurrentUser(), CurrentInvestigador());

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

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var evento = eventoService.GetEventoById(id);

            if (evento.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            evento.Activo = true;
            evento.ModificadoPor = CurrentUser();
            eventoService.SaveEvento(evento);

            var form = eventoMapper.Map(evento);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var evento = eventoService.GetEventoById(id);

            if (evento.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            evento.Activo = false;
            evento.ModificadoPor = CurrentUser();
            eventoService.SaveEvento(evento);

            var form = eventoMapper.Map(evento);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Evento>(x => x.Nombre, q);
            return Content(data);
        }

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

        [Transaction]
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

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorExterno([Bind(Prefix = "CoautorExternoEvento")] CoautorExternoEventoForm form,
                                              int eventoId)
        {
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
                evento.AddCoautorExterno(coautorExternoEvento);
                eventoService.SaveEvento(evento);
            }

            var coautorExternoEventoForm = coautorExternoEventoMapper.Map(coautorExternoEvento);

            return Rjs("AddCoautorExterno", coautorExternoEventoForm);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewTipoParticipacion(int id)
        {
            var evento = eventoService.GetEventoById(id);
            var form = new EventoForm();

            if (evento != null)
                form.Id = evento.Id;

            form.TipoParticipacionEvento = new TipoParticipacionEventoForm();
            form.TiposParticipaciones = tipoParticipacionMapper.Map(catalogoService.GetActiveTipoParticipaciones());

            return Rjs("NewTipoParticipacion", form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddTipoParticipacion(
            [Bind(Prefix = "TipoParticipacionEvento")] TipoParticipacionEventoForm form, int eventoId)
        {
            var tipoParticipacionEvento = tipoParticipacionEventoMapper.Map(form);

            ModelState.AddModelErrors(tipoParticipacionEvento.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            tipoParticipacionEvento.CreadorPor = CurrentUser();
            tipoParticipacionEvento.ModificadoPor = CurrentUser();

            if (eventoId != 0)
            {
                var evento = eventoService.GetEventoById(eventoId);
                evento.AddTipo(tipoParticipacionEvento);
                eventoService.SaveEvento(evento);
            }

            var tipoParticipacionEventoForm = tipoParticipacionEventoMapper.Map(tipoParticipacionEvento);

            return Rjs("AddTipoParticipacion", tipoParticipacionEventoForm);
        }

        EventoForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        EventoForm SetupNewForm(EventoForm form)
        {
            form = form ?? new EventoForm();

            form.TipoParticipacionEvento = new TipoParticipacionEventoForm();
            form.CoautorExternoEvento = new CoautorExternoEventoForm();
            form.CoautorInternoEvento = new CoautorInternoEventoForm();

            //Lista de Catalogos Pendientes
            form.Ambitos = ambitoMapper.Map(catalogoService.GetActiveAmbitos());
            form.TiposEventos = tipoEventoMapper.Map(catalogoService.GetActiveTipoEventos());
            form.TiposParticipaciones = tipoParticipacionMapper.Map(catalogoService.GetActiveTipoParticipaciones());
            form.CoautoresExternos = investigadorExternoMapper.Map(catalogoService.GetActiveInvestigadorExternos());
            form.CoautoresInternos = investigadorMapper.Map(investigadorService.GetActiveInvestigadores());
            form.Instituciones = institucionMapper.Map(catalogoService.GetActiveInstituciones());
            form.LineasTematicas = lineaTematicaMapper.Map(catalogoService.GetActiveLineaTematicas());
            form.TiposFinanciamientos = tipoFinanciamientoMapper.Map(catalogoService.GetActiveTipoFinanciamientos());

            return form;
        }

        void FormSetCombos(EventoForm form)
        {
            ViewData["Ambito"] = form.AmbitoId;
            ViewData["TipoEvento"] = form.TipoEventoId;
            ViewData["Institucion"] = form.InstitucionId;
            ViewData["LineaTematica"] = form.LineaTematicaId;
            ViewData["TipoFinanciamiento"] = form.TipoFinanciamientoId;
        }
    }
}