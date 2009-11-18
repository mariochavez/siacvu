using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    public class TipoParticipacionController : BaseController<TipoParticipacion, TipoParticipacionForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ITipoParticipacionMapper tipoParticipacionMapper;
        readonly ICustomCollection customCollection;

        public TipoParticipacionController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                           ITipoParticipacionMapper tipoParticipacionMapper,
                                           ISearchService searchService, ICustomCollection customCollection)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.tipoParticipacionMapper = tipoParticipacionMapper;
            this.customCollection = customCollection;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var tipoParticipacions = catalogoService.GetAllTipoParticipaciones();
            data.List = tipoParticipacionMapper.Map(tipoParticipacions);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tipoParticipacion = catalogoService.GetTipoParticipacionById(id);
            var tipoParticipacionForm = tipoParticipacionMapper.Map(tipoParticipacion);

            data.Form = SetupNewForm(tipoParticipacionForm);

            ViewData["Tipo"] = data.Form.Tipo;

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoParticipacionForm form)
        {
            var tipoParticipacion = tipoParticipacionMapper.Map(form);

            tipoParticipacion.CreadorPor = CurrentUser();
            tipoParticipacion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoParticipacion, form, Title.New))
            {
                var tipoParticipacionForm = tipoParticipacionMapper.Map(tipoParticipacion);

                ((GenericViewData<TipoParticipacionForm>)ViewData.Model).Form = SetupNewForm(tipoParticipacionForm);
                return ViewNew();   
            }

            catalogoService.SaveTipoParticipacion(tipoParticipacion);

            return RedirectToIndex(String.Format("Tipo de participación {0} ha sido creada", tipoParticipacion.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoParticipacionForm form)
        {
            var tipoParticipacion = tipoParticipacionMapper.Map(form);

            tipoParticipacion.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoParticipacion, form, Title.Edit))
            {
                var tipoParticipacionForm = tipoParticipacionMapper.Map(tipoParticipacion);

                ((GenericViewData<TipoParticipacionForm>)ViewData.Model).Form = SetupNewForm(tipoParticipacionForm);
                return ViewEdit();
            }

            catalogoService.SaveTipoParticipacion(tipoParticipacion);

            return RedirectToIndex(String.Format("Tipo de participación {0} ha sido modificada", tipoParticipacion.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoParticipacion = catalogoService.GetTipoParticipacionById(id);
            tipoParticipacion.Activo = true;
            tipoParticipacion.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoParticipacion(tipoParticipacion);

            var form = tipoParticipacionMapper.Map(tipoParticipacion);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoParticipacion = catalogoService.GetTipoParticipacionById(id);
            tipoParticipacion.Activo = false;
            tipoParticipacion.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoParticipacion(tipoParticipacion);

            var form = tipoParticipacionMapper.Map(tipoParticipacion);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<TipoParticipacion>(x => x.Nombre, q);
            return Content(data);
        }

        TipoParticipacionForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        TipoParticipacionForm SetupNewForm(TipoParticipacionForm form)
        {
            form = form ?? new TipoParticipacionForm();

            form.TiposParticipaciones = customCollection.TipoParticipacionCustomCollection();

            return form;
        }
    }
}