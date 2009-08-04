using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class InvestigadorController : BaseController<Investigador, InvestigadorForm>
    {
		readonly IInvestigadorService investigadorService;
        readonly ICatalogoService catalogoService;
        readonly IInvestigadorMapper investigadorMapper;
        readonly IUsuarioMapper usuarioMapper;
        readonly IEstadoMapper estadoMapper;
        readonly IGradoAcademicoMapper gradoAcademicoMapper;
        readonly ICategoriaMapper categoriaMapper;
        readonly ICargoMapper cargoMapper;
        readonly ISedeMapper sedeMapper;
        readonly IDepartamentoMapper departamentoMapper;
        readonly ISNIMapper sniMapper;
        readonly IEstadoInvestigadorMapper estadoInvestigadorMapper;

        public InvestigadorController(IInvestigadorService investigadorService,
            IUsuarioService usuarioService,
            ICatalogoService catalogoService,
            IInvestigadorMapper investigadorMapper,
            IUsuarioMapper usuarioMapper,
            IEstadoMapper estadoMapper,
            IGradoAcademicoMapper gradoAcademicoMapper,
            ICategoriaMapper categoriaMapper,
            ICargoMapper cargoMapper,
            ISedeMapper sedeMapper,
            IDepartamentoMapper departamentoMapper,
            ISNIMapper sniMapper,
            IEstadoInvestigadorMapper estadoInvestigadorMapper) : base(usuarioService)
        {
            this.investigadorService = investigadorService;
            this.catalogoService = catalogoService;
            this.investigadorMapper = investigadorMapper;
            this.usuarioMapper = usuarioMapper;
            this.estadoMapper = estadoMapper;
            this.gradoAcademicoMapper = gradoAcademicoMapper;
            this.categoriaMapper = categoriaMapper;
            this.cargoMapper = cargoMapper;
            this.sedeMapper = sedeMapper;
            this.departamentoMapper = departamentoMapper;
            this.sniMapper = sniMapper;
            this.estadoInvestigadorMapper = estadoInvestigadorMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);
			
			var investigadors = investigadorService.GetAllInvestigadors();
            data.List = investigadorMapper.Map(investigadors);

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

            var investigador = investigadorService.GetInvestigadorById(id);
            if(investigador == null)
                return RedirectToIndex("no ha sido encontrado", true);

            data.Form = investigadorMapper.Map(investigador);

			ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var investigador = investigadorService.GetInvestigadorById(id);
            data.Form = investigadorMapper.Map(investigador);
            
            ViewData.Model = data;
            return View();
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(InvestigadorForm form)
        {
            var investigador = investigadorMapper.Map(form, CurrentUser());

            if (!IsValidateModel(investigador, form, Title.New, "Investigador"))
            {
                ((GenericViewData<InvestigadorForm>)ViewData.Model).Form = SetupNewForm();
                return ViewNew();
            }

            investigadorService.SaveInvestigador(investigador);

            return RedirectToIndex(String.Format("{0} {1} {2} ha sido creado", investigador.Usuario.Persona.Nombre,
                investigador.Usuario.Persona.ApellidoPaterno, investigador.Usuario.Persona.ApellidoMaterno));
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(InvestigadorForm form)
        {
            var investigador = investigadorMapper.Map(form);

            if (!IsValidateModel(investigador, form, Title.Edit))
                return ViewEdit();

            investigadorService.SaveInvestigador(investigador);

            return RedirectToIndex(String.Format("{0} {1} {2} ha sido creado", investigador.Usuario.Persona.Nombre,
                investigador.Usuario.Persona.ApellidoPaterno, investigador.Usuario.Persona.ApellidoMaterno));
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var investigador = investigadorService.GetInvestigadorById(id);
            investigador.Activo = true;
            investigadorService.SaveInvestigador(investigador);

            var form = investigadorMapper.Map(investigador);
            
            return Rjs(form);
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var investigador = investigadorService.GetInvestigadorById(id);
            investigador.Activo = false;
            investigadorService.SaveInvestigador(investigador);

            var form = investigadorMapper.Map(investigador);
            
            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewEstado(int id)
        {
            var investigador = investigadorService.GetInvestigadorById(id);
            var form = new InvestigadorForm
                           {
                               Id = investigador.Id,
                               EstadoInvestigador = new EstadoInvestigadorForm(),
                               Estados = estadoMapper.Map(catalogoService.GetActiveEstados())
                           };

            return Rjs("NewEstado", form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddEstado([Bind(Prefix = "EstadoInvestigador")]EstadoInvestigadorForm form, int investigadorId)
        {
            var estadoInvestigador =  estadoInvestigadorMapper.Map(form);

            ModelState.AddModelErrors(estadoInvestigador.ValidationResults(), true, String.Empty);
            if(!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            estadoInvestigador.CreadorPor = CurrentUser();
            estadoInvestigador.ModificadoPor = CurrentUser();

            var investigador = investigadorService.GetInvestigadorById(investigadorId);
            investigador.AddEstado(estadoInvestigador);
            investigadorService.SaveInvestigador(investigador);

            var estadoInvestigadorForm = estadoInvestigadorMapper.Map(estadoInvestigador);

            return Rjs("AddEstado", estadoInvestigadorForm);
        }


        InvestigadorForm SetupNewForm()
        {
            return new InvestigadorForm
            {
                EstadoInvestigador = new EstadoInvestigadorForm(),
                GradoAcademicoInvestigador = new GradoAcademicoInvestigadorForm(),
                CategoriaInvestigador = new CategoriaInvestigadorForm(),
                CargoInvestigador = new CargoInvestigadorForm(),
                SNIInvestigador = new SNIInvestigadorForm(),

                Usuarios = usuarioMapper.Map(investigadorService.FindUsuariosToBeInvestigador()),
                Estados = estadoMapper.Map(catalogoService.GetActiveEstados()),
                GradosAcademicos = gradoAcademicoMapper.Map(catalogoService.GetActiveGrados()),
                Categorias = categoriaMapper.Map(catalogoService.GetActiveCategorias()),
                Cargos = cargoMapper.Map(catalogoService.GetActiveCargos()),
                Sedes = sedeMapper.Map(catalogoService.GetActiveSedes()),
                Departamentos = departamentoMapper.Map(catalogoService.GetActiveDepartamentos()),
                SNIs = sniMapper.Map(catalogoService.GetActiveSNIs())
            };
        }
    }
}
