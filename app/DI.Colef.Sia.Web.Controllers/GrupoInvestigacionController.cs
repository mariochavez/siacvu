using System;
using System.Collections.Generic;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class GrupoInvestigacionController : BaseController<GrupoInvestigacion, GrupoInvestigacionForm>
    {
		readonly IGrupoInvestigacionService grupoInvestigacionService;
        readonly IGrupoInvestigacionMapper grupoInvestigacionMapper;
        readonly ICatalogoService catalogoService;
        readonly ISectorMapper sectorMapper;
    
        public GrupoInvestigacionController(IGrupoInvestigacionService grupoInvestigacionService, 
			                                IGrupoInvestigacionMapper grupoInvestigacionMapper, 
			                                ICatalogoService catalogoService, IUsuarioService usuarioService,
                                            ISectorMapper sectorMapper,
                                            IOrganizacionMapper organizacionMapper,
                                            ISearchService searchService,
                                            INivelMapper nivelMapper)
            : base(usuarioService, searchService, catalogoService, organizacionMapper, nivelMapper)
        {
			this.catalogoService = catalogoService;
            this.grupoInvestigacionService = grupoInvestigacionService;
            this.grupoInvestigacionMapper = grupoInvestigacionMapper;
            this.sectorMapper = sectorMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);
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
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

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
            var data = CreateViewDataWithTitle(Title.Show);

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
        public ActionResult Create(GrupoInvestigacionForm form)
        {
            var grupoInvestigacion = grupoInvestigacionMapper.Map(form, CurrentUser());

            if (!IsValidateModel(grupoInvestigacion, form, Title.New, "GrupoInvestigacion"))
            {
                var grupoInvestigacionForm = grupoInvestigacionMapper.Map(grupoInvestigacion);

                ((GenericViewData<GrupoInvestigacionForm>)ViewData.Model).Form = SetupNewForm(grupoInvestigacionForm);
                FormSetCombos(grupoInvestigacionForm);
                return ViewNew();
            }

            grupoInvestigacionService.SaveGrupoInvestigacion(grupoInvestigacion);

            return RedirectToIndex(String.Format("Grupo de Investigación {0} ha sido creado", grupoInvestigacion.NombreGrupoInvestigacion));
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

        GrupoInvestigacionForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        GrupoInvestigacionForm SetupNewForm(GrupoInvestigacionForm form)
        {
            form = form ?? new GrupoInvestigacionForm();

            form.Sectores = sectorMapper.Map(catalogoService.GetActiveSectores());
            var nivel2 = nivelMapper.Map(catalogoService.GetNivelById(form.Nivel2Id));
            form.Organizaciones = GetOrganizaciones(nivel2.OrganizacionSectorId);
            form.Niveles = GetNiveles(nivel2.OrganizacionId);

            return form;
        }

        void FormSetCombos(GrupoInvestigacionForm form)
        {
            var nivel2 = nivelMapper.Map(catalogoService.GetNivelById(form.Nivel2Id));
            ViewData["SectorId"] = nivel2.OrganizacionSectorId;
            ViewData["OrganizacionId"] = nivel2.OrganizacionId;
            ViewData["Nivel2Id"] = form.Nivel2Id;
        }

        private GrupoInvestigacionForm SetupShowForm(GrupoInvestigacionForm form)
        {
            form = form ?? new GrupoInvestigacionForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      Nivel2Nombre = form.Nivel2.Nombre,
                                      Nivel2OrganizacionNombre = form.Nivel2.OrganizacionNombre,
                                      Nivel2OrganizacionSectorNombre = form.Nivel2.OrganizacionSectorNombre,

                                      IsShowForm = true
                                  };

            return form;
        }
    }
}