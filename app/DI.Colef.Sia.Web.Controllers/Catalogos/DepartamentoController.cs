using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    public class DepartamentoController : BaseController<Departamento, DepartamentoForm>
    {
        //readonly ICatalogoService catalogoService;
        readonly IDepartamentoMapper departamentoMapper;

        public DepartamentoController(IUsuarioService usuarioService, ICatalogoService catalogoService, IDepartamentoMapper departamentoMapper,
                                      ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.departamentoMapper = departamentoMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = new GenericViewData<DepartamentoForm>();
            var departamentos = catalogoService.GetAllDepartamentos();
            data.List = departamentoMapper.Map(departamentos);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = new GenericViewData<DepartamentoForm> {Form = new DepartamentoForm()};

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<DepartamentoForm>();

            var departamento = catalogoService.GetDepartamentoById(id);
            data.Form = departamentoMapper.Map(departamento);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(DepartamentoForm form)
        {
            var departamento = departamentoMapper.Map(form);

            departamento.CreadoPor = CurrentUser();
            departamento.ModificadoPor = CurrentUser();

            if (!IsValidateModel(departamento, form, Title.New))
                return ViewNew();

            catalogoService.SaveDepartamento(departamento);

            return RedirectToIndex(String.Format("Departamento {0} ha sido creado", departamento.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(DepartamentoForm form)
        {
            var departamento = departamentoMapper.Map(form);

            departamento.ModificadoPor = CurrentUser();

            if (!IsValidateModel(departamento, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveDepartamento(departamento);

            return RedirectToIndex(String.Format("Departamento {0} ha sido modificado", departamento.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var departamento = catalogoService.GetDepartamentoById(id);
            departamento.Activo = true;
            departamento.ModificadoPor = CurrentUser();
            catalogoService.SaveDepartamento(departamento);

            var form = departamentoMapper.Map(departamento);
            
            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var departamento = catalogoService.GetDepartamentoById(id);
            departamento.Activo = false;
            departamento.ModificadoPor = CurrentUser();
            catalogoService.SaveDepartamento(departamento);

            var form = departamentoMapper.Map(departamento);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Departamento>(x => x.Nombre, q);
            return Content(data);
        }
    }
}