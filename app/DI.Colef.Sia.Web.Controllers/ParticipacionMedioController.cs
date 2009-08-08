using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;
using SharpArch.Core.CommonValidator;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class ParticipacionMedioController : BaseController<ParticipacionMedio, ParticipacionMedioForm>
    {
		readonly IParticipacionMedioService participacionMedioService;
        readonly IParticipacionMedioMapper participacionMedioMapper;
        readonly ICatalogoService catalogoService;
        readonly IMedioImpresoMapper medioImpresoMapper;
readonly IMedioElectronicoMapper medioElectronicoMapper;
readonly IGeneroMapper generoMapper;
readonly IPeriodoReferenciaMapper periodoReferenciaMapper;
readonly IProyectoMapper proyectoMapper;
readonly ILineaTematicaMapper lineaTematicaMapper;
readonly IAmbitoMapper ambitoMapper;
readonly IPaisMapper paisMapper;
readonly IEstadoPaisMapper estadoPaisMapper;
        
    
        public ParticipacionMedioController(IParticipacionMedioService participacionMedioService, 
			IParticipacionMedioMapper participacionMedioMapper, 
			ICatalogoService catalogoService, IUsuarioService usuarioService
			, IMedioImpresoMapper medioImpresoMapper
, IMedioElectronicoMapper medioElectronicoMapper
, IGeneroMapper generoMapper
, IPeriodoReferenciaMapper periodoReferenciaMapper
, IProyectoMapper proyectoMapper
, ILineaTematicaMapper lineaTematicaMapper
, IAmbitoMapper ambitoMapper
, IPaisMapper paisMapper
, IEstadoPaisMapper estadoPaisMapper
			) : base(usuarioService)
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
            data.Form = participacionMedioMapper.Map(participacionMedio);

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
            var participacionMedio = participacionMedioMapper.Map(form);
            
            participacionMedio.CreadorPor = CurrentUser();
            participacionMedio.ModificadoPor = CurrentUser();

            if (!IsValidateModel(participacionMedio, form, Title.New, "ParticipacionMedio"))
            {
                ((GenericViewData<ParticipacionMedioForm>)ViewData.Model).Form = SetupNewForm();
                return ViewNew();
            }

            participacionMedioService.SaveParticipacionMedio(participacionMedio);

            return RedirectToIndex(String.Format("{0} ha sido creado", "participacionMedio.Nombre"));
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ParticipacionMedioForm form)
        {
            var participacionMedio = participacionMedioMapper.Map(form);
            
            participacionMedio.ModificadoPor = CurrentUser();

            if (!IsValidateModel(participacionMedio, form, Title.Edit))
                return ViewEdit();

            participacionMedioService.SaveParticipacionMedio(participacionMedio);

            return RedirectToIndex(String.Format("{0} ha sido modificado", "participacionMedio.Nombre"));
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {            
            var participacionMedio = participacionMedioService.GetParticipacionMedioById(id);
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
            participacionMedio.Activo = false;
            participacionMedio.ModificadoPor = CurrentUser();
            participacionMedioService.SaveParticipacionMedio(participacionMedio);

            var form = participacionMedioMapper.Map(participacionMedio);
            
            return Rjs("Activate", form);
        }
        
        ParticipacionMedioForm SetupNewForm()
        {
            return new ParticipacionMedioForm
            {
            
				                
                //Lista de Catalogos Pendientes
                MediosImpresos = medioImpresoMapper.Map(catalogoService.GetActiveMedioImpresos()),
MediosElectronicos = medioElectronicoMapper.Map(catalogoService.GetActiveMedioElectronicos()),
Generos = generoMapper.Map(catalogoService.GetActiveGeneros()),
PeriodosReferencias = periodoReferenciaMapper.Map(catalogoService.GetActivePeriodoReferencias()),
Proyectos = proyectoMapper.Map(catalogoService.GetActiveProyectos()),
LineasTematicas = lineaTematicaMapper.Map(catalogoService.GetActiveLineaTematicas()),
Ambitos = ambitoMapper.Map(catalogoService.GetActiveAmbitos()),
Paises = paisMapper.Map(catalogoService.GetActivePaises()),
EstadosPaises = estadoPaisMapper.Map(catalogoService.GetActiveEstadoPaises()),
            };
        }
    }
}
