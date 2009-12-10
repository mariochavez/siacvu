using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class ProyectoController : BaseController<Proyecto, ProyectoForm>
    {
        readonly IProyectoService proyectoService;
        readonly IProyectoMapper proyectoMapper;
        readonly ICatalogoService catalogoService;
        readonly ITipoProyectoMapper tipoProyectoMapper;
        readonly IConvenioMapper convenioMapper;
        readonly IInvestigadorMapper investigadorMapper;
        readonly IResponsableProyectoMapper responsableProyectoMapper;
        readonly IParticipanteInternoProyectoMapper participanteInternoProyectoMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly IParticipanteExternoProyectoMapper participanteExternoProyectoMapper;
        readonly ISedeMapper sedeMapper;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IAmbitoMapper ambitoMapper;
        readonly IMonedaMapper monedaMapper;
        readonly IInstitucionMapper institucionMapper;
        readonly INivelEstudioMapper nivelEstudioMapper;
        readonly ISectorMapper sectorMapper;
        readonly IDepartamentoMapper departamentoMapper;
        readonly IInvestigadorService investigadorService;
        readonly IRecursoFinancieroProyectoMapper recursoFinancieroProyectoMapper;
        readonly IFondoConacytMapper fondoConacytMapper;
        readonly IGradoAcademicoMapper gradoAcademicoMapper;
        readonly IAreaTematicaMapper areaTematicaMapper;
        readonly ICustomCollection customCollection;
        readonly IAreaMapper areaMapper;
        readonly IConvenioService convenioService;
        readonly IVinculacionAPyDMapper vinculacionAPyDMapper;
        readonly IEstudianteProyectoMapper estudianteProyectoMapper;
        readonly IProductoGeneradoProyectoMapper productoGeneradoProyectoMapper;

        public ProyectoController(IProyectoService proyectoService, IProyectoMapper proyectoMapper, ICatalogoService catalogoService, 
                                  IUsuarioService usuarioService, ITipoProyectoMapper tipoProyectoMapper, IConvenioMapper convenioMapper, 
                                  IInvestigadorMapper investigadorMapper, IResponsableProyectoMapper responsableProyectoMapper, 
                                  IParticipanteInternoProyectoMapper participanteInternoProyectoMapper, ICustomCollection customCollection,
                                  IInvestigadorExternoMapper investigadorExternoMapper, IParticipanteExternoProyectoMapper participanteExternoProyectoMapper, 
                                  ISedeMapper sedeMapper, ILineaTematicaMapper lineaTematicaMapper, 
                                  IAmbitoMapper ambitoMapper, IMonedaMapper monedaMapper, 
                                  IInstitucionMapper institucionMapper, 
                                  INivelEstudioMapper nivelEstudioMapper, ISectorMapper sectorMapper, IOrganizacionMapper organizacionMapper, 
                                  INivelMapper nivelMapper, IDepartamentoMapper departamentoMapper, IDisciplinaMapper disciplinaMapper, 
                                  ISubdisciplinaMapper subdisciplinaMapper, ISearchService searchService, IInvestigadorService investigadorService,
                                  IRecursoFinancieroProyectoMapper recursoFinancieroProyectoMapper,
                                  IFondoConacytMapper fondoConacytMapper,
                                  IGradoAcademicoMapper gradoAcademicoMapper, IRamaMapper ramaMapper, IClaseMapper claseMapper,
                                  IAreaTematicaMapper areaTematicaMapper, IAreaMapper areaMapper, IConvenioService convenioService,
                                  IVinculacionAPyDMapper vinculacionAPyDMapper, IEstudianteProyectoMapper estudianteProyectoMapper,
                                  IProductoGeneradoProyectoMapper productoGeneradoProyectoMapper)
            : base(usuarioService, searchService, catalogoService, disciplinaMapper, subdisciplinaMapper, organizacionMapper, nivelMapper, ramaMapper, claseMapper)
        {
        
            this.catalogoService = catalogoService;
            this.customCollection = customCollection;
            this.proyectoService = proyectoService;
            this.proyectoMapper = proyectoMapper;
            this.tipoProyectoMapper = tipoProyectoMapper;
            this.convenioMapper = convenioMapper;
            this.investigadorMapper = investigadorMapper;
            this.responsableProyectoMapper = responsableProyectoMapper;
            this.participanteInternoProyectoMapper = participanteInternoProyectoMapper;
            this.investigadorExternoMapper = investigadorExternoMapper;
            this.participanteExternoProyectoMapper = participanteExternoProyectoMapper;
            this.sedeMapper = sedeMapper;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.ambitoMapper = ambitoMapper;
            this.monedaMapper = monedaMapper;
            this.institucionMapper = institucionMapper;
            this.nivelEstudioMapper = nivelEstudioMapper;
            this.sectorMapper = sectorMapper;
            this.departamentoMapper = departamentoMapper;
            this.investigadorService = investigadorService;
            this.recursoFinancieroProyectoMapper = recursoFinancieroProyectoMapper;
            this.fondoConacytMapper = fondoConacytMapper;
            this.gradoAcademicoMapper = gradoAcademicoMapper;
            this.areaTematicaMapper = areaTematicaMapper;
            this.areaMapper = areaMapper;
            this.convenioService = convenioService;
            this.vinculacionAPyDMapper = vinculacionAPyDMapper;
            this.estudianteProyectoMapper = estudianteProyectoMapper;
            this.productoGeneradoProyectoMapper = productoGeneradoProyectoMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var proyectos = proyectoService.GetAllProyectos();
            data.List = proyectoMapper.Map(proyectos);

            return View(data);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
            ViewData["SectorId"] = (from s in data.Form.Sectores where s.Nombre == "INSTITUCIONES DEL SECTOR ENTIDADES PARAESTATALES" select s.Id).FirstOrDefault();
            ViewData["OrganizacionId"] = (from o in data.Form.Organizaciones where o.Nombre == "EL COLEGIO DE LA FRONTERA NORTE, A. C." select o.Id).FirstOrDefault();
            ViewData["SectorEconomicoId"] = (from se in data.Form.SectoresEconomicos where se.Nombre == "Servicios profesionales cientificos y tecnicos" select se.Id).FirstOrDefault();
            ViewData["RamaId"] = (from r in data.Form.Ramas where r.Nombre == "Servicios de investigacion cientifica y desarrollo" select r.Id).FirstOrDefault();
            ViewData["ClaseId"] = (from c in data.Form.Clases where c.Nombre == "Servicios de investigacion y desarrollo en ciencias sociales y humanidades prestados por el sector publi" select c.Id).FirstOrDefault();

            return View(data);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var proyecto = proyectoService.GetProyectoById(id);

            //if (proyecto == null)
            //    return RedirectToIndex("no ha sido encontrado", true);
            //if (proyecto.Usuario.Id != CurrentUser().Id)
            //    return RedirectToIndex("no lo puede modificar", true);

            var proyectoForm = proyectoMapper.Map(proyecto);

            data.Form = SetupNewForm(proyectoForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var proyecto = proyectoService.GetProyectoById(id);
            var proyectoForm = proyectoMapper.Map(proyecto);

            data.Form = SetupShowForm(proyectoForm);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create([Bind(Prefix = "Responsable")] ResponsableProyectoForm[] responsables,
                                   [Bind(Prefix = "ParticipanteInterno")] ParticipanteInternoProductoForm[] participantesInternos,
                                   [Bind(Prefix = "ParticipanteExterno")] ParticipanteExternoProductoForm[] participantesExternos,
                                   [Bind(Prefix = "RecursoFinanciero")] RecursoFinancieroProyectoForm[] recursos,
                                   [Bind(Prefix = "Estudiante")] EstudianteProyectoForm[] estudiantes,
                                   [Bind(Prefix = "ProductoGenerado")] ProductoGeneradoProyectoForm[] productos,
                                   ProyectoForm form)
        {
            responsables = responsables ?? new ResponsableProyectoForm[] {};
            recursos = recursos ?? new RecursoFinancieroProyectoForm[] {};
            estudiantes = estudiantes ?? new EstudianteProyectoForm[] {};
            productos = productos ?? new ProductoGeneradoProyectoForm[] {};
            participantesInternos = participantesInternos ?? new ParticipanteInternoProductoForm[] { };
            participantesExternos = participantesExternos ?? new ParticipanteExternoProductoForm[] { };

            var proyecto = proyectoMapper.Map(form, CurrentUser(), CurrentInvestigador(), responsables,
                                              participantesInternos, participantesExternos,
                                              recursos, estudiantes, productos);

            if (!IsValidateModel(proyecto, form, Title.New, "Proyecto"))
            {
                var proyectoForm = proyectoMapper.Map(proyecto);

                ((GenericViewData<ProyectoForm>)ViewData.Model).Form = SetupNewForm(proyectoForm);
                FormSetCombos(proyectoForm);
                return ViewNew();
            }

            proyectoService.SaveProyecto(proyecto, false);

            return RedirectToIndex(String.Format("Proyecto {0} ha sido creado", proyecto.Nombre));
        }

        [CustomTransaction]
        [Authorize]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ProyectoForm form)
        {
            var proyecto = proyectoMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(proyecto, form, Title.Edit))
            {
                var proyectoForm = proyectoMapper.Map(proyecto);

                ((GenericViewData<ProyectoForm>)ViewData.Model).Form = SetupNewForm(proyectoForm);
                FormSetCombos(proyectoForm);
                return ViewEdit();
            }

            proyectoService.SaveProyecto(proyecto, false);

            return RedirectToIndex(String.Format("Proyecto {0} ha sido modificado", proyecto.Nombre));
        }
        
        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Proyecto>(x => x.Nombre, q);
            return Content(data);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeConvenio(int select)
        {
            var convenioForm = convenioMapper.Map(convenioService.GetConvenioById(select));

            return Rjs("ChangeConvenio", convenioForm);
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
        public ActionResult NewResponsable(int id)
        {
            var proyecto = proyectoService.GetProyectoById(id);
            var form = new ProyectoForm();

            if (proyecto != null)
                form.Id = proyecto.Id;

            return Rjs("NewResponsable", form);
        }


        [Authorize]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddResponsable([Bind(Prefix = "Responsable")]ResponsableProyectoForm form, int proyectoId)
        {
            var responsableProyecto = responsableProyectoMapper.Map(form);

            ModelState.AddModelErrors(responsableProyecto.ValidationResults(), false, "Responsable", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (proyectoId != 0)
            {
                responsableProyecto.CreadoPor = CurrentUser();
                responsableProyecto.ModificadoPor = CurrentUser();

                var proyecto = proyectoService.GetProyectoById(proyectoId);
                var alreadyHasIt =
                    proyecto.ResponsableProyectos.Where(
                        x => x.Investigador.Id == responsableProyecto.Investigador.Id).Count();

                if (alreadyHasIt == 0)
                {
                    proyecto.AddResponsable(responsableProyecto);
                    proyectoService.SaveProyecto(proyecto, false);
                }
            }

            var responsableProyectoForm = responsableProyectoMapper.Map(responsableProyecto);
            responsableProyectoForm.ParentId = proyectoId;

            return Rjs("AddResponsable", responsableProyectoForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteResponsable(int id, int investigadorId)
        {
            var proyecto = proyectoService.GetProyectoById(id);

            if (proyecto != null)
            {
                var responsable = proyecto.ResponsableProyectos.Where(x => x.Investigador.Id == investigadorId).First();
                proyecto.DeleteResponsable(responsable);

                proyectoService.SaveProyecto(proyecto, false);
            }

            var form = new ResponsableProyectoForm {InvestigadorId = investigadorId};

            return Rjs("DeleteResponsable", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewRecursoFinanciero(int id)
        {
            var proyecto = proyectoService.GetProyectoById(id);
            var form = new ProyectoForm();

            if (proyecto != null)
                form.Id = proyecto.Id;

            form.Monedas = monedaMapper.Map(catalogoService.GetActiveMonedas());

            return Rjs("NewRecursoFinanciero", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddRecursoFinanciero([Bind(Prefix = "RecursoFinanciero")] RecursoFinancieroProyectoForm form, int proyectoId)
        {
            var recursoFinancieroProyecto = recursoFinancieroProyectoMapper.Map(form);

            ModelState.AddModelErrors(recursoFinancieroProyecto.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (proyectoId != 0)
            {
                recursoFinancieroProyecto.CreadoPor = CurrentUser();
                recursoFinancieroProyecto.ModificadoPor = CurrentUser();

                var proyecto = proyectoService.GetProyectoById(proyectoId);
                var alreadyHasIt =
                    proyecto.RecursoFinancieroProyectos.Where(
                        x => x.Institucion.Id == recursoFinancieroProyecto.Institucion.Id).Count();


                if (alreadyHasIt == 0)
                {
                    proyecto.AddRecursoFinanciero(recursoFinancieroProyecto);
                    proyectoService.SaveProyecto(proyecto, false);
                }
            }

            var recursoFinancieroProyectoForm = recursoFinancieroProyectoMapper.Map(recursoFinancieroProyecto);
            recursoFinancieroProyectoForm.ParentId = proyectoId;

            return Rjs("AddRecursoFinanciero", recursoFinancieroProyectoForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteRecursoFinanciero(int id, int institucionId, int monto, int tipoMoneda)
        {
            var proyecto = proyectoService.GetProyectoById(id);

            if (proyecto != null)
            {
                var recurso = proyecto.RecursoFinancieroProyectos.Where(x => x.Institucion.Id == institucionId).First();
                proyecto.DeleteRecursoFinanciero(recurso);

                proyectoService.SaveProyecto(proyecto, false);
            }

            var form = new RecursoFinancieroProyectoForm {InstitucionId = institucionId, Monto = monto, MonedaId = tipoMoneda};

            return Rjs("DeleteRecursoFinanciero", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewEstudiante(int id)
        {
            var proyecto = proyectoService.GetProyectoById(id);
            var form = new ProyectoForm();

            if (proyecto != null)
                form.Id = proyecto.Id;

            form.TiposEstudiantes = customCollection.TipoEstudianteCustomCollection();
            form.GradosAcademicos = gradoAcademicoMapper.Map(catalogoService.GetActiveGrados());

            return Rjs("NewEstudiante", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddEstudiante([Bind(Prefix = "Estudiante")] EstudianteProyectoForm form, int proyectoId)
        {
            var estudianteProyecto = estudianteProyectoMapper.Map(form);

            ModelState.AddModelErrors(estudianteProyecto.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (proyectoId != 0)
            {
                estudianteProyecto.CreadoPor = CurrentUser();
                estudianteProyecto.ModificadoPor = CurrentUser();

                var proyecto = proyectoService.GetProyectoById(proyectoId);
                var alreadyHasIt =
                    proyecto.EstudianteProyectos.Where(
                        x => x.NombreEstudiante == estudianteProyecto.NombreEstudiante).Count();


                if (alreadyHasIt == 0)
                {
                    proyecto.AddEstudiante(estudianteProyecto);
                    proyectoService.SaveProyecto(proyecto, false);
                }
            }

            var estudianteProyectoForm = estudianteProyectoMapper.Map(estudianteProyecto);
            estudianteProyectoForm.ParentId = proyectoId;

            return Rjs("AddEstudiante", estudianteProyectoForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteEstudiante(int id, string nombreEstudiante)
        {
            var proyecto = proyectoService.GetProyectoById(id);

            if (proyecto != null)
            {
                var estudiante = proyecto.EstudianteProyectos.Where(x => x.NombreEstudiante == nombreEstudiante.Replace("_", " ")).First();
                proyecto.DeleteEstudiante(estudiante);

                proyectoService.SaveProyecto(proyecto, false);
            }

            var form = new EstudianteProyectoForm {NombreEstudiante = nombreEstudiante};

            return Rjs("DeleteEstudiante", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewParticipanteInterno(int id)
        {
            var proyecto = proyectoService.GetProyectoById(id);
            var form = new ParticipanteForm {Controller = "Proyecto", IdName = "ProyectoId"};

            if (proyecto != null)
                form.Id = proyecto.Id;

            return Rjs("NewParticipanteInterno", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddParticipanteInterno([Bind(Prefix = "ParticipanteInterno")] ParticipanteInternoProductoForm form,
                                                    int proyectoId)
        {
            var participanteInternoProyecto = participanteInternoProyectoMapper.Map(form);

            ModelState.AddModelErrors(participanteInternoProyecto.ValidationResults(), false, "ParticipanteInterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (proyectoId != 0)
            {
                participanteInternoProyecto.CreadoPor = CurrentUser();
                participanteInternoProyecto.ModificadoPor = CurrentUser();

                var proyecto = proyectoService.GetProyectoById(proyectoId);
                var alreadyHasIt =
                    proyecto.ParticipanteInternoProyectos.Where(
                        x => x.Investigador.Id == participanteInternoProyecto.Investigador.Id).Count();

                if (alreadyHasIt == 0)
                {
                    proyecto.AddParticipanteInterno(participanteInternoProyecto);
                    proyectoService.SaveProyecto(proyecto, false);
                }
            }

            var participanteInternoProyectoForm = participanteInternoProyectoMapper.Map(participanteInternoProyecto);
            participanteInternoProyectoForm.ParentId = proyectoId;

            return Rjs("AddParticipanteInterno", participanteInternoProyectoForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteParticipanteInterno(int id, int investigadorId)
        {
            var proyecto = proyectoService.GetProyectoById(id);

            if (proyecto != null)
            {
                var participante = proyecto.ParticipanteInternoProyectos.Where(x => x.Investigador.Id == investigadorId).First();
                proyecto.DeleteParticipanteInterno(participante);

                proyectoService.SaveProyecto(proyecto, false);
            }

            var form = new ParticipanteForm {InvestigadorId = investigadorId};

            return Rjs("DeleteParticipanteInterno", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewParticipanteExterno(int id)
        {
            var proyecto = proyectoService.GetProyectoById(id);
            var form = new ParticipanteForm { Controller = "Proyecto", IdName = "ProyectoId", InvestigadorExterno = new InvestigadorExternoForm()};

            if (proyecto != null)
                form.Id = proyecto.Id;

            return Rjs("NewParticipanteExterno", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddParticipanteExterno([Bind(Prefix = "ParticipanteExterno")] ParticipanteExternoProductoForm form,
            int proyectoId)
        {
            var investigadorExternoForm = new InvestigadorExternoForm
                                              {
                                                  Nombre = form.InvestigadorExternoNombre,
                                                  ApellidoPaterno = form.InvestigadorExternoApellidoPaterno,
                                                  ApellidoMaterno = form.InvestigadorExternoApellidoMaterno
                                              };

            var investigadorExterno = investigadorExternoMapper.Map(investigadorExternoForm);

            ModelState.AddModelErrors(investigadorExterno.ValidationResults(), false, "ParticipanteExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            investigadorExterno.CreadoPor = CurrentUser();
            investigadorExterno.ModificadoPor = CurrentUser();

            catalogoService.SaveInvestigadorExterno(investigadorExterno);
            investigadorExternoForm = investigadorExternoMapper.Map(investigadorExterno);

            form.InvestigadorExternoId = investigadorExternoForm.Id;
            var participanteExternoProyecto = participanteExternoProyectoMapper.Map(form);

            ModelState.AddModelErrors(participanteExternoProyecto.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (proyectoId != 0)
            {
                participanteExternoProyecto.CreadoPor = CurrentUser();
                participanteExternoProyecto.ModificadoPor = CurrentUser();

                var proyecto = proyectoService.GetProyectoById(proyectoId);
                var alreadyHasIt =
                    proyecto.ParticipanteExternoProyectos.Where(
                        x => x.InvestigadorExterno.Id == participanteExternoProyecto.InvestigadorExterno.Id).Count();

                if (alreadyHasIt == 0)
                {
                    proyecto.AddParticipanteExterno(participanteExternoProyecto);
                    proyectoService.SaveProyecto(proyecto, false);
                }
            }

            var participanteExternoProyectoForm = participanteExternoProyectoMapper.Map(participanteExternoProyecto);
            participanteExternoProyectoForm.ParentId = proyectoId;

            return Rjs("AddParticipanteExterno", participanteExternoProyectoForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteParticipanteExterno(int id, int investigadorExternoId)
        {
            var proyecto = proyectoService.GetProyectoById(id);

            if (proyecto != null)
            {
                var participante = proyecto.ParticipanteExternoProyectos.Where(x => x.InvestigadorExterno.Id == investigadorExternoId).First();
                proyecto.DeleteParticipanteExterno(participante);

                proyectoService.SaveProyecto(proyecto, false);
            }

            var form = new ParticipanteForm { InvestigadorExternoId = investigadorExternoId };

            return Rjs("DeleteParticipanteExterno", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewProducto(int id)
        {
            var proyecto = proyectoService.GetProyectoById(id);
            var form = new ProyectoForm();

            if (proyecto != null)
                form.Id = proyecto.Id;

            form.ProductosGenerados = customCollection.ProductoGeneradoCustomCollection();

            return Rjs("NewProducto", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddProducto([Bind(Prefix = "ProductoGenerado")] ProductoGeneradoProyectoForm form, int proyectoId)
        {
            var productoGeneradoProyecto = productoGeneradoProyectoMapper.Map(form);

            ModelState.AddModelErrors(productoGeneradoProyecto.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (proyectoId != 0)
            {
                productoGeneradoProyecto.CreadoPor = CurrentUser();
                productoGeneradoProyecto.ModificadoPor = CurrentUser();

                var proyecto = proyectoService.GetProyectoById(proyectoId);

                proyecto.AddProducto(productoGeneradoProyecto);
                proyectoService.SaveProyecto(proyecto, true);
            }

            var productoGeneradoProyectoForm = productoGeneradoProyectoMapper.Map(productoGeneradoProyecto);

            if (proyectoId == 0)
            {
                var buffer = Guid.NewGuid().ToByteArray();
                productoGeneradoProyectoForm.Id = BitConverter.ToInt32(buffer, 0);
            }

            productoGeneradoProyectoForm.ParentId = proyectoId;

            return Rjs("AddProducto", productoGeneradoProyectoForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteProducto(int id, int productoGeneradoId)
        {
            var proyecto = proyectoService.GetProyectoById(id);

            if (proyecto != null)
            {
                var producto = proyecto.ProductoGeneradoProyectos.Where(x => x.Id == productoGeneradoId).First();
                proyecto.DeleteProducto(producto);

                proyectoService.SaveProyecto(proyecto, false);
            }

            var form = new ProductoGeneradoProyectoForm { Id = productoGeneradoId };

            return Rjs("DeleteProducto", form);
        }

        ProyectoForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        ProyectoForm SetupNewForm(ProyectoForm form)
        {
            form = form ?? new ProyectoForm();

            form.ResponsableProyecto = new ResponsableProyectoForm();
            form.RecursoFinancieroProyecto = new RecursoFinancieroProyectoForm();

            //Lista de Catalogos
            form.TiposProyectos = tipoProyectoMapper.Map(catalogoService.GetActiveTipoProyectos());
            form.EstatusProyectos = customCollection.EstadoProyectoCustomCollection();
            form.Convenios = convenioMapper.Map(convenioService.GetAllConvenios());
            form.SectoresFinanciamientos = sectorMapper.Map(catalogoService.GetActiveSectoresFinanciamientos());
            form.FondosConacyt = fondoConacytMapper.Map(catalogoService.GetActiveFondoConacyts());
            form.ImpactoPuliticaPublicas = customCollection.ImpactoPoliticaPublicaCustomCollection();
            form.VinculacionesAPyDs = vinculacionAPyDMapper.Map(catalogoService.GetActiveVinculacionAPyDs());
            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = GetDisciplinasByAreaId(form.AreaId);
            form.Subdisciplinas = GetSubdisciplinasByDisciplinaId(form.DisciplinaId);

            form.Sectores = sectorMapper.Map(catalogoService.GetActiveSectores());
            form.SectoresEconomicos = sectorMapper.Map(catalogoService.GetActiveSectoresEconomicos());

            if (form.Id == 0)
            {
                var sectorId = (from s in form.Sectores where s.Nombre == "INSTITUCIONES DEL SECTOR ENTIDADES PARAESTATALES" select s.Id).FirstOrDefault();
                form.Organizaciones = GetOrganizacionesBySectorId(sectorId);

                var organizacionId = (from o in form.Organizaciones where o.Nombre == "EL COLEGIO DE LA FRONTERA NORTE, A. C." select o.Id).FirstOrDefault();
                form.Niveles = GetNivelesByOrganizacionId(organizacionId);

                var sectorEconomicoId = (from se in form.SectoresEconomicos where se.Nombre == "Servicios profesionales cientificos y tecnicos" select se.Id).FirstOrDefault();
                form.Ramas = GetRamasBySectorEconomicoId(sectorEconomicoId);

                var ramaId = (from r in form.Ramas where r.Nombre == "Servicios de investigacion cientifica y desarrollo" select r.Id).FirstOrDefault();
                form.Clases = GetClasesByRamaId(ramaId);
            }
            else
            {
                form.Organizaciones = GetOrganizacionesBySectorId(form.SectorId);
                form.Niveles = GetNivelesByOrganizacionId(form.OrganizacionId);

                form.Ramas = GetRamasBySectorEconomicoId(form.SectorEconomicoId);
                form.Clases = GetClasesByRamaId(form.RamaId);
            }

            return form;
        }

        private void FormSetCombos(ProyectoForm form)
        {
            ViewData["TipoProyecto"] = form.TipoProyectoId;
            ViewData["EstadoProyecto"] = form.EstadoProyecto;
            ViewData["Convenio"] = form.ConvenioId;
            ViewData["SectorFinanciamiento"] = form.SectorFinanciamientoId;
            ViewData["FondoConacyt"] = form.FondoConacytId;
            ViewData["ImpactoPoliticaPublica"] = form.ImpactoPoliticaPublica;
            ViewData["VinculacionAPyD"] = form.VinculacionAPyDId;

            ViewData["AreaId"] = form.AreaId;
            ViewData["DisciplinaId"] = form.DisciplinaId;
            ViewData["SubdisciplinaId"] = form.SubdisciplinaId;

            ViewData["SectorId"] = form.SectorId;
            ViewData["OrganizacionId"] = form.OrganizacionId;
            ViewData["Nivel2Id"] = form.Nivel2Id;

            ViewData["SectorEconomicoId"] = form.SectorEconomicoId;
            ViewData["RamaId"] = form.RamaId;
            ViewData["ClaseId"] = form.ClaseId;
        }

        private ProyectoForm SetupShowForm(ProyectoForm form)
        {
            form = form ?? new ProyectoForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      SubdisciplinaNombre = form.SubdisciplinaNombre,
                                      DisciplinaNombre = form.DisciplinaNombre,
                                      AreaNombre = form.AreaNombre,

                                      Nivel2Nombre = form.Nivel2Nombre,
                                      OrganizacionNombre = form.OrganizacionNombre,
                                      SectorNombre = form.SectorNombre,

                                      ClaseNombre = form.ClaseNombre,
                                      RamaNombre = form.RamaNombre,
                                      SectorEconomicoNombre = form.SectorEconomicoNombre,

                                      IsShowForm = true
                                  };

            return form;
        }
    }
}