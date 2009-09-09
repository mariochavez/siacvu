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
    public class SubdisciplinaController : BaseController<Subdisciplina, SubdisciplinaForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ISubdisciplinaMapper subdisciplinaMapper;

        public SubdisciplinaController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                       ISubdisciplinaMapper subdisciplinaMapper, ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.subdisciplinaMapper = subdisciplinaMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var subdisciplinas = catalogoService.GetAllSubdisciplinas();
            data.List = subdisciplinaMapper.Map(subdisciplinas);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new SubdisciplinaForm();

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var subdisciplina = catalogoService.GetSubdisciplinaById(id);
            data.Form = subdisciplinaMapper.Map(subdisciplina);

            ViewData.Model = data;
            return View();
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(SubdisciplinaForm form)
        {
            var subdisciplina = subdisciplinaMapper.Map(form);

            subdisciplina.CreadorPor = CurrentUser();
            subdisciplina.ModificadoPor = CurrentUser();

            if (!IsValidateModel(subdisciplina, form, Title.New))
                return ViewNew();

            catalogoService.SaveSubdisciplina(subdisciplina);

            return RedirectToIndex(String.Format("Subdisciplina {0} ha sido creada", subdisciplina.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(SubdisciplinaForm form)
        {
            var subdisciplina = subdisciplinaMapper.Map(form);

            subdisciplina.ModificadoPor = CurrentUser();

            if (!IsValidateModel(subdisciplina, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveSubdisciplina(subdisciplina);

            return RedirectToIndex(String.Format("Subdisciplina {0} ha sido modificada", subdisciplina.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var subdisciplina = catalogoService.GetSubdisciplinaById(id);
            subdisciplina.Activo = true;
            subdisciplina.ModificadoPor = CurrentUser();
            catalogoService.SaveSubdisciplina(subdisciplina);

            var form = subdisciplinaMapper.Map(subdisciplina);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var subdisciplina = catalogoService.GetSubdisciplinaById(id);
            subdisciplina.Activo = false;
            subdisciplina.ModificadoPor = CurrentUser();
            catalogoService.SaveSubdisciplina(subdisciplina);

            var form = subdisciplinaMapper.Map(subdisciplina);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Subdisciplina>(x => x.Nombre, q);
            return Content(data);
        }
    }
}