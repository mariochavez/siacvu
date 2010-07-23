using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos
{
    [HandleError]
    [Obsolete("Hay que eliminar este controlador, como sus dependencias y vistas")]
    public class AreaTematicaController : BaseController<AreaTematica, AreaTematicaForm>
    {
        readonly ILineaTematicaMapper lineaTematicaMapper;
        //readonly ISubdisciplinaMapper subdisciplinaMapper;
    
        public AreaTematicaController(IUsuarioService usuarioService, ICatalogoService catalogoService, 
                                      IAreaTematicaMapper areaTematicaMapper, ISearchService searchService,
                                      ILineaTematicaMapper lineaTematicaMapper, ISubdisciplinaMapper subdisciplinaMapper) 
            : base (usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.areaTematicaMapper = areaTematicaMapper;
            this.lineaTematicaMapper = lineaTematicaMapper;
            //this.subdisciplinaMapper = subdisciplinaMapper;
        }

        //[AcceptVerbs(HttpVerbs.Get)]
        //public ActionResult Index() 
        //{
        //    var data = CreateViewDataWithTitle(Title.Index);
			
        //    var areaTematicas = catalogoService.GetAllAreaTematicas();
        //    data.List = areaTematicaMapper.Map(areaTematicas);

        //    return View(data);
        //}
        
        //[AcceptVerbs(HttpVerbs.Get)]
        //public ActionResult New()
        //{			
        //    var data = CreateViewDataWithTitle(Title.New);
        //    data.Form = SetupNewForm();
			
        //    return View(data);
        //}
        
        //[AcceptVerbs(HttpVerbs.Get)]
        //public ActionResult Edit(int id)
        //{
        //    var data = CreateViewDataWithTitle(Title.Edit);

        //    var areaTematica = catalogoService.GetAreaTematicaById(id);

        //    var areaTematicaForm = areaTematicaMapper.Map(areaTematica);

        //    data.Form = SetupNewForm(areaTematicaForm);

        //    FormSetCombos(data.Form);

        //    ViewData.Model = data;
        //    return View();
        //}
        
        //[CustomTransaction]
        //[ValidateAntiForgeryToken]
        //[AcceptVerbs(HttpVerbs.Post)]
        //public ActionResult Create(AreaTematicaForm form)
        //{
        
        //    var areaTematica = areaTematicaMapper.Map(form);
            
        //    areaTematica.CreadoPor = CurrentUser();
        //    areaTematica.ModificadoPor = CurrentUser();

        //    if (!IsValidateModel(areaTematica, form, Title.New, "AreaTematica"))
        //    {
        //        var areaTematicaForm = areaTematicaMapper.Map(areaTematica);

        //        ((GenericViewData<AreaTematicaForm>)ViewData.Model).Form = SetupNewForm(areaTematicaForm);
        //        return ViewNew();
        //    }

        //    catalogoService.SaveAreaTematica(areaTematica);

        //    return RedirectToIndex(String.Format("Área temática {0} ha sido creada", areaTematica.Nombre));
        //}
        
        //[CustomTransaction]
        //[ValidateAntiForgeryToken]
        //[AcceptVerbs(HttpVerbs.Post)]
        //public ActionResult Update(AreaTematicaForm form)
        //{
        
        //    var areaTematica = areaTematicaMapper.Map(form);
            
        //    areaTematica.ModificadoPor = CurrentUser();

        //    if (!IsValidateModel(areaTematica, form, Title.Edit))
        //    {
        //        var areaTematicaForm = areaTematicaMapper.Map(areaTematica);

        //        ((GenericViewData<AreaTematicaForm>)ViewData.Model).Form = SetupNewForm(areaTematicaForm);
        //        FormSetCombos(areaTematicaForm);
        //        return ViewEdit();
        //    }

        //    catalogoService.SaveAreaTematica(areaTematica);

        //    return RedirectToIndex(String.Format("Área temática {0} ha sido modificada", areaTematica.Nombre));
        //}
        
        //[CustomTransaction]
        //[AcceptVerbs(HttpVerbs.Put)]
        //public ActionResult Activate(int id)
        //{
        //    var areaTematica = catalogoService.GetAreaTematicaById(id);
        //    areaTematica.Activo = true;
        //    areaTematica.ModificadoPor = CurrentUser();
        //    catalogoService.SaveAreaTematica(areaTematica);

        //    var form = areaTematicaMapper.Map(areaTematica);
            
        //    return Rjs(form);
        //}
        
        //[CustomTransaction]
        //[AcceptVerbs(HttpVerbs.Put)]
        //public ActionResult Deactivate(int id)
        //{
        //    var areaTematica = catalogoService.GetAreaTematicaById(id);
        //    areaTematica.Activo = false;
        //    areaTematica.ModificadoPor = CurrentUser();
        //    catalogoService.SaveAreaTematica(areaTematica);

        //    var form = areaTematicaMapper.Map(areaTematica);
            
        //    return Rjs("Activate", form);
        //}
        
        //[AcceptVerbs(HttpVerbs.Get)]
        //public override ActionResult Search(string q)
        //{
        //    var data = searchService.Search<AreaTematica>(x => x.Nombre, q);
        //    return Content(data);
        //}

        //AreaTematicaForm SetupNewForm()
        //{
        //    return SetupNewForm(null);
        //}

        //AreaTematicaForm SetupNewForm(AreaTematicaForm form)
        //{
        //    form = form ?? new AreaTematicaForm();

        //    form.LineasTematicas = lineaTematicaMapper.Map(catalogoService.GetActiveLineaTematicas());

        //    return form;
        //}

        //private void FormSetCombos(AreaTematicaForm form)
        //{
        //    ViewData["LineaTematica"] = form.LineaTematicaId;
        //}
    }
}