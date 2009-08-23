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
    public class MedioElectronicoController : BaseController<MedioElectronico, MedioElectronicoForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IMedioElectronicoMapper medioElectronicoMapper;

        public MedioElectronicoController(IUsuarioService usuarioService, ICatalogoService catalogoService,
                                          IMedioElectronicoMapper medioElectronicoMapper,
                                          ISearchService searchService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.medioElectronicoMapper = medioElectronicoMapper;
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = CreateViewDataWithTitle(Title.Index);

            var medioElectronicos = catalogoService.GetAllMedioElectronicos();
            data.List = medioElectronicoMapper.Map(medioElectronicos);

            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {			
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = new MedioElectronicoForm();
			
            return View(data);
        }
        
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var medioElectronico = catalogoService.GetMedioElectronicoById(id);
            data.Form = medioElectronicoMapper.Map(medioElectronico);

            ViewData.Model = data;
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var medioElectronico = catalogoService.GetMedioElectronicoById(id);
            data.Form = medioElectronicoMapper.Map(medioElectronico);
            
            ViewData.Model = data;
            return View();
        }
        
        [Transaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(MedioElectronicoForm form)
        {
        
            var medioElectronico = medioElectronicoMapper.Map(form);
            
            medioElectronico.CreadorPor = CurrentUser();
            medioElectronico.ModificadoPor = CurrentUser();

            if(!IsValidateModel(medioElectronico, form, Title.New))
                return ViewNew();

            catalogoService.SaveMedioElectronico(medioElectronico);

            return RedirectToIndex(String.Format("Medio Electrónico {0} ha sido creado", medioElectronico.Nombre));
        }
        
        [Transaction]
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
        
        [Transaction]
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
        
        [Transaction]
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

        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<MedioElectronico>(x => x.Nombre, q);
            return Content(data);
        }
    }
}