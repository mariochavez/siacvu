using System;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos
{
    [HandleError]
    public class OrganoInternoController : BaseController<OrganoInterno, OrganoInternoForm>
    {
		readonly IOrganoInternoService organoInternoService;
        readonly IOrganoInternoMapper organoInternoMapper;
        readonly ICatalogoService catalogoService;
        readonly IConsejoComisionMapper consejoComisionMapper;
        readonly ICustomCollection customCollection;
    
        public OrganoInternoController(IOrganoInternoService organoInternoService, 
			IOrganoInternoMapper organoInternoMapper, 
			ICatalogoService catalogoService,
            ICustomCollection customCollection,
            IUsuarioService usuarioService,
            ISearchService searchService,
            IConsejoComisionMapper consejoComisionMapper)
            : base(usuarioService, searchService, catalogoService)
        {
			this.catalogoService = catalogoService;
            this.customCollection = customCollection;
            this.organoInternoService = organoInternoService;
            this.organoInternoMapper = organoInternoMapper;
			this.consejoComisionMapper = consejoComisionMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);
            var organoInternos = new OrganoInterno[] { };

            if (User.IsInRole("Investigadores"))
                organoInternos = organoInternoService.GetAllOrganoInternos(CurrentUser());

            if (User.IsInRole("DGAA"))
                organoInternos = organoInternoService.GetAllOrganoInternos();

            data.List = organoInternoMapper.Map(organoInternos);

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            if (CurrentInvestigador() == null)
                return NoInvestigadorProfile("Por tal motivo no puede crear nuevos productos.");

			var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
            ViewData["Periodo"] = (from p in data.Form.Periodos where p.Nombre == "Primer periodo" select p.Id).FirstOrDefault();

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
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

        [Authorize(Roles = "Investigadores")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(OrganoInternoForm form)
        {
            var organoInterno = organoInternoMapper.Map(form, CurrentUser(), CurrentInvestigador());
            
            if (!IsValidateModel(organoInterno, form, Title.New, "OrganoInterno"))
            {
                ((GenericViewData<OrganoInternoForm>)ViewData.Model).Form = SetupNewForm();
                return ViewNew();
            }

            organoInternoService.SaveOrganoInterno(organoInterno);

            return RedirectToIndex(String.Format("Órgano Interno {0} ha sido creado", organoInterno.Nombre));
        }

        [Authorize(Roles = "Investigadores")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(OrganoInternoForm form)
        {
            var organoInterno = organoInternoMapper.Map(form, CurrentUser(), CurrentInvestigador());
            
            if (!IsValidateModel(organoInterno, form, Title.Edit))
            {
                var organoInternoForm = organoInternoMapper.Map(organoInterno);

                ((GenericViewData<OrganoInternoForm>)ViewData.Model).Form = SetupNewForm(organoInternoForm);
                FormSetCombos(organoInternoForm);
                return ViewEdit();
            }
            
            organoInternoService.SaveOrganoInterno(organoInterno);

            return RedirectToIndex(String.Format("Órgano Interno {0} ha sido modificado", organoInterno.Nombre));
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<OrganoInterno>(x => x.Nombre, q);
            return Content(data);
        }

        OrganoInternoForm SetupNewForm()
        {
            return SetupNewForm(null);
        }
        
        OrganoInternoForm SetupNewForm(OrganoInternoForm form)
        {
			form = form ?? new OrganoInternoForm();
            
			//Lista de Catalogos Pendientes
            form.Periodos = customCollection.PeriodoCustomCollection();
            form.ConsejosComisiones = consejoComisionMapper.Map(catalogoService.GetActiveConsejoComisions());

			return form;
        }
        
        private void FormSetCombos(OrganoInternoForm form)
        {
            ViewData["ConsejoComision"] = form.ConsejoComisionId;
            ViewData["Periodo"] = form.Periodo;
        }
    }
}
