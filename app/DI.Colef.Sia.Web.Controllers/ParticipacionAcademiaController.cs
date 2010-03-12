using System;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections;
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
        readonly IEditorialMapper editorialMapper;
        readonly ICustomCollection customCollection;
        //readonly IInstitucionMapper institucionMapper;
        readonly IRevistaPublicacionMapper revistaPublicacionMapper;

        public ParticipacionAcademiaController(IParticipacionAcademiaService participacionAcademiaService,
                                               IParticipacionAcademiaMapper participacionAcademiaMapper,
                                               ICatalogoService catalogoService,
                                               IUsuarioService usuarioService,
                                               ISearchService searchService,
                                               IPaisMapper paisMapper,
                                               IRevistaPublicacionMapper revistaPublicacionMapper,
                                               IEditorialMapper editorialMapper,
                                               ICustomCollection customCollection, IInstitucionMapper institucionMapper, ISedeMapper sedeMapper
            ) : base(usuarioService, searchService, catalogoService, institucionMapper, sedeMapper)
        {
            base.catalogoService = catalogoService;
            base.paisMapper = paisMapper;

            this.editorialMapper = editorialMapper;
            this.participacionAcademiaService = participacionAcademiaService;
            this.participacionAcademiaMapper = participacionAcademiaMapper;
            this.customCollection = customCollection;
            this.revistaPublicacionMapper = revistaPublicacionMapper;
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
            if (CurrentInvestigador() == null)
                return NoInvestigadorProfile("Por tal motivo no puede crear nuevos productos.");

            var data = CreateViewDataWithTitle(Title.New);
            data.Form = SetupNewForm();
            ViewData["Pais"] = (from p in data.Form.Paises where p.Nombre == "México" select p.Id).FirstOrDefault();
            
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
            var participacionAcademiaForm = participacionAcademiaMapper.Map(participacionAcademia);
            data.Form = SetupShowForm(participacionAcademiaForm);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(ParticipacionAcademiaForm form)
        {
            var participacionAcademia = participacionAcademiaMapper.Map(form, CurrentUser(), CurrentInvestigador());

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
            var participacionAcademia = participacionAcademiaMapper.Map(form, CurrentUser(), CurrentInvestigador());

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

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<ParticipacionAcademia>(x => x.NombreProducto, q);
            return Content(data);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeRevista(int select)
        {
            var revistaForm = revistaPublicacionMapper.Map(catalogoService.GetRevistaPublicacionById(select));

            var form = new ShowFieldsForm
            {
                RevistaPublicacionId = revistaForm.Id,

                RevistaPublicacionInstitucionNombre = revistaForm.InstitucionNombre,
                RevistaPublicacionIndice1Nombre = revistaForm.Indice1Nombre,
                RevistaPublicacionIndice2Nombre = revistaForm.Indice2Nombre,
                RevistaPublicacionIndice3Nombre = revistaForm.Indice3Nombre
            };

            return Rjs("ChangeRevista", form);
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
            //form.Editoriales = editorialMapper.Map(catalogoService.GetActiveEditorials());
            form.EstadosProductos = customCollection.EstadoProductoCustomCollection();
            return form;
        }

        private void FormSetCombos(ParticipacionAcademiaForm form)
        {
            ViewData["Pais"] = form.PaisId;
            ViewData["Volumen"] = form.Volumen;
            ViewData["Editorial"] = form.EditorialId;
            ViewData["EstadoProducto"] = form.EstadoProducto;
        }

        private ParticipacionAcademiaForm SetupShowForm(ParticipacionAcademiaForm form)
        {
            form = form ?? new ParticipacionAcademiaForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      RevistaPublicacionTitulo = form.RevistaPublicacion.Titulo,
                                      RevistaPublicacionInstitucionNombre = form.RevistaPublicacion.InstitucionNombre,
                                      RevistaPublicacionIndice1Nombre = form.RevistaPublicacion.Indice1Nombre,
                                      RevistaPublicacionIndice2Nombre = form.RevistaPublicacion.Indice2Nombre,
                                      RevistaPublicacionIndice3Nombre = form.RevistaPublicacion.Indice3Nombre,

                                      InstitucionNombre = form.Institucion.Nombre,
                                      InstitucionCiudad = form.Institucion.Ciudad,
                                      InstitucionEstadoPaisNombre = form.Institucion.EstadoPaisNombre,
                                      InstitucionPaisNombre = form.Institucion.PaisNombre,
                                      InstitucionTipoInstitucionNombre = form.Institucion.TipoInstitucion,

                                      IsShowForm = true,
                                      RevistaLabel = "Nombre de la revista",
                                      InstitucionLabel = "Institución"
                                  };

            return form;
        }
    }
}