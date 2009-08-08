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
    public class ParticipacionController : BaseController<Participacion, ParticipacionForm>
    {
		readonly IParticipacionService participacionService;
        readonly IParticipacionMapper participacionMapper;
        readonly ICatalogoService catalogoService;
        readonly IInvestigadorMapper investigadorMapper;
readonly IOtraParticipacionMapper otraParticipacionMapper;
readonly ITipoPresentacionMapper tipoPresentacionMapper;
readonly IPeriodoReferenciaMapper periodoReferenciaMapper;
readonly IProyectoMapper proyectoMapper;
readonly IPaisMapper paisMapper;
readonly IEstadoPaisMapper estadoPaisMapper;
        
    
        public ParticipacionController(IParticipacionService participacionService, 
			IParticipacionMapper participacionMapper, 
			ICatalogoService catalogoService, IUsuarioService usuarioService
			, IInvestigadorMapper investigadorMapper
, IOtraParticipacionMapper otraParticipacionMapper
, ITipoPresentacionMapper tipoPresentacionMapper
, IPeriodoReferenciaMapper periodoReferenciaMapper
, IProyectoMapper proyectoMapper
, IPaisMapper paisMapper
, IEstadoPaisMapper estadoPaisMapper
			) : base(usuarioService)
        {
			this.catalogoService = catalogoService;
            this.participacionService = participacionService;
            this.participacionMapper = participacionMapper;
			this.investigadorMapper = investigadorMapper;
this.otraParticipacionMapper = otraParticipacionMapper;
this.tipoPresentacionMapper = tipoPresentacionMapper;
this.periodoReferenciaMapper = periodoReferenciaMapper;
this.proyectoMapper = proyectoMapper;
this.paisMapper = paisMapper;
this.estadoPaisMapper = estadoPaisMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);
			
			var participacions = participacionService.GetAllParticipacions();
            data.List = participacionMapper.Map(participacions);

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

            var participacion = participacionService.GetParticipacionById(id);
            data.Form = participacionMapper.Map(participacion);

			ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var participacion = participacionService.GetParticipacionById(id);
            data.Form = participacionMapper.Map(participacion);
            
            ViewData.Model = data;
            return View();
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ParticipacionForm form)
        {
            var participacion = participacionMapper.Map(form);
            
            participacion.CreadorPor = CurrentUser();
            participacion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(participacion, form, Title.New, "Participacion"))
            {
                ((GenericViewData<ParticipacionForm>)ViewData.Model).Form = SetupNewForm();
                return ViewNew();
            }

            participacionService.SaveParticipacion(participacion);

            return RedirectToIndex(String.Format("{0} ha sido creado", "participacion.Nombre"));
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ParticipacionForm form)
        {
            var participacion = participacionMapper.Map(form);
            
            participacion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(participacion, form, Title.Edit))
                return ViewEdit();

            participacionService.SaveParticipacion(participacion);

            return RedirectToIndex(String.Format("{0} ha sido modificado", "participacion.Nombre"));
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {            
            var participacion = participacionService.GetParticipacionById(id);
            participacion.Activo = true;
            participacion.ModificadoPor = CurrentUser();
            participacionService.SaveParticipacion(participacion);

            var form = participacionMapper.Map(participacion);
            
            return Rjs(form);
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var participacion = participacionService.GetParticipacionById(id);
            participacion.Activo = false;
            participacion.ModificadoPor = CurrentUser();
            participacionService.SaveParticipacion(participacion);

            var form = participacionMapper.Map(participacion);
            
            return Rjs("Activate", form);
        }
        
        ParticipacionForm SetupNewForm()
        {
            return new ParticipacionForm
            {
            
				                
                //Lista de Catalogos Pendientes
                //Investigadores = investigadorMapper.Map(investigadorService.GetActiveInvestigadores()),
OtrasParticipaciones = otraParticipacionMapper.Map(catalogoService.GetActiveOtraParticipaciones()),
TiposPresentaciones = tipoPresentacionMapper.Map(catalogoService.GetActiveTipoPresentaciones()),
PeriodosReferencias = periodoReferenciaMapper.Map(catalogoService.GetActivePeriodoReferencias()),
Proyectos = proyectoMapper.Map(catalogoService.GetActiveProyectos()),
Paises = paisMapper.Map(catalogoService.GetActivePaises()),
EstadosPaises = estadoPaisMapper.Map(catalogoService.GetActiveEstadoPaises()),
            };
        }
    }
}
