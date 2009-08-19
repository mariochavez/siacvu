using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    public class PuestoController : BaseController<Puesto, PuestoForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IPuestoMapper puestoMapper;

        public PuestoController(IUsuarioService usuarioService, ICatalogoService catalogoService, IPuestoMapper puestoMapper,
            ISearchService searchService)
            : base(usuarioService, searchService)
        {
            this.catalogoService = catalogoService;
            this.puestoMapper = puestoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var puestos = catalogoService.GetAllPuestos();
            data.List = puestoMapper.Map(puestos);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new PuestoForm();

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var puesto = catalogoService.GetPuestoById(id);
            data.Form = puestoMapper.Map(puesto);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(PuestoForm form)
        {
            var puesto = puestoMapper.Map(form);

            puesto.CreadorPor = CurrentUser();
            puesto.ModificadoPor = CurrentUser();

            if (!IsValidateModel(puesto, form, Title.New))
                return ViewNew();

            catalogoService.SavePuesto(puesto);

            return RedirectToIndex(String.Format("Puesto {0} ha sido creado", puesto.Nombre));
        }

        [Transaction]
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

        [Transaction]
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

        [Transaction]
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

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Puesto>(x => x.Nombre, q);
            return Content(data);
        }
    }
}
