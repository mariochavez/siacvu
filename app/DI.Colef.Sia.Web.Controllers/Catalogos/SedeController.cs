using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class SedeController : BaseController<Sede, SedeForm>
    {
		readonly ICatalogoService catalogoService;
        readonly ISedeMapper sedeMapper;

        public SedeController(IUsuarioService usuarioService, ICatalogoService catalogoService, ISedeMapper sedeMapper)
            : base(usuarioService)
        {
            this.catalogoService = catalogoService;
            this.sedeMapper = sedeMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var sedes = catalogoService.GetAllSedes();
            data.List = sedeMapper.Map(sedes);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new SedeForm();

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var sede = catalogoService.GetSedeById(id);
            data.Form = sedeMapper.Map(sede);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(SedeForm form)
        {
            var sede = sedeMapper.Map(form);

            sede.CreadorPor = CurrentUser();
            sede.ModificadoPor = CurrentUser();

            if (!IsValidateModel(sede, form, Title.New))
                return ViewNew();

            catalogoService.SaveSede(sede);

            return RedirectToIndex(String.Format("{0} ha sido creado", sede.Nombre));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(SedeForm form)
        {
            var sede = sedeMapper.Map(form);

            sede.ModificadoPor = CurrentUser();

            if (!IsValidateModel(sede, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveSede(sede);

            return RedirectToIndex(String.Format("{0} ha sido modificado", sede.Nombre));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var sede = catalogoService.GetSedeById(id);
            sede.Activo = true;
            sede.ModificadoPor = CurrentUser();
            catalogoService.SaveSede(sede);

            var form = sedeMapper.Map(sede);
            
            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var sede = catalogoService.GetSedeById(id);
            sede.Activo = false;
            sede.ModificadoPor = CurrentUser();
            catalogoService.SaveSede(sede);

            var form = sedeMapper.Map(sede);
            
            return Rjs("Activate", form);
        }
    }
}
