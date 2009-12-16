using System;
using System.Linq;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Collections;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Security;
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
        readonly IArchivoService archivoService;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;

        public CapituloController(ICapituloService capituloService, ICapituloMapper capituloMapper,
                                  ICatalogoService catalogoService, IUsuarioService usuarioService,
                                  IArchivoService archivoService,
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
            this.archivoService = archivoService;
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
            return RedirectToHomeIndex();
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

        [Authorize(Roles = "Investigadores, DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            CoautorInternoCapitulo coautorInternoCapitulo;
            int posicionAutor;
            var coautorExists = 0;
            var data = CreateViewDataWithTitle(Title.Edit);

            var capitulo = capituloService.GetCapituloById(id);

            if (capitulo.Firma.Aceptacion1 == 1 && capitulo.Firma.Aceptacion2 == 0 && User.IsInRole("Investigadores"))
                return RedirectToHomeIndex(String.Format("El capítulo {0} esta en firma y no puede ser editado", capitulo.NombreCapitulo));
            if (User.IsInRole("DGAA"))
            {
                if ((capitulo.Firma.Aceptacion1 == 1 && capitulo.Firma.Aceptacion2 == 1) ||
                    (capitulo.Firma.Aceptacion1 == 0 && capitulo.Firma.Aceptacion2 == 0) ||
                    (capitulo.Firma.Aceptacion1 == 0 && capitulo.Firma.Aceptacion2 == 2)
                   )
                    return
                        RedirectToHomeIndex(String.Format(
                                                "El capítulo {0} ya fue aceptado o no ha sido enviado a firma",
                                                capitulo.NombreCapitulo));
            }

            if (User.IsInRole("Investigadores"))
            {
                coautorExists =
                    capitulo.CoautorInternoCapitulos.Where(
                        x => x.Investigador.Id == CurrentInvestigador().Id).Count();

                if (capitulo.Usuario.Id != CurrentUser().Id && coautorExists == 0)
                    return RedirectToHomeIndex("no lo puede modificar");
            }

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
            var capituloForm = capituloMapper.Map(capitulo);

            data.Form = SetupShowForm(capituloForm);

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
            ModelState.AddModelErrors(capitulo.ValidationResults(), true, "Capitulo");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            //if (!IsValidateModel(capitulo, form, Title.New, "Capitulo"))
            //{
            //    var capituloForm = capituloMapper.Map(capitulo);

            //    ((GenericViewData<CapituloForm>) ViewData.Model).Form = SetupNewForm(capituloForm);
            //    FormSetCombos(capituloForm);
            //    return ViewNew();
            //}

            capituloService.SaveCapitulo(capitulo);
            SetMessage(String.Format("Capítulo {0} ha sido creado", capitulo.NombreCapitulo));

            return Rjs("Save", capitulo.Id);
        }

        //[CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(CapituloForm form)
        {
            var capitulo = capituloMapper.Map(form, CurrentUser(), CurrentInvestigador());

            ModelState.AddModelErrors(capitulo.ValidationResults(), true, "Capitulo");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            //if (!IsValidateModel(capitulo, form, Title.Edit))
            //{
            //    var capituloForm = capituloMapper.Map(capitulo);

            //    ((GenericViewData<CapituloForm>) ViewData.Model).Form = SetupNewForm(capituloForm);
            //    FormSetCombos(capituloForm);
            //    return ViewEdit();
            //}

            capituloService.SaveCapitulo(capitulo, true);
            SetMessage(String.Format ("Capítulo {0} ha sido modificado", capitulo.NombreCapitulo));

            return Rjs("Save", capitulo.Id);
        }

        [CookieLessAuthorize(Roles = "Investigadores")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddFile(FormCollection form)
        {
            var id = Convert.ToInt32(form["Id"]);
            var capitulo = capituloService.GetCapituloById(id);

            var file = Request.Files["fileData"];

            var archivo = new Archivo
            {
                Activo = true,
                Contenido = file.ContentType,
                CreadoEl = DateTime.Now,
                CreadoPor = CurrentUser(),
                ModificadoEl = DateTime.Now,
                ModificadoPor = CurrentUser(),
                Nombre = file.FileName,
                Tamano = file.ContentLength
            };

            var datos = new byte[file.ContentLength];
            file.InputStream.Read(datos, 0, datos.Length);
            archivo.Datos = datos;

            if (form["TipoArchivo"] == "Aceptado")
            {
                archivo.TipoProducto = capitulo.TipoProducto;
                archivoService.Save(archivo);
                capitulo.ComprobanteAceptado = archivo;
            }
            else if (form["TipoArchivo"] == "Publicado")
            {
                archivo.TipoProducto = capitulo.TipoProducto;
                archivoService.Save(archivo);
                capitulo.ComprobantePublicado = archivo;
            }
            else if (form["TipoArchivo"] == "ComprobanteCapitulo")
            {
                archivo.TipoProducto = capitulo.TipoProducto;
                archivoService.Save(archivo);
                capitulo.ComprobanteCapitulo = archivo;
            }

            capituloService.SaveCapitulo(capitulo);

            return Content("Uploaded");
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
                coautorInternoCapitulo.CreadoPor = CurrentUser();
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
                                                  Nombre = form.Nombre,
                                                  ApellidoPaterno = form.ApellidoPaterno,
                                                  ApellidoMaterno = form.ApellidoMaterno
                                              };

            var investigadorExterno = investigadorExternoMapper.Map(investigadorExternoForm);

            ModelState.AddModelErrors(investigadorExterno.ValidationResults(), false, "CoautorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            investigadorExterno.CreadoPor = CurrentUser();
            investigadorExterno.ModificadoPor = CurrentUser();

            catalogoService.SaveInvestigadorExterno(investigadorExterno);

            form.InvestigadorExternoId = investigadorExterno.Id;
            var coautorExternoCapitulo = coautorExternoCapituloMapper.Map(form);

            ModelState.AddModelErrors(coautorExternoCapitulo.ValidationResults(), false, "CoautorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (capituloId != 0)
            {
                coautorExternoCapitulo.CreadoPor = CurrentUser();
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
                autorInternoCapitulo.CreadoPor = CurrentUser();
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
                                                  Nombre = form.Nombre,
                                                  ApellidoPaterno = form.ApellidoPaterno,
                                                  ApellidoMaterno = form.ApellidoMaterno
                                              };

            var investigadorExterno = investigadorExternoMapper.Map(investigadorExternoForm);

            ModelState.AddModelErrors(investigadorExterno.ValidationResults(), false, "AutorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            investigadorExterno.CreadoPor = CurrentUser();
            investigadorExterno.ModificadoPor = CurrentUser();

            catalogoService.SaveInvestigadorExterno(investigadorExterno);

            form.InvestigadorExternoId = investigadorExterno.Id;
            var autorExternoCapitulo = autorExternoCapituloMapper.Map(form);

            ModelState.AddModelErrors(autorExternoCapitulo.ValidationResults(), false, "AutorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (capituloId != 0)
            {
                autorExternoCapitulo.CreadoPor = CurrentUser();
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
                editorialCapitulo.CreadoPor = CurrentUser();
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