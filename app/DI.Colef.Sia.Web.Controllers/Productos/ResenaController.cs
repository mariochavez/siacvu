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
    [HandleError]
    public class ResenaController : BaseController<Resena, ResenaForm>
    {
        readonly IAreaMapper areaMapper;
        readonly IAutorExternoResenaMapper autorExternoResenaMapper;
        readonly IAutorInternoResenaMapper autorInternoResenaMapper;
        readonly ICoautorExternoResenaMapper coautorExternoResenaMapper;
        readonly ICoautorInternoResenaMapper coautorInternoResenaMapper;
        readonly ICustomCollection customCollection;
        readonly IEditorialProductoMapper<EditorialResena> editorialResenaMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly IInvestigadorService investigadorService;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IProductoService productoService;
        readonly IResenaMapper resenaMapper;
        readonly IResenaService resenaService;
        readonly IRevistaPublicacionMapper revistaPublicacionMapper;

        public ResenaController(IResenaService resenaService,
                                IResenaMapper resenaMapper,
                                IAutorInternoResenaMapper autorInternoResenaMapper,
                                IAreaMapper areaMapper,
                                IDisciplinaMapper disciplinaMapper,
                                ISubdisciplinaMapper subdisciplinaMapper,
                                IAutorExternoResenaMapper autorExternoResenaMapper,
                                IEditorialProductoMapper<EditorialResena> editorialResenaMapper,
                                ICatalogoService catalogoService,
                                IAreaTematicaMapper areaTematicaMapper,
                                IUsuarioService usuarioService,
                                ICustomCollection customCollection,
                                IPaisMapper paisMapper,
                                IArchivoService archivoService,
                                ICoautorExternoResenaMapper coautorExternoResenaMapper,
                                ICoautorInternoResenaMapper coautorInternoResenaMapper,
                                ISearchService searchService,
                                IRevistaPublicacionMapper revistaPublicacionMapper,
                                ILineaTematicaMapper lineaTematicaMapper,
                                IInvestigadorExternoMapper investigadorExternoMapper,
                                IInvestigadorService investigadorService, IProductoService productoService
            ) : base(usuarioService, searchService, catalogoService, disciplinaMapper, subdisciplinaMapper)
        {
            base.paisMapper = paisMapper;

            this.areaTematicaMapper = areaTematicaMapper;
            this.areaMapper = areaMapper;
            this.revistaPublicacionMapper = revistaPublicacionMapper;
            this.resenaService = resenaService;
            this.resenaMapper = resenaMapper;
            this.customCollection = customCollection;
            this.autorInternoResenaMapper = autorInternoResenaMapper;
            this.autorExternoResenaMapper = autorExternoResenaMapper;
            this.editorialResenaMapper = editorialResenaMapper;
            this.coautorExternoResenaMapper = coautorExternoResenaMapper;
            this.coautorInternoResenaMapper = coautorInternoResenaMapper;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.investigadorExternoMapper = investigadorExternoMapper;
            this.investigadorService = investigadorService;
            this.productoService = productoService;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<ResenaForm>();
            var productos = productoService.GetProductosByUsuario<Resena>(CurrentUser(), x => x.NombreProducto,
                                                                          x => x.TipoResena);
            data.ProductList = productos;

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            if (CurrentInvestigador() == null)
                return NoInvestigadorProfile("Por tal motivo no puede crear nuevos productos.");

            var data = new GenericViewData<ResenaForm> {Form = SetupNewForm()};

            return View(data);
        }

        [Authorize(Roles = "Investigadores, DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            CoautorInternoResena coautorInternoResena;
            AutorInternoResena autorInternoResena;
            int posicionCoautor = 0;
            var coautorExists = 0;
            int posicionAutor = 0;
            var autorExists = 0;
            var data = new GenericViewData<ResenaForm>();

            var resena = resenaService.GetResenaById(id);

            var verifyMessage = VerifyProductoStatus(resena.Firma, resena.NombreProducto);
            if (!String.IsNullOrEmpty(verifyMessage))
                return RedirectToHomeIndex(verifyMessage);

            if (User.IsInRole("Investigadores"))
            {
                coautorExists =
                    resena.CoautorInternoResenas.Where(
                        x => x.Investigador.Id == CurrentInvestigador().Id).Count();

                autorExists =
                    resena.AutorInternoResenas.Where(
                        x => x.Investigador.Id == CurrentInvestigador().Id).Count();

                if (resena.Usuario.Id != CurrentUser().Id && coautorExists == 0)
                    return RedirectToHomeIndex("no lo puede modificar");
            }

            var resenaForm = resenaMapper.Map(resena);
            if (resena.AreaTematica != null)
                resenaForm.LineaTematicaId = resena.AreaTematica.LineaTematica.Id;

            data.Form = SetupNewForm(resenaForm);

            FormSetCombos(data.Form);

            if (coautorExists != 0)
            {
                coautorInternoResena =
                    resena.CoautorInternoResenas.Where(x => x.Investigador.Id == CurrentInvestigador().Id).
                        FirstOrDefault();

                if (coautorInternoResena != null) posicionCoautor = coautorInternoResena.Posicion;
            }
            else
                posicionCoautor = data.Form.PosicionCoautor;

            if (autorExists != 0)
            {
                autorInternoResena =
                    resena.AutorInternoResenas.Where(x => x.Investigador.Id == CurrentInvestigador().Id).
                        FirstOrDefault();

                if (autorInternoResena != null) posicionAutor = autorInternoResena.Posicion;
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
            var data = new GenericViewData<ResenaForm>();

            var resena = resenaService.GetResenaById(id);

            var resenaForm = resenaMapper.Map(resena);
            data.Form = SetupShowForm(resenaForm);

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
                                   ResenaForm form)
        {
            coautorExterno = coautorExterno ?? new CoautorExternoProductoForm[] {};
            coautorInterno = coautorInterno ?? new CoautorInternoProductoForm[] {};
            autorExterno = autorExterno ?? new AutorExternoProductoForm[] {};
            autorInterno = autorInterno ?? new AutorInternoProductoForm[] {};
            editorial = editorial ?? new EditorialProductoForm[] {};

            var resena = resenaMapper.Map(form, CurrentUser(), CurrentInvestigador(),
                                          coautorExterno, coautorInterno, autorExterno, autorInterno, editorial);

            ModelState.AddModelErrors(resena.ValidationResults(), true, "Resena");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            resenaService.SaveResena(resena);
            SetMessage(String.Format("Reseña {0} ha sido creada", resena.NombreProducto));

            return Rjs("Save", resena.Id);
        }

        [Authorize]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ResenaForm form)
        {
            var resena = new Resena();

            if (User.IsInRole("Investigadores"))
                resena = resenaMapper.Map(form, CurrentUser(), CurrentInvestigador());
            if (User.IsInRole("DGAA"))
                resena = resenaMapper.Map(form, CurrentUser());

            ModelState.AddModelErrors(resena.ValidationResults(), true, "Resena");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            resenaService.SaveResena(resena, true);
            SetMessage(String.Format("Reseña {0} ha sido modificada", resena.NombreProducto));

            return Rjs("Save", resena.Id);
        }

        [CookieLessAuthorize]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddFile(FormCollection form)
        {
            var id = Convert.ToInt32(form["Id"]);
            var resena = resenaService.GetResenaById(id);

            var archivo = MapArchivo<ArchivoResena>();
            resena.AddArchivo(archivo);

            resenaService.SaveResena(resena);

            return Content("Uploaded");
        }

        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DgaaValidateProduct(FirmaForm firmaForm)
        {
            var resena = resenaService.GetResenaById(firmaForm.ProductoId);

            resena.Firma.Aceptacion2 = 1;
            resena.Firma.Usuario2 = CurrentUser();

            resenaService.SaveResena(resena);

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
            var resena = resenaService.GetResenaById(firmaForm.ProductoId);
            resena.Firma.Aceptacion1 = 0;
            resena.Firma.Aceptacion2 = 2;
            resena.Firma.Descripcion = firmaForm.Descripcion;
            resena.Firma.Usuario1 = CurrentUser();
            resena.Firma.Usuario2 = CurrentUser();

            ModelState.AddModelErrors(resena.ValidationResults(), false, "Firma");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            resenaService.SaveResena(resena, true);

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
            var data = searchService.Search<Resena>(x => x.NombreProducto, q);
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

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeAreaTematica(int select)
        {
            // TODO: Dependencias
            return Rjs("", null);
            //var areaTematicaForm = areaTematicaMapper.Map(catalogoService.GetAreaTematicaById(select));
            //var lineaTematicaForm = lineaTematicaMapper.Map(catalogoService.GetLineaTematicaById(areaTematicaForm.LineaTematicaId));

            //var form = new ShowFieldsForm
            //{
            //    AreaTematicaLineaTematicaNombre = lineaTematicaForm.Nombre,
            //    AreaTematicaId = areaTematicaForm.Id
            //};

            //return Rjs("ChangeAreaTematica", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorInterno(int id, bool esAlfabeticamente)
        {
            var resena = resenaService.GetResenaById(id);
            var form = new CoautorForm
                           {
                               Controller = "Resena",
                               IdName = "ResenaId",
                               CoautorSeOrdenaAlfabeticamente = esAlfabeticamente
                           };

            if (User.IsInRole("Investigadores"))
                form.CreadoPorId = CurrentInvestigador().Id;

            if (resena != null)
            {
                form.Id = resena.Id;
                var investigador = investigadorService.GetInvestigadorByUsuario(resena.CreadoPor.UsuarioNombre);
                form.CreadoPorId = investigador.Id;
            }

            return Rjs("NewCoautorInterno", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorInterno([Bind(Prefix = "CoautorInterno")] CoautorInternoProductoForm form,
                                              int resenaId)
        {
            var coautorInternoResena = coautorInternoResenaMapper.Map(form);

            ModelState.AddModelErrors(coautorInternoResena.ValidationResults(), false, "CoautorInterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            coautorInternoResena.CreadoPor = CurrentUser();
            coautorInternoResena.ModificadoPor = CurrentUser();

            if (resenaId != 0)
            {
                var resena = resenaService.GetResenaById(resenaId);

                var alreadyHasIt =
                    resena.CoautorInternoResenas.Where(
                        x => x.Investigador.Id == coautorInternoResena.Investigador.Id).Count();

                if (alreadyHasIt == 0)
                {
                    resena.AddCoautorInterno(coautorInternoResena);
                    resenaService.SaveResena(resena);
                }
            }

            var coautorInternoResenaForm = coautorInternoResenaMapper.Map(coautorInternoResena);
            coautorInternoResenaForm.ParentId = resenaId;

            return Rjs("AddCoautorInterno", coautorInternoResenaForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteCoautorInterno(int id, int investigadorId)
        {
            var resena = resenaService.GetResenaById(id);

            if (resena != null)
            {
                var coautor = resena.CoautorInternoResenas.Where(x => x.Investigador.Id == investigadorId).First();
                resena.DeleteCoautorInterno(coautor);

                resenaService.SaveResena(resena);
            }

            var form = new CoautorForm {ModelId = id, InvestigadorId = investigadorId};

            return Rjs("DeleteCoautorInterno", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id, bool esAlfabeticamente)
        {
            var resena = resenaService.GetResenaById(id);
            var form = new CoautorForm
                           {
                               Controller = "Resena",
                               IdName = "ResenaId",
                               InvestigadorExterno = new InvestigadorExternoForm(),
                               CoautorSeOrdenaAlfabeticamente = esAlfabeticamente
                           };

            if (resena != null)
                form.Id = resena.Id;

            return Rjs("NewCoautorExterno", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorExterno([Bind(Prefix = "CoautorExterno")] CoautorExternoProductoForm form,
                                              int resenaId)
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
            var coautorExternoResena = coautorExternoResenaMapper.Map(form);

            ModelState.AddModelErrors(coautorExternoResena.ValidationResults(), false, "CoautorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (resenaId != 0)
            {
                coautorExternoResena.CreadoPor = CurrentUser();
                coautorExternoResena.ModificadoPor = CurrentUser();

                var resena = resenaService.GetResenaById(resenaId);

                var alreadyHasIt =
                    resena.CoautorExternoResenas.Where(
                        x => x.InvestigadorExterno.Id == coautorExternoResena.InvestigadorExterno.Id).Count();

                if (alreadyHasIt == 0)
                {
                    resena.AddCoautorExterno(coautorExternoResena);
                    resenaService.SaveResena(resena);
                }
            }

            var coautorExternoResenaForm = coautorExternoResenaMapper.Map(coautorExternoResena);
            coautorExternoResenaForm.ParentId = resenaId;

            return Rjs("AddCoautorExterno", coautorExternoResenaForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteCoautorExterno(int id, int investigadorExternoId)
        {
            var resena = resenaService.GetResenaById(id);

            if (resena != null)
            {
                var coautor =
                    resena.CoautorExternoResenas.Where(x => x.InvestigadorExterno.Id == investigadorExternoId).First();
                resena.DeleteCoautorExterno(coautor);

                resenaService.SaveResena(resena);
            }

            var form = new CoautorForm {ModelId = id, InvestigadorExternoId = investigadorExternoId};

            return Rjs("DeleteCoautorExterno", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewAutorInterno(int id, bool esAlfabeticamente)
        {
            var resena = resenaService.GetResenaById(id);
            var form = new AutorForm
                           {
                               Controller = "Resena",
                               IdName = "ResenaId",
                               AutorSeOrdenaAlfabeticamente = esAlfabeticamente
                           };

            if (resena != null)
                form.Id = resena.Id;

            return Rjs("NewAutorInterno", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddAutorInterno(
            [Bind(Prefix = "AutorInterno")] AutorInternoProductoForm form, int resenaId)
        {
            var autorInternoResena = autorInternoResenaMapper.Map(form);

            ModelState.AddModelErrors(autorInternoResena.ValidationResults(), false, "AutorInterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (resenaId != 0)
            {
                autorInternoResena.CreadoPor = CurrentUser();
                autorInternoResena.ModificadoPor = CurrentUser();

                var resena = resenaService.GetResenaById(resenaId);

                var alreadyHasIt =
                    resena.AutorInternoResenas.Where(
                        x => x.Investigador.Id == autorInternoResena.Investigador.Id).Count();

                if (alreadyHasIt == 0)
                {
                    resena.AddAutorInterno(autorInternoResena);
                    resenaService.SaveResena(resena);
                }
            }

            var autorInternoResenaForm = autorInternoResenaMapper.Map(autorInternoResena);
            autorInternoResenaForm.ParentId = resenaId;

            return Rjs("AddAutorInterno", autorInternoResenaForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteAutorInterno(int id, int investigadorId)
        {
            var resena = resenaService.GetResenaById(id);

            if (resena != null)
            {
                var autor = resena.AutorInternoResenas.Where(x => x.Investigador.Id == investigadorId).First();
                resena.DeleteAutorInterno(autor);

                resenaService.SaveResena(resena);
            }

            var form = new AutorForm {ModelId = id, InvestigadorId = investigadorId};

            return Rjs("DeleteAutorInterno", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewAutorExterno(int id, bool esAlfabeticamente)
        {
            var resena = resenaService.GetResenaById(id);

            var form = new AutorForm
                           {
                               Controller = "Resena",
                               IdName = "ResenaId",
                               InvestigadorExterno = new InvestigadorExternoForm(),
                               AutorSeOrdenaAlfabeticamente = esAlfabeticamente
                           };

            if (resena != null)
                form.Id = resena.Id;

            return Rjs("NewAutorExterno", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddAutorExterno(
            [Bind(Prefix = "AutorExterno")] AutorExternoProductoForm form, int resenaId)
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
            var autorExternoResena = autorExternoResenaMapper.Map(form);

            ModelState.AddModelErrors(autorExternoResena.ValidationResults(), false, "AutorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (resenaId != 0)
            {
                autorExternoResena.CreadoPor = CurrentUser();
                autorExternoResena.ModificadoPor = CurrentUser();

                var resena = resenaService.GetResenaById(resenaId);

                var alreadyHasIt =
                    resena.AutorExternoResenas.Where(
                        x => x.InvestigadorExterno.Id == autorExternoResena.InvestigadorExterno.Id).Count();

                if (alreadyHasIt == 0)
                {
                    resena.AddAutorExterno(autorExternoResena);
                    resenaService.SaveResena(resena);
                }
            }

            var autorExternoResenaForm = autorExternoResenaMapper.Map(autorExternoResena);
            autorExternoResenaForm.ParentId = resenaId;

            return Rjs("AddAutorExterno", autorExternoResenaForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteAutorExterno(int id, int investigadorExternoId)
        {
            var resena = resenaService.GetResenaById(id);

            if (resena != null)
            {
                var autor =
                    resena.AutorExternoResenas.Where(x => x.InvestigadorExterno.Id == investigadorExternoId).First();
                resena.DeleteAutorExterno(autor);

                resenaService.SaveResena(resena);
            }

            var form = new AutorForm {ModelId = id, InvestigadorExternoId = investigadorExternoId};

            return Rjs("DeleteAutorExterno", form);
        }

        ResenaForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        ResenaForm SetupNewForm(ResenaForm form)
        {
            form = form ?? new ResenaForm();

            form.LineasTematicas = lineaTematicaMapper.Map(catalogoService.GetActiveLineaTematicas());

            form.TiposResenas = customCollection.TipoResenaCustomCollection();
            form.EstadosProductos = customCollection.EstadoProductoCustomCollection();
            form.Paises = paisMapper.Map(catalogoService.GetActivePaises());

            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = GetDisciplinasByAreaId(form.AreaId);
            form.Subdisciplinas = GetSubdisciplinasByDisciplinaId(form.DisciplinaId);

            if (form.Id == 0)
            {
                form.CoautorExternoResenas = new CoautorExternoProductoForm[] {};
                form.CoautorInternoResenas = new CoautorInternoProductoForm[] {};
                form.AutorInternoResenas = new AutorInternoProductoForm[] {};
                form.AutorExternoResenas = new AutorExternoProductoForm[] {};

                if (User.IsInRole("Investigadores"))
                {
                    form.UsuarioNombre = CurrentInvestigador().Usuario.Nombre;
                    form.UsuarioApellidoPaterno = CurrentInvestigador().Usuario.ApellidoPaterno;
                    form.UsuarioApellidoMaterno = CurrentInvestigador().Usuario.ApellidoMaterno;
                }

                ViewData["Pais"] = (from p in form.Paises where p.Nombre == "México" select p.Id).FirstOrDefault();
                form.PosicionCoautor = 1;
            }
            else
            {
                form.AreasTematicas =
                    areaTematicaMapper.Map(catalogoService.GetAreaTematicasByLineaTematicaId(form.LineaTematicaId));
            }

            return form;
        }

        void FormSetCombos(ResenaForm form)
        {
            ViewData["TipoResena"] = form.TipoResena;
            ViewData["EstadoProducto"] = form.EstadoProducto;
            ViewData["Pais"] = form.PaisId;

            ViewData["AreaId"] = form.AreaId;
            ViewData["DisciplinaId"] = form.DisciplinaId;
            ViewData["SubdisciplinaId"] = form.SubdisciplinaId;

            ViewData["LineaTematicaId"] = form.LineaTematicaId;
            ViewData["AreaTematicaId"] = form.AreaTematicaId;
        }

        static ResenaForm SetupShowForm(ResenaForm form)
        {
            form = form ?? new ResenaForm();

            form.ShowFields = new ShowFieldsForm
                                  {
                                      RevistaPublicacionTitulo = form.RevistaPublicacion.Titulo,
                                      RevistaPublicacionInstitucionNombre = form.RevistaPublicacion.InstitucionNombre,
                                      RevistaPublicacionIndice1Nombre = form.RevistaPublicacion.Indice1Nombre,
                                      RevistaPublicacionIndice2Nombre = form.RevistaPublicacion.Indice2Nombre,
                                      RevistaPublicacionIndice3Nombre = form.RevistaPublicacion.Indice3Nombre,
                                      AreaTematicaNombre = form.AreaTematica.Nombre,
                                      AreaTematicaLineaTematicaNombre = form.AreaTematica.LineaTematicaNombre,
                                      SubdisciplinaNombre = form.SubdisciplinaNombre,
                                      DisciplinaNombre = form.DisciplinaNombre,
                                      AreaNombre = form.AreaNombre,
                                      EstadoProducto = form.EstadoProducto,
                                      FechaAceptacion = form.FechaAceptacion,
                                      FechaPublicacion = form.FechaPublicacion,
                                      ModelId = form.Id,
                                      PalabraClave1 = form.PalabraClave1,
                                      PalabraClave2 = form.PalabraClave2,
                                      PalabraClave3 = form.PalabraClave3,
                                      IsShowForm = true,
                                      RevistaLabel = "Revista en que se publica"
                                  };

            return form;
        }

        protected override void DeleteEditorialInModel(Resena model, int editorialId)
        {
            if (model != null)
            {
                var editorial = model.EditorialResenas.Where(x => x.Id == editorialId).First();
                model.DeleteEditorial(editorial);

                resenaService.SaveResena(model);
            }
        }

        protected override bool SaveEditorialToModel(Resena model, EditorialProducto editorialProducto)
        {
            var editorialId = editorialProducto.Editorial != null ? editorialProducto.Editorial.Id : 0;

            var alreadyHasIt =
                model.EditorialResenas.Where(
                    x => ((x.Editorial != null && editorialId > 0 && x.Editorial.Id == editorialId) ||
                          (x.EditorialNombre == editorialProducto.EditorialNombre))
                         && x.Pais.Id == editorialProducto.Pais.Id).Count();

            if (alreadyHasIt == 0)
            {
                model.AddEditorial(editorialProducto);
                resenaService.SaveResena(model, true);
            }

            return alreadyHasIt == 0;
        }

        protected override EditorialProducto MapEditorialMessage(EditorialProductoForm form)
        {
            return editorialResenaMapper.Map(form);
        }

        protected override EditorialProductoForm MapEditorialModel(EditorialProducto model, int parentId)
        {
            var editorialResenaForm = editorialResenaMapper.Map(model as EditorialResena);
            editorialResenaForm.ParentId = parentId;

            return editorialResenaForm;
        }

        protected override Resena GetModelById(int id)
        {
            return resenaService.GetResenaById(id);
        }
    }
}