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
    public class ConvenioController : BaseController<Convenio, ConvenioForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IConvenioMapper convenioMapper;

        public ConvenioController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                  IConvenioMapper convenioMapper, ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.convenioMapper = convenioMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var convenios = catalogoService.GetAllConvenios();
            data.List = convenioMapper.Map(convenios);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new ConvenioForm();

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var convenio = catalogoService.GetConvenioById(id);
            data.Form = convenioMapper.Map(convenio);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var convenio = catalogoService.GetConvenioById(id);
            data.Form = convenioMapper.Map(convenio);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ConvenioForm form)
        {
            var convenio = convenioMapper.Map(form);

            convenio.CreadorPor = CurrentUser();
            convenio.ModificadoPor = CurrentUser();

            if (!IsValidateModel(convenio, form, Title.New))
                return ViewNew();

            catalogoService.SaveConvenio(convenio);

            return RedirectToIndex(String.Format("Convenio {0} ha sido creado", convenio.Nombre));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ConvenioForm form)
        {
            var convenio = convenioMapper.Map(form);

            convenio.ModificadoPor = CurrentUser();

            if (!IsValidateModel(convenio, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveConvenio(convenio);

            return RedirectToIndex(String.Format("Convenio {0} ha sido modificado", convenio.Nombre));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var convenio = catalogoService.GetConvenioById(id);
            convenio.Activo = true;
            convenio.ModificadoPor = CurrentUser();
            catalogoService.SaveConvenio(convenio);

            var form = convenioMapper.Map(convenio);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var convenio = catalogoService.GetConvenioById(id);
            convenio.Activo = false;
            convenio.ModificadoPor = CurrentUser();
            catalogoService.SaveConvenio(convenio);

            var form = convenioMapper.Map(convenio);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Convenio>(x => x.Nombre, q);
            return Content(data);
        }
    }
}