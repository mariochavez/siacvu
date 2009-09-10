using System;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers
{
    [HandleError]
    public class ParticipacionAcademiaController : BaseController<ParticipacionAcademia, ParticipacionAcademiaForm>
    {
        readonly IParticipacionAcademiaService participacionAcademiaService;
        readonly IParticipacionAcademiaMapper participacionAcademiaMapper;
        readonly ICatalogoService catalogoService;
        readonly IPaisMapper paisMapper;
        readonly IEstadoProductoMapper estadoProductoMapper;
        readonly IProyectoMapper proyectoMapper;
        readonly IProyectoService proyectoService;


        public ParticipacionAcademiaController(IParticipacionAcademiaService participacionAcademiaService, IParticipacionAcademiaMapper participacionAcademiaMapper,
                                               ICatalogoService catalogoService, IUsuarioService usuarioService, ISearchService searchService, IPaisMapper paisMapper, 
                                               IEstadoProductoMapper estadoProductoMapper, IProyectoMapper proyectoMapper, IProyectoService proyectoService)
            : base(usuarioService, searchService, catalogoService)
        {
            this.catalogoService = catalogoService;
            this.participacionAcademiaService = participacionAcademiaService;
            this.participacionAcademiaMapper = participacionAcademiaMapper;
            this.paisMapper = paisMapper;
            this.estadoProductoMapper = estadoProductoMapper;
            this.proyectoMapper = proyectoMapper;
            this.proyectoService = proyectoService;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var participacionAcademias = new ParticipacionAcademia[] { };

            if (User.IsInRole("Investigadores"))
                participacionAcademias = participacionAcademiaService.GetAllParticipacionAcademias(CurrentUser());
            if (User.IsInRole("DGAA"))
                participacionAcademias = participacionAcademiaService.GetAllParticipacionAcademias();
            
            data.List = participacionAcademiaMapper.Map(participacionAcademias);

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
            ViewData["Pais"] = (from p in data.Form.Paises where p.Nombre == "México" select p.Id).FirstOrDefault();
            data.Form.PeriodoReferenciaPeriodo = CurrentPeriodo().Periodo;

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var participacionAcademia = participacionAcademiaService.GetParticipacionAcademiaById(id);

            if (participacionAcademia == null)
                return RedirectToIndex("no ha sido encontrado", true);
            if (participacionAcademia.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            var participacionAcademiaForm = participacionAcademiaMapper.Map(participacionAcademia);

            data.Form = SetupNewForm(participacionAcademiaForm);

            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var participacionAcademia = participacionAcademiaService.GetParticipacionAcademiaById(id);
            data.Form = participacionAcademiaMapper.Map(participacionAcademia);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ParticipacionAcademiaForm form)
        {
            var participacionAcademia = participacionAcademiaMapper.Map(form, CurrentUser(), CurrentPeriodo());

            if (!IsValidateModel(participacionAcademia, form, Title.New, "ParticipacionAcademia"))
            {
                var participacionAcademiaForm = participacionAcademiaMapper.Map(participacionAcademia);

                ((GenericViewData<ParticipacionAcademiaForm>)ViewData.Model).Form = SetupNewForm(participacionAcademiaForm);
                return ViewNew();
            }

            participacionAcademiaService.SaveParticipacionAcademia(participacionAcademia);

            return RedirectToIndex(String.Format("Participación en academia {0} ha sido creada", participacionAcademia.NombreProducto));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ParticipacionAcademiaForm form)
        {
            var participacionAcademia = participacionAcademiaMapper.Map(form, CurrentUser(), CurrentPeriodo());

            participacionAcademia.ModificadoPor = CurrentUser();

            if (!IsValidateModel(participacionAcademia, form, Title.Edit))
            {
                var participacionAcademiaForm = participacionAcademiaMapper.Map(participacionAcademia);

                ((GenericViewData<ParticipacionAcademiaForm>)ViewData.Model).Form = SetupNewForm(participacionAcademiaForm);
                FormSetCombos(participacionAcademiaForm);
                return ViewEdit();
            }

            participacionAcademiaService.SaveParticipacionAcademia(participacionAcademia);

            return RedirectToIndex(String.Format("Participación en academia {0} ha sido modificada", participacionAcademia.NombreProducto));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Activate(int id)
        {
            var participacionAcademia = participacionAcademiaService.GetParticipacionAcademiaById(id);

            if (participacionAcademia.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            participacionAcademia.Activo = true;
            participacionAcademia.ModificadoPor = CurrentUser();
            participacionAcademiaService.SaveParticipacionAcademia(participacionAcademia);

            var form = participacionAcademiaMapper.Map(participacionAcademia);

            return Rjs(form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Put)]
        public ActionResult Deactivate(int id)
        {
            var participacionAcademia = participacionAcademiaService.GetParticipacionAcademiaById(id);

            if (participacionAcademia.Usuario.Id != CurrentUser().Id)
                return RedirectToIndex("no lo puede modificar", true);

            participacionAcademia.Activo = false;
            participacionAcademia.ModificadoPor = CurrentUser();
            participacionAcademiaService.SaveParticipacionAcademia(participacionAcademia);

            var form = participacionAcademiaMapper.Map(participacionAcademia);

            return Rjs("Activate", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<ParticipacionAcademia>(x => x.NombreProducto, q);
            return Content(data);
        }

        ParticipacionAcademiaForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        ParticipacionAcademiaForm SetupNewForm(ParticipacionAcademiaForm form)
        {
            form = form ?? new ParticipacionAcademiaForm();

            //Lista de Catalogos Pendientes
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());
            form.EstadosProductos = estadoProductoMapper.Map(catalogoService.GetActiveEstadoProductos());
            form.Proyectos = proyectoMapper.Map(proyectoService.GetActiveProyectos());
            return form;
        }

        private void FormSetCombos(ParticipacionAcademiaForm form)
        {
            ViewData["Pais"] = form.PaisId;
            ViewData["EstadoProducto"] = form.EstadoProductoId;
            ViewData["Proyecto"] = form.ProyectoId;
        }
    }
}
