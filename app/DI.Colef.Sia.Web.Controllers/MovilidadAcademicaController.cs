using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class MovilidadAcademicaController : BaseController<MovilidadAcademica, MovilidadAcademicaForm>
    {
        readonly IMovilidadAcademicaService movilidadAcademicaService;
        readonly IMovilidadAcademicaMapper movilidadAcademicaMapper;
        readonly ICatalogoService catalogoService;
        readonly ITipoEstanciaMapper tipoEstanciaMapper;

        public MovilidadAcademicaController(IMovilidadAcademicaService movilidadAcademicaService,
                                            IMovilidadAcademicaMapper movilidadAcademicaMapper,
                                            ICatalogoService catalogoService, IUsuarioService usuarioService, 
                                            ITipoEstanciaMapper tipoEstanciaMapper, 
                                            ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.movilidadAcademicaService = movilidadAcademicaService;
            this.movilidadAcademicaMapper = movilidadAcademicaMapper;
            this.tipoEstanciaMapper = tipoEstanciaMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var movilidadAcademicas = new MovilidadAcademica[] { };

            if (User.IsInRole("Investigadores"))
                movilidadAcademicas = movilidadAcademicaService.GetAllMovilidadAcademicas(CurrentUser());
            if (User.IsInRole("DGAA"))
                movilidadAcademicas = movilidadAcademicaService.GetAllMovilidadAcademicas();

            data.List = movilidadAcademicaMapper.Map(movilidadAcademicas);

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
            ViewData["FechaInicial"] = DateTime.Now.ToString("dd/MM/yyyy");
            ViewData["FechaFinal"] = DateTime.Now.ToString("dd/MM/yyyy");

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var movilidadAcademica = movilidadAcademicaService.GetMovilidadAcademicaById(id);

            if (movilidadAcademica == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (movilidadAcademica.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var movilidadAcademicaForm = movilidadAcademicaMapper.Map(movilidadAcademica);

            data.Form = SetupNewForm(movilidadAcademicaForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var movilidadAcademica = movilidadAcademicaService.GetMovilidadAcademicaById(id);
            data.Form = movilidadAcademicaMapper.Map(movilidadAcademica);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(MovilidadAcademicaForm form,
                                   FormCollection formCollection)
        {
            var movilidadAcademica = movilidadAcademicaMapper.Map(form, CurrentUser());

            if (!IsValidateModel(movilidadAcademica, form, Title.New, "MovilidadAcademica"))
            {
                var movilidadAcademicaForm = movilidadAcademicaMapper.Map(movilidadAcademica);

                ((GenericViewData<MovilidadAcademicaForm>)ViewData.Model).Form = SetupNewForm(movilidadAcademicaForm);
                return ViewNew();
            }

            movilidadAcademicaService.SaveMovilidadAcademica(movilidadAcademica);

            return RedirectToIndex(String.Format("Movilidad Académica {0} ha sido creada", movilidadAcademica.Institucion.Nombre));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(MovilidadAcademicaForm form)
        {
            var movilidadAcademica = movilidadAcademicaMapper.Map(form, CurrentUser());

            if (!IsValidateModel(movilidadAcademica, form, Title.Edit))
            {
                var movilidadAcademicaForm = movilidadAcademicaMapper.Map(movilidadAcademica);

                ((GenericViewData<MovilidadAcademicaForm>)ViewData.Model).Form = SetupNewForm(movilidadAcademicaForm);
                FormSetCombos(movilidadAcademicaForm);
                return ViewEdit();
            }

            movilidadAcademicaService.SaveMovilidadAcademica(movilidadAcademica);

            return RedirectToIndex(String.Format("Movilidad Académica {0} ha sido modificada", movilidadAcademica.TipoEstancia.Nombre));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var movilidadAcademica = movilidadAcademicaService.GetMovilidadAcademicaById(id);

            if (movilidadAcademica.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            movilidadAcademica.Activo = true;
            movilidadAcademica.ModificadoPor = CurrentUser();
            movilidadAcademicaService.SaveMovilidadAcademica(movilidadAcademica);

            var form = movilidadAcademicaMapper.Map(movilidadAcademica);

            return Rjs(form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var movilidadAcademica = movilidadAcademicaService.GetMovilidadAcademicaById(id);

            if (movilidadAcademica.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            movilidadAcademica.Activo = false;
            movilidadAcademica.ModificadoPor = CurrentUser();
            movilidadAcademicaService.SaveMovilidadAcademica(movilidadAcademica);

            var form = movilidadAcademicaMapper.Map(movilidadAcademica);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.SearchMovilidadAcademica(q);
            return Content(data);
        }

        MovilidadAcademicaForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        MovilidadAcademicaForm SetupNewForm(MovilidadAcademicaForm form)
        {
            form = form ?? new MovilidadAcademicaForm();

            //Lista de Catalogos Pendientes
            form.TiposEstancias = tipoEstanciaMapper.Map(catalogoService.GetActiveTipoEstancias());
            return form;
        }

        private void FormSetCombos(MovilidadAcademicaForm form)
        {
            ViewData["TipoEstancia"] = form.TipoEstanciaId;
        }
    }
}
