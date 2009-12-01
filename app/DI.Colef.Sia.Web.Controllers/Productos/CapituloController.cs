using System;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos
{
    public class CapituloController : BaseController<Capitulo, CapituloForm>
    {
        readonly IAreaMapper areaMapper;
        readonly IAreaTematicaMapper areaTematicaMapper;
        readonly IAutorExternoCapituloMapper autorExternoCapituloMapper;
        readonly IAutorInternoCapituloMapper autorInternoCapituloMapper;
        readonly ICapituloMapper capituloMapper;
        readonly ICapituloService capituloService;
        readonly ICoautorExternoCapituloMapper coautorExternoCapituloMapper;
        readonly ICoautorInternoCapituloMapper coautorInternoCapituloMapper;
        readonly ICustomCollection customCollection;
        readonly IEditorialCapituloMapper editorialCapituloMapper;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;

        public CapituloController(ICapituloService capituloService, ICapituloMapper capituloMapper,
                                  ICatalogoService catalogoService, IUsuarioService usuarioService,
                                  ICoautorExternoCapituloMapper coautorExternoCapituloMapper,
                                  ICoautorInternoCapituloMapper coautorInternoCapituloMapper,
                                  IAutorExternoCapituloMapper autorExternoCapituloMapper,
                                  IAutorInternoCapituloMapper autorInternoCapituloMapper, ISearchService searchService,
                                  ICustomCollection customCollection, IAreaTematicaMapper areaTematicaMapper,
                                  ILineaTematicaMapper lineaTematicaMapper, IAreaMapper areaMapper,
                                  IDisciplinaMapper disciplinaMapper, ISubdisciplinaMapper subdisciplinaMapper,
                                  IEditorialCapituloMapper editorialCapituloMapper, IInvestigadorExternoMapper investigadorExternoMapper)
            : base(usuarioService, searchService, catalogoService, disciplinaMapper, subdisciplinaMapper)
        {
            this.capituloService = capituloService;
            this.capituloMapper = capituloMapper;
            this.coautorExternoCapituloMapper = coautorExternoCapituloMapper;
            this.coautorInternoCapituloMapper = coautorInternoCapituloMapper;
            this.autorExternoCapituloMapper = autorExternoCapituloMapper;
            this.autorInternoCapituloMapper = autorInternoCapituloMapper;
            this.areaTematicaMapper = areaTematicaMapper;
            this.customCollection = customCollection;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.areaMapper = areaMapper;
            this.editorialCapituloMapper = editorialCapituloMapper;
            this.investigadorExternoMapper = investigadorExternoMapper;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = CreateViewDataWithTitle(Title.Index);
            var capitulos = new Capitulo[] {};

            if (User.IsInRole("Investigadores"))
                capitulos = capituloService.GetAllCapitulos(CurrentUser());
            if (User.IsInRole("DGAA"))
                capitulos = capituloService.GetAllCapitulos();

            data.List = capituloMapper.Map(capitulos);

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
            data.Form.PosicionAutor = 1;

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            CoautorInternoCapitulo coautorInternoCapitulo;
            int posicionAutor;
            var data = CreateViewDataWithTitle(Title.Edit);

            var capitulo = capituloService.GetCapituloById(id);

            if (capitulo == null)
                return RedirectToIndex("no ha sido encontrado", true);

            var coautorExists =
                capitulo.CoautorInternoCapitulos.Where(
                    x => x.Investigador.Id == CurrentInvestigador().Id).Count();

            if (capitulo.Usuario.Id != CurrentUser().Id && coautorExists == 0)
                return RedirectToIndex("no lo puede modificar", true);

            var capituloForm = capituloMapper.Map(capitulo);

            data.Form = SetupNewForm(capituloForm);

            FormSetCombos(data.Form);

            if (coautorExists != 0)
            {
                coautorInternoCapitulo =
                    capitulo.CoautorInternoCapitulos.Where(x => x.Investigador.Id == CurrentInvestigador().Id).
                        FirstOrDefault();

                posicionAutor = coautorInternoCapitulo.Posicion;
            }
            else
                posicionAutor = data.Form.PosicionAutor;

            data.Form.PosicionAutor = posicionAutor;

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var capitulo = capituloService.GetCapituloById(id);
            var articuloForm = capituloMapper.Map(capitulo);

            data.Form = SetupShowForm(articuloForm);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create([Bind(Prefix = "CoautorInterno")] CoautorInternoProductoForm[] coautorInterno,
                                   [Bind(Prefix = "CoautorExterno")] CoautorExternoProductoForm[] coautorExterno,
                                   [Bind(Prefix = "AutorExterno")] AutorExternoProductoForm[] autorExterno,
                                   [Bind(Prefix = "AutorInterno")] AutorInternoProductoForm[] autorInterno,
                                   [Bind(Prefix = "Editorial")] EditorialProductoForm[] editorial,
                                   CapituloForm form)
        {
            coautorExterno = coautorExterno ?? new CoautorExternoProductoForm[] {};
            coautorInterno = coautorInterno ?? new CoautorInternoProductoForm[] {};
            autorExterno = autorExterno ?? new AutorExternoProductoForm[] {};
            autorInterno = autorInterno ?? new AutorInternoProductoForm[] {};
            editorial = editorial ?? new EditorialProductoForm[] {};

            var capitulo = capituloMapper.Map(form, CurrentUser(), CurrentInvestigador(),
                                              coautorExterno, coautorInterno, autorExterno, autorInterno, editorial);

            if (!IsValidateModel(capitulo, form, Title.New, "Capitulo"))
            {
                var capituloForm = capituloMapper.Map(capitulo);

                ((GenericViewData<CapituloForm>) ViewData.Model).Form = SetupNewForm(capituloForm);
                FormSetCombos(capituloForm);
                return ViewNew();
            }

            capituloService.SaveCapitulo(capitulo);

            return RedirectToIndex(String.Format("Capítulo {0} ha sido creado", capitulo.NombreCapitulo));
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(CapituloForm form)
        {
            var capitulo = capituloMapper.Map(form, CurrentUser(), CurrentInvestigador());

            if (!IsValidateModel(capitulo, form, Title.Edit))
            {
                var capituloForm = capituloMapper.Map(capitulo);

                ((GenericViewData<CapituloForm>) ViewData.Model).Form = SetupNewForm(capituloForm);
                FormSetCombos(capituloForm);
                return ViewEdit();
            }

            capituloService.SaveCapitulo(capitulo);

            return RedirectToIndex(String.Format("Capítulo {0} ha sido modificado", capitulo.NombreCapitulo));
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Capitulo>(x => x.NombreCapitulo, q);
            return Content(data);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeAreaTematica(int select)
        {
            var areaTematicaForm = areaTematicaMapper.Map(catalogoService.GetAreaTematicaById(select));
            var lineaTematicaForm =
                lineaTematicaMapper.Map(catalogoService.GetLineaTematicaById(areaTematicaForm.LineaTematicaId));

            var form = new ShowFieldsForm
                           {
                               AreaTematicaLineaTematicaNombre = lineaTematicaForm.Nombre,
                               AreaTematicaId = areaTematicaForm.Id
                           };

            return Rjs("ChangeAreaTematica", form);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorInterno(int id)
        {
            var capitulo = capituloService.GetCapituloById(id);
            var form = new CoautorForm {Controller = "Capitulo", IdName = "CapituloId"};

            if (capitulo != null)
                form.Id = capitulo.Id;

            return Rjs("NewCoautorInterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorInterno([Bind(Prefix = "CoautorInterno")] CoautorInternoProductoForm form,
                                              int capituloId)
        {
            var coautorInternoCapitulo = coautorInternoCapituloMapper.Map(form);

            ModelState.AddModelErrors(coautorInternoCapitulo.ValidationResults(), false, "CoautorInterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (capituloId != 0)
            {
                coautorInternoCapitulo.CreadorPor = CurrentUser();
                coautorInternoCapitulo.ModificadoPor = CurrentUser();

                var capitulo = capituloService.GetCapituloById(capituloId);

                var alreadyHasIt =
                    capitulo.CoautorInternoCapitulos.Where(
                        x => x.Investigador.Id == coautorInternoCapitulo.Investigador.Id).Count();

                if (alreadyHasIt == 0)
                {
                    capitulo.AddCoautorInterno(coautorInternoCapitulo);

                    capituloService.SaveCapitulo(capitulo);
                }
            }

            var coautorInternoCapituloForm = coautorInternoCapituloMapper.Map(coautorInternoCapitulo);
            coautorInternoCapituloForm.ParentId = capituloId;

            return Rjs("AddCoautorInterno", coautorInternoCapituloForm);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteCoautorInterno(int id, int investigadorId)
        {
            var capitulo = capituloService.GetCapituloById(id);

            if (capitulo != null)
            {
                var coautor = capitulo.CoautorInternoCapitulos.Where(x => x.Investigador.Id == investigadorId).First();
                capitulo.DeleteCoautorInterno(coautor);

                capituloService.SaveCapitulo(capitulo);
            }

            var form = new CoautorForm {ModelId = id, InvestigadorId = investigadorId};

            return Rjs("DeleteCoautorInterno", form);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id)
        {
            var capitulo = capituloService.GetCapituloById(id);
            var form = new CoautorForm { Controller = "Capitulo", IdName = "CapituloId", InvestigadorExterno = new InvestigadorExternoForm() };

            if (capitulo != null)
                form.Id = capitulo.Id;

            return Rjs("NewCoautorExterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorExterno([Bind(Prefix = "CoautorExterno")] CoautorExternoProductoForm form,
                                              int capituloId)
        {
            var investigadorExternoForm = new InvestigadorExternoForm
                                              {
                                                  Nombre = form.InvestigadorExternoNombre,
                                                  ApellidoPaterno = form.InvestigadorExternoApellidoPaterno,
                                                  ApellidoMaterno = form.InvestigadorExternoApellidoMaterno
                                              };

            var investigadorExterno = investigadorExternoMapper.Map(investigadorExternoForm);

            ModelState.AddModelErrors(investigadorExterno.ValidationResults(), false, "CoautorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            investigadorExterno.CreadorPor = CurrentUser();
            investigadorExterno.ModificadoPor = CurrentUser();

            catalogoService.SaveInvestigadorExterno(investigadorExterno);

            investigadorExternoForm = investigadorExternoMapper.Map(investigadorExterno);

            form.InvestigadorExternoId = investigadorExternoForm.Id;
            var coautorExternoCapitulo = coautorExternoCapituloMapper.Map(form);

            ModelState.AddModelErrors(coautorExternoCapitulo.ValidationResults(), false, "CoautorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (capituloId != 0)
            {
                coautorExternoCapitulo.CreadorPor = CurrentUser();
                coautorExternoCapitulo.ModificadoPor = CurrentUser();

                var capitulo = capituloService.GetCapituloById(capituloId);

                var alreadyHasIt =
                    capitulo.CoautorExternoCapitulos.Where(
                        x => x.InvestigadorExterno.Id == coautorExternoCapitulo.InvestigadorExterno.Id).Count();

                if (alreadyHasIt == 0)
                {
                    capitulo.AddCoautorExterno(coautorExternoCapitulo);
                    capituloService.SaveCapitulo(capitulo);
                }
            }

            var coautorExternoCapituloForm = coautorExternoCapituloMapper.Map(coautorExternoCapitulo);
            coautorExternoCapituloForm.ParentId = capituloId;

            return Rjs("AddCoautorExterno", coautorExternoCapituloForm);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteCoautorExterno(int id, int investigadorExternoId)
        {
            var capitulo = capituloService.GetCapituloById(id);

            if (capitulo != null)
            {
                var coautor =
                    capitulo.CoautorExternoCapitulos.Where(x => x.InvestigadorExterno.Id == investigadorExternoId).First
                        ();
                capitulo.DeleteCoautorExterno(coautor);

                capituloService.SaveCapitulo(capitulo);
            }

            var form = new CoautorForm {ModelId = id, InvestigadorExternoId = investigadorExternoId};

            return Rjs("DeleteCoautorExterno", form);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewAutorInterno(int id)
        {
            var capitulo = capituloService.GetCapituloById(id);
            var form = new AutorForm {Controller = "Capitulo", IdName = "CapituloId"};

            if (capitulo != null)
                form.Id = capitulo.Id;

            return Rjs("NewAutorInterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddAutorInterno(
            [Bind(Prefix = "AutorInterno")] AutorInternoProductoForm form, int capituloId)
        {
            var autorInternoCapitulo = autorInternoCapituloMapper.Map(form);

            ModelState.AddModelErrors(autorInternoCapitulo.ValidationResults(), false, "AutorInterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (capituloId != 0)
            {
                autorInternoCapitulo.CreadorPor = CurrentUser();
                autorInternoCapitulo.ModificadoPor = CurrentUser();

                var capitulo = capituloService.GetCapituloById(capituloId);

                var alreadyHasIt =
                    capitulo.AutorInternoCapitulos.Where(
                        x => x.Investigador.Id == autorInternoCapitulo.Investigador.Id).Count();

                if (alreadyHasIt == 0)
                {
                    capitulo.AddAutorInterno(autorInternoCapitulo);
                    capituloService.SaveCapitulo(capitulo);
                }
            }

            var autorInternoCapituloForm = autorInternoCapituloMapper.Map(autorInternoCapitulo);
            autorInternoCapituloForm.ParentId = capituloId;

            return Rjs("AddAutorInterno", autorInternoCapituloForm);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteAutorInterno(int id, int investigadorId)
        {
            var capitulo = capituloService.GetCapituloById(id);

            if (capitulo != null)
            {
                var autor = capitulo.AutorInternoCapitulos.Where(x => x.Investigador.Id == investigadorId).First();
                capitulo.DeleteAutorInterno(autor);

                capituloService.SaveCapitulo(capitulo);
            }

            var form = new AutorForm {ModelId = id, InvestigadorId = investigadorId};

            return Rjs("DeleteAutorInterno", form);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewAutorExterno(int id)
        {
            var capitulo = capituloService.GetCapituloById(id);

            var form = new AutorForm {Controller = "Capitulo", IdName = "CapituloId", InvestigadorExterno = new InvestigadorExternoForm()};

            if (capitulo != null)
                form.Id = capitulo.Id;

            return Rjs("NewAutorExterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddAutorExterno(
            [Bind(Prefix = "AutorExterno")] AutorExternoProductoForm form, int capituloId)
        {
            var investigadorExternoForm = new InvestigadorExternoForm
                                              {
                                                  Nombre = form.InvestigadorExternoNombre,
                                                  ApellidoPaterno = form.InvestigadorExternoApellidoPaterno,
                                                  ApellidoMaterno = form.InvestigadorExternoApellidoMaterno
                                              };

            var investigadorExterno = investigadorExternoMapper.Map(investigadorExternoForm);

            ModelState.AddModelErrors(investigadorExterno.ValidationResults(), false, "AutorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            investigadorExterno.CreadorPor = CurrentUser();
            investigadorExterno.ModificadoPor = CurrentUser();

            catalogoService.SaveInvestigadorExterno(investigadorExterno);

            investigadorExternoForm = investigadorExternoMapper.Map(investigadorExterno);

            form.InvestigadorExternoId = investigadorExternoForm.Id;
            var autorExternoCapitulo = autorExternoCapituloMapper.Map(form);

            ModelState.AddModelErrors(autorExternoCapitulo.ValidationResults(), false, "AutorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (capituloId != 0)
            {
                autorExternoCapitulo.CreadorPor = CurrentUser();
                autorExternoCapitulo.ModificadoPor = CurrentUser();

                var capitulo = capituloService.GetCapituloById(capituloId);

                var alreadyHasIt =
                    capitulo.AutorExternoCapitulos.Where(
                        x => x.InvestigadorExterno.Id == autorExternoCapitulo.InvestigadorExterno.Id).Count();

                if (alreadyHasIt == 0)
                {
                    capitulo.AddAutorExterno(autorExternoCapitulo);
                    capituloService.SaveCapitulo(capitulo);
                }
            }

            var autorExternoCapituloForm = autorExternoCapituloMapper.Map(autorExternoCapitulo);
            autorExternoCapituloForm.ParentId = capituloId;

            return Rjs("AddAutorExterno", autorExternoCapituloForm);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteAutorExterno(int id, int investigadorExternoId)
        {
            var capitulo = capituloService.GetCapituloById(id);

            if (capitulo != null)
            {
                var autor =
                    capitulo.AutorExternoCapitulos.Where(x => x.InvestigadorExterno.Id == investigadorExternoId).First();
                capitulo.DeleteAutorExterno(autor);

                capituloService.SaveCapitulo(capitulo);
            }

            var form = new AutorForm {ModelId = id, InvestigadorExternoId = investigadorExternoId};

            return Rjs("DeleteAutorExterno", form);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewEditorial(int id)
        {
            var capitulo = capituloService.GetCapituloById(id);

            var form = new EditorialForm {Controller = "Capitulo", IdName = "CapituloId"};

            if (capitulo != null)
                form.Id = capitulo.Id;

            return Rjs("NewEditorial", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddEditorial([Bind(Prefix = "Editorial")] EditorialProductoForm form, int capituloId)
        {
            var editorialCapitulo = editorialCapituloMapper.Map(form);

            ModelState.AddModelErrors(editorialCapitulo.ValidationResults(), false, "Editorial", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (capituloId != 0)
            {
                editorialCapitulo.CreadorPor = CurrentUser();
                editorialCapitulo.ModificadoPor = CurrentUser();

                var capitulo = capituloService.GetCapituloById(capituloId);

                var alreadyHasIt =
                    capitulo.EditorialCapitulos.Where(
                        x => x.Editorial.Id == editorialCapitulo.Editorial.Id).Count();

                if (alreadyHasIt == 0)
                {
                    capitulo.AddEditorial(editorialCapitulo);
                    capituloService.SaveCapitulo(capitulo);
                }
            }

            var editorialCapituloForm = editorialCapituloMapper.Map(editorialCapitulo);
            editorialCapituloForm.ParentId = capituloId;

            return Rjs("AddEditorial", editorialCapituloForm);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteEditorial(int id, int editorialId)
        {
            var capitulo = capituloService.GetCapituloById(id);

            if (capitulo != null)
            {
                var editorial = capitulo.EditorialCapitulos.Where(x => x.Editorial.Id == editorialId).First();
                capitulo.DeleteEditorial(editorial);

                capituloService.SaveCapitulo(capitulo);
            }

            var form = new EditorialForm {ModelId = id, EditorialId = editorialId};

            return Rjs("DeleteEditorial", form);
        }

        CapituloForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        CapituloForm SetupNewForm(CapituloForm form)
        {
            form = form ?? new CapituloForm();

            //Lista de Catalogos Pendientes
            form.TiposCapitulos = customCollection.TipoProductoCustomCollection(2);
            form.EstadosProductos = customCollection.EstadoProductoCustomCollection();
            form.TiposLibro = customCollection.TipoLibroCustomCollection();

            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = GetDisciplinasByAreaId(form.AreaId);
            form.Subdisciplinas = GetSubdisciplinasByDisciplinaId(form.DisciplinaId);

            return form;
        }

        void FormSetCombos(CapituloForm form)
        {
            ViewData["TipoCapitulo"] = form.TipoCapitulo;
            ViewData["EstadoProducto"] = form.EstadoProducto;
            ViewData["TipoLibro"] = form.TipoLibro;

            ViewData["AreaId"] = form.AreaId;
            ViewData["DisciplinaId"] = form.DisciplinaId;
            ViewData["SubdisciplinaId"] = form.SubdisciplinaId;
        }

        static CapituloForm SetupShowForm(CapituloForm form)
        {
            form = form ?? new CapituloForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      AreaTematicaNombre = form.AreaTematica.Nombre,
                                      AreaTematicaLineaTematicaNombre = form.AreaTematica.LineaTematicaNombre,

                                      SubdisciplinaNombre = form.SubdisciplinaNombre,
                                      DisciplinaNombre = form.DisciplinaNombre,
                                      AreaNombre = form.AreaNombre,

                                      ProyectoNombre = form.Proyecto.Nombre,

                                      EstadoProducto = form.EstadoProducto,
                                      FechaAceptacion = form.FechaAceptacion,
                                      FechaPublicacion = form.FechaPublicacion,

                                      IsShowForm = true
                                  };

            return form;
        }
    }
}