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
        readonly IDirigidoAMapper dirigidoAMapper;
        readonly IInstitucionEventoMapper institucionEventoMapper;

        public EventoController(IEventoService eventoService, IEventoMapper eventoMapper,
                                ICatalogoService catalogoService,
                                IDirigidoAMapper dirigidoAMapper,
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
                                ISearchService searchService, IInstitucionEventoMapper institucionEventoMapper)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.estadoPaisMapper = estadoPaisMapper;
            this.paisMapper = paisMapper;
            this.investigadorService = investigadorService;
            this.eventoService = eventoService;
            this.eventoMapper = eventoMapper;
            this.ambitoMapper = ambitoMapper;
            this.dirigidoAMapper = dirigidoAMapper;
            this.tipoEventoMapper = tipoEventoMapper;
            this.tipoParticipacionMapper = tipoParticipacionMapper;
            this.investigadorExternoMapper = investigadorExternoMapper;
            this.investigadorMapper = investigadorMapper;
            this.tipoFinanciamientoMapper = tipoFinanciamientoMapper;
            this.coautorExternoEventoMapper = coautorExternoEventoMapper;
            this.coautorInternoEventoMapper = coautorInternoEventoMapper;
            this.institucionEventoMapper = institucionEventoMapper;
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
            if (CurrentInvestigador() == null)
                return RedirectToIndex("No existe perfil de investigador definido para éste usuario, por tal motivo no puede crear nuevos productos.");

            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
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
        public ActionResult Create([Bind(Prefix = "CoautorInterno")] CoautorInternoProductoForm[] coautorInterno,
                                   [Bind(Prefix = "CoautorExterno")] CoautorExternoProductoForm[] coautorExterno,
                                   [Bind(Prefix = "InstitucionEvento")] InstitucionEventoForm[] institucion,
                                   EventoForm form)
        {
            coautorExterno = coautorExterno ?? new CoautorExternoProductoForm[] { };
            coautorInterno = coautorInterno ?? new CoautorInternoProductoForm[] { };
            institucion = institucion ?? new InstitucionEventoForm[] { };

            var evento = eventoMapper.Map(form, CurrentUser(), CurrentInvestigador(),
                                          coautorExterno, coautorInterno, institucion);

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
            var form = new CoautorForm { Controller = "Evento", IdName = "EventoId" };

            if (evento != null)
                form.Id = evento.Id;

            return Rjs("NewCoautorInterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorInterno([Bind(Prefix = "CoautorInterno")] CoautorInternoProductoForm form,
                                              int eventoId)
        {
            var coautorInternoEvento = coautorInternoEventoMapper.Map(form);

            ModelState.AddModelErrors(coautorInternoEvento.ValidationResults(), false, "CoautorInterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (eventoId != 0)
            {
                coautorInternoEvento.CreadorPor = CurrentUser();
                coautorInternoEvento.ModificadoPor = CurrentUser();

                var evento = eventoService.GetEventoById(eventoId);
                var alreadyHasIt =
                    evento.CoautorInternoEventos.Where(
                        x => x.Investigador.Id == coautorInternoEvento.Investigador.Id).Count();

                if (alreadyHasIt == 0)
                {
                    evento.AddCoautorInterno(coautorInternoEvento);
                    eventoService.SaveEvento(evento);
                }
            }

            var coautorInternoEventoForm = coautorInternoEventoMapper.Map(coautorInternoEvento);
            coautorInternoEventoForm.ParentId = eventoId;

            return Rjs("AddCoautorInterno", coautorInternoEventoForm);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteCoautorInterno(int id, int investigadorId)
        {
            var evento = eventoService.GetEventoById(id);

            if (evento != null)
            {
                var coautor = evento.CoautorInternoEventos.Where(x => x.Investigador.Id == investigadorId).First();
                evento.DeleteCoautorInterno(coautor);

                eventoService.SaveEvento(evento);
            }

            return Rjs("DeleteCoautorInterno", investigadorId);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id)
        {
            var evento = eventoService.GetEventoById(id);
            var form = new CoautorForm { Controller = "Evento", IdName = "EventoId" };

            if (evento != null)
                form.Id = evento.Id;

            return Rjs("NewCoautorExterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorExterno([Bind(Prefix = "CoautorExterno")] CoautorExternoProductoForm form,
                                              int eventoId)
        {
            var coautorExternoEvento = coautorExternoEventoMapper.Map(form);

            ModelState.AddModelErrors(coautorExternoEvento.ValidationResults(), false, "CoautorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (eventoId != 0)
            {
                coautorExternoEvento.CreadorPor = CurrentUser();
                coautorExternoEvento.ModificadoPor = CurrentUser();

                var evento = eventoService.GetEventoById(eventoId);

                var alreadyHasIt =
                    evento.CoautorExternoEventos.Where(
                        x => x.InvestigadorExterno.Id == coautorExternoEvento.InvestigadorExterno.Id).Count();

                if (alreadyHasIt == 0)
                {
                    evento.AddCoautorExterno(coautorExternoEvento);
                    eventoService.SaveEvento(evento);
                }
            }

            var coautorExternoEventoForm = coautorExternoEventoMapper.Map(coautorExternoEvento);
            coautorExternoEventoForm.ParentId = eventoId;

            return Rjs("AddCoautorExterno", coautorExternoEventoForm);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteCoautorExterno(int id, int investigadorExternoId)
        {
            var evento = eventoService.GetEventoById(id);

            if (evento != null)
            {
                var coautor = evento.CoautorExternoEventos.Where(x => x.InvestigadorExterno.Id == investigadorExternoId).First();
                evento.DeleteCoautorExterno(coautor);

                eventoService.SaveEvento(evento);
            }

            return Rjs("DeleteCoautorExterno", investigadorExternoId);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewInstitucion(int id)
        {
            var evento = eventoService.GetEventoById(id);
            var form = new EventoForm();

            if (evento != null)
                form.Id = evento.Id;

            return Rjs("NewInstitucion", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddInstitucion([Bind(Prefix = "InstitucionEvento")] InstitucionEventoForm form,
                                              int eventoId)
        {
            var institucionEvento = institucionEventoMapper.Map(form);

            ModelState.AddModelErrors(institucionEvento.ValidationResults(), false, "InstitucionEvento", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (eventoId != 0)
            {
                institucionEvento.CreadorPor = CurrentUser();
                institucionEvento.ModificadoPor = CurrentUser();

                var evento = eventoService.GetEventoById(eventoId);
                var alreadyHasIt =
                    evento.InstitucionEventos.Where(
                        x => x.Institucion.Id == institucionEvento.Institucion.Id).Count();

                if (alreadyHasIt == 0)
                {
                    evento.AddInstitucion(institucionEvento);
                    eventoService.SaveEvento(evento);
                }
            }

            var institucionEventoForm = institucionEventoMapper.Map(institucionEvento);
            institucionEventoForm.ParentId = eventoId;

            return Rjs("AddInstitucion", institucionEventoForm);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteInstitucion(int id, int institucionId)
        {
            var evento = eventoService.GetEventoById(id);

            if (evento != null)
            {
                var institucion = evento.InstitucionEventos.Where(x => x.Institucion.Id == institucionId).First();
                evento.DeleteInstitucion(institucion);

                eventoService.SaveEvento(evento);
            }

            return Rjs("DeleteInstitucion", institucionId);
        }

        EventoForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        EventoForm SetupNewForm(EventoForm form)
        {
            form = form ?? new EventoForm();

            form.CoautorExternoProducto = new CoautorExternoProductoForm();
            form.CoautorInternoProducto = new CoautorInternoProductoForm();

            //Lista de Catalogos Pendientes
            form.Ambitos = ambitoMapper.Map(catalogoService.GetActiveAmbitos());
            form.TiposParticipaciones = tipoParticipacionMapper.Map(catalogoService.GetActiveTipoParticipaciones());
            form.TiposEventos = tipoEventoMapper.Map(catalogoService.GetActiveTipoEventos());

            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());

            return form;
        }

        void FormSetCombos(EventoForm form)
        {
            ViewData["Ambito"] = form.AmbitoId;
            ViewData["TipoEvento"] = form.TipoEventoId;
            ViewData["TipoParticipacion"] = form.TipoParticipacionId;
            ViewData["Pais"] = form.PaisId;
        }
    }
}