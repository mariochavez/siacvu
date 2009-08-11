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
    public class FormaParticipacionController : BaseController<FormaParticipacion, FormaParticipacionForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IFormaParticipacionMapper formaParticipacionMapper;

        public FormaParticipacionController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                            IFormaParticipacionMapper formaParticipacionMapper,
                                            ISearchService searchService) : base(usuarioService, searchService)
        {
            this.catalogoService = catalogoService;
            this.formaParticipacionMapper = formaParticipacionMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var formaParticipacions = catalogoService.GetAllFormaParticipaciones();
            data.List = formaParticipacionMapper.Map(formaParticipacions);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new FormaParticipacionForm();

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var formaParticipacion = catalogoService.GetFormaParticipacionById(id);
            data.Form = formaParticipacionMapper.Map(formaParticipacion);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var formaParticipacion = catalogoService.GetFormaParticipacionById(id);
            data.Form = formaParticipacionMapper.Map(formaParticipacion);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(FormaParticipacionForm form)
        {
            var formaParticipacion = formaParticipacionMapper.Map(form);

            formaParticipacion.CreadorPor = CurrentUser();
            formaParticipacion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(formaParticipacion, form, Title.New))
                return ViewNew();

            catalogoService.SaveFormaParticipacion(formaParticipacion);

            return RedirectToIndex(String.Format("{0} ha sido creado", formaParticipacion.Nombre));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(FormaParticipacionForm form)
        {
            var formaParticipacion = formaParticipacionMapper.Map(form);

            formaParticipacion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(formaParticipacion, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveFormaParticipacion(formaParticipacion);

            return RedirectToIndex(String.Format("{0} ha sido modificado", formaParticipacion.Nombre));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var formaParticipacion = catalogoService.GetFormaParticipacionById(id);
            formaParticipacion.Activo = true;
            formaParticipacion.ModificadoPor = CurrentUser();
            catalogoService.SaveFormaParticipacion(formaParticipacion);

            var form = formaParticipacionMapper.Map(formaParticipacion);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var formaParticipacion = catalogoService.GetFormaParticipacionById(id);
            formaParticipacion.Activo = false;
            formaParticipacion.ModificadoPor = CurrentUser();
            catalogoService.SaveFormaParticipacion(formaParticipacion);

            var form = formaParticipacionMapper.Map(formaParticipacion);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<FormaParticipacion>(x => x.Nombre, q);
            return Content(data);
        }
    }
}