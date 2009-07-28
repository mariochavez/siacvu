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
    [HandleError]
    public class SNIController : BaseController<SNI, SNIForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ISNIMapper sNIMapper;

        public SNIController(ICatalogoService catalogoService, ISNIMapper sNIMapper) 
        {
            this.catalogoService = catalogoService;
            this.sNIMapper = sNIMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var sNIs = catalogoService.GetAllSNIs();
            data.List = sNIMapper.Map(sNIs);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new SNIForm();

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {

            var data = CreateViewDataWithTitle(Title.Edit);

            var sNI = catalogoService.GetSNIById(id);
            data.Form = sNIMapper.Map(sNI);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(SNIForm form)
        {
            var sNI = sNIMapper.Map(form);

            if (!IsValidateModel(sNI, form, Title.New))
                return ViewNew();

            catalogoService.SaveSNI(sNI);

            return RedirectToIndex(String.Format("{0} ha sido creado", sNI.Nombre));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(SNIForm form)
        {
            var sNI = sNIMapper.Map(form);

            if (!IsValidateModel(sNI, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveSNI(sNI);

            return RedirectToIndex(String.Format("{0} ha sido modificado", sNI.Nombre));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var sNI = catalogoService.GetSNIById(id);
            sNI.Activo = true;
            catalogoService.SaveSNI(sNI);

            var form = sNIMapper.Map(sNI);
            
            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var sNI = catalogoService.GetSNIById(id);
            sNI.Activo = false;
            catalogoService.SaveSNI(sNI);

            var form = sNIMapper.Map(sNI);
            
            return Rjs("Activate", form);
        }
    }
}
