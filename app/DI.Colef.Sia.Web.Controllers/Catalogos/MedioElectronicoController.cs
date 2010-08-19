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
    public class MedioElectronicoController : BaseController<MedioElectronico, MedioElectronicoForm>
    {
        readonly IMedioElectronicoMapper medioElectronicoMapper;

        public MedioElectronicoController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                          IMedioElectronicoMapper medioElectronicoMapper,
                                          ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.medioElectronicoMapper = medioElectronicoMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = new GenericViewData<MedioElectronicoForm>();

            var medioElectronicos = catalogoService.GetAllMedioElectronicos();
            data.List = medioElectronicoMapper.Map(medioElectronicos);

            return View(data);
        }
        
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = new GenericViewData<MedioElectronicoForm> {Form = new MedioElectronicoForm()};

            return View(data);
        }
        
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<MedioElectronicoForm>();

            var medioElectronico = catalogoService.GetMedioElectronicoById(id);
            data.Form = medioElectronicoMapper.Map(medioElectronico);

            ViewData.Model = data;
            return View();
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(MedioElectronicoForm form)
        {
        
            var medioElectronico = medioElectronicoMapper.Map(form);
            
            medioElectronico.CreadoPor = CurrentUser();
            medioElectronico.ModificadoPor = CurrentUser();

            if(!IsValidateModel(medioElectronico, form, Title.New))
                return ViewNew();

            catalogoService.SaveMedioElectronico(medioElectronico);

            return RedirectToIndex(String.Format("Medio Electrónico {0} ha sido registrado", medioElectronico.Nombre));
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(MedioElectronicoForm form)
        {
        
            var medioElectronico = medioElectronicoMapper.Map(form);
            
            medioElectronico.ModificadoPor = CurrentUser();

            if (!IsValidateModel(medioElectronico, form, Title.Edit))
                return ViewEdit();

            catalogoService.SaveMedioElectronico(medioElectronico);

            return RedirectToIndex(String.Format("Medio Electrónico {0} ha sido modificado", medioElectronico.Nombre));
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var medioElectronico = catalogoService.GetMedioElectronicoById(id);
            medioElectronico.Activo = true;
            medioElectronico.ModificadoPor = CurrentUser();
            catalogoService.SaveMedioElectronico(medioElectronico);

            var form = medioElectronicoMapper.Map(medioElectronico);
            
            return Rjs(form);
        }
        
        [Authorize(Roles = "DGAA")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var medioElectronico = catalogoService.GetMedioElectronicoById(id);
            medioElectronico.Activo = false;
            medioElectronico.ModificadoPor = CurrentUser();
            catalogoService.SaveMedioElectronico(medioElectronico);

            var form = medioElectronicoMapper.Map(medioElectronico);
            
            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<MedioElectronico>(x => x.Nombre, q);
            return Content(data);
        }
    }
}