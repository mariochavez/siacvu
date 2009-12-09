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
        readonly ISesionEventoMapper sesionEventoMapper;
        readonly ICoautorInternoEventoMapper coautorInternoEventoMapper;
        readonly IEventoMapper eventoMapper;
        readonly IEventoService eventoService;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly ITipoEventoMapper tipoEventoMapper;
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
        readonly IAreaTematicaMapper areaTematicaMapper;
        readonly ILineaTematicaMapper lineaTematicaMapper;
=======
>>>>>>> 8e05959aaa279ca15f1faef92bb47ad2b1d919eb
=======
>>>>>>> 8e05959aaa279ca15f1faef92bb47ad2b1d919eb
=======
>>>>>>> 8e05959aaa279ca15f1faef92bb47ad2b1d919eb
=======
>>>>>>> 8e05959aaa279ca15f1faef92bb47ad2b1d919eb
        readonly ITipoParticipacionMapper tipoParticipacionMapper;
        readonly IPaisMapper paisMapper;
        readonly IInstitucionEventoMapper institucionEventoMapper;

        public EventoController(IEventoService eventoService, IEventoMapper eventoMapper,
                                ICatalogoService catalogoService,
                                ILineaTematicaMapper lineaTematicaMapper,
                                IPaisMapper paisMapper,
                                IAreaTematicaMapper areaTematicaMapper,
                                ISesionEventoMapper sesionEventoMapper,
                                IUsuarioService usuarioService,
                                IAmbitoMapper ambitoMapper,
                                ITipoEventoMapper tipoEventoMapper,
                                ITipoParticipacionMapper tipoParticipacionMapper,
<<<<<<< HEAD
=======
                                IInvestigadorMapper investigadorMapper,
                                IInvestigadorService investigadorService,
>>>>>>> 8e05959aaa279ca15f1faef92bb47ad2b1d919eb
                                ICoautorExternoEventoMapper coautorExternoEventoMapper,
                                ICoautorInternoEventoMapper coautorInternoEventoMapper,
                                ISearchService searchService,
                                IInstitucionEventoMapper institucionEventoMapper,
                                IInvestigadorExternoMapper investigadorExternoMapper)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.areaTematicaMapper = areaTematicaMapper;
            this.sesionEventoMapper = sesionEventoMapper;
            this.paisMapper = paisMapper;
            this.eventoService = eventoService;
            this.eventoMapper = eventoMapper;
            this.ambitoMapper = ambitoMapper;
            this.tipoEventoMapper = tipoEventoMapper;
            this.tipoParticipacionMapper = tipoParticipacionMapper;
            this.investigadorExternoMapper = investigadorExternoMapper;
<<<<<<< HEAD
=======
            this.investigadorMapper = investigadorMapper;
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 8e05959aaa279ca15f1faef92bb47ad2b1d919eb
=======
>>>>>>> 8e05959aaa279ca15f1faef92bb47ad2b1d919eb
=======
>>>>>>> 8e05959aaa279ca15f1faef92bb47ad2b1d919eb
=======
>>>>>>> 8e05959aaa279ca15f1faef92bb47ad2b1d919eb
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
                return NoInvestigadorProfile("Por tal motivo no puede crear nuevos productos.");

            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
            data.Form.PosicionAutor = 1;
            ViewData["Pais"] = (from p in data.Form.Paises where p.Nombre == "México" select p.Id).FirstOrDefault();

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            CoautorInternoEvento coautorInternoEvento;
            int posicionAutor;
            var data = CreateViewDataWithTitle(Title.Edit);

            var evento = eventoService.GetEventoById(id);

            if (evento == null)
                return RedirectToIndex("no ha sido encontrado", true);

            var coautorExists =
                    evento.CoautorInternoEventos.Where(
                        x => x.Investigador.Id == CurrentInvestigador().Id).Count();

            if (evento.Usuario.Id != CurrentUser().Id && coautorExists == 0)
                return RedirectToIndex("no lo puede modificar", true);

            var eventoForm = eventoMapper.Map(evento);

            data.Form = SetupNewForm(eventoForm);

            FormSetCombos(data.Form);

            if (coautorExists != 0)
            {
                coautorInternoEvento =
                    evento.CoautorInternoEventos.Where(x => x.Investigador.Id == CurrentInvestigador().Id).
                        FirstOrDefault();

                posicionAutor = coautorInternoEvento.Posicion;
            }
            else
                posicionAutor = data.Form.PosicionAutor;

            data.Form.PosicionAutor = posicionAutor;

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var evento = eventoService.GetEventoById(id);
            var eventoForm = eventoMapper.Map(evento);

            data.Form = SetupShowForm(eventoForm);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create([Bind(Prefix = "CoautorInterno")] CoautorInternoProductoForm[] coautorInterno,
                                   [Bind(Prefix = "CoautorExterno")] CoautorExternoProductoForm[] coautorExterno,
                                   [Bind(Prefix = "Institucion")] InstitucionProductoForm[] institucion,
                                   [Bind(Prefix = "SesionEvento")] SesionEventoForm[] sesion,
                                   EventoForm form)
        {
            coautorExterno = coautorExterno ?? new CoautorExternoProductoForm[] { };
            coautorInterno = coautorInterno ?? new CoautorInternoProductoForm[] { };
            institucion = institucion ?? new InstitucionProductoForm[] { };
            sesion = sesion ?? new SesionEventoForm[] { };

            var evento = eventoMapper.Map(form, CurrentUser(), CurrentInvestigador(),
                                          coautorExterno, coautorInterno, institucion, sesion);

            //if (!IsInternacionalOrBinacional(eventoMapper.Map(evento).AmbitoNombre, new[] { "Internacional", "Binacional", "" }))
            //    evento.Pais = GetDefaultPais();

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

            //if (!IsInternacionalOrBinacional(eventoMapper.Map(evento).AmbitoNombre, new[] { "Internacional", "Binacional", "" }))
            //    evento.Pais = GetDefaultPais();

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

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeAreaTematica(int select)
        {
            var areaTematicaForm = areaTematicaMapper.Map(catalogoService.GetAreaTematicaById(select));
            var lineaTematicaForm = lineaTematicaMapper.Map(catalogoService.GetLineaTematicaById(areaTematicaForm.LineaTematicaId));

            var form = new ShowFieldsForm
            {
                AreaTematicaLineaTematicaNombre = lineaTematicaForm.Nombre,
                AreaTematicaId = areaTematicaForm.Id
            };

            return Rjs("ChangeAreaTematica", form);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewSesion(int id)
        {
            var evento = eventoService.GetEventoById(id);
            var form = new EventoForm();

            if (evento != null)
                form.Id = evento.Id;

            form.SesionEvento = new SesionEventoForm();
            form.Ambitos = ambitoMapper.Map(catalogoService.GetActiveAmbitos());
            
            return Rjs("NewSesion", form);
        }

        [Authorize(Roles = "Investigadores")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddSesion([Bind(Prefix = "SesionEvento")] SesionEventoForm form,
                                      int eventoId)
        {
            var sesionEvento = sesionEventoMapper.Map(form);

            ModelState.AddModelErrors(sesionEvento.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (eventoId != 0)
            {
                sesionEvento.CreadoPor = CurrentUser();
                sesionEvento.ModificadoPor = CurrentUser();

                var evento = eventoService.GetEventoById(eventoId);

                evento.AddSesion(sesionEvento);
                eventoService.SaveEvento(evento);
            }

            var sesionEventoForm = sesionEventoMapper.Map(sesionEvento);

            return Rjs("AddSesion", sesionEventoForm);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteSesion(int id, int sesionId)
        {
            var evento = eventoService.GetEventoById(id);

            if (evento != null)
            {
                var sesion = evento.SesionesEventos.Where(x => x.Id == sesionId).First();
                evento.DeleteSesion(sesion);

                eventoService.SaveEvento(evento);
            }

            var form = new SesionEventoForm { ModelId = id, SesionId =  sesionId};
            return Rjs("DeleteSesion", form);
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
                coautorInternoEvento.CreadoPor = CurrentUser();
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

            var form = new CoautorForm { ModelId = id, InvestigadorId = investigadorId };

            return Rjs("DeleteCoautorInterno", form);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id)
        {
            var evento = eventoService.GetEventoById(id);
            var form = new CoautorForm { Controller = "Evento", IdName = "EventoId", InvestigadorExterno = new InvestigadorExternoForm() };

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
            var investigadorExternoForm = new InvestigadorExternoForm
                                              {
                                                  Nombre = form.InvestigadorExternoNombre,
                                                  ApellidoPaterno = form.InvestigadorExternoApellidoPaterno,
                                                  ApellidoMaterno = form.InvestigadorExternoApellidoMaterno
                                              };

            var investigadorExterno = investigadorExternoMapper.Map(investigadorExternoForm);

            ModelState.AddModelErrors(investigadorExterno.ValidationResults(), false, "CoautorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            investigadorExterno.CreadoPor = CurrentUser();
            investigadorExterno.ModificadoPor = CurrentUser();

            catalogoService.SaveInvestigadorExterno(investigadorExterno);

            investigadorExternoForm = investigadorExternoMapper.Map(investigadorExterno);

            form.InvestigadorExternoId = investigadorExternoForm.Id;
            var coautorExternoEvento = coautorExternoEventoMapper.Map(form);

            ModelState.AddModelErrors(coautorExternoEvento.ValidationResults(), false, "CoautorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (eventoId != 0)
            {
                coautorExternoEvento.CreadoPor = CurrentUser();
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

            var form = new CoautorForm { ModelId = id, InvestigadorExternoId = investigadorExternoId };

            return Rjs("DeleteCoautorExterno", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewInstitucion(int id)
        {
            var evento = eventoService.GetEventoById(id);

            var form = new InstitucionForm { Controller = "Evento", IdName = "EventoId" };

            if (evento != null)
                form.Id = evento.Id;

            return Rjs("NewInstitucion", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddInstitucion([Bind(Prefix = "Institucion")] InstitucionProductoForm form,
                                              int eventoId)
        {
            var institucionEvento = institucionEventoMapper.Map(form);

            ModelState.AddModelErrors(institucionEvento.ValidationResults(), false, "Institucion", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (eventoId != 0)
            {
                institucionEvento.CreadoPor = CurrentUser();
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

            var form = new InstitucionForm {ModelId = id, InstitucionId = institucionId};

            return Rjs("DeleteInstitucion", form);
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
            form.SesionEvento = new SesionEventoForm();

            //Lista de Catalogos Pendientes
            //form.SesionEventos = sesionEventoMapper.Map(form.SesionEventos);
            form.Ambitos = ambitoMapper.Map(catalogoService.GetActiveAmbitos());
            form.TiposParticipaciones = tipoParticipacionMapper.Map(catalogoService.GetTipoParticipacionEventos());
            form.TiposEventos = tipoEventoMapper.Map(catalogoService.GetActiveTipoEventos());

            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());

            return form;
        }

        void FormSetCombos(EventoForm form)
        {
            ViewData["TipoEvento"] = form.TipoEventoId;
            ViewData["TipoParticipacion"] = form.TipoParticipacionId;
            ViewData["Pais"] = form.PaisId;
        }

        private EventoForm SetupShowForm(EventoForm form)
        {
            form = form ?? new EventoForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      PalabraClave1 = form.PalabraClave1,
                                      PalabraClave2 = form.PalabraClave2,
                                      PalabraClave3 = form.PalabraClave3,

                                      AreaTematicaNombre = form.AreaTematica.Nombre,
                                      AreaTematicaLineaTematicaNombre = form.AreaTematica.LineaTematicaNombre,

                                      IsShowForm = true,
                                  };

            return form;
        }
    }
}