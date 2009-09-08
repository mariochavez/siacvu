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
    public class PaisController : BaseController<Pais, PaisForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IPaisMapper paisMapper;

        public PaisController(IUsuarioService usuarioService, ICatalogoService catalogoService, IPaisMapper paisMapper,
                              ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.paisMapper = paisMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var pais = catalogoService.GetAllPaises();
            data.List = paisMapper.Map(pais);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new PaisForm();

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var pais = catalogoService.GetPaisById(id);
            data.Form = paisMapper.Map(pais);

            ViewData.Model = data;
            return View();
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(PaisForm form)
        {
            var pais = paisMapper.Map(form);

            pais.CreadorPor = CurrentUser();
            pais.ModificadoPor = CurrentUser();

            if (!IsValidateModel(pais, form, Title.New))
                return ViewNew();

            catalogoService.SavePais(pais);

            return RedirectToIndex(String.Format("País {0} ha sido creado", pais.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(PaisForm form)
        {
            var pais = paisMapper.Map(form);

            pais.ModificadoPor = CurrentUser();

            if (!IsValidateModel(pais, form, Title.Edit))
                return ViewEdit();

            catalogoService.SavePais(pais);

            return RedirectToIndex(String.Format("País {0} ha sido modificado", pais.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var pais = catalogoService.GetPaisById(id);
            pais.Activo = true;
            pais.ModificadoPor = CurrentUser();
            catalogoService.SavePais(pais);

            var form = paisMapper.Map(pais);

            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var pais = catalogoService.GetPaisById(id);
            pais.Activo = false;
            pais.ModificadoPor = CurrentUser();
            catalogoService.SavePais(pais);

            var form = paisMapper.Map(pais);

            return Rjs("Activate", form);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Pais>(x => x.Nombre, q);
            return Content(data);
        }
    }
}