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
    public class CoautorExternoController : BaseController<CoautorExterno, CoautorExternoForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ICoautorExternoMapper coautorExternoMapper;

        public CoautorExternoController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                        ICoautorExternoMapper coautorExternoMapper, ISearchService searchService)
            : base(usuarioService, searchService)
        {
            this.catalogoService = catalogoService;
            this.coautorExternoMapper = coautorExternoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var coautorExternos = catalogoService.GetAllCoautorExternos();
            data.List = coautorExternoMapper.Map(coautorExternos);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new CoautorExternoForm();

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var coautorExterno = catalogoService.GetCoautorExternoById(id);
            data.Form = coautorExternoMapper.Map(coautorExterno);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var coautorExterno = catalogoService.GetCoautorExternoById(id);
            data.Form = coautorExternoMapper.Map(coautorExterno);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(CoautorExternoForm form)
        {
            var coautorExterno = coautorExternoMapper.Map(form);

            coautorExterno.CreadorPor = CurrentUser();
            coautorExterno.ModificadoPor = CurrentUser();

            if (!IsValidateModel(coautorExterno, form, Title.New))
                return ViewNew();

            catalogoService.SaveCoautorExterno(coautorExterno);

            return RedirectToIndex(String.Format("{0} ha sido creado", coautorExterno.Nombre));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(CoautorExternoForm form)
        {
            var coautorExterno = coautorExternoMapper.Map(form);

            coautorExterno.ModificadoPor = CurrentUser();

            if (!IsValidateModel(coautorExterno, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveCoautorExterno(coautorExterno);

            return RedirectToIndex(String.Format("{0} ha sido modificado", coautorExterno.Nombre));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var coautorExterno = catalogoService.GetCoautorExternoById(id);
            coautorExterno.Activo = true;
            coautorExterno.ModificadoPor = CurrentUser();
            catalogoService.SaveCoautorExterno(coautorExterno);

            var form = coautorExternoMapper.Map(coautorExterno);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var coautorExterno = catalogoService.GetCoautorExternoById(id);
            coautorExterno.Activo = false;
            coautorExterno.ModificadoPor = CurrentUser();
            catalogoService.SaveCoautorExterno(coautorExterno);

            var form = coautorExternoMapper.Map(coautorExterno);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<CoautorExterno>(x => x.Nombre, q);
            return Content(data);
        }
    }
}