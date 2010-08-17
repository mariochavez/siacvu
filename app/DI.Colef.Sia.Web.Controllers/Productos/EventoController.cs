using System;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Security;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos
{
    [HandleError]
    public class EventoController : BaseController<Evento, EventoForm>
    {
        readonly IAmbitoMapper ambitoMapper;
        readonly ICoautorExternoEventoMapper coautorExternoEventoMapper;
        readonly ICoautorInternoEventoMapper coautorInternoEventoMapper;
        readonly IEventoMapper eventoMapper;
        readonly IEventoService eventoService;
        readonly IInstitucionProductoMapper<InstitucionEvento> institucionEventoMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly IInvestigadorService investigadorService;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IProductoService productoService;
        readonly ISesionEventoMapper sesionEventoMapper;
        readonly ITipoEventoMapper tipoEventoMapper;
        readonly ITipoParticipacionMapper tipoParticipacionMapper;

        public EventoController(IEventoService eventoService, IEventoMapper eventoMapper,
                                ICatalogoService catalogoService,
                                IAreaTematicaMapper areaTematicaMapper, ICustomCollection customCollection,
                                ILineaTematicaMapper lineaTematicaMapper, IAreaMapper areaMapper,
                                IArchivoService archivoService,
                                ISesionEventoMapper sesionEventoMapper,
                                IUsuarioService usuarioService,
                                IAmbitoMapper ambitoMapper,
                                ITipoEventoMapper tipoEventoMapper,
                                ITipoParticipacionMapper tipoParticipacionMapper,
                                ICoautorExternoEventoMapper coautorExternoEventoMapper,
                                ICoautorInternoEventoMapper coautorInternoEventoMapper,
                                ISearchService searchService,
                                IInstitucionProductoMapper<InstitucionEvento> institucionEventoMapper,
                                IInvestigadorExternoMapper investigadorExternoMapper,
                                IInvestigadorService investigadorService, IProductoService productoService)
            : base(usuarioService, searchService, catalogoService)
        {
            base.catalogoService = catalogoService;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.areaTematicaMapper = areaTematicaMapper;
            this.sesionEventoMapper = sesionEventoMapper;
            this.eventoService = eventoService;
            this.eventoMapper = eventoMapper;
            this.ambitoMapper = ambitoMapper;
            this.tipoEventoMapper = tipoEventoMapper;
            this.tipoParticipacionMapper = tipoParticipacionMapper;
            this.investigadorExternoMapper = investigadorExternoMapper;
            this.coautorExternoEventoMapper = coautorExternoEventoMapper;
            this.coautorInternoEventoMapper = coautorInternoEventoMapper;
            this.institucionEventoMapper = institucionEventoMapper;
            this.investigadorService = investigadorService;
            this.productoService = productoService;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<EventoForm>();
            var productos = productoService.GetProductosByUsuario<Evento>(CurrentUser(), x => x.Nombre,
                                                                          x => x.TipoEvento);
            data.ProductList = productos;

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            if (CurrentInvestigador() == null)
                return NoInvestigadorProfile("Por tal motivo no puede crear nuevos productos.");

            var data = new GenericViewData<EventoForm> {Form = SetupNewForm()};

            return View(data);
        }

        [Authorize(Roles = "Investigadores, DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<EventoForm>();
            var evento = eventoService.GetEventoById(id);

            var verifyMessage = VerifyProductoStatus(evento.Firma, evento.Nombre);
            if (!String.IsNullOrEmpty(verifyMessage))
                return RedirectToHomeIndex(verifyMessage);

            var verifyOwnershipMessage = VerifyProductoOwnership(CurrentUser().Investigador, evento.Usuario.Id,
                                                                 CurrentUser().Id);
            if (!String.IsNullOrEmpty(verifyOwnershipMessage))
                return RedirectToHomeIndex(verifyOwnershipMessage);

            CoautorInternoEvento coautorInternoEvento;
            int posicionAutor;
            var coautorExists = 0;

            if (User.IsInRole("Investigadores"))
            {
                coautorExists =
                    evento.CoautorInternoEventos.Where(
                        x => x.Investigador.Id == CurrentInvestigador().Id).Count();

                if (evento.Usuario.Id != CurrentUser().Id && coautorExists == 0)
                    return RedirectToHomeIndex("no lo puede modificar");
            }

            var eventoForm = eventoMapper.Map(evento);
            if (evento.AreaTematica != null)
                eventoForm.LineaTematicaId = evento.AreaTematica.LineaTematica.Id;

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
                posicionAutor = data.Form.PosicionCoautor;

            data.Form.PosicionCoautor = posicionAutor;

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = new GenericViewData<EventoForm>();

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
                                   [Bind(Prefix = "Sesion")] SesionEventoForm[] sesion,
                                   EventoForm form)
        {
            coautorExterno = coautorExterno ?? new CoautorExternoProductoForm[] {};
            coautorInterno = coautorInterno ?? new CoautorInternoProductoForm[] {};
            institucion = institucion ?? new InstitucionProductoForm[] {};
            sesion = sesion ?? new SesionEventoForm[] {};

            var evento = eventoMapper.Map(form, CurrentUser(), CurrentInvestigador(),
                                          coautorExterno, coautorInterno, institucion, sesion);
            ModelState.AddModelErrors(evento.ValidationResults(), true, "Evento");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            eventoService.SaveEvento(evento);
            SetMessage(String.Format("Evento {0} ha sido registrado", evento.Nombre));

            return Rjs("Save", evento.Id);
        }

        [Authorize]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(EventoForm form)
        {
            var evento = new Evento();

            if (User.IsInRole("Investigadores"))
                evento = eventoMapper.Map(form, CurrentUser(), CurrentInvestigador());
            if (User.IsInRole("DGAA"))
                evento = eventoMapper.Map(form, CurrentUser());

            ModelState.AddModelErrors(evento.ValidationResults(), true, "Evento");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            eventoService.SaveEvento(evento, true);
            SetMessage(String.Format("Evento {0} ha sido modificado", evento.Nombre));

            return Rjs("Save", evento.Id);
        }

        [CookieLessAuthorize]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddFile(FormCollection form)
        {
            var id = Convert.ToInt32(form["Id"]);
            var evento = eventoService.GetEventoById(id);

            var archivo = MapArchivo<ArchivoEvento>();
            evento.AddArchivo(archivo);

            eventoService.SaveEvento(evento);

            return Content("Uploaded");
        }

        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DgaaValidateProduct(FirmaForm firmaForm)
        {
            var evento = eventoService.GetEventoById(firmaForm.ProductoId);

            evento.Firma.Aceptacion2 = 1;
            evento.Firma.Usuario2 = CurrentUser();

            eventoService.SaveEvento(evento);

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
            var evento = eventoService.GetEventoById(firmaForm.ProductoId);
            evento.Firma.Aceptacion1 = 0;
            evento.Firma.Aceptacion2 = 2;
            evento.Firma.Descripcion = firmaForm.Descripcion;
            evento.Firma.Usuario1 = CurrentUser();
            evento.Firma.Usuario2 = CurrentUser();

            ModelState.AddModelErrors(evento.ValidationResults(), false, "Firma");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            eventoService.SaveEvento(evento, true);

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
            var data = searchService.Search<Evento>(x => x.Nombre, q);
            return Content(data);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeAreaTematica(int select)
        {
            // TODO: Dependencias
            //var areaTematicaForm = areaTematicaMapper.Map(catalogoService.GetAreaTematicaById(select));
            //var lineaTematicaForm = lineaTematicaMapper.Map(catalogoService.GetLineaTematicaById(areaTematicaForm.LineaTematicaId));

            //var form = new ShowFieldsForm
            //{
            //    AreaTematicaLineaTematicaNombre = lineaTematicaForm.Nombre,
            //    AreaTematicaId = areaTematicaForm.Id
            //};

            //return Rjs("ChangeAreaTematica", form);

            return Rjs("", null);
        }

        [Authorize]
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

        [Authorize]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddSesion([Bind(Prefix = "Sesion")] SesionEventoForm form, int eventoId)
        {
            Evento evento;
            SesionEventoForm sesionEventoForm;
            var sesionEvento = sesionEventoMapper.Map(form);

            ModelState.AddModelErrors(sesionEvento.ValidationResults(), false, "Sesion", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (eventoId != 0)
            {
                sesionEvento.CreadoPor = CurrentUser();
                sesionEvento.ModificadoPor = CurrentUser();

                evento = eventoService.GetEventoById(eventoId);

                evento.AddSesion(sesionEvento);
                eventoService.SaveEvento(evento);
                sesionEventoForm = sesionEventoMapper.Map(sesionEvento);
            }

            else
            {
                sesionEventoForm = sesionEventoMapper.Map(sesionEvento);
                var buffer = Guid.NewGuid().ToByteArray();
                sesionEventoForm.Id = BitConverter.ToInt32(buffer, 0);
            }

            sesionEventoForm.ParentId = eventoId;

            return Rjs("AddSesion", sesionEventoForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteSesion(int id, int sesionId)
        {
            var evento = eventoService.GetEventoById(id);

            if (evento != null)
            {
                var sesion = evento.SesionEventos.Where(x => x.Id == sesionId).First();
                evento.DeleteSesion(sesion);

                eventoService.SaveEvento(evento);
            }

            var form = new SesionEventoForm {Id = sesionId};
            return Rjs("DeleteSesion", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorInterno(int id, bool esAlfabeticamente)
        {
            var evento = eventoService.GetEventoById(id);
            var form = new CoautorForm
                           {
                               Controller = "Evento",
                               IdName = "EventoId",
                               CoautorSeOrdenaAlfabeticamente = esAlfabeticamente
                           };

            if (User.IsInRole("Investigadores"))
                form.CreadoPorId = CurrentInvestigador().Id;

            if (evento != null)
            {
                form.Id = evento.Id;
                var investigador = investigadorService.GetInvestigadorByUsuario(evento.CreadoPor.UsuarioNombre);
                form.CreadoPorId = investigador.Id;
            }

            return Rjs("NewCoautorInterno", form);
        }

        [CustomTransaction]
        [Authorize]
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
        [Authorize]
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

            var form = new CoautorForm {ModelId = id, InvestigadorId = investigadorId};

            return Rjs("DeleteCoautorInterno", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id, bool esAlfabeticamente)
        {
            var evento = eventoService.GetEventoById(id);
            var form = new CoautorForm
                           {
                               Controller = "Evento",
                               IdName = "EventoId",
                               InvestigadorExterno = new InvestigadorExternoForm(),
                               CoautorSeOrdenaAlfabeticamente = esAlfabeticamente
                           };

            if (evento != null)
                form.Id = evento.Id;

            return Rjs("NewCoautorExterno", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorExterno([Bind(Prefix = "CoautorExterno")] CoautorExternoProductoForm form,
                                              int eventoId)
        {
            var investigadorExternoForm = new InvestigadorExternoForm
                                              {
                                                  Nombre = form.Nombre,
                                                  ApellidoPaterno = form.ApellidoPaterno,
                                                  ApellidoMaterno = form.ApellidoMaterno
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

            form.InvestigadorExternoId = investigadorExterno.Id;
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
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteCoautorExterno(int id, int investigadorExternoId)
        {
            var evento = eventoService.GetEventoById(id);

            if (evento != null)
            {
                var coautor =
                    evento.CoautorExternoEventos.Where(x => x.InvestigadorExterno.Id == investigadorExternoId).First();
                evento.DeleteCoautorExterno(coautor);

                eventoService.SaveEvento(evento);
            }

            var form = new CoautorForm {ModelId = id, InvestigadorExternoId = investigadorExternoId};

            return Rjs("DeleteCoautorExterno", form);
        }

        protected override void DeleteInstitucionInModel(Evento model, int institucionId)
        {
            if(model != null)
            {
                var institucion = model.InstitucionEventos.Where(x => x.Id == institucionId).First();
                model.DeleteInstitucion(institucion);

                eventoService.SaveEvento(model);
            }
        }

        protected override bool SaveInstitucionToModel(Evento model, InstitucionProducto institucionProducto)
        {
            var alreadyHasIt = AlreadyHasIt(model.Id, institucionProducto);
            var added = false;

            if (!alreadyHasIt)
            {
                model.AddInstitucion(institucionProducto);
                eventoService.SaveEvento(model, true);
                added = true;
            }

            return added;
        }

        protected override InstitucionProducto MapInstitucionMessage(InstitucionProductoForm form)
        {
            return institucionEventoMapper.Map(form);
        }

        protected override InstitucionProductoForm MapInstitucionModel(InstitucionProducto model, int parentId)
        {
            var institucionEventoForm = institucionEventoMapper.Map(model as InstitucionEvento);
            institucionEventoForm.ParentId = parentId;

            return institucionEventoForm;
        }

        protected override Evento GetModelById(int id)
        {
            return eventoService.GetEventoById(id);
        }

        protected override bool AlreadyHasIt(int eventoId, InstitucionProducto institucionProducto)
        {
            var evento = eventoService.GetEventoById(eventoId);

            var institucionId = institucionProducto.Institucion != null ? institucionProducto.Institucion.Id : 0;

            var count =
                evento.InstitucionEventos.Where(
                    x => ((x.Institucion != null && institucionId > 0 && x.Institucion.Id == institucionId) ||
                          (x.InstitucionNombre == institucionProducto.InstitucionNombre))).Count();

            return count > 0;
        }

        EventoForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        EventoForm SetupNewForm(EventoForm form)
        {
            form = form ?? new EventoForm();

            form.LineasTematicas = lineaTematicaMapper.Map(catalogoService.GetActiveLineaTematicas());

            form.TiposParticipaciones = tipoParticipacionMapper.Map(catalogoService.GetTipoParticipacionEventos());
            form.TiposEventos = tipoEventoMapper.Map(catalogoService.GetActiveTipoEventos());

            if (form.Id == 0)
            {
                form.CoautorExternoEventos = new CoautorExternoProductoForm[] {};
                form.CoautorInternoEventos = new CoautorInternoProductoForm[] {};

                if (User.IsInRole("Investigadores"))
                {
                    form.UsuarioNombre = CurrentInvestigador().Usuario.Nombre;
                    form.UsuarioApellidoPaterno = CurrentInvestigador().Usuario.ApellidoPaterno;
                    form.UsuarioApellidoMaterno = CurrentInvestigador().Usuario.ApellidoMaterno;
                }
            }
            else
            {
                form.AreasTematicas =
                    areaTematicaMapper.Map(catalogoService.GetAreaTematicasByLineaTematicaId(form.LineaTematicaId));
            }

            return form;
        }

        void FormSetCombos(EventoForm form)
        {
            ViewData["TipoEvento"] = form.TipoEventoId;
            ViewData["TipoParticipacion"] = form.TipoParticipacionId;

            ViewData["LineaTematicaId"] = form.LineaTematicaId;
            ViewData["AreaTematicaId"] = form.AreaTematicaId;
        }

        EventoForm SetupShowForm(EventoForm form)
        {
            form = form ?? new EventoForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      PalabraClave1 = form.PalabraClave1,
                                      PalabraClave2 = form.PalabraClave2,
                                      PalabraClave3 = form.PalabraClave3,
                                      IsShowForm = true,
                                  };

            return form;
        }
    }
}