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
    public class IndiceController : BaseController<Indice, IndiceForm>
    {
		readonly ICatalogoService catalogoService;
        readonly IIndiceMapper indiceMapper;

        public IndiceController(IUsuarioService usuarioService, ICatalogoService catalogoService, IIndiceMapper indiceMapper)
            : base(usuarioService)
        {
            this.catalogoService = catalogoService;
            this.indiceMapper = indiceMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
			var data = CreateViewDataWithTitle(Title.Index);

            var indices = catalogoService.GetAllIndices();
            data.List = indiceMapper.Map(indices);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
			var data = CreateViewDataWithTitle(Title.New);
            data.Form = new IndiceForm();
			
			return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var indice = catalogoService.GetIndiceById(id);
            data.Form = indiceMapper.Map(indice);

			ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var indice = catalogoService.GetIndiceById(id);
            data.Form = indiceMapper.Map(indice);
            
            ViewData.Model = data;
            return View();
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(IndiceForm form)
        {
        
            var indice = indiceMapper.Map(form);

            if(!IsValidateModel(indice, form, Title.New))
                return ViewNew();

            catalogoService.SaveIndice(indice);

            return RedirectToIndex(String.Format("{0} ha sido creado", indice.Nombre));
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(IndiceForm form)
        {
        
            var indice = indiceMapper.Map(form);

            if (!IsValidateModel(indice, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveIndice(indice);

            return RedirectToIndex(String.Format("{0} ha sido modificado", indice.Nombre));
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var indice = catalogoService.GetIndiceById(id);
            indice.Activo = true;
            catalogoService.SaveIndice(indice);

            var form = indiceMapper.Map(indice);
            
            return Rjs(form);
        }
        
        [Transaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var indice = catalogoService.GetIndiceById(id);
            indice.Activo = false;
            catalogoService.SaveIndice(indice);

            var form = indiceMapper.Map(indice);
            
            return Rjs("Activate", form);
        }
    }
}
