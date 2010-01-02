using System;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
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
        readonly ICatalogoService catalogoService;
        readonly ICoautorExternoEventoMapper coautorExternoEventoMapper;
        readonly ISesionEventoMapper sesionEventoMapper;
        readonly ICoautorInternoEventoMapper coautorInternoEventoMapper;
        readonly IEventoMapper eventoMapper;
        readonly IEventoService eventoService;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly ITipoEventoMapper tipoEventoMapper;
        readonly IAreaTematicaMapper areaTematicaMapper;
        readonly IArchivoService archivoService;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly ITipoParticipacionMapper tipoParticipacionMapper;
        readonly IInstitucionEventoMapper institucionEventoMapper;
        readonly IInvestigadorService investigadorService;

        public EventoController(IEventoService eventoService, IEventoMapper eventoMapper,
                                ICatalogoService catalogoService,
                                ILineaTematicaMapper lineaTematicaMapper,
                                IArchivoService archivoService,
                                IAreaTematicaMapper areaTematicaMapper,
                                ISesionEventoMapper sesionEventoMapper,
                                IUsuarioService usuarioService,
                                IAmbitoMapper ambitoMapper,
                                ITipoEventoMapper tipoEventoMapper,
                                ITipoParticipacionMapper tipoParticipacionMapper,
                                ICoautorExternoEventoMapper coautorExternoEventoMapper,
                                ICoautorInternoEventoMapper coautorInternoEventoMapper,
                                ISearchService searchService,
                                IInstitucionEventoMapper institucionEventoMapper,
                                IInvestigadorExternoMapper investigadorExternoMapper,
                                IInvestigadorService investigadorService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.areaTematicaMapper = areaTematicaMapper;
            this.sesionEventoMapper = sesionEventoMapper;
            this.eventoService = eventoService;
            this.eventoMapper = eventoMapper;
            this.archivoService = archivoService;
            this.ambitoMapper = ambitoMapper;
            this.tipoEventoMapper = tipoEventoMapper;
            this.tipoParticipacionMapper = tipoParticipacionMapper;
            this.investigadorExternoMapper = investigadorExternoMapper;
            this.coautorExternoEventoMapper = coautorExternoEventoMapper;
            this.coautorInternoEventoMapper = coautorInternoEventoMapper;
            this.institucionEventoMapper = institucionEventoMapper;
            this.investigadorService = investigadorService;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            return RedirectToHomeIndex();
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

            return View(data);
        }

        [Authorize(Roles = "Investigadores, DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            CoautorInternoEvento coautorInternoEvento;
            int posicionAutor;
            var coautorExists = 0;
            var data = CreateViewDataWithTitle(Title.Edit);

            var evento = eventoService.GetEventoById(id);

            if (evento.Firma.Aceptacion1 == 1 && evento.Firma.Aceptacion2 == 0 && User.IsInRole("Investigadores"))
                return RedirectToHomeIndex(String.Format("El evento {0} esta en firma y no puede ser editado", evento.Nombre));
            
            if (User.IsInRole("DGAA"))
            {
                if ((evento.Firma.Aceptacion1 == 1 && evento.Firma.Aceptacion2 == 1) ||
                    (evento.Firma.Aceptacion1 == 0 && evento.Firma.Aceptacion2 == 0) ||
                    (evento.Firma.Aceptacion1 == 0 && evento.Firma.Aceptacion2 == 2)
                   )
                    return
                        RedirectToHomeIndex(String.Format(
                                                "El evento {0} ya fue aceptado o no ha sido enviado a firma",
                                                evento.Nombre));
            }

            if (User.IsInRole("Investigadores"))
            {
                coautorExists =
                    evento.CoautorInternoEventos.Where(
                        x => x.Investigador.Id == CurrentInvestigador().Id).Count();

                if (evento.Usuario.Id != CurrentUser().Id && coautorExists == 0)
                    return RedirectToHomeIndex("no lo puede modificar");
            }

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
                                   [Bind(Prefix = "Sesion")] SesionEventoForm[] sesion,
                                   EventoForm form)
        {
            coautorExterno = coautorExterno ?? new CoautorExternoProductoForm[] { };
            coautorInterno = coautorInterno ?? new CoautorInternoProductoForm[] { };
            institucion = institucion ?? new InstitucionProductoForm[] { };
            sesion = sesion ?? new SesionEventoForm[] { };

            var evento = eventoMapper.Map(form, CurrentUser(), CurrentInvestigador(),
                                          coautorExterno, coautorInterno, institucion, sesion);
            ModelState.AddModelErrors(evento.ValidationResults(), true, "Evento");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            eventoService.SaveEvento(evento);
            SetMessage(String.Format("Evento {0} ha sido creado", evento.Nombre));

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

            var file = Request.Files["fileData"];

            var archivo = new Archivo
                              {
                                  Activo = true,
                                  Contenido = file.ContentType,
                                  CreadoEl = DateTime.Now,
                                  CreadoPor = CurrentUser(),
                                  ModificadoEl = DateTime.Now,
                                  ModificadoPor = CurrentUser(),
                                  Nombre = file.FileName,
                                  Tamano = file.ContentLength
                              };

            var datos = new byte[file.ContentLength];
            file.InputStream.Read(datos, 0, datos.Length);
            archivo.Datos = datos;

            if (form["TipoArchivo"] == "ComprobanteEvento")
            {
                archivo.TipoProducto = evento.TipoProducto;
                archivoService.Save(archivo);
                evento.ComprobanteEvento = archivo;
            }

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
            var areaTematicaForm = areaTematicaMapper.Map(catalogoService.GetAreaTematicaById(select));
            var lineaTematicaForm = lineaTematicaMapper.Map(catalogoService.GetLineaTematicaById(areaTematicaForm.LineaTematicaId));

            var form = new ShowFieldsForm
            {
                AreaTematicaLineaTematicaNombre = lineaTematicaForm.Nombre,
                AreaTematicaId = areaTematicaForm.Id
            };

            return Rjs("ChangeAreaTematica", form);
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

            var form = new SesionEventoForm { Id = sesionId };
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

            var form = new CoautorForm { ModelId = id, InvestigadorId = investigadorId };

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
        [Authorize]
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
        [Authorize]
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

        private EventoForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        private EventoForm SetupNewForm(EventoForm form)
        {
            form = form ?? new EventoForm();
            var nombreInvestigador = String.Empty;

            if (form.Id == 0)
            {
                form.CoautorExternoEventos = new CoautorExternoProductoForm[] { };
                form.CoautorInternoEventos = new CoautorInternoProductoForm[] { };

                if (User.IsInRole("Investigadores"))
                    nombreInvestigador = String.Format("{0} {1} {2}", CurrentInvestigador().Usuario.Nombre,
                                                       CurrentInvestigador().Usuario.ApellidoPaterno,
                                                       CurrentInvestigador().Usuario.ApellidoMaterno);
            }
            else
                nombreInvestigador = String.Format("{0}", form.InvestigadorNombre);

            form.InvestigadorNombre = nombreInvestigador;

            //Lista de Catalogos Pendientes
            form.TiposParticipaciones = tipoParticipacionMapper.Map(catalogoService.GetTipoParticipacionEventos());
            form.TiposEventos = tipoEventoMapper.Map(catalogoService.GetActiveTipoEventos());

            return form;
        }

        void FormSetCombos(EventoForm form)
        {
            ViewData["TipoEvento"] = form.TipoEventoId;
            ViewData["TipoParticipacion"] = form.TipoParticipacionId;
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