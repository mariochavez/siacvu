using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    public class TipoArchivoController : BaseController<TipoArchivo, TipoArchivoForm>
    {
        readonly ICatalogoService catalogoService;
        readonly ITipoArchivoMapper tipoArchivoMapper;
    
        public TipoArchivoController(IUsuarioService usuarioService, ICatalogoService catalogoService, 
                                     ITipoArchivoMapper tipoArchivoMapper, ISearchService searchService) 
            : base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.tipoArchivoMapper = tipoArchivoMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);
			
            var tipoArchivos = catalogoService.GetAllTipoArchivos();
            data.List = tipoArchivoMapper.Map(tipoArchivos);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new TipoArchivoForm();
			
            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tipoArchivo = catalogoService.GetTipoArchivoById(id);
            data.Form = tipoArchivoMapper.Map(tipoArchivo);

            ViewData.Model = data;
            return View();
        }
        
        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TipoArchivoForm form)
        {
        
            var tipoArchivo = tipoArchivoMapper.Map(form);
            
            tipoArchivo.CreadorPor = CurrentUser();
            tipoArchivo.ModificadoPor = CurrentUser();

            if(!IsValidateModel(tipoArchivo, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoArchivo(tipoArchivo);

            return RedirectToIndex(String.Format("Tipo de archivo {0} ha sido creado", tipoArchivo.Nombre));
        }
        
        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TipoArchivoForm form)
        {
        
            var tipoArchivo = tipoArchivoMapper.Map(form);
            
            tipoArchivo.ModificadoPor = CurrentUser();

            if (!IsValidateModel(tipoArchivo, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveTipoArchivo(tipoArchivo);

            return RedirectToIndex(String.Format("Tipo de archivo {0} ha sido modificado", tipoArchivo.Nombre));
        }
        
        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var tipoArchivo = catalogoService.GetTipoArchivoById(id);
            tipoArchivo.Activo = true;
            tipoArchivo.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoArchivo(tipoArchivo);

            var form = tipoArchivoMapper.Map(tipoArchivo);
            
            return Rjs(form);
        }
        
        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var tipoArchivo = catalogoService.GetTipoArchivoById(id);
            tipoArchivo.Activo = false;
            tipoArchivo.ModificadoPor = CurrentUser();
            catalogoService.SaveTipoArchivo(tipoArchivo);

            var form = tipoArchivoMapper.Map(tipoArchivo);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<TipoArchivo>(x => x.Nombre, q);
            return Content(data);
        }
    }
}