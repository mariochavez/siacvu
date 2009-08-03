using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    public class DepartamentoController : BaseController<Departamento, DepartamentoForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IDepartamentoMapper departamentoMapper;

        public DepartamentoController(IUsuarioService usuarioService, ICatalogoService catalogoService, IDepartamentoMapper departamentoMapper)
            : base(usuarioService)
        {
            this.catalogoService = catalogoService;
            this.departamentoMapper = departamentoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var departamentos = catalogoService.GetAllDepartamentos();
            data.List = departamentoMapper.Map(departamentos);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new DepartamentoForm();

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var departamento = catalogoService.GetDepartamentoById(id);
            data.Form = departamentoMapper.Map(departamento);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(DepartamentoForm form)
        {
            var departamento = departamentoMapper.Map(form);

            if (!IsValidateModel(departamento, form, Title.New))
                return ViewNew();

            catalogoService.SaveDepartamento(departamento);

            return RedirectToIndex(String.Format("{0} ha sido creado", departamento.Nombre));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(DepartamentoForm form)
        {
            var departamento = departamentoMapper.Map(form);

            if (!IsValidateModel(departamento, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveDepartamento(departamento);

            return RedirectToIndex(String.Format("{0} ha sido modificado", departamento.Nombre));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var departamento = catalogoService.GetDepartamentoById(id);
            departamento.Activo = true;
            catalogoService.SaveDepartamento(departamento);

            var form = departamentoMapper.Map(departamento);
            
            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var departamento = catalogoService.GetDepartamentoById(id);
            departamento.Activo = false;
            catalogoService.SaveDepartamento(departamento);

            var form = departamentoMapper.Map(departamento);
            
            return Rjs("Activate", form);
        }
    }
}
