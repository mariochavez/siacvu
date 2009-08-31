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
    public class TipoProyectoController : BaseController<TipoProyecto, TipoProyectoForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ITipoProyectoMapper tipoProyectoMapper;

        public TipoProyectoController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                      ITipoProyectoMapper tipoProyectoMapper, ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.tipoProyectoMapper = tipoProyectoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var tipoProyectos = catalogoService.GetAllTipoProyectos();
            data.List = tipoProyectoMapper.Map(tipoProyectos);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new TipoProyectoForm();

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tipoProyecto = catalogoService.GetTipoProyectoById(id);
            data.Form = tipoProyectoMapper.Map(tipoProyecto);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var tipoProyecto = catalogoService.GetTipoProyectoById(id);
            data.Form = tipoProyectoMapper.Map(tipoProyecto);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoProyectoForm form)
        {
            var tipoProyecto = tipoProyectoMapper.Map(form);

            tipoProyecto.CreadorPor = CurrentUser();
            tipoProyecto.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoProyecto, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoProyecto(tipoProyecto);

            return RedirectToIndex(String.Format("Tipo de Proyecto {0} ha sido creado", tipoProyecto.Nombre));
        }

        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoProyectoForm form)
        {
            var tipoProyecto = tipoProyectoMapper.Map(form);

            tipoProyecto.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoProyecto, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoProyecto(tipoProyecto);

            return RedirectToIndex(String.Format("Tipo de Proyecto {0} ha sido modificado", tipoProyecto.Nombre));
        }

        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoProyecto = catalogoService.GetTipoProyectoById(id);
            tipoProyecto.Activo = true;
            tipoProyecto.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoProyecto(tipoProyecto);

            var form = tipoProyectoMapper.Map(tipoProyecto);

            return Rjs(form);
        }

        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoProyecto = catalogoService.GetTipoProyectoById(id);
            tipoProyecto.Activo = false;
            tipoProyecto.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoProyecto(tipoProyecto);

            var form = tipoProyectoMapper.Map(tipoProyecto);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<TipoProyecto>(x => x.Nombre, q);
            return Content(data);
        }
    }
}