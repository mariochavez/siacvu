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
    public class SNIController : BaseController<SNI, SNIForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ISNIMapper sniMapper;

        public SNIController(IUsuarioService usuarioService, ICatalogoService catalogoService, ISNIMapper sniMapper,
                             ISearchService searchService) : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.sniMapper = sniMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var snis = catalogoService.GetAllSNIs();
            data.List = sniMapper.Map(snis);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new SNIForm();

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var sni = catalogoService.GetSNIById(id);
            data.Form = sniMapper.Map(sni);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(SNIForm form)
        {
            var sni = sniMapper.Map(form);

            sni.CreadorPor = CurrentUser();
            sni.ModificadoPor = CurrentUser();

            if (!IsValidateModel(sni, form, Title.New))
                return ViewNew();

            catalogoService.SaveSNI(sni);

            return RedirectToIndex(String.Format("SNI {0} ha sido creado", sni.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(SNIForm form)
        {
            var sni = sniMapper.Map(form);

            sni.ModificadoPor = CurrentUser();

            if (!IsValidateModel(sni, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveSNI(sni);

            return RedirectToIndex(String.Format("SNI {0} ha sido modificado", sni.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var sni = catalogoService.GetSNIById(id);
            sni.Activo = true;
            sni.ModificadoPor = CurrentUser();
            catalogoService.SaveSNI(sni);

            var form = sniMapper.Map(sni);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var sni = catalogoService.GetSNIById(id);
            sni.Activo = false;
            sni.ModificadoPor = CurrentUser();
            catalogoService.SaveSNI(sni);

            var form = sniMapper.Map(sni);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<SNI>(x => x.Nombre, q);
            return Content(data);
        }
    }
}