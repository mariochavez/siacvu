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
    public class ProgramaEstudioController : BaseController<ProgramaEstudio, ProgramaEstudioForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IProgramaEstudioMapper programaEstudioMapper;

        public ProgramaEstudioController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                         IProgramaEstudioMapper programaEstudioMapper,
                                         ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.programaEstudioMapper = programaEstudioMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var programaEstudios = catalogoService.GetAllProgramaEstudios();
            data.List = programaEstudioMapper.Map(programaEstudios);

            return View(data);
        }
        
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new ProgramaEstudioForm();
			
            return View(data);
        }
        
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var programaEstudio = catalogoService.GetProgramaEstudioById(id);
            data.Form = programaEstudioMapper.Map(programaEstudio);

            ViewData.Model = data;
            return View();
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ProgramaEstudioForm form)
        {
        
            var programaEstudio = programaEstudioMapper.Map(form);
            
            programaEstudio.CreadorPor = CurrentUser();
            programaEstudio.ModificadoPor = CurrentUser();

            if(!IsValidateModel(programaEstudio, form, Title.New))
                return ViewNew();

            catalogoService.SaveProgramaEstudio(programaEstudio);

            return RedirectToIndex(String.Format("Programa de Estudio {0} ha sido creado", programaEstudio.Nombre));
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ProgramaEstudioForm form)
        {
        
            var programaEstudio = programaEstudioMapper.Map(form);
            
            programaEstudio.ModificadoPor = CurrentUser();

            if (!IsValidateModel(programaEstudio, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveProgramaEstudio(programaEstudio);

            return RedirectToIndex(String.Format("Programa de Estudio {0} ha sido modificado", programaEstudio.Nombre));
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var programaEstudio = catalogoService.GetProgramaEstudioById(id);
            programaEstudio.Activo = true;
            programaEstudio.ModificadoPor = CurrentUser();
            catalogoService.SaveProgramaEstudio(programaEstudio);

            var form = programaEstudioMapper.Map(programaEstudio);
            
            return Rjs(form);
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var programaEstudio = catalogoService.GetProgramaEstudioById(id);
            programaEstudio.Activo = false;
            programaEstudio.ModificadoPor = CurrentUser();
            catalogoService.SaveProgramaEstudio(programaEstudio);

            var form = programaEstudioMapper.Map(programaEstudio);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<ProgramaEstudio>(x => x.Nombre, q);
            return Content(data);
        }
    }
}