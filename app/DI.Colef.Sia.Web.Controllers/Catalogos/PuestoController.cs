using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    public class PuestoController : BaseController<Puesto, PuestoForm>
    {
        readonly IPuestoMapper puestoMapper;

        public PuestoController(IUsuarioService usuarioService, ICatalogoService catalogoService, IPuestoMapper puestoMapper,
                                ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.puestoMapper = puestoMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = new GenericViewData<PuestoForm>();
            var puestos = catalogoService.GetAllPuestos();
            data.List = puestoMapper.Map(puestos);

            return View(data);
        }
        
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = new GenericViewData<PuestoForm> {Form = new PuestoForm()};

            return View(data);
        }
        
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<PuestoForm>();

            var puesto = catalogoService.GetPuestoById(id);
            data.Form = puestoMapper.Map(puesto);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(PuestoForm form)
        {
            var puesto = puestoMapper.Map(form);

            puesto.CreadoPor = CurrentUser();
            puesto.ModificadoPor = CurrentUser();

            if (!IsValidateModel(puesto, form, Title.New))
                return ViewNew();

            catalogoService.SavePuesto(puesto);

            return RedirectToIndex(String.Format("Puesto {0} ha sido registrado", puesto.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(PuestoForm form)
        {
            var puesto = puestoMapper.Map(form);

            puesto.ModificadoPor = CurrentUser();

            if (!IsValidateModel(puesto, form, Title.Edit))
                return ViewEdit();

            catalogoService.SavePuesto(puesto);

            return RedirectToIndex(String.Format("Puesto {0} ha sido modificado", puesto.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var puesto = catalogoService.GetPuestoById(id);
            puesto.Activo = true;
            puesto.ModificadoPor = CurrentUser();
            catalogoService.SavePuesto(puesto);

            var form = puestoMapper.Map(puesto);
            
            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var puesto = catalogoService.GetPuestoById(id);
            puesto.Activo = false;
            puesto.ModificadoPor = CurrentUser();
            catalogoService.SavePuesto(puesto);

            var form = puestoMapper.Map(puesto);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Puesto>(x => x.Nombre, q);
            return Content(data);
        }
    }
}