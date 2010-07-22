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
        readonly IAutorExternoCapituloMapper autorExternoCapituloMapper;
        readonly IAutorInternoCapituloMapper autorInternoCapituloMapper;
        readonly ICapituloMapper capituloMapper;
        readonly ICapituloService capituloService;
        readonly ICoautorExternoCapituloMapper coautorExternoCapituloMapper;
        readonly ICoautorInternoCapituloMapper coautorInternoCapituloMapper;
        readonly ICustomCollection customCollection;
        readonly IEditorialProductoMapper<EditorialCapitulo> editorialCapituloMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly IInvestigadorService investigadorService;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IProductoService productoService;

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
                                  IEditorialProductoMapper<EditorialCapitulo> editorialCapituloMapper,
                                  IInvestigadorExternoMapper investigadorExternoMapper,
                                  IInvestigadorService investigadorService,
                                  IPaisMapper paisMapper, IProductoService productoService)
            : base(usuarioService, searchService, catalogoService, disciplinaMapper, subdisciplinaMapper)
        {
            base.paisMapper = paisMapper;

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
            this.investigadorService = investigadorService;
            this.productoService = productoService;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<CapituloForm>();
            var productos = productoService.GetProductosByUsuario<Capitulo>(CurrentUser(), x => x.NombreCapitulo,
                                                                            x => x.TipoCapitulo);
            data.ProductList = productos;

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            if (CurrentInvestigador() == null)
                return NoInvestigadorProfile("Por tal motivo no puede crear nuevos productos.");

            var data = new GenericViewData<CapituloForm> {Form = SetupNewForm()};

            return View(data);
        }

        [Authorize(Roles = "Investigadores, DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<CapituloForm>();
            var capitulo = capituloService.GetCapituloById(id);

            var verifyMessage = VerifyProductoStatus(capitulo.Firma, capitulo.NombreCapitulo);
            if (!String.IsNullOrEmpty(verifyMessage))
                return RedirectToHomeIndex(verifyMessage);

            var verifyOwnershipMessage = VerifyProductoOwnership(CurrentUser().Investigador, capitulo.Usuario.Id,
                                                                 CurrentUser().Id);
            if (!String.IsNullOrEmpty(verifyOwnershipMessage))
                return RedirectToHomeIndex(verifyOwnershipMessage);

            CoautorInternoCapitulo coautorInternoCapitulo;
            AutorInternoCapitulo autorInternoCapitulo;
            int posicionCoautor;
            var coautorExists = 0;
            int posicionAutor;
            var autorExists = 0;

            if (User.IsInRole("Investigadores"))
            {
                coautorExists =
                    capitulo.CoautorInternoCapitulos.Where(
                        x => x.Investigador.Id == CurrentInvestigador().Id).Count();

                autorExists =
                    capitulo.AutorInternoCapitulos.Where(
                        x => x.Investigador.Id == CurrentInvestigador().Id).Count();

                if (capitulo.Usuario.Id != CurrentUser().Id && coautorExists == 0)
                    return RedirectToHomeIndex("no lo puede modificar");
            }

            var capituloForm = capituloMapper.Map(capitulo);
            if (capitulo.AreaTematica != null)
                capituloForm.LineaTematicaId = capitulo.AreaTematica.LineaTematica.Id;

            data.Form = SetupNewForm(capituloForm);
            FormSetCombos(data.Form);

            if (coautorExists != 0)
            {
                coautorInternoCapitulo =
                    capitulo.CoautorInternoCapitulos.Where(x => x.Investigador.Id == CurrentInvestigador().Id).
                        FirstOrDefault();

                posicionCoautor = coautorInternoCapitulo.Posicion;
            }
            else
                posicionCoautor = data.Form.PosicionCoautor;

            if (autorExists != 0)
            {
                autorInternoCapitulo =
                    capitulo.AutorInternoCapitulos.Where(x => x.Investigador.Id == CurrentInvestigador().Id).
                        FirstOrDefault();

                posicionAutor = autorInternoCapitulo.Posicion;
            }
            else
                posicionAutor = data.Form.PosicionAutor;

            data.Form.PosicionCoautor = posicionCoautor;
            data.Form.PosicionAutor = posicionAutor;

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = new GenericViewData<CapituloForm>();

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

            capituloService.SaveCapitulo(capitulo);
            SetMessage(String.Format("Capítulo {0} ha sido creado", capitulo.NombreCapitulo));

            return Rjs("Save", capitulo.Id);
        }

        [Authorize]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(CapituloForm form)
        {
            var capitulo = new Capitulo();

            if (User.IsInRole("Investigadores"))
                capitulo = capituloMapper.Map(form, CurrentUser(), CurrentInvestigador());
            if (User.IsInRole("DGAA"))
                capitulo = capituloMapper.Map(form, CurrentUser());

            ModelState.AddModelErrors(capitulo.ValidationResults(), true, "Capitulo");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            capituloService.SaveCapitulo(capitulo, true);
            SetMessage(String.Format("Capítulo {0} ha sido modificado", capitulo.NombreCapitulo));

            return Rjs("Save", capitulo.Id);
        }

        [CookieLessAuthorize]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddFile(FormCollection form)
        {
            var id = Convert.ToInt32(form["Id"]);
            var capitulo = capituloService.GetCapituloById(id);

            var archivo = MapArchivo<ArchivoCapitulo>();
            capitulo.AddArchivo(archivo);

            capituloService.SaveCapitulo(capitulo);

            return Content("Uploaded");
        }

        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DgaaValidateProduct(FirmaForm firmaForm)
        {
            var capitulo = capituloService.GetCapituloById(firmaForm.ProductoId);

            capitulo.Firma.Aceptacion2 = 1;
            capitulo.Firma.Usuario2 = CurrentUser();
            
            capituloService.SaveCapitulo(capitulo);

            var data = new FirmaForm
                           {
                               TipoProducto = firmaForm.TipoProducto,
                               Aceptacion2 = 1                        
                           };

            return Rjs("DgaaSign", data);
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DgaaRejectProduct(FirmaForm firmaForm)
        {
            var capitulo = capituloService.GetCapituloById(firmaForm.ProductoId);
            capitulo.Firma.Aceptacion1 = 0;
            capitulo.Firma.Aceptacion2 = 2;
            capitulo.Firma.Descripcion = firmaForm.Descripcion;
            capitulo.Firma.Usuario1 = CurrentUser();
            capitulo.Firma.Usuario2 = CurrentUser();

            ModelState.AddModelErrors(capitulo.ValidationResults(), false, "Firma");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            capituloService.SaveCapitulo(capitulo, true);

            var data = new FirmaForm
                           {
                               TipoProducto = firmaForm.TipoProducto,
                               Aceptacion2 = 2
                           };

            return Rjs("DgaaSign", data);
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
            // TODO: Dependencias
            return Rjs("", null);
            //var areaTematicaForm = areaTematicaMapper.Map(catalogoService.GetAreaTematicaById(select));
            //var lineaTematicaForm =
            //    lineaTematicaMapper.Map(catalogoService.GetLineaTematicaById(areaTematicaForm.LineaTematicaId));

            //var form = new ShowFieldsForm
            //               {
            //                   AreaTematicaLineaTematicaNombre = lineaTematicaForm.Nombre,
            //                   AreaTematicaId = areaTematicaForm.Id
            //               };

            //return Rjs("ChangeAreaTematica", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorInterno(int id, bool esAlfabeticamente)
        {
            var capitulo = capituloService.GetCapituloById(id);
            var form = new CoautorForm
                           {
                               Controller = "Capitulo",
                               IdName = "CapituloId",
                               CoautorSeOrdenaAlfabeticamente = esAlfabeticamente
                           };

            if (User.IsInRole("Investigadores"))
                form.CreadoPorId = CurrentInvestigador().Id;

            if (capitulo != null)
            {
                form.Id = capitulo.Id;
                var investigador = investigadorService.GetInvestigadorByUsuario(capitulo.CreadoPor.UsuarioNombre);
                form.CreadoPorId = investigador.Id;
            }

            return Rjs("NewCoautorInterno", form);
        }

        [CustomTransaction]
        [Authorize]
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
        [Authorize]
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

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id, bool esAlfabeticamente)
        {
            var capitulo = capituloService.GetCapituloById(id);
            var form = new CoautorForm
                           {
                               Controller = "Capitulo",
                               IdName = "CapituloId",
                               InvestigadorExterno = new InvestigadorExternoForm(),
                               CoautorSeOrdenaAlfabeticamente = esAlfabeticamente
                           };

            if (capitulo != null)
                form.Id = capitulo.Id;

            return Rjs("NewCoautorExterno", form);
        }

        [CustomTransaction]
        [Authorize]
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
        [Authorize]
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

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewAutorInterno(int id, bool esAlfabeticamente)
        {
            var capitulo = capituloService.GetCapituloById(id);
            var form = new AutorForm
                           {
                               Controller = "Capitulo",
                               IdName = "CapituloId",
                               AutorSeOrdenaAlfabeticamente = esAlfabeticamente
                           };

            if (capitulo != null)
                form.Id = capitulo.Id;

            return Rjs("NewAutorInterno", form);
        }

        [CustomTransaction]
        [Authorize]
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
        [Authorize]
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

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewAutorExterno(int id, bool esAlfabeticamente)
        {
            var capitulo = capituloService.GetCapituloById(id);

            var form = new AutorForm
                           {
                               Controller = "Capitulo",
                               IdName = "CapituloId",
                               InvestigadorExterno = new InvestigadorExternoForm(),
                               AutorSeOrdenaAlfabeticamente = esAlfabeticamente
                           };

            if (capitulo != null)
                form.Id = capitulo.Id;

            return Rjs("NewAutorExterno", form);
        }

        [CustomTransaction]
        [Authorize]
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
        [Authorize]
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

        CapituloForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        CapituloForm SetupNewForm(CapituloForm form)
        {
            form = form ?? new CapituloForm();

            form.LineasTematicas = lineaTematicaMapper.Map(catalogoService.GetActiveLineaTematicas());

            form.TiposCapitulos = customCollection.TipoProductoCustomCollection(2);
            form.EstadosProductos = customCollection.EstadoProductoCustomCollection();
            form.TiposLibro = customCollection.TipoLibroCustomCollection();

            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = GetDisciplinasByAreaId(form.AreaId);
            form.Subdisciplinas = GetSubdisciplinasByDisciplinaId(form.DisciplinaId);

            if (form.Id == 0)
            {
                form.CoautorExternoCapitulos = new CoautorExternoProductoForm[] {};
                form.CoautorInternoCapitulos = new CoautorInternoProductoForm[] {};
                form.AutorInternoCapitulos = new AutorInternoProductoForm[] {};
                form.AutorExternoCapitulos = new AutorExternoProductoForm[] {};

                if (User.IsInRole("Investigadores"))
                {
                    form.UsuarioNombre = CurrentInvestigador().Usuario.Nombre;
                    form.UsuarioApellidoPaterno = CurrentInvestigador().Usuario.ApellidoPaterno;
                    form.UsuarioApellidoMaterno = CurrentInvestigador().Usuario.ApellidoMaterno;
                }
                form.PosicionCoautor = 1;
            }
            else
            {
                form.AreasTematicas =
                    areaTematicaMapper.Map(catalogoService.GetAreaTematicasByLineaTematicaId(form.LineaTematicaId));
            }

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

            ViewData["LineaTematicaId"] = form.LineaTematicaId;
            ViewData["AreaTematicaId"] = form.AreaTematicaId;
        }

        static CapituloForm SetupShowForm(CapituloForm form)
        {
            form = form ?? new CapituloForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      SubdisciplinaNombre = form.SubdisciplinaNombre,
                                      DisciplinaNombre = form.DisciplinaNombre,
                                      AreaNombre = form.AreaNombre,
                                      ProyectoNombre = form.Proyecto.Nombre,
                                      EstadoProducto = form.EstadoProducto,
                                      FechaAceptacion = form.FechaAceptacion,
                                      FechaPublicacion = form.FechaPublicacion,
                                      ModelId = form.Id,
                                      IsShowForm = true
                                  };

            return form;
        }

        protected override void DeleteEditorialInModel(Capitulo model, int editorialId)
        {
            if (model != null)
            {
                var editorial = model.EditorialCapitulos.Where(x => x.Id == editorialId).First();
                model.DeleteEditorial(editorial);

                capituloService.SaveCapitulo(model);
            }
        }

        protected override bool SaveEditorialToModel(Capitulo model, EditorialProducto editorialProducto)
        {
            var editorialId = editorialProducto.Editorial != null ? editorialProducto.Editorial.Id : 0;

            var alreadyHasIt =
                model.EditorialCapitulos.Where(
                    x => ((x.Editorial != null && editorialId > 0 && x.Editorial.Id == editorialId) ||
                          (x.EditorialNombre == editorialProducto.EditorialNombre))
                         && x.Pais.Id == editorialProducto.Pais.Id).Count();

            if (alreadyHasIt == 0)
            {
                model.AddEditorial(editorialProducto);
                capituloService.SaveCapitulo(model, true);
            }

            return alreadyHasIt == 0;
        }

        protected override EditorialProducto MapEditorialMessage(EditorialProductoForm form)
        {
            return editorialCapituloMapper.Map(form);
        }

        protected override EditorialProductoForm MapEditorialModel(EditorialProducto model, int parentId)
        {
            var editorialCapituloForm = editorialCapituloMapper.Map(model as EditorialCapitulo);
            editorialCapituloForm.ParentId = parentId;

            return editorialCapituloForm;
        }

        protected override Capitulo GetModelById(int id)
        {
            return capituloService.GetCapituloById(id);
        }
    }
}