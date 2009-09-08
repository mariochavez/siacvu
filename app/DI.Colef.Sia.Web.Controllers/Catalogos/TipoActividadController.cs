using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    public class TipoActividadController : BaseController<TipoActividad, TipoActividadForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ITipoActividadMapper tipoActividadMapper;

        public TipoActividadController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                       ITipoActividadMapper tipoActividadMapper, ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.tipoActividadMapper = tipoActividadMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var tipoActividads = catalogoService.GetAllTipoActividades();
            data.List = tipoActividadMapper.Map(tipoActividads);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new TipoActividadForm();

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tipoActividad = catalogoService.GetTipoActividadById(id);
            data.Form = tipoActividadMapper.Map(tipoActividad);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var tipoActividad = catalogoService.GetTipoActividadById(id);
            data.Form = tipoActividadMapper.Map(tipoActividad);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoActividadForm form)
        {
            var tipoActividad = tipoActividadMapper.Map(form);

            tipoActividad.CreadorPor = CurrentUser();
            tipoActividad.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoActividad, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoActividad(tipoActividad);

            return RedirectToIndex(String.Format("Tipo de Actividad {0} ha sido creada", tipoActividad.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoActividadForm form)
        {
            var tipoActividad = tipoActividadMapper.Map(form);

            tipoActividad.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoActividad, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoActividad(tipoActividad);

            return RedirectToIndex(String.Format("Tipo de Actividad {0} ha sido modificada", tipoActividad.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoActividad = catalogoService.GetTipoActividadById(id);
            tipoActividad.Activo = true;
            tipoActividad.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoActividad(tipoActividad);

            var form = tipoActividadMapper.Map(tipoActividad);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoActividad = catalogoService.GetTipoActividadById(id);
            tipoActividad.Activo = false;
            tipoActividad.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoActividad(tipoActividad);

            var form = tipoActividadMapper.Map(tipoActividad);

            return Rjs("Activate", form);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<TipoActividad>(x => x.Nombre, q);
            return Content(data);
        }
    }
}