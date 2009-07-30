using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Web.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class DisciplinaController : BaseController<Disciplina, DisciplinaForm>
    {
		readonly ICatalogoService catalogoService;
        readonly IDisciplinaMapper disciplinaMapper;

        public DisciplinaController(ICatalogoService catalogoService, IDisciplinaMapper disciplinaMapper) 
        {
            this.catalogoService = catalogoService;
            this.disciplinaMapper = disciplinaMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);

            var disciplinas = catalogoService.GetAllDisciplinas();
            data.List = disciplinaMapper.Map(disciplinas);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new DisciplinaForm();
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var disciplina = catalogoService.GetDisciplinaById(id);
            data.Form = disciplinaMapper.Map(disciplina);

			ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var disciplina = catalogoService.GetDisciplinaById(id);
            data.Form = disciplinaMapper.Map(disciplina);
            
            ViewData.Model = data;
            return View();
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(DisciplinaForm form)
        {
        
            var disciplina = disciplinaMapper.Map(form);

            if(!IsValidateModel(disciplina, form, Title.New))
                return ViewNew();

            catalogoService.SaveDisciplina(disciplina);

            return RedirectToIndex(String.Format("{0} ha sido creada", disciplina.Nombre));
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(DisciplinaForm form)
        {
        
            var disciplina = disciplinaMapper.Map(form);

            if (!IsValidateModel(disciplina, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveDisciplina(disciplina);

            return RedirectToIndex(String.Format("{0} ha sido modificada", disciplina.Nombre));
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var disciplina = catalogoService.GetDisciplinaById(id);
            disciplina.Activo = true;
            catalogoService.SaveDisciplina(disciplina);

            var form = disciplinaMapper.Map(disciplina);
            
            return Rjs(form);
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var disciplina = catalogoService.GetDisciplinaById(id);
            disciplina.Activo = false;
            catalogoService.SaveDisciplina(disciplina);

            var form = disciplinaMapper.Map(disciplina);
            
            return Rjs("Activate", form);
        }
    }
}
