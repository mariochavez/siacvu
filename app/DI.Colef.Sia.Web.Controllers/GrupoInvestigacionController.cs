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
        readonly IOrganizacionMapper organizacionMapper;
        readonly INivelMapper nivelMapper;
    
        public GrupoInvestigacionController(IGrupoInvestigacionService grupoInvestigacionService, 
			                                IGrupoInvestigacionMapper grupoInvestigacionMapper, 
			                                ICatalogoService catalogoService, IUsuarioService usuarioService,
                                            ISectorMapper sectorMapper,
                                            IOrganizacionMapper organizacionMapper,
                                            ISearchService searchService,
                                            INivelMapper nivelMapper)
            : base(usuarioService, searchService, catalogoService)
        {
			this.catalogoService = catalogoService;
            this.grupoInvestigacionService = grupoInvestigacionService;
            this.grupoInvestigacionMapper = grupoInvestigacionMapper;
            this.sectorMapper = sectorMapper;
            this.organizacionMapper = organizacionMapper;
            this.nivelMapper = nivelMapper;
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
            data.Form = new GrupoInvestigacionForm();

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

            data.Form = grupoInvestigacionMapper.Map(grupoInvestigacion);
            
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
                return ViewNew();

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
                return ViewEdit();
            
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

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeNivel(int select)
        {
            var nivelForm = nivelMapper.Map(catalogoService.GetNivelById(select));
            var organizacionForm = organizacionMapper.Map(catalogoService.GetOrganizacionById(nivelForm.OrganizacionId));
            var sectorForm = sectorMapper.Map(catalogoService.GetSectorById(organizacionForm.SectorId));

            var form = new ShowFieldsForm
                           {
                               Nivel2OrganizacionNombre = organizacionForm.Nombre,
                               Nivel2OrganizacionSectorNombre = sectorForm.Nombre,
                               Nivel2Id = nivelForm.Id
                           };

            return Rjs("ChangeNivel", form);
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