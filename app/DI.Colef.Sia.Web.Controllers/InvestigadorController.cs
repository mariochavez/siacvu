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
        readonly IGradoAcademicoInvestigadorMapper gradoAcademicoInvestigadorMapper;
        readonly ICategoriaInvestigadorMapper categoriaInvestigadorMapper;
        readonly ICargoInvestigadorMapper cargoInvestigadorMapper;
        readonly ISNIInvestigadorMapper sniInvestigadorMapper;

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
            IEstadoInvestigadorMapper estadoInvestigadorMapper,
            IGradoAcademicoInvestigadorMapper gradoAcademicoInvestigadorMapper,
            ICategoriaInvestigadorMapper categoriaInvestigadorMapper,
            ICargoInvestigadorMapper cargoInvestigadorMapper,
            ISNIInvestigadorMapper sniInvestigadorMapper,
                                      ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
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
            this.gradoAcademicoInvestigadorMapper = gradoAcademicoInvestigadorMapper;
            this.categoriaInvestigadorMapper = categoriaInvestigadorMapper;
            this.cargoInvestigadorMapper = cargoInvestigadorMapper;
            this.sniInvestigadorMapper = sniInvestigadorMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);
			
			var investigadors = investigadorService.GetAllInvestigadores();
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

            return RedirectToIndex(String.Format("{0} {1} {2} ha sido creado", investigador.Usuario.Nombre,
                investigador.Usuario.ApellidoPaterno, investigador.Usuario.ApellidoMaterno));
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(InvestigadorForm form)
        {
            var investigador = investigadorMapper.Map(form, CurrentUser());

            if (!IsValidateModel(investigador, form, Title.Edit))
                return ViewEdit();

            investigadorService.SaveInvestigador(investigador);

            return RedirectToIndex(String.Format("{0} {1} {2} ha sido actualizado", investigador.Usuario.Nombre,
                investigador.Usuario.ApellidoPaterno, investigador.Usuario.ApellidoMaterno));
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

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewGrado(int id)
        {
            var investigador = investigadorService.GetInvestigadorById(id);
            var form = new InvestigadorForm
            {
                Id = investigador.Id,
                GradoAcademicoInvestigador = new GradoAcademicoInvestigadorForm(),
                GradosAcademicos = gradoAcademicoMapper.Map(catalogoService.GetActiveGrados())
            };

            return Rjs("NewGrado", form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddGrado([Bind(Prefix = "GradoAcademicoInvestigador")]GradoAcademicoInvestigadorForm form, int investigadorId)
        {
            var gradoAcademicoInvestigador = gradoAcademicoInvestigadorMapper.Map(form);

            ModelState.AddModelErrors(gradoAcademicoInvestigador.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            gradoAcademicoInvestigador.CreadorPor = CurrentUser();
            gradoAcademicoInvestigador.ModificadoPor = CurrentUser();

            var investigador = investigadorService.GetInvestigadorById(investigadorId);
            investigador.AddGrado(gradoAcademicoInvestigador);
            investigadorService.SaveInvestigador(investigador);

            var gradoAcademicoInvestigadorForm = gradoAcademicoInvestigadorMapper.Map(gradoAcademicoInvestigador);

            return Rjs("AddGrado", gradoAcademicoInvestigadorForm);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCategoria(int id)
        {
            var investigador = investigadorService.GetInvestigadorById(id);
            var form = new InvestigadorForm
            {
                Id = investigador.Id,
                CategoriaInvestigador = new CategoriaInvestigadorForm(),
                Categorias = categoriaMapper.Map(catalogoService.GetActiveCategorias())
            };

            return Rjs("NewCategoria", form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCategoria([Bind(Prefix = "CategoriaInvestigador")]CategoriaInvestigadorForm form, int investigadorId)
        {
            var categoriaInvestigador = categoriaInvestigadorMapper.Map(form);

            ModelState.AddModelErrors(categoriaInvestigador.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            categoriaInvestigador.CreadorPor = CurrentUser();
            categoriaInvestigador.ModificadoPor = CurrentUser();

            var investigador = investigadorService.GetInvestigadorById(investigadorId);
            investigador.AddCategoria(categoriaInvestigador);
            investigadorService.SaveInvestigador(investigador);

            var categoriaInvestigadorForm = categoriaInvestigadorMapper.Map(categoriaInvestigador);

            return Rjs("AddCategoria", categoriaInvestigadorForm);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCargo(int id)
        {
            var investigador = investigadorService.GetInvestigadorById(id);
            var form = new InvestigadorForm
            {
                Id = investigador.Id,
                CargoInvestigador = new CargoInvestigadorForm(),
                Cargos = cargoMapper.Map(catalogoService.GetActiveCargos()),
                Sedes = sedeMapper.Map(catalogoService.GetActiveSedes()),
                Departamentos = departamentoMapper.Map(catalogoService.GetActiveDepartamentos())
            };

            return Rjs("NewCargo", form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCargo([Bind(Prefix = "CargoInvestigador")]CargoInvestigadorForm form, int investigadorId)
        {
            var cargoInvestigador = cargoInvestigadorMapper.Map(form);

            ModelState.AddModelErrors(cargoInvestigador.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            cargoInvestigador.CreadorPor = CurrentUser();
            cargoInvestigador.ModificadoPor = CurrentUser();

            var investigador = investigadorService.GetInvestigadorById(investigadorId);
            investigador.AddCargo(cargoInvestigador);
            investigadorService.SaveInvestigador(investigador);

            var cargoInvestigadorForm = cargoInvestigadorMapper.Map(cargoInvestigador);

            return Rjs("AddCargo", cargoInvestigadorForm);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewSni(int id)
        {
            var investigador = investigadorService.GetInvestigadorById(id);
            var form = new InvestigadorForm
            {
                Id = investigador.Id,
                SNIInvestigador = new SNIInvestigadorForm(),
                SNIs = sniMapper.Map(catalogoService.GetActiveSNIs())
            };

            return Rjs("NewSni", form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddSni([Bind(Prefix = "SNIInvestigador")]SNIInvestigadorForm form, int investigadorId)
        {
            var sniInvestigador = sniInvestigadorMapper.Map(form);

            ModelState.AddModelErrors(sniInvestigador.ValidationResults(), true, String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            sniInvestigador.CreadorPor = CurrentUser();
            sniInvestigador.ModificadoPor = CurrentUser();

            var investigador = investigadorService.GetInvestigadorById(investigadorId);
            investigador.AddSNI(sniInvestigador);
            investigadorService.SaveInvestigador(investigador);

            var sniInvestigadorForm = sniInvestigadorMapper.Map(sniInvestigador);

            return Rjs("AddSni", sniInvestigadorForm);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.SearchInvestigador(q);
            return Content(data);
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
