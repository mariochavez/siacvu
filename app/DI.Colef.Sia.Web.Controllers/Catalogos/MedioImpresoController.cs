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
    public class MedioImpresoController : BaseController<MedioImpreso, MedioImpresoForm>
    {
        readonly IMedioImpresoMapper medioImpresoMapper;

        public MedioImpresoController(IUsuarioService usuarioService, ICatalogoService catalogoService, IMedioImpresoMapper medioImpresoMapper,
                                      ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.medioImpresoMapper = medioImpresoMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = new GenericViewData<MedioImpresoForm>();

            var medioImpresos = catalogoService.GetAllMedioImpresos();
            data.List = medioImpresoMapper.Map(medioImpresos);

            return View(data);
        }
        
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = new GenericViewData<MedioImpresoForm> {Form = new MedioImpresoForm()};

            return View(data);
        }
        
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<MedioImpresoForm>();

            var medioImpreso = catalogoService.GetMedioImpresoById(id);
            data.Form = medioImpresoMapper.Map(medioImpreso);

            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(MedioImpresoForm form)
        {
            var medioImpreso = medioImpresoMapper.Map(form);
            
            medioImpreso.CreadoPor = CurrentUser();
            medioImpreso.ModificadoPor = CurrentUser();

            if(!IsValidateModel(medioImpreso, form, Title.New))
                return ViewNew();

            catalogoService.SaveMedioImpreso(medioImpreso);

            return RedirectToIndex(String.Format("Medio Impreso {0} ha sido registrado", medioImpreso.Nombre));
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(MedioImpresoForm form)
        {
            var medioImpreso = medioImpresoMapper.Map(form);
            
            medioImpreso.ModificadoPor = CurrentUser();

            if (!IsValidateModel(medioImpreso, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveMedioImpreso(medioImpreso);

            return RedirectToIndex(String.Format("Medio Impreso {0} ha sido modificado", medioImpreso.Nombre));
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var medioImpreso = catalogoService.GetMedioImpresoById(id);
            medioImpreso.Activo = true;
            medioImpreso.ModificadoPor = CurrentUser();
            catalogoService.SaveMedioImpreso(medioImpreso);

            var form = medioImpresoMapper.Map(medioImpreso);
            
            return Rjs(form);
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var medioImpreso = catalogoService.GetMedioImpresoById(id);
            medioImpreso.Activo = false;
            medioImpreso.ModificadoPor = CurrentUser();
            catalogoService.SaveMedioImpreso(medioImpreso);

            var form = medioImpresoMapper.Map(medioImpreso);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<MedioImpreso>(x => x.Nombre, q);
            return Content(data);
        }
    }
}