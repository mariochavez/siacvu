using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    public class ActividadPrevistaController : BaseController<ActividadPrevista, ActividadPrevistaForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IActividadPrevistaMapper actividadPrevistaMapper;
    
        public ActividadPrevistaController(IUsuarioService usuarioService,
                                           ICatalogoService catalogoService,
                                           ISearchService searchService,
                                           IActividadPrevistaMapper actividadPrevistaMapper)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.actividadPrevistaMapper = actividadPrevistaMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var actividadPrevistas = catalogoService.GetAllActividadPrevistas();
            data.List = actividadPrevistaMapper.Map(actividadPrevistas);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new ActividadPrevistaForm();
			
            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var actividadPrevista = catalogoService.GetActividadPrevistaById(id);
            data.Form = actividadPrevistaMapper.Map(actividadPrevista);

            ViewData.Model = data;
            return View();
        }

        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var actividadPrevista = catalogoService.GetActividadPrevistaById(id);
            data.Form = actividadPrevistaMapper.Map(actividadPrevista);
            
            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ActividadPrevistaForm form)
        {
        
            var actividadPrevista = actividadPrevistaMapper.Map(form);
            
            actividadPrevista.CreadorPor = CurrentUser();
            actividadPrevista.ModificadoPor = CurrentUser();

            if(!IsValidateModel(actividadPrevista, form, Title.New))
                return ViewNew();

            catalogoService.SaveActividadPrevista(actividadPrevista);

            return RedirectToIndex(String.Format("Actividad prevista {0} ha sido creada", actividadPrevista.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ActividadPrevistaForm form)
        {
        
            var actividadPrevista = actividadPrevistaMapper.Map(form);
            
            actividadPrevista.ModificadoPor = CurrentUser();

            if (!IsValidateModel(actividadPrevista, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveActividadPrevista(actividadPrevista);

            return RedirectToIndex(String.Format("Actividad prevista {0} ha sido modificada", actividadPrevista.Nombre));
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var actividadPrevista = catalogoService.GetActividadPrevistaById(id);
            actividadPrevista.Activo = true;
            actividadPrevista.ModificadoPor = CurrentUser();
            catalogoService.SaveActividadPrevista(actividadPrevista);

            var form = actividadPrevistaMapper.Map(actividadPrevista);
            
            return Rjs(form);
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var actividadPrevista = catalogoService.GetActividadPrevistaById(id);
            actividadPrevista.Activo = false;
            actividadPrevista.ModificadoPor = CurrentUser();
            catalogoService.SaveActividadPrevista(actividadPrevista);

            var form = actividadPrevistaMapper.Map(actividadPrevista);
            
            return Rjs("Activate", form);
        }
        
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<ActividadPrevista>(x => x.Nombre, q);
            return Content(data);
        }
    }
}