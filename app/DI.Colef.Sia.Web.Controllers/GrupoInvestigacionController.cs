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
            data.Form = grupoInvestigacionMapper.Map(grupoInvestigacion);
            
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
                ((GenericViewData<GrupoInvestigacionForm>)ViewData.Model).Form = SetupNewForm();
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
        
        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {            
            var grupoInvestigacion = grupoInvestigacionService.GetGrupoInvestigacionById(id);

            if (grupoInvestigacion.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            grupoInvestigacion.Activo = true;
            grupoInvestigacion.ModificadoPor = CurrentUser();
            grupoInvestigacionService.SaveGrupoInvestigacion(grupoInvestigacion);

            var form = grupoInvestigacionMapper.Map(grupoInvestigacion);
            
            return Rjs(form);
        }
        
        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var grupoInvestigacion = grupoInvestigacionService.GetGrupoInvestigacionById(id);

            if (grupoInvestigacion.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            grupoInvestigacion.Activo = false;
            grupoInvestigacion.ModificadoPor = CurrentUser();
            grupoInvestigacionService.SaveGrupoInvestigacion(grupoInvestigacion);

            var form = grupoInvestigacionMapper.Map(grupoInvestigacion);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeSector(int select)
        {
            var list = new List<OrganizacionForm> { new OrganizacionForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(organizacionMapper.Map(catalogoService.GetOrganizacionesBySectorId(select)));

            var form = new GrupoInvestigacionForm
                           {
                               Organizaciones = list.ToArray(),
                               Niveles2 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles3 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles4 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles5 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles6 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}}
                           };

            return Rjs("ChangeSector", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeOrganizacion(int select)
        {
            var list = new List<NivelForm> { new NivelForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(nivelMapper.Map(catalogoService.GetNivelesByOrganizacionId(select)));

            var form = new GrupoInvestigacionForm
                           {
                               Niveles2 = list.ToArray(),
                               Niveles3 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles4 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles5 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}},
                               Niveles6 = new[] {new NivelForm {Id = 0, Nombre = "Seleccione ..."}}
                           };

            return Rjs("ChangeOrganizacion", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeNivel2(int select)
        {
            var list = new List<NivelForm> { new NivelForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(nivelMapper.Map(catalogoService.GetNivelesByNivelId(select)));

            var form = new GrupoInvestigacionForm
            {
                Niveles3 = list.ToArray(),
                Niveles4 = new[] { new NivelForm { Id = 0, Nombre = "Seleccione ..." } },
                Niveles5 = new[] { new NivelForm { Id = 0, Nombre = "Seleccione ..." } },
                Niveles6 = new[] { new NivelForm { Id = 0, Nombre = "Seleccione ..." } }
            };

            return Rjs("ChangeNivel2", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeNivel3(int select)
        {
            var list = new List<NivelForm> { new NivelForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(nivelMapper.Map(catalogoService.GetNivelesByNivelId(select)));

            var form = new GrupoInvestigacionForm
            {
                Niveles4 = list.ToArray(),
                Niveles5 = new[] { new NivelForm { Id = 0, Nombre = "Seleccione ..." } },
                Niveles6 = new[] { new NivelForm { Id = 0, Nombre = "Seleccione ..." } }
            };

            return Rjs("ChangeNivel3", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeNivel4(int select)
        {
            var list = new List<NivelForm> { new NivelForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(nivelMapper.Map(catalogoService.GetNivelesByNivelId(select)));

            var form = new GrupoInvestigacionForm
            {
                Niveles5 = list.ToArray(),
                Niveles6 = new[] { new NivelForm { Id = 0, Nombre = "Seleccione ..." } }
            };

            return Rjs("ChangeNivel4", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeNivel5(int select)
        {
            var list = new List<NivelForm> { new NivelForm { Id = 0, Nombre = "Seleccione ..." } };

            list.AddRange(nivelMapper.Map(catalogoService.GetNivelesByNivelId(select)));

            var form = new GrupoInvestigacionForm
            {   
                Niveles6 = list.ToArray()
            };

            return Rjs("ChangeNivel5", form);
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
            form.Organizaciones = organizacionMapper.Map(catalogoService.GetOrganizacionesBySectorId(form.SectorId));
            form.Niveles2 = nivelMapper.Map(catalogoService.GetNivelesByOrganizacionId(form.OrganizacionId));
            form.Niveles3 = nivelMapper.Map(catalogoService.GetNivelesByNivelId(form.Nivel2Id));
            form.Niveles4 = nivelMapper.Map(catalogoService.GetNivelesByNivelId(form.Nivel2Id));
            form.Niveles5 = nivelMapper.Map(catalogoService.GetNivelesByNivelId(form.Nivel2Id));
            form.Niveles6 = nivelMapper.Map(catalogoService.GetNivelesByNivelId(form.Nivel2Id));

			return form;
        }
        
        private void FormSetCombos(GrupoInvestigacionForm form)
        {
			ViewData["Sector"] = form.SectorId;
			ViewData["Organizacion"] = form.OrganizacionId;
			ViewData["Nivel2"] = form.Nivel2Id;
			ViewData["Nivel3"] = form.Nivel3Id;
			ViewData["Nivel4"] = form.Nivel4Id;
			ViewData["Nivel5"] = form.Nivel5Id;
			ViewData["Nivel6"] = form.Nivel6Id;
        }
    }
}
