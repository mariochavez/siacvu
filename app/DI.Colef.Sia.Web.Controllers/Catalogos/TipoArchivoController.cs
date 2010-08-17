using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    public class TipoArchivoController : BaseController<TipoArchivo, TipoArchivoForm>
    {
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
            var data = new GenericViewData<TipoArchivoForm>();
			
            var tipoArchivos = catalogoService.GetAllTipoArchivos();
            data.List = tipoArchivoMapper.Map(tipoArchivos);

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = new GenericViewData<TipoArchivoForm> {Form = new TipoArchivoForm()};

            return View(data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<TipoArchivoForm>();

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
            
            tipoArchivo.CreadoPor = CurrentUser();
            tipoArchivo.ModificadoPor = CurrentUser();

            if(!IsValidateModel(tipoArchivo, form, Title.New))
                return ViewNew();

            catalogoService.SaveTipoArchivo(tipoArchivo);

            return RedirectToIndex(String.Format("Tipo de archivo {0} ha sido registrado", tipoArchivo.Nombre));
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