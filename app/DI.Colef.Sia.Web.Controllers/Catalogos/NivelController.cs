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
    public class NivelController : BaseController<Nivel, NivelForm>
    {
        readonly ICatalogoService catalogoService;
        readonly INivelMapper nivelMapper;

        public NivelController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                               INivelMapper nivelMapper, ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.nivelMapper = nivelMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var nivels = catalogoService.GetAllNiveles();
            data.List = nivelMapper.Map(nivels);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new NivelForm();

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var nivel = catalogoService.GetNivelById(id);
            data.Form = nivelMapper.Map(nivel);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var nivel = catalogoService.GetNivelById(id);
            data.Form = nivelMapper.Map(nivel);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(NivelForm form)
        {
            var nivel = nivelMapper.Map(form);

            nivel.CreadorPor = CurrentUser();
            nivel.ModificadoPor = CurrentUser();

            if (!IsValidateModel(nivel, form, Title.New))
                return ViewNew();

            catalogoService.SaveNivel(nivel);

            return RedirectToIndex(String.Format("Nivel {0} ha sido creado", nivel.Nombre));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(NivelForm form)
        {
            var nivel = nivelMapper.Map(form);

            nivel.ModificadoPor = CurrentUser();

            if (!IsValidateModel(nivel, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveNivel(nivel);

            return RedirectToIndex(String.Format("Nivel {0} ha sido modificado", nivel.Nombre));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var nivel = catalogoService.GetNivelById(id);
            nivel.Activo = true;
            nivel.ModificadoPor = CurrentUser();
            catalogoService.SaveNivel(nivel);

            var form = nivelMapper.Map(nivel);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var nivel = catalogoService.GetNivelById(id);
            nivel.Activo = false;
            nivel.ModificadoPor = CurrentUser();
            catalogoService.SaveNivel(nivel);

            var form = nivelMapper.Map(nivel);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Nivel>(x => x.Nombre, q);
            return Content(data);
        }
    }
}