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
    public class IdentificadorLibroController : BaseController<IdentificadorLibro, IdentificadorLibroForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IIdentificadorLibroMapper identificadorLibroMapper;

        public IdentificadorLibroController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                            IIdentificadorLibroMapper identificadorLibroMapper,
                                            ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.identificadorLibroMapper = identificadorLibroMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var identificadorLibros = catalogoService.GetAllIdentificadorLibros();
            data.List = identificadorLibroMapper.Map(identificadorLibros);

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new IdentificadorLibroForm();

            return View(data);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var identificadorLibro = catalogoService.GetIdentificadorLibroById(id);
            data.Form = identificadorLibroMapper.Map(identificadorLibro);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var identificadorLibro = catalogoService.GetIdentificadorLibroById(id);
            data.Form = identificadorLibroMapper.Map(identificadorLibro);

            ViewData.Model = data;
            return View();
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(IdentificadorLibroForm form)
        {
            var identificadorLibro = identificadorLibroMapper.Map(form);

            identificadorLibro.CreadorPor = CurrentUser();
            identificadorLibro.ModificadoPor = CurrentUser();

            if (!IsValidateModel(identificadorLibro, form, Title.New))
                return ViewNew();

            catalogoService.SaveIdentificadorLibro(identificadorLibro);

            return RedirectToIndex(String.Format("Identificador del Libro {0} ha sido creado", identificadorLibro.Nombre));
        }

        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(IdentificadorLibroForm form)
        {
            var identificadorLibro = identificadorLibroMapper.Map(form);

            identificadorLibro.ModificadoPor = CurrentUser();

            if (!IsValidateModel(identificadorLibro, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveIdentificadorLibro(identificadorLibro);

            return RedirectToIndex(String.Format("Identificador del Libro {0} ha sido modificado", identificadorLibro.Nombre));
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var identificadorLibro = catalogoService.GetIdentificadorLibroById(id);
            identificadorLibro.Activo = true;
            identificadorLibro.ModificadoPor = CurrentUser();
            catalogoService.SaveIdentificadorLibro(identificadorLibro);

            var form = identificadorLibroMapper.Map(identificadorLibro);

            return Rjs(form);
        }

        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var identificadorLibro = catalogoService.GetIdentificadorLibroById(id);
            identificadorLibro.Activo = false;
            identificadorLibro.ModificadoPor = CurrentUser();
            catalogoService.SaveIdentificadorLibro(identificadorLibro);

            var form = identificadorLibroMapper.Map(identificadorLibro);

            return Rjs("Activate", form);
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<IdentificadorLibro>(x => x.Nombre, q);
            return Content(data);
        }
    }
}