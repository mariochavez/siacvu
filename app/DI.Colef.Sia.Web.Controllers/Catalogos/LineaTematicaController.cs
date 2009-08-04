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
    public class LineaTematicaController : BaseController<LineaTematica, LineaTematicaForm>
    {
		readonly ICatalogoService catalogoService;
        readonly ILineaTematicaMapper lineaTematicaMapper;

        public LineaTematicaController(IUsuarioService usuarioService, ICatalogoService catalogoService, ILineaTematicaMapper lineaTematicaMapper)
            : base(usuarioService)
        {
            this.catalogoService = catalogoService;
            this.lineaTematicaMapper = lineaTematicaMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);

            var lineaTematicas = catalogoService.GetAllLineaTematicas();
            data.List = lineaTematicaMapper.Map(lineaTematicas);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new LineaTematicaForm();
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var lineaTematica = catalogoService.GetLineaTematicaById(id);
            data.Form = lineaTematicaMapper.Map(lineaTematica);

			ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var lineaTematica = catalogoService.GetLineaTematicaById(id);
            data.Form = lineaTematicaMapper.Map(lineaTematica);
            
            ViewData.Model = data;
            return View();
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(LineaTematicaForm form)
        {
            var lineaTematica = lineaTematicaMapper.Map(form);

            lineaTematica.CreadorPor = CurrentUser();
            lineaTematica.ModificadoPor = CurrentUser();

            if(!IsValidateModel(lineaTematica, form, Title.New))
                return ViewNew();

            catalogoService.SaveLineaTematica(lineaTematica);

            return RedirectToIndex(String.Format("{0} ha sido creada", lineaTematica.Nombre));
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(LineaTematicaForm form)
        {
            var lineaTematica = lineaTematicaMapper.Map(form);

            lineaTematica.ModificadoPor = CurrentUser();

            if (!IsValidateModel(lineaTematica, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveLineaTematica(lineaTematica);

            return RedirectToIndex(String.Format("{0} ha sido modificada", lineaTematica.Nombre));
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var lineaTematica = catalogoService.GetLineaTematicaById(id);
            lineaTematica.Activo = true;
            lineaTematica.ModificadoPor = CurrentUser();
            catalogoService.SaveLineaTematica(lineaTematica);

            var form = lineaTematicaMapper.Map(lineaTematica);
            
            return Rjs(form);
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var lineaTematica = catalogoService.GetLineaTematicaById(id);
            lineaTematica.Activo = false;
            lineaTematica.ModificadoPor = CurrentUser();
            catalogoService.SaveLineaTematica(lineaTematica);

            var form = lineaTematicaMapper.Map(lineaTematica);
            
            return Rjs("Activate", form);
        }
    }
}
