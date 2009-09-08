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
    public class NivelEstudioController : BaseController<NivelEstudio, NivelEstudioForm>
    {
        readonly ICatalogoService catalogoService;
        readonly INivelEstudioMapper nivelEstudioMapper;

        public NivelEstudioController(IUsuarioService usuarioService, ICatalogoService catalogoService, INivelEstudioMapper nivelEstudioMapper,
                                      ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.nivelEstudioMapper = nivelEstudioMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var nivelEstudios = catalogoService.GetAllNivelEstudios();
            data.List = nivelEstudioMapper.Map(nivelEstudios);

            return View(data);
        }
        
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new NivelEstudioForm();
			
            return View(data);
        }
        
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var nivelEstudio = catalogoService.GetNivelEstudioById(id);
            data.Form = nivelEstudioMapper.Map(nivelEstudio);

            ViewData.Model = data;
            return View();
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(NivelEstudioForm form)
        {
            var nivelEstudio = nivelEstudioMapper.Map(form);
            
            nivelEstudio.CreadorPor = CurrentUser();
            nivelEstudio.ModificadoPor = CurrentUser();

            if(!IsValidateModel(nivelEstudio, form, Title.New))
                return ViewNew();

            catalogoService.SaveNivelEstudio(nivelEstudio);

            return RedirectToIndex(String.Format("Nivel de Estudio {0} ha sido creado", nivelEstudio.Nombre));
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(NivelEstudioForm form)
        {
            var nivelEstudio = nivelEstudioMapper.Map(form);
            
            nivelEstudio.ModificadoPor = CurrentUser();

            if (!IsValidateModel(nivelEstudio, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveNivelEstudio(nivelEstudio);

            return RedirectToIndex(String.Format("Nivel de Estudio {0} ha sido modificado", nivelEstudio.Nombre));
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var nivelEstudio = catalogoService.GetNivelEstudioById(id);
            nivelEstudio.Activo = true;
            nivelEstudio.ModificadoPor = CurrentUser();
            catalogoService.SaveNivelEstudio(nivelEstudio);

            var form = nivelEstudioMapper.Map(nivelEstudio);
            
            return Rjs(form);
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var nivelEstudio = catalogoService.GetNivelEstudioById(id);
            nivelEstudio.Activo = false;
            nivelEstudio.ModificadoPor = CurrentUser();
            catalogoService.SaveNivelEstudio(nivelEstudio);

            var form = nivelEstudioMapper.Map(nivelEstudio);
            
            return Rjs("Activate", form);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<NivelEstudio>(x => x.Nombre, q);
            return Content(data);
        }
    }
}