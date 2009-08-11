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
    public class TipoInstitucionController : BaseController<TipoInstitucion, TipoInstitucionForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ITipoInstitucionMapper tipoInstitucionMapper;

        public TipoInstitucionController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                         ITipoInstitucionMapper tipoInstitucionMapper, ISearchService searchService)
            : base(usuarioService, searchService)
        {
            this.catalogoService = catalogoService;
            this.tipoInstitucionMapper = tipoInstitucionMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var tipoInstitucions = catalogoService.GetAllTipoInstitucions();
            data.List = tipoInstitucionMapper.Map(tipoInstitucions);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new TipoInstitucionForm();

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tipoInstitucion = catalogoService.GetTipoInstitucionById(id);
            data.Form = tipoInstitucionMapper.Map(tipoInstitucion);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var tipoInstitucion = catalogoService.GetTipoInstitucionById(id);
            data.Form = tipoInstitucionMapper.Map(tipoInstitucion);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoInstitucionForm form)
        {
            var tipoInstitucion = tipoInstitucionMapper.Map(form);

            tipoInstitucion.CreadorPor = CurrentUser();
            tipoInstitucion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoInstitucion, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoInstitucion(tipoInstitucion);

            return RedirectToIndex(String.Format("{0} ha sido creada", tipoInstitucion.Nombre));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoInstitucionForm form)
        {
            var tipoInstitucion = tipoInstitucionMapper.Map(form);

            tipoInstitucion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoInstitucion, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoInstitucion(tipoInstitucion);

            return RedirectToIndex(String.Format("{0} ha sido modificada", tipoInstitucion.Nombre));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoInstitucion = catalogoService.GetTipoInstitucionById(id);
            tipoInstitucion.Activo = true;
            tipoInstitucion.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoInstitucion(tipoInstitucion);

            var form = tipoInstitucionMapper.Map(tipoInstitucion);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoInstitucion = catalogoService.GetTipoInstitucionById(id);
            tipoInstitucion.Activo = false;
            tipoInstitucion.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoInstitucion(tipoInstitucion);

            var form = tipoInstitucionMapper.Map(tipoInstitucion);

            return Rjs("Activate", form);
        }
    }
}