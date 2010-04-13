using System;
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
    public class ParticipacionMedioController : BaseController<ParticipacionMedio, ParticipacionMedioForm>
    {
        readonly IAmbitoMapper ambitoMapper;
        readonly IParticipacionMedioMapper participacionMedioMapper;
        readonly IParticipacionMedioService participacionMedioService;
        readonly IDirigidoAMapper dirigidoAMapper;
        readonly ITipoParticipacionMapper tipoParticipacionMapper;
        readonly ILineaTematicaMapper lineaTematicaMapper;

        public ParticipacionMedioController(IParticipacionMedioService participacionMedioService,
                                            IParticipacionMedioMapper participacionMedioMapper,
                                            ICatalogoService catalogoService,
                                            IUsuarioService usuarioService,
                                            IAmbitoMapper ambitoMapper,
                                            ITipoParticipacionMapper tipoParticipacionMapper,
                                            IAreaTematicaMapper areaTematicaMapper,
                                            IDirigidoAMapper dirigidoAMapper,
                                            ISearchService searchService, 
                                            ILineaTematicaMapper lineaTematicaMapper, 
                                            IAreaMapper areaMapper, 
                                            IDisciplinaMapper disciplinaMapper,
                                ISubdisciplinaMapper subdisciplinaMapper)
            : base(usuarioService, searchService, catalogoService)
        {
            base.catalogoService = catalogoService;
            this.areaTematicaMapper = areaTematicaMapper;
            this.tipoParticipacionMapper = tipoParticipacionMapper;
            this.participacionMedioService = participacionMedioService;
            this.participacionMedioMapper = participacionMedioMapper;
            this.ambitoMapper = ambitoMapper;
            this.dirigidoAMapper = dirigidoAMapper;
            this.lineaTematicaMapper = lineaTematicaMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<ParticipacionMedioForm>();
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

            var data = new GenericViewData<ParticipacionMedioForm> { Form = SetupNewForm() };
            
            return View(data);
        }

        [Authorize(Roles = "Investigadores, DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<ParticipacionMedioForm>();
            var participacionMedio = participacionMedioService.GetParticipacionMedioById(id);

            var verifyMessage = VerifyProductoStatus(participacionMedio.Firma, participacionMedio.Titulo);
            if (!String.IsNullOrEmpty(verifyMessage))
                return RedirectToHomeIndex(verifyMessage);

            if (User.IsInRole("Investigadores"))
            {
                if (participacionMedio.Usuario.Id != CurrentUser().Id)
                    return RedirectToHomeIndex("no lo puede modificar");
            }

            var participacionMedioForm = participacionMedioMapper.Map(participacionMedio);
            if (participacionMedio.AreaTematica != null)
                participacionMedioForm.LineaTematicaId = participacionMedio.AreaTematica.LineaTematica.Id;

            data.Form = SetupNewForm(participacionMedioForm);
            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = new GenericViewData<ParticipacionMedioForm>();

            var participacionMedio = participacionMedioService.GetParticipacionMedioById(id);
            var participacionForm = participacionMedioMapper.Map(participacionMedio);

            data.Form = SetupShowForm(participacionForm);

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

            ModelState.AddModelErrors(participacionMedio.ValidationResults(), true, "ParticipacionMedio");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            participacionMedioService.SaveParticipacionMedio(participacionMedio);
            SetMessage(String.Format("Participación en medio {0} ha sido creada", participacionMedio.Titulo));

            return Rjs("Save", participacionMedio.Id);
        }

        [Authorize]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ParticipacionMedioForm form)
        {
            var participacionMedio = new ParticipacionMedio();

            if (User.IsInRole("Investigadores"))
                participacionMedio = participacionMedioMapper.Map(form, CurrentUser(), CurrentInvestigador());
            if (User.IsInRole("DGAA"))
                participacionMedio = participacionMedioMapper.Map(form, CurrentUser());

            ModelState.AddModelErrors(participacionMedio.ValidationResults(), true, "ParticipacionMedio");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            participacionMedioService.SaveParticipacionMedio(participacionMedio, true);
            SetMessage(String.Format("Participación en medio {0} ha sido modificada", participacionMedio.Titulo));

            return Rjs("Save", participacionMedio.Id);
        }

        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DgaaValidateProduct(FirmaForm firmaForm)
        {

            var participacionMedio = participacionMedioService.GetParticipacionMedioById(firmaForm.ProductoId);

            participacionMedio.Firma.Aceptacion2 = 1;
            participacionMedio.Firma.Usuario2 = CurrentUser();

            participacionMedioService.SaveParticipacionMedio(participacionMedio);

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

            var participacionMedio = participacionMedioService.GetParticipacionMedioById(firmaForm.ProductoId);
            participacionMedio.Firma.Aceptacion1 = 0;
            participacionMedio.Firma.Aceptacion2 = 2;
            participacionMedio.Firma.Descripcion = firmaForm.Descripcion;
            participacionMedio.Firma.Usuario1 = CurrentUser();
            participacionMedio.Firma.Usuario2 = CurrentUser();

            ModelState.AddModelErrors(participacionMedio.ValidationResults(), false, "Firma");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            participacionMedioService.SaveParticipacionMedio(participacionMedio, true);

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
            var data = searchService.Search<ParticipacionMedio>(x => x.Titulo, q);
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
            //               {
            //                   AreaTematicaLineaTematicaNombre = lineaTematicaForm.Nombre,

            //                   AreaTematicaId = areaTematicaForm.Id
            //               };

            //return Rjs("ChangeAreaTematica", form);
            return Rjs("", null);
        }

        ParticipacionMedioForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        ParticipacionMedioForm SetupNewForm(ParticipacionMedioForm form)
        {
            form = form ?? new ParticipacionMedioForm();

            form.LineasTematicas = lineaTematicaMapper.Map(catalogoService.GetActiveLineaTematicas());

            form.Ambitos = ambitoMapper.Map(catalogoService.GetActiveAmbitos());
            form.DirigidosA = dirigidoAMapper.Map(catalogoService.GetActiveDirigidoAs());
            form.TiposParticipaciones = tipoParticipacionMapper.Map(catalogoService.GetTipoParticipacionParticipacionMedios());

            if (form.Id == 0)
            {
                if (User.IsInRole("Investigadores"))
                {
                    form.UsuarioNombre = CurrentInvestigador().Usuario.Nombre;
                    form.UsuarioApellidoPaterno = CurrentInvestigador().Usuario.ApellidoPaterno;
                    form.UsuarioApellidoMaterno = CurrentInvestigador().Usuario.ApellidoMaterno;
                }
            } else
            {
                form.AreasTematicas =
                    areaTematicaMapper.Map(catalogoService.GetAreaTematicasByLineaTematicaId(form.LineaTematicaId));
            }

            return form;
        }

        void FormSetCombos(ParticipacionMedioForm form)
        {
            ViewData["Ambito"] = form.AmbitoId;
            ViewData["DirigidoA"] = form.DirigidoAId;
            ViewData["TipoParticipacion"] = form.TipoParticipacionId;

            ViewData["LineaTematicaId"] = form.LineaTematicaId;
            ViewData["AreaTematicaId"] = form.AreaTematicaId;
        }

        private static ParticipacionMedioForm SetupShowForm(ParticipacionMedioForm form)
        {
            form = form ?? new ParticipacionMedioForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      PalabraClave1 = form.PalabraClave1,
                                      PalabraClave2 = form.PalabraClave2,
                                      PalabraClave3 = form.PalabraClave3,

                                      IsShowForm = true
                                  };

            return form;
        }
    }
}