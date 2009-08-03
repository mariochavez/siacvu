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
    public class SNIController : BaseController<SNI, SNIForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ISNIMapper sniMapper;

        public SNIController(IUsuarioService usuarioService, ICatalogoService catalogoService, ISNIMapper sniMapper)
            : base(usuarioService)
        {
            this.catalogoService = catalogoService;
            this.sniMapper = sniMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var snis = catalogoService.GetAllSNIs();
            data.List = sniMapper.Map(snis);

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

            var sni = catalogoService.GetSNIById(id);
            data.Form = sniMapper.Map(sni);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(SNIForm form)
        {
            var sni = sniMapper.Map(form);

            if (!IsValidateModel(sni, form, Title.New))
                return ViewNew();

            catalogoService.SaveSNI(sni);

            return RedirectToIndex(String.Format("{0} ha sido creado", sni.Nombre));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(SNIForm form)
        {
            var sni = sniMapper.Map(form);

            if (!IsValidateModel(sni, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveSNI(sni);

            return RedirectToIndex(String.Format("{0} ha sido modificado", sni.Nombre));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var sni = catalogoService.GetSNIById(id);
            sni.Activo = true;
            catalogoService.SaveSNI(sni);

            var form = sniMapper.Map(sni);
            
            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var sni = catalogoService.GetSNIById(id);
            sni.Activo = false;
            catalogoService.SaveSNI(sni);

            var form = sniMapper.Map(sni);
            
            return Rjs("Activate", form);
        }
    }
}
