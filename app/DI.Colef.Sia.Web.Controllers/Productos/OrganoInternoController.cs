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

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos
{
    [HandleError]
    public class OrganoInternoController : BaseController<OrganoInterno, OrganoInternoForm>
    {
		readonly IOrganoInternoService organoInternoService;
        readonly IOrganoInternoMapper organoInternoMapper;
        readonly IInvestigadorMapper investigadorMapper;
        readonly IInvestigadorService investigadorService;
        readonly IConsejoComisionMapper consejoComisionMapper;
        readonly IProductoService productoService;
        readonly ICustomCollection customCollection;
    
        public OrganoInternoController(IOrganoInternoService organoInternoService, 
			IOrganoInternoMapper organoInternoMapper,
            IInvestigadorMapper investigadorMapper,
            IInvestigadorService investigadorService,
            IArchivoService archivoService,
			ICatalogoService catalogoService,
            ICustomCollection customCollection,
            IUsuarioService usuarioService,
            ISearchService searchService,
            IConsejoComisionMapper consejoComisionMapper, IProductoService productoService)
            : base(usuarioService, searchService, catalogoService)
        {
			base.catalogoService = catalogoService;
            this.investigadorService = investigadorService;
            this.investigadorMapper = investigadorMapper;
            this.customCollection = customCollection;
            this.organoInternoService = organoInternoService;
            this.organoInternoMapper = organoInternoMapper;
			this.consejoComisionMapper = consejoComisionMapper;
            this.productoService = productoService;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);
            var productos = productoService.GetProductosByUsuario<OrganoInterno>(CurrentUser(), x => x.ConsejoComision,
                                                             x => x.Departamento);
            data.ProductList = productos;

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
            ViewData["Periodo"] = (from p in data.Form.Periodos where p.Nombre == "Primer periodo" select p.Id).FirstOrDefault();

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var organoInterno = organoInternoService.GetOrganoInternoById(id);

            if (organoInterno == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (organoInterno.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);
                        
            var organoInternoForm = organoInternoMapper.Map(organoInterno);

            data.Form = SetupNewForm(organoInternoForm);

            FormSetCombos(data.Form);
            
			ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var organoInterno = organoInternoService.GetOrganoInternoById(id);
            data.Form = organoInternoMapper.Map(organoInterno);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(OrganoInternoForm form)
        {
            var organoInterno = organoInternoMapper.Map(form, CurrentUser());

            ModelState.AddModelErrors(organoInterno.ValidationResults(), true, "OrganoInterno");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            organoInternoService.SaveOrganoInterno(organoInterno);
            SetMessage(String.Format("Órgano interno {0} ha sido creado", organoInterno.ConsejoComision.Nombre));

            return Rjs("Save", organoInterno.Id);
        }

        [Authorize(Roles = "DGAA")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(OrganoInternoForm form)
        {
            var organoInterno = organoInternoMapper.Map(form, CurrentUser());
            ModelState.AddModelErrors(organoInterno.ValidationResults(), true, "OrganoInterno");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }
            
            organoInternoService.SaveOrganoInterno(organoInterno, true);
            SetMessage(String.Format("Órgano interno {0} ha sido modificado", organoInterno.ConsejoComision.Nombre));

            return Rjs("Save", organoInterno.Id);
        }

        [CookieLessAuthorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddFile(FormCollection form)
        {
            var id = Convert.ToInt32(form["Id"]);
            var organoInterno = organoInternoService.GetOrganoInternoById(id);

            var archivo = MapArchivo<ArchivoOrganoInterno>();
            organoInterno.AddArchivo(archivo);

            organoInternoService.SaveOrganoInterno(organoInterno);

            return Content("Uploaded");
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.SearchOrganoInterno(q);
            return Content(data);
        }

        OrganoInternoForm SetupNewForm()
        {
            return SetupNewForm(null);
        }
        
        OrganoInternoForm SetupNewForm(OrganoInternoForm form)
        {
			form = form ?? new OrganoInternoForm();
            
            form.Investigador = form.Id != 0 ? form.Investigador : new InvestigadorForm();
			//Lista de Catalogos Pendientes
            form.Investigadores = investigadorMapper.Map(investigadorService.GetAllInvestigadores());
            form.Periodos = customCollection.PeriodoCustomCollection();
            form.ConsejosComisiones = consejoComisionMapper.Map(catalogoService.GetActiveConsejoComisions());

			return form;
        }
        
        private void FormSetCombos(OrganoInternoForm form)
        {
            ViewData["ConsejoComision"] = form.ConsejoComisionId;
            ViewData["Periodo"] = form.Periodo;
            ViewData["InvestigadorId"] = form.InvestigadorId;
        }
    }
}
