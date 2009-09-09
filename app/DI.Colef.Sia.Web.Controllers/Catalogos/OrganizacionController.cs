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
    public class OrganizacionController : BaseController<Organizacion, OrganizacionForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IOrganizacionMapper organizacionMapper;

        public OrganizacionController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                      IOrganizacionMapper organizacionMapper, ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.organizacionMapper = organizacionMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var organizacions = catalogoService.GetAllOrganizaciones();
            data.List = organizacionMapper.Map(organizacions);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new OrganizacionForm();

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var organizacion = catalogoService.GetOrganizacionById(id);
            data.Form = organizacionMapper.Map(organizacion);

            ViewData.Model = data;
            return View();
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(OrganizacionForm form)
        {
            var organizacion = organizacionMapper.Map(form);

            organizacion.CreadorPor = CurrentUser();
            organizacion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(organizacion, form, Title.New))
                return ViewNew();

            catalogoService.SaveOrganizacion(organizacion);

            return RedirectToIndex(String.Format("Organización {0} ha sido creada", organizacion.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(OrganizacionForm form)
        {
            var organizacion = organizacionMapper.Map(form);

            organizacion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(organizacion, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveOrganizacion(organizacion);

            return RedirectToIndex(String.Format("Organización {0} ha sido modificada", organizacion.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var organizacion = catalogoService.GetOrganizacionById(id);
            organizacion.Activo = true;
            organizacion.ModificadoPor = CurrentUser();
            catalogoService.SaveOrganizacion(organizacion);

            var form = organizacionMapper.Map(organizacion);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var organizacion = catalogoService.GetOrganizacionById(id);
            organizacion.Activo = false;
            organizacion.ModificadoPor = CurrentUser();
            catalogoService.SaveOrganizacion(organizacion);

            var form = organizacionMapper.Map(organizacion);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Organizacion>(x => x.Nombre, q);
            return Content(data);
        }
    }
}