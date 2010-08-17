using System;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    public class GrupoInvestigacionController : BaseController<GrupoInvestigacion, GrupoInvestigacionForm>
    {
		readonly IGrupoInvestigacionService grupoInvestigacionService;
        readonly IGrupoInvestigacionMapper grupoInvestigacionMapper;
        readonly ISectorMapper sectorMapper;
        readonly IMiembroExternoGrupoInvestigacionMapper miembroExternoGrupoInvestigacionMapper;
        readonly IMiembroInternoGrupoInvestigacionMapper miembroInternoGrupoInvestigacionMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly IInvestigadorService investigadorService;
    
        public GrupoInvestigacionController(IGrupoInvestigacionService grupoInvestigacionService, 
			                                IGrupoInvestigacionMapper grupoInvestigacionMapper, 
			                                ICatalogoService catalogoService, IUsuarioService usuarioService,
                                            ISectorMapper sectorMapper,
                                            IInvestigadorExternoMapper investigadorExternoMapper,
                                            IMiembroExternoGrupoInvestigacionMapper miembroExternoGrupoInvestigacionMapper,
                                            IMiembroInternoGrupoInvestigacionMapper miembroInternoGrupoInvestigacionMapper,
                                            IOrganizacionMapper organizacionMapper,
                                            ISearchService searchService,
                                            INivelMapper nivelMapper, 
                                            IInvestigadorService investigadorService)
            : base(usuarioService, searchService, catalogoService, organizacionMapper, nivelMapper)
        {
			this.catalogoService = catalogoService;
            this.investigadorExternoMapper = investigadorExternoMapper;
            this.miembroExternoGrupoInvestigacionMapper = miembroExternoGrupoInvestigacionMapper;
            this.miembroInternoGrupoInvestigacionMapper = miembroInternoGrupoInvestigacionMapper;
            this.grupoInvestigacionService = grupoInvestigacionService;
            this.grupoInvestigacionMapper = grupoInvestigacionMapper;
            this.sectorMapper = sectorMapper;
            this.investigadorService = investigadorService;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = new GenericViewData<GrupoInvestigacionForm>();
            var grupoInvestigacions = new GrupoInvestigacion[] { };

            if (User.IsInRole("Investigadores"))
                grupoInvestigacions = grupoInvestigacionService.GetAllGrupoInvestigacions(CurrentUser());
            if (User.IsInRole("DGAA"))
                grupoInvestigacions = grupoInvestigacionService.GetAllGrupoInvestigacions();
			
            data.List = grupoInvestigacionMapper.Map(grupoInvestigacions);

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            if (CurrentInvestigador() == null)
                return NoInvestigadorProfile("Por tal motivo no puede crear nuevos productos.");

            var data = new GenericViewData<GrupoInvestigacionForm> { Form = SetupNewForm() };

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<GrupoInvestigacionForm>();

            var grupoInvestigacion = grupoInvestigacionService.GetGrupoInvestigacionById(id);

            if (grupoInvestigacion == null)
                return RedirectToIndex("no ha sido encontrado", true);

            if (grupoInvestigacion.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var grupoInvestigacionForm = grupoInvestigacionMapper.Map(grupoInvestigacion);
            data.Form = SetupNewForm(grupoInvestigacionForm);

            FormSetCombos(data.Form);
            
			ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = new GenericViewData<GrupoInvestigacionForm>();

            var grupoInvestigacion = grupoInvestigacionService.GetGrupoInvestigacionById(id);
            var grupoInvestigacionForm = grupoInvestigacionMapper.Map(grupoInvestigacion);

            data.Form = SetupShowForm(grupoInvestigacionForm);
            
            ViewData.Model = data;
            return View();
        }
        
        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create([Bind(Prefix = "CoautorInterno")] CoautorInternoProductoForm[] miembroInterno,
                                   [Bind(Prefix = "CoautorExterno")] CoautorExternoProductoForm[] miembroExterno,
                                   GrupoInvestigacionForm form)
        {
            miembroExterno = miembroExterno ?? new CoautorExternoProductoForm[] { };
            miembroInterno = miembroInterno ?? new CoautorInternoProductoForm[] { };

            var grupoInvestigacion = grupoInvestigacionMapper.Map(form, CurrentUser(), CurrentInvestigador(),
                                                                  miembroExterno, miembroInterno);

            ModelState.AddModelErrors(grupoInvestigacion.ValidationResults(), true, "GrupoInvestigacion");

            if(!ModelState.IsValid)
            {
                var grupoInvestigacionForm = grupoInvestigacionMapper.Map(grupoInvestigacion);

                ((GenericViewData<GrupoInvestigacionForm>)ViewData.Model).Form = SetupNewForm(grupoInvestigacionForm);
                FormSetCombos(grupoInvestigacionForm);
                return ViewNew();
            }

            grupoInvestigacionService.SaveGrupoInvestigacion(grupoInvestigacion);

            return RedirectToIndex(String.Format("Grupo de Investigación {0} ha sido registrado", grupoInvestigacion.NombreGrupoInvestigacion));
        }
        
        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(GrupoInvestigacionForm form)
        {
            var grupoInvestigacion = grupoInvestigacionMapper.Map(form, CurrentUser());

            if (!IsValidateModel(grupoInvestigacion, form, Title.Edit))
            {
                var grupoInvestigacionForm = grupoInvestigacionMapper.Map(grupoInvestigacion);

                ((GenericViewData<GrupoInvestigacionForm>)ViewData.Model).Form = SetupNewForm(grupoInvestigacionForm);
                FormSetCombos(grupoInvestigacionForm);
                return ViewEdit();
            }

            grupoInvestigacionService.SaveGrupoInvestigacion(grupoInvestigacion);
            return RedirectToIndex(String.Format("Grupo de Investigación {0} ha sido modificado", grupoInvestigacion.NombreGrupoInvestigacion));
        }
        
        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<GrupoInvestigacion>(x => x.NombreGrupoInvestigacion, q);
            return Content(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id, bool esAlfabeticamente)
        {
            var grupoInvestigacion = grupoInvestigacionService.GetGrupoInvestigacionById(id);
            var form = new CoautorForm
            {
                Controller = "GrupoInvestigacion",
                IdName = "GrupoInvestigacionId",
                InvestigadorExterno = new InvestigadorExternoForm(),
                CoautorSeOrdenaAlfabeticamente = esAlfabeticamente
            };

            if (grupoInvestigacion != null)
                form.Id = grupoInvestigacion.Id;

            return Rjs("NewCoautorExterno", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorExterno([Bind(Prefix = "CoautorExterno")] CoautorExternoProductoForm form,
                                              int grupoInvestigacionId)
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
            var miembroExternoGrupoInvestigacion = miembroExternoGrupoInvestigacionMapper.Map(form);

            ModelState.AddModelErrors(miembroExternoGrupoInvestigacion.ValidationResults(), false, "CoautorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (grupoInvestigacionId != 0)
            {
                miembroExternoGrupoInvestigacion.CreadoPor = CurrentUser();
                miembroExternoGrupoInvestigacion.ModificadoPor = CurrentUser();

                var grupoInvestigacion = grupoInvestigacionService.GetGrupoInvestigacionById(grupoInvestigacionId);

                var alreadyHasIt =
                    grupoInvestigacion.MiembroExternoGrupoInvestigaciones.Where(
                        x => x.InvestigadorExterno.Id == miembroExternoGrupoInvestigacion.InvestigadorExterno.Id).Count();

                if (alreadyHasIt == 0)
                {
                    grupoInvestigacion.AddMiembroExterno(miembroExternoGrupoInvestigacion);
                    grupoInvestigacionService.SaveGrupoInvestigacion(grupoInvestigacion);
                }
            }

            var miembroExternoGrupoInvestigacionForm = miembroExternoGrupoInvestigacionMapper.Map(miembroExternoGrupoInvestigacion);
            miembroExternoGrupoInvestigacionForm.ParentId = grupoInvestigacionId;

            return Rjs("AddCoautorExterno", miembroExternoGrupoInvestigacionForm);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteCoautorExterno(int id, int investigadorExternoId)
        {
            var grupoInvestigacion = grupoInvestigacionService.GetGrupoInvestigacionById(id);

            if (grupoInvestigacion != null)
            {
                var miembro = grupoInvestigacion.MiembroExternoGrupoInvestigaciones.Where(x => x.InvestigadorExterno.Id == investigadorExternoId).First();
                grupoInvestigacion.DeleteMiembroExterno(miembro);

                grupoInvestigacionService.SaveGrupoInvestigacion(grupoInvestigacion);
            }

            var form = new MiembroExternoGrupoInvestigacionForm{InvestigadorExternoId = investigadorExternoId};

            return Rjs("DeleteMiembroExterno", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorInterno(int id, bool esAlfabeticamente)
        {
            var grupoInvestigacion = grupoInvestigacionService.GetGrupoInvestigacionById(id);

            var form = new CoautorForm
                           {
                               Controller = "GrupoInvestigacion",
                               IdName = "GrupoInvestigacionId",
                               CoautorSeOrdenaAlfabeticamente = esAlfabeticamente
                           };

            if (User.IsInRole("Investigadores"))
                form.CreadoPorId = CurrentInvestigador().Id;

            if (grupoInvestigacion != null)
            {
                form.Id = grupoInvestigacion.Id;
                var investigador = investigadorService.GetInvestigadorByUsuario(grupoInvestigacion.CreadoPor.UsuarioNombre);
                form.CreadoPorId = investigador.Id;
            }

            return Rjs("NewCoautorInterno", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorInterno([Bind(Prefix = "CoautorInterno")] CoautorInternoProductoForm form,
                                              int grupoInvestigacionId)
        {
            var miembroInternoGrupoInvestigacion = miembroInternoGrupoInvestigacionMapper.Map(form);

            ModelState.AddModelErrors(miembroInternoGrupoInvestigacion.ValidationResults(), false, "CoautorInterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if(grupoInvestigacionId != 0)
            {
                miembroInternoGrupoInvestigacion.CreadoPor = CurrentUser();
                miembroInternoGrupoInvestigacion.ModificadoPor = CurrentUser();

                var grupoInvestigacion = grupoInvestigacionService.GetGrupoInvestigacionById(grupoInvestigacionId);
                var alreadyHasIt = grupoInvestigacion.MiembroInternoGrupoInvestigaciones.Where(
                        x => x.Investigador.Id == miembroInternoGrupoInvestigacion.Investigador.Id).Count();

                if (alreadyHasIt == 0)
                {
                    grupoInvestigacion.AddMiembroInterno(miembroInternoGrupoInvestigacion);
                    grupoInvestigacionService.SaveGrupoInvestigacion(grupoInvestigacion);
                }
            }

            var miembroInternoGrupoInvestigacionForm =
                miembroInternoGrupoInvestigacionMapper.Map(miembroInternoGrupoInvestigacion);
            miembroInternoGrupoInvestigacionForm.ParentId = grupoInvestigacionId;

            return Rjs("AddCoautorInterno", miembroInternoGrupoInvestigacionForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteCoautorInterno(int id, int investigadorId)
        {
            var grupoInvestigacion = grupoInvestigacionService.GetGrupoInvestigacionById(id);

            if(grupoInvestigacion != null)
            {
                var miembro = grupoInvestigacion.MiembroInternoGrupoInvestigaciones.Where(x => x.Investigador.Id == investigadorId).First();

                grupoInvestigacion.DeleteMiembroInterno(miembro);

                grupoInvestigacionService.SaveGrupoInvestigacion(grupoInvestigacion);
            }

            var form = new CoautorForm { ModelId = id, InvestigadorId = investigadorId };

            return Rjs("DeleteCoautorInterno", form);
        }

        GrupoInvestigacionForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        GrupoInvestigacionForm SetupNewForm(GrupoInvestigacionForm form)
        {
            form = form ?? new GrupoInvestigacionForm();

            form.Sectores = sectorMapper.Map(catalogoService.GetActiveSectores());
            form.Organizaciones = GetOrganizacionesBySectorId(form.SectorId);
            form.Niveles = GetNivelesByOrganizacionId(form.OrganizacionId);

            if (form.Id == 0)
            {
                form.MiembroExternoGrupoInvestigaciones = new CoautorExternoProductoForm[]{};
                form.MiembroInternoGrupoInvestigaciones = new CoautorInternoProductoForm[]{};

                if (User.IsInRole("Investigadores"))
                {
                    form.UsuarioNombre = CurrentInvestigador().Usuario.Nombre;
                    form.UsuarioApellidoPaterno = CurrentInvestigador().Usuario.ApellidoPaterno;
                    form.UsuarioApellidoMaterno = CurrentInvestigador().Usuario.ApellidoMaterno;
                }

                form.PosicionCoautor = 1;
            }

            return form;
        }

        void FormSetCombos(GrupoInvestigacionForm form)
        {
            ViewData["SectorId"] = form.SectorId;
            ViewData["OrganizacionId"] = form.OrganizacionId;
            ViewData["Nivel2Id"] = form.Nivel2Id;
        }

        private static GrupoInvestigacionForm SetupShowForm(GrupoInvestigacionForm form)
        {
            form = form ?? new GrupoInvestigacionForm();
            form.ShowFields = new ShowFieldsForm
                                  {
                                      Nivel2Nombre = form.Nivel2Nombre,
                                      OrganizacionNombre = form.OrganizacionNombre,
                                      SectorNombre = form.SectorNombre,

                                      IsShowForm = true
                                  };

            return form;
        }
    }
}