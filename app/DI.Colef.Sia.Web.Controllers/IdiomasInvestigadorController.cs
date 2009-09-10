using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class IdiomasInvestigadorController : BaseController<IdiomasInvestigador, IdiomasInvestigadorForm>
    {
        readonly IIdiomasInvestigadorService idiomasInvestigadorService;
        readonly IIdiomasInvestigadorMapper idiomasInvestigadorMapper;
        readonly ICatalogoService catalogoService;
        readonly IIdiomaMapper idiomaMapper;
        readonly INivelIdiomaMapper nivelIdiomaMapper;

        public IdiomasInvestigadorController(IIdiomasInvestigadorService idiomasInvestigadorService,
                                             IIdiomasInvestigadorMapper idiomasInvestigadorMapper,
                                             ICatalogoService catalogoService, IUsuarioService usuarioService,
                                             ISearchService searchService, IIdiomaMapper idiomaMapper,
                                             INivelIdiomaMapper nivelIdiomaMapper)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.idiomasInvestigadorService = idiomasInvestigadorService;
            this.idiomasInvestigadorMapper = idiomasInvestigadorMapper;
            this.idiomaMapper = idiomaMapper;
            this.nivelIdiomaMapper = nivelIdiomaMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var idiomasInvestigadors = new IdiomasInvestigador[] { };

            if (User.IsInRole("Investigadores"))
                idiomasInvestigadors = idiomasInvestigadorService.GetAllIdiomasInvestigadores(CurrentUser());
            if (User.IsInRole("DGAA"))
                idiomasInvestigadors = idiomasInvestigadorService.GetAllIdiomasInvestigadores();

            data.List = idiomasInvestigadorMapper.Map(idiomasInvestigadors);

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var idiomasInvestigador = idiomasInvestigadorService.GetIdiomasInvestigadorById(id);

            if (idiomasInvestigador == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (idiomasInvestigador.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var idiomasInvestigadorForm = idiomasInvestigadorMapper.Map(idiomasInvestigador);

            data.Form = SetupNewForm(idiomasInvestigadorForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var idiomasInvestigador = idiomasInvestigadorService.GetIdiomasInvestigadorById(id);
            data.Form = idiomasInvestigadorMapper.Map(idiomasInvestigador);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(IdiomasInvestigadorForm form)
        {
            var idiomasInvestigador = idiomasInvestigadorMapper.Map(form, CurrentUser());

            if (!IsValidateModel(idiomasInvestigador, form, Title.New, "IdiomasInvestigador"))
            {
                ((GenericViewData<IdiomasInvestigadorForm>)ViewData.Model).Form = SetupNewForm();
                return ViewNew();
            }

            idiomasInvestigadorService.SaveIdiomasInvestigador(idiomasInvestigador);

            return RedirectToIndex(String.Format("Idioma del investigador {0} ha sido creado", idiomasInvestigador.Idioma.Nombre));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(IdiomasInvestigadorForm form)
        {
            var idiomasInvestigador = idiomasInvestigadorMapper.Map(form, CurrentUser());

            if (!IsValidateModel(idiomasInvestigador, form, Title.Edit))
            {
                var idiomasInvestigadorForm = idiomasInvestigadorMapper.Map(idiomasInvestigador);

                ((GenericViewData<IdiomasInvestigadorForm>)ViewData.Model).Form = SetupNewForm(idiomasInvestigadorForm);
                FormSetCombos(idiomasInvestigadorForm);
                return ViewEdit();
            }

            idiomasInvestigadorService.SaveIdiomasInvestigador(idiomasInvestigador);

            return RedirectToIndex(String.Format("Idioma del investigador {0} ha sido modificado", idiomasInvestigador.Idioma.Nombre));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var idiomasInvestigador = idiomasInvestigadorService.GetIdiomasInvestigadorById(id);

            if (idiomasInvestigador.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            idiomasInvestigador.Activo = true;
            idiomasInvestigador.ModificadoPor = CurrentUser();
            idiomasInvestigadorService.SaveIdiomasInvestigador(idiomasInvestigador);

            var form = idiomasInvestigadorMapper.Map(idiomasInvestigador);

            return Rjs(form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var idiomasInvestigador = idiomasInvestigadorService.GetIdiomasInvestigadorById(id);

            if (idiomasInvestigador.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            idiomasInvestigador.Activo = false;
            idiomasInvestigador.ModificadoPor = CurrentUser();
            idiomasInvestigadorService.SaveIdiomasInvestigador(idiomasInvestigador);

            var form = idiomasInvestigadorMapper.Map(idiomasInvestigador);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.SearchIdiomaInvestigador(q);
            return Content(data);
        }

        IdiomasInvestigadorForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        IdiomasInvestigadorForm SetupNewForm(IdiomasInvestigadorForm form)
        {
            form = form ?? new IdiomasInvestigadorForm();

            //Lista de Catalogos Pendientes
            form.Idiomas = idiomaMapper.Map(catalogoService.GetActiveIdiomas());
            form.NivelesConversacion = nivelIdiomaMapper.Map(catalogoService.GetActiveNivelIdiomas());
            form.NivelesEscritura = nivelIdiomaMapper.Map(catalogoService.GetActiveNivelIdiomas());
            form.NivelesLectura = nivelIdiomaMapper.Map(catalogoService.GetActiveNivelIdiomas());
            return form;
        }

        private void FormSetCombos(IdiomasInvestigadorForm form)
        {
            ViewData["Idioma"] = form.IdiomaId;
            ViewData["NivelConversacion"] = form.NivelConversacionId;
            ViewData["NivelLectura"] = form.NivelLecturaId;
            ViewData["NivelEscritura"] = form.NivelEscrituraId;
        }
    }
}
