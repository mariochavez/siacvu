using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos
{
    [HandleError]
    public class ParticipacionMedioController : BaseController<ParticipacionMedio, ParticipacionMedioForm>
    {
        readonly IAmbitoMapper ambitoMapper;
        readonly ICatalogoService catalogoService;
        readonly IEstadoPaisMapper estadoPaisMapper;
        readonly IGeneroMapper generoMapper;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IMedioElectronicoMapper medioElectronicoMapper;
        readonly IMedioImpresoMapper medioImpresoMapper;
        readonly IPaisMapper paisMapper;
        readonly IParticipacionMedioMapper participacionMedioMapper;
        readonly IParticipacionMedioService participacionMedioService;
        readonly IPeriodoReferenciaMapper periodoReferenciaMapper;
        readonly IProyectoMapper proyectoMapper;

        public ParticipacionMedioController(IParticipacionMedioService participacionMedioService,
                                            IParticipacionMedioMapper participacionMedioMapper,
                                            ICatalogoService catalogoService,
                                            IUsuarioService usuarioService,
                                            IMedioImpresoMapper medioImpresoMapper,
                                            IMedioElectronicoMapper medioElectronicoMapper,
                                            IGeneroMapper generoMapper,
                                            IPeriodoReferenciaMapper periodoReferenciaMapper,
                                            IProyectoMapper proyectoMapper,
                                            ILineaTematicaMapper lineaTematicaMapper,
                                            IAmbitoMapper ambitoMapper,
                                            IPaisMapper paisMapper,
                                            IEstadoPaisMapper estadoPaisMapper, ISearchService searchService)
            : base(usuarioService, searchService)
        {
            this.catalogoService = catalogoService;
            this.participacionMedioService = participacionMedioService;
            this.participacionMedioMapper = participacionMedioMapper;
            this.medioImpresoMapper = medioImpresoMapper;
            this.medioElectronicoMapper = medioElectronicoMapper;
            this.generoMapper = generoMapper;
            this.periodoReferenciaMapper = periodoReferenciaMapper;
            this.proyectoMapper = proyectoMapper;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.ambitoMapper = ambitoMapper;
            this.paisMapper = paisMapper;
            this.estadoPaisMapper = estadoPaisMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var participacionMedios = participacionMedioService.GetAllParticipacionMedios();
            data.List = participacionMedioMapper.Map(participacionMedios);

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

            var participacionMedio = participacionMedioService.GetParticipacionMedioById(id);
            if (participacionMedio == null)
                return RedirectToIndex("no ha sido encontrado", true);

            if (participacionMedio.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var participacionMedioForm = participacionMedioMapper.Map(participacionMedio);

            data.Form = SetupNewForm(participacionMedioForm);
            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var participacionMedio = participacionMedioService.GetParticipacionMedioById(id);
            data.Form = participacionMedioMapper.Map(participacionMedio);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ParticipacionMedioForm form)
        {
            var participacionMedio = participacionMedioMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(participacionMedio, form, Title.New, "ParticipacionMedio"))
            {
                ((GenericViewData<ParticipacionMedioForm>) ViewData.Model).Form = SetupNewForm();
                return ViewNew();
            }

            participacionMedioService.SaveParticipacionMedio(participacionMedio);

            return RedirectToIndex(String.Format("Participación en Medio {0} ha sido creada", participacionMedio.Nombre));
        }

        [Transaction]
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

            return RedirectToIndex(String.Format("Participación en Medio {0} ha sido modificada", participacionMedio.Nombre));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var participacionMedio = participacionMedioService.GetParticipacionMedioById(id);

            if (participacionMedio.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            participacionMedio.Activo = true;
            participacionMedio.ModificadoPor = CurrentUser();
            participacionMedioService.SaveParticipacionMedio(participacionMedio);

            var form = participacionMedioMapper.Map(participacionMedio);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var participacionMedio = participacionMedioService.GetParticipacionMedioById(id);

            if (participacionMedio.Investigador.Id != CurrentInvestigador().Id)
                return RedirectToIndex("no lo puede modificar", true);

            participacionMedio.Activo = false;
            participacionMedio.ModificadoPor = CurrentUser();
            participacionMedioService.SaveParticipacionMedio(participacionMedio);

            var form = participacionMedioMapper.Map(participacionMedio);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<ParticipacionMedio>(x => x.Nombre, q);
            return Content(data);
        }

        ParticipacionMedioForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        ParticipacionMedioForm SetupNewForm(ParticipacionMedioForm form)
        {
            form = form ?? new ParticipacionMedioForm();

            form.MediosImpresos = medioImpresoMapper.Map(catalogoService.GetActiveMedioImpresos());
            form.MediosElectronicos = medioElectronicoMapper.Map(catalogoService.GetActiveMedioElectronicos());
            form.Generos = generoMapper.Map(catalogoService.GetActiveGeneros());
            form.PeriodosReferencias = periodoReferenciaMapper.Map(catalogoService.GetActivePeriodoReferencias());
            form.Proyectos = proyectoMapper.Map(catalogoService.GetActiveProyectos());
            form.LineasTematicas = lineaTematicaMapper.Map(catalogoService.GetActiveLineaTematicas());
            form.Ambitos = ambitoMapper.Map(catalogoService.GetActiveAmbitos());
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            form.EstadosPaises = estadoPaisMapper.Map(catalogoService.GetActiveEstadoPaises());

            return form;
        }

        void FormSetCombos(ParticipacionMedioForm form)
        {
            ViewData["MedioImpreso"] = form.MedioImpresoId;
            ViewData["MedioElectronico"] = form.MedioElectronicoId;
            ViewData["Genero"] = form.GeneroId;
            ViewData["PeriodoReferencia"] = form.PeriodoReferenciaId;
            ViewData["Proyecto"] = form.ProyectoId;
            ViewData["LineaTematica"] = form.LineaTematicaId;
            ViewData["Ambito"] = form.AmbitoId;
            ViewData["Pais"] = form.PaisId;
            ViewData["EstadoPais"] = form.EstadoPaisId;
        }
    }
}