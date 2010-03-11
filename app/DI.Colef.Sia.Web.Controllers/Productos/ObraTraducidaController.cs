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
    public class ObraTraducidaController : BaseController<ObraTraducida, ObraTraducidaForm>
    {
		readonly IObraTraducidaService obraTraducidaService;
        readonly IObraTraducidaMapper obraTraducidaMapper;
        readonly IIdiomaMapper idiomaMapper;
        readonly IArchivoService archivoService;
        readonly IRevistaPublicacionMapper revistaPublicacionMapper;
        readonly IAutorExternoObraTraducidaMapper autorExternoObraTraducidaMapper;
        readonly IAutorInternoObraTraducidaMapper autorInternoObraTraducidaMapper;
        readonly ICoautorExternoObraTraducidaMapper coautorExternoObraTraducidaMapper;
        readonly ICoautorInternoObraTraducidaMapper coautorInternoObraTraducidaMapper;
        readonly ICustomCollection customCollection;
        readonly IEditorialProductoMapper<EditorialObraTraducida> editorialObraTraducidaMapper;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        readonly IInvestigadorService investigadorService;
        readonly IPaisMapper paisMapper;
    
        public ObraTraducidaController(IObraTraducidaService obraTraducidaService, 
			                        IObraTraducidaMapper obraTraducidaMapper,
			                        ICatalogoService catalogoService,
                                    IUsuarioService usuarioService,
                                    ISearchService searchService,
                                    IArchivoService archivoService,
			                        IIdiomaMapper idiomaMapper,
                                    IAreaTematicaMapper areaTematicaMapper,
                                    IRevistaPublicacionMapper revistaPublicacionMapper,
                                    ICoautorExternoObraTraducidaMapper coautorExternoObraTraducidaMapper,
                                    ICoautorInternoObraTraducidaMapper coautorInternoObraTraducidaMapper,
                                    IAutorExternoObraTraducidaMapper autorExternoObraTraducidaMapper,
                                    IAutorInternoObraTraducidaMapper autorInternoObraTraducidaMapper,
                                    ICustomCollection customCollection,
                                    ILineaTematicaMapper lineaTematicaMapper,
                                    IEditorialProductoMapper<EditorialObraTraducida> editorialObraTraducidaMapper,
                                    IInvestigadorExternoMapper investigadorExternoMapper,
                                    IInvestigadorService investigadorService,
                                    IPaisMapper paisMapper
            ) : base(usuarioService, searchService, catalogoService)
        {
			base.catalogoService = catalogoService;
            base.paisMapper = paisMapper;

            this.archivoService = archivoService;
            this.obraTraducidaService = obraTraducidaService;
            this.obraTraducidaMapper = obraTraducidaMapper;
			this.idiomaMapper = idiomaMapper;
            this.areaTematicaMapper = areaTematicaMapper;
            this.revistaPublicacionMapper = revistaPublicacionMapper;
            this.coautorExternoObraTraducidaMapper = coautorExternoObraTraducidaMapper;
            this.coautorInternoObraTraducidaMapper = coautorInternoObraTraducidaMapper;
            this.autorExternoObraTraducidaMapper = autorExternoObraTraducidaMapper;
            this.autorInternoObraTraducidaMapper = autorInternoObraTraducidaMapper;
            this.areaTematicaMapper = areaTematicaMapper;
            this.customCollection = customCollection;
            this.lineaTematicaMapper = lineaTematicaMapper;
            this.editorialObraTraducidaMapper = editorialObraTraducidaMapper;
            this.investigadorExternoMapper = investigadorExternoMapper;
            this.investigadorService = investigadorService;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index() 
        {
            var data = new GenericViewData<ObraTraducidaForm>();
            var obrasTraducidas = new ObraTraducida[] { };

            if (User.IsInRole("Investigadores"))
                obrasTraducidas = obraTraducidaService.GetAllObraTraducidas(CurrentUser());
            if (User.IsInRole("DGAA"))
                obrasTraducidas = obraTraducidaService.GetAllObraTraducidas();

            data.List = obraTraducidaMapper.Map(obrasTraducidas);

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            if (CurrentInvestigador() == null)
                return NoInvestigadorProfile("Por tal motivo no puede crear nuevos productos.");

            var data = new GenericViewData<ObraTraducidaForm> { Form = SetupNewForm() };

            ViewData["Idioma"] = (from e in data.Form.Idiomas where e.Nombre == "Español" select e.Id).FirstOrDefault();
            ViewData["Edicion"] = (from e in data.Form.Ediciones where e.Nombre == "Primera edición" select e.Id).FirstOrDefault();

            return View(data);
        }

        [Authorize(Roles = "Investigadores, DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<ObraTraducidaForm>();
            var obraTraducida = obraTraducidaService.GetObraTraducidaById(id);

            var verifyMessage = VerifyProductoStatus(obraTraducida.Firma, obraTraducida.Nombre);
            if (!String.IsNullOrEmpty(verifyMessage))
                return RedirectToHomeIndex(verifyMessage);

            CoautorInternoObraTraducida coautorInternoObraTraducida;
            AutorInternoObraTraducida autorInternoObraTraducida;
            int posicionCoautor;
            int posicionAutor;
            var coautorExists = 0;
            var autorExists = 0;

            if (User.IsInRole("Investigadores"))
            {
                coautorExists =
                    obraTraducida.CoautorInternoObraTraducidas.Where(
                        x => x.Investigador.Id == CurrentInvestigador().Id).Count();

                autorExists =
                    obraTraducida.AutorInternoObraTraducidas.Where(
                        x => x.Investigador.Id == CurrentInvestigador().Id).Count();

                if (obraTraducida.Usuario.Id != CurrentUser().Id && coautorExists == 0)
                    return RedirectToHomeIndex("no lo puede modificar");
            }

            var obraTraducidaForm = obraTraducidaMapper.Map(obraTraducida);
            if (obraTraducida.AreaTematica != null)
                obraTraducidaForm.LineaTematicaId = obraTraducida.AreaTematica.LineaTematica.Id;

            data.Form = SetupNewForm(obraTraducidaForm);
            FormSetCombos(data.Form);

            if (coautorExists != 0)
            {
                coautorInternoObraTraducida =
                    obraTraducida.CoautorInternoObraTraducidas.Where(x => x.Investigador.Id == CurrentInvestigador().Id).
                        FirstOrDefault();

                posicionCoautor = coautorInternoObraTraducida.Posicion;
            }
            else
                posicionCoautor = data.Form.PosicionCoautor;

            if (autorExists != 0)
            {
                autorInternoObraTraducida =
                    obraTraducida.AutorInternoObraTraducidas.Where(x => x.Investigador.Id == CurrentInvestigador().Id).
                        FirstOrDefault();

                posicionAutor = autorInternoObraTraducida.Posicion;
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
            var data = new GenericViewData<ObraTraducidaForm>();

            var obraTraducida = obraTraducidaService.GetObraTraducidaById(id);
            var obraTraducidaForm = obraTraducidaMapper.Map(obraTraducida);
            
            data.Form = SetupShowForm(obraTraducidaForm);
            
            ViewData.Model = data;
            return View();
        }

        [Authorize(Roles = "Investigadores")]
        [CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create([Bind(Prefix = "CoautorInterno")] CoautorInternoProductoForm[] coautorInterno,
                                   [Bind(Prefix = "CoautorExterno")] CoautorExternoProductoForm[] coautorExterno,
                                   [Bind(Prefix = "AutorExterno")] AutorExternoProductoForm[] autorExterno,
                                   [Bind(Prefix = "AutorInterno")] AutorInternoProductoForm[] autorInterno,
                                   [Bind(Prefix = "Editorial")] EditorialProductoForm[] editorial,
                                   ObraTraducidaForm form)
        {
            coautorExterno = coautorExterno ?? new CoautorExternoProductoForm[] { };
            coautorInterno = coautorInterno ?? new CoautorInternoProductoForm[] { };
            autorExterno = autorExterno ?? new AutorExternoProductoForm[] { };
            autorInterno = autorInterno ?? new AutorInternoProductoForm[] { };
            editorial = editorial ?? new EditorialProductoForm[] { };

            var obraTraducida = obraTraducidaMapper.Map(form, CurrentUser(), CurrentInvestigador(),
                                              coautorExterno, coautorInterno, autorExterno, autorInterno, editorial);

            ModelState.AddModelErrors(obraTraducida.ValidationResults(), true, "ObraTraducida");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            obraTraducidaService.SaveObraTraducida(obraTraducida);
            SetMessage(String.Format("Obra traducida {0} ha sido creada", obraTraducida.Nombre));

            return Rjs("Save", obraTraducida.Id);
        }

        [Authorize]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ObraTraducidaForm form)
        {
            var obraTraducida = new ObraTraducida();

            if (User.IsInRole("Investigadores"))
                obraTraducida = obraTraducidaMapper.Map(form, CurrentUser(), CurrentInvestigador());
            if (User.IsInRole("DGAA"))
                obraTraducida = obraTraducidaMapper.Map(form, CurrentUser());

            ModelState.AddModelErrors(obraTraducida.ValidationResults(), true, "ObraTraducida");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }
            
            obraTraducidaService.SaveObraTraducida(obraTraducida, true);
            SetMessage(String.Format("Obra traducida {0} ha sido modificada", obraTraducida.Nombre));

            return Rjs("Save", obraTraducida.Id);
        }

        [CookieLessAuthorize]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddFile(FormCollection form)
        {
            var id = Convert.ToInt32(form["Id"]);
            var obraTraducida = obraTraducidaService.GetObraTraducidaById(id);

            var archivo = MapArchivo();

            if (form["TipoArchivo"] == "Aceptado")
            {
                archivo.TipoProducto = obraTraducida.TipoProducto;
                archivoService.Save(archivo);
                obraTraducida.ComprobanteAceptado = archivo;
            }
            else if (form["TipoArchivo"] == "ComprobanteObraTraducida")
            {
                archivo.TipoProducto = obraTraducida.TipoProducto;
                archivoService.Save(archivo);
                obraTraducida.ComprobanteObraTraducida = archivo;
            }

            obraTraducidaService.SaveObraTraducida(obraTraducida);

            return Content("Uploaded");
        }

        [CustomTransaction]
        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DgaaValidateProduct(FirmaForm firmaForm)
        {

            var obraTraducida = obraTraducidaService.GetObraTraducidaById(firmaForm.ProductoId);

            obraTraducida.Firma.Aceptacion2 = 1;
            obraTraducida.Firma.Usuario2 = CurrentUser();

            obraTraducidaService.SaveObraTraducida(obraTraducida);

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

            var obraTraducida = obraTraducidaService.GetObraTraducidaById(firmaForm.ProductoId);
            obraTraducida.Firma.Aceptacion1 = 0;
            obraTraducida.Firma.Aceptacion2 = 2;
            obraTraducida.Firma.Descripcion = firmaForm.Descripcion;
            obraTraducida.Firma.Usuario1 = CurrentUser();
            obraTraducida.Firma.Usuario2 = CurrentUser();

            ModelState.AddModelErrors(obraTraducida.ValidationResults(), false, "Firma");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            obraTraducidaService.SaveObraTraducida(obraTraducida, true);

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
            var data = searchService.Search<ObraTraducida>(x => x.Nombre, q);
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
        public ActionResult NewCoautorInterno(int id, bool esAlfabeticamente)
        {
            var obraTraducida = obraTraducidaService.GetObraTraducidaById(id);
            var form = new CoautorForm
                           {
                               Controller = "ObraTraducida", 
                               IdName = "ObraTraducidaId",
                               CoautorSeOrdenaAlfabeticamente = esAlfabeticamente
                           };

            if (User.IsInRole("Investigadores"))
                form.CreadoPorId = CurrentInvestigador().Id;

            if (obraTraducida != null)
            {
                form.Id = obraTraducida.Id;
                var investigador = investigadorService.GetInvestigadorByUsuario(obraTraducida.CreadoPor.UsuarioNombre);
                form.CreadoPorId = investigador.Id;
            }

            return Rjs("NewCoautorInterno", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorInterno([Bind(Prefix = "CoautorInterno")] CoautorInternoProductoForm form,
                                              int obraTraducidaId)
        {
            var coautorInternoObraTraducida = coautorInternoObraTraducidaMapper.Map(form);

            ModelState.AddModelErrors(coautorInternoObraTraducida.ValidationResults(), false, "CoautorInterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (obraTraducidaId != 0)
            {
                coautorInternoObraTraducida.CreadoPor = CurrentUser();
                coautorInternoObraTraducida.ModificadoPor = CurrentUser();

                var obraTraducida = obraTraducidaService.GetObraTraducidaById(obraTraducidaId);

                var alreadyHasIt =
                    obraTraducida.CoautorInternoObraTraducidas.Where(
                        x => x.Investigador.Id == coautorInternoObraTraducida.Investigador.Id).Count();

                if (alreadyHasIt == 0)
                {
                    obraTraducida.AddCoautorInterno(coautorInternoObraTraducida);

                    obraTraducidaService.SaveObraTraducida(obraTraducida);
                }
            }

            var coautorInternoObraTraducidaForm = coautorInternoObraTraducidaMapper.Map(coautorInternoObraTraducida);
            coautorInternoObraTraducidaForm.ParentId = obraTraducidaId;

            return Rjs("AddCoautorInterno", coautorInternoObraTraducidaForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteCoautorInterno(int id, int investigadorId)
        {
            var obraTraducida = obraTraducidaService.GetObraTraducidaById(id);

            if (obraTraducida != null)
            {
                var coautor = obraTraducida.CoautorInternoObraTraducidas.Where(x => x.Investigador.Id == investigadorId).First();
                obraTraducida.DeleteCoautorInterno(coautor);

                obraTraducidaService.SaveObraTraducida(obraTraducida);
            }

            var form = new CoautorForm { ModelId = id, InvestigadorId = investigadorId };

            return Rjs("DeleteCoautorInterno", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id, bool esAlfabeticamente)
        {
            var obraTraducida = obraTraducidaService.GetObraTraducidaById(id);
            var form = new CoautorForm
                           {
                               Controller = "ObraTraducida", 
                               IdName = "ObraTraducidaId", 
                               InvestigadorExterno = new InvestigadorExternoForm(),
                               CoautorSeOrdenaAlfabeticamente = esAlfabeticamente
                           };

            if (obraTraducida != null)
                form.Id = obraTraducida.Id;

            return Rjs("NewCoautorExterno", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddCoautorExterno([Bind(Prefix = "CoautorExterno")] CoautorExternoProductoForm form,
                                              int obraTraducidaId)
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
            var coautorExternoObraTraducida = coautorExternoObraTraducidaMapper.Map(form);

            ModelState.AddModelErrors(coautorExternoObraTraducida.ValidationResults(), false, "CoautorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (obraTraducidaId != 0)
            {
                coautorExternoObraTraducida.CreadoPor = CurrentUser();
                coautorExternoObraTraducida.ModificadoPor = CurrentUser();

                var obraTraducida = obraTraducidaService.GetObraTraducidaById(obraTraducidaId);

                var alreadyHasIt =
                    obraTraducida.CoautorExternoObraTraducidas.Where(
                        x => x.InvestigadorExterno.Id == coautorExternoObraTraducida.InvestigadorExterno.Id).Count();

                if (alreadyHasIt == 0)
                {
                    obraTraducida.AddCoautorExterno(coautorExternoObraTraducida);
                    obraTraducidaService.SaveObraTraducida(obraTraducida);
                }
            }

            var coautorExternoObraTraducidaForm = coautorExternoObraTraducidaMapper.Map(coautorExternoObraTraducida);
            coautorExternoObraTraducidaForm.ParentId = obraTraducidaId;

            return Rjs("AddCoautorExterno", coautorExternoObraTraducidaForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteCoautorExterno(int id, int investigadorExternoId)
        {
            var obraTraducida = obraTraducidaService.GetObraTraducidaById(id);

            if (obraTraducida != null)
            {
                var coautor =
                    obraTraducida.CoautorExternoObraTraducidas.Where(x => x.InvestigadorExterno.Id == investigadorExternoId).First
                        ();
                obraTraducida.DeleteCoautorExterno(coautor);

                obraTraducidaService.SaveObraTraducida(obraTraducida);
            }

            var form = new CoautorForm { ModelId = id, InvestigadorExternoId = investigadorExternoId };

            return Rjs("DeleteCoautorExterno", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewAutorInterno(int id, bool esAlfabeticamente)
        {
            var obraTraducida = obraTraducidaService.GetObraTraducidaById(id);
            var form = new AutorForm
                           {
                               Controller = "ObraTraducida", 
                               IdName = "ObraTraducidaId",
                               AutorSeOrdenaAlfabeticamente = esAlfabeticamente
                           };

            if (obraTraducida != null)
                form.Id = obraTraducida.Id;

            return Rjs("NewAutorInterno", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddAutorInterno(
            [Bind(Prefix = "AutorInterno")] AutorInternoProductoForm form, int obraTraducidaId)
        {
            var autorInternoObraTraducida = autorInternoObraTraducidaMapper.Map(form);

            ModelState.AddModelErrors(autorInternoObraTraducida.ValidationResults(), false, "AutorInterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (obraTraducidaId != 0)
            {
                autorInternoObraTraducida.CreadoPor = CurrentUser();
                autorInternoObraTraducida.ModificadoPor = CurrentUser();

                var obraTraducida = obraTraducidaService.GetObraTraducidaById(obraTraducidaId);

                var alreadyHasIt =
                    obraTraducida.AutorInternoObraTraducidas.Where(
                        x => x.Investigador.Id == autorInternoObraTraducida.Investigador.Id).Count();

                if (alreadyHasIt == 0)
                {
                    obraTraducida.AddAutorInterno(autorInternoObraTraducida);
                    obraTraducidaService.SaveObraTraducida(obraTraducida);
                }
            }

            var autorInternoObraTraducidaForm = autorInternoObraTraducidaMapper.Map(autorInternoObraTraducida);
            autorInternoObraTraducidaForm.ParentId = obraTraducidaId;

            return Rjs("AddAutorInterno", autorInternoObraTraducidaForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteAutorInterno(int id, int investigadorId)
        {
            var obraTraducida = obraTraducidaService.GetObraTraducidaById(id);

            if (obraTraducida != null)
            {
                var autor = obraTraducida.AutorInternoObraTraducidas.Where(x => x.Investigador.Id == investigadorId).First();
                obraTraducida.DeleteAutorInterno(autor);

                obraTraducidaService.SaveObraTraducida(obraTraducida);
            }

            var form = new AutorForm { ModelId = id, InvestigadorId = investigadorId };

            return Rjs("DeleteAutorInterno", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewAutorExterno(int id, bool esAlfabeticamente)
        {
            var obraTraducida = obraTraducidaService.GetObraTraducidaById(id);

            var form = new AutorForm
                           {
                               Controller = "ObraTraducida", 
                               IdName = "ObraTraducidaId", 
                               InvestigadorExterno = new InvestigadorExternoForm(),
                               AutorSeOrdenaAlfabeticamente = esAlfabeticamente
                           };

            if (obraTraducida != null)
                form.Id = obraTraducida.Id;

            return Rjs("NewAutorExterno", form);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddAutorExterno(
            [Bind(Prefix = "AutorExterno")] AutorExternoProductoForm form, int obraTraducidaId)
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
            var autorExternoObraTraducida = autorExternoObraTraducidaMapper.Map(form);

            ModelState.AddModelErrors(autorExternoObraTraducida.ValidationResults(), false, "AutorExterno", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (obraTraducidaId != 0)
            {
                autorExternoObraTraducida.CreadoPor = CurrentUser();
                autorExternoObraTraducida.ModificadoPor = CurrentUser();

                var obraTraducida = obraTraducidaService.GetObraTraducidaById(obraTraducidaId);

                var alreadyHasIt =
                    obraTraducida.AutorExternoObraTraducidas.Where(
                        x => x.InvestigadorExterno.Id == autorExternoObraTraducida.InvestigadorExterno.Id).Count();

                if (alreadyHasIt == 0)
                {
                    obraTraducida.AddAutorExterno(autorExternoObraTraducida);
                    obraTraducidaService.SaveObraTraducida(obraTraducida);
                }
            }

            var autorExternoObraTraducidaForm = autorExternoObraTraducidaMapper.Map(autorExternoObraTraducida);
            autorExternoObraTraducidaForm.ParentId = obraTraducidaId;

            return Rjs("AddAutorExterno", autorExternoObraTraducidaForm);
        }

        [CustomTransaction]
        [Authorize]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteAutorExterno(int id, int investigadorExternoId)
        {
            var obraTraducida = obraTraducidaService.GetObraTraducidaById(id);

            if (obraTraducida != null)
            {
                var autor =
                    obraTraducida.AutorExternoObraTraducidas.Where(x => x.InvestigadorExterno.Id == investigadorExternoId).First();
                obraTraducida.DeleteAutorExterno(autor);

                obraTraducidaService.SaveObraTraducida(obraTraducida);
            }

            var form = new AutorForm { ModelId = id, InvestigadorExternoId = investigadorExternoId };

            return Rjs("DeleteAutorExterno", form);
        }
                
        private ObraTraducidaForm SetupNewForm()
        {
            return SetupNewForm(null);
        }
        
        private ObraTraducidaForm SetupNewForm(ObraTraducidaForm form)
        {
			form = form ?? new ObraTraducidaForm();

            form.LineasTematicas = lineaTematicaMapper.Map(catalogoService.GetActiveLineaTematicas());

            form.TiposLibro = customCollection.TipoLibroCustomCollection();
            form.TiposObraTraducidas = customCollection.TipoObraTraducidaCustomCollection();
            form.EstadosProductos = customCollection.EstadoProductoCustomCollection();
            
            form.Reimpresiones = customCollection.ReimpresionCustomCollection();
            form.Ediciones = customCollection.EdicionCustomCollection();
            form.Idiomas = idiomaMapper.Map(catalogoService.GetActiveIdiomas());

            if (form.Id == 0)
            {
                form.CoautorExternoObraTraducidas = new CoautorExternoProductoForm[] {};
                form.CoautorInternoObraTraducidas = new CoautorInternoProductoForm[] {};
                form.AutorInternoObraTraducidas = new AutorInternoProductoForm[] {};
                form.AutorExternoObraTraducidas = new AutorExternoProductoForm[] {};

                if (User.IsInRole("Investigadores"))
				{
				    form.UsuarioNombre = CurrentInvestigador().Usuario.Nombre;
                    form.UsuarioApellidoPaterno = CurrentInvestigador().Usuario.ApellidoPaterno;
                    form.UsuarioApellidoMaterno = CurrentInvestigador().Usuario.ApellidoMaterno;
				}
            } else
            {
                form.AreasTematicas =
                    areaTematicaMapper.Map(catalogoService.GetAreaTematicasByLineaTematicaId(form.LineaTematicaId));
            }
			
            return form;
        }
        
        private void FormSetCombos(ObraTraducidaForm form)
        {
            ViewData["TipoObraTraducida"] = form.TipoObraTraducida;
            ViewData["EstadoProducto"] = form.EstadoProducto;
            ViewData["TipoLibro"] = form.TipoLibro;
            ViewData["Reimpresion"] = form.Reimpresion;
            ViewData["Edicion"] = form.Edicion;

            ViewData["Idioma"] = form.IdiomaId;

            ViewData["LineaTematicaId"] = form.LineaTematicaId;
            ViewData["AreaTematicaId"] = form.AreaTematicaId;
        }

        static ObraTraducidaForm SetupShowForm(ObraTraducidaForm form)
        {
            form = form ?? new ObraTraducidaForm();

            form.ShowFields = new ShowFieldsForm
            {
                EstadoProducto = form.EstadoProducto,
                FechaAceptacion = form.FechaAceptacion,
                FechaPublicacion = form.FechaPublicacion,
                ModelId = form.Id,
                ComprobanteAceptadoId = form.ComprobanteAceptadoId,
                ComprobanteAceptadoNombre = form.ComprobanteAceptadoNombre,

                RevistaPublicacionTitulo = form.RevistaPublicacion.Titulo,
                RevistaPublicacionInstitucionNombre = form.RevistaPublicacion.InstitucionNombre,
                RevistaPublicacionIndice1Nombre = form.RevistaPublicacion.Indice1Nombre,
                RevistaPublicacionIndice2Nombre = form.RevistaPublicacion.Indice2Nombre,
                RevistaPublicacionIndice3Nombre = form.RevistaPublicacion.Indice3Nombre,

                PalabraClave1 = form.PalabraClave1,
                PalabraClave2 = form.PalabraClave2,
                PalabraClave3 = form.PalabraClave3,

                IsShowForm = true,
                RevistaLabel = "Nombre de la revista"
            };

            return form;
        }

        protected override void DeleteEditorialInModel(ObraTraducida model, int editorialId)
        {
            if (model != null)
            {
                var editorial = model.EditorialObraTraducidas.Where(x => x.Id == editorialId).First();
                model.DeleteEditorial(editorial);

                obraTraducidaService.SaveObraTraducida(model);
            }
        }

        protected override bool SaveEditorialToModel(ObraTraducida model, EditorialProducto editorialProducto)
        {
            var editorialId = editorialProducto.Editorial != null ? editorialProducto.Editorial.Id : 0;

            var alreadyHasIt =
                model.EditorialObraTraducidas.Where(
                    x => ((x.Editorial != null && editorialId > 0 && x.Editorial.Id == editorialId) ||
                          (x.EditorialNombre == editorialProducto.EditorialNombre))
                         && x.Pais.Id == editorialProducto.Pais.Id).Count();

            if (alreadyHasIt == 0)
            {
                model.AddEditorial(editorialProducto);
                obraTraducidaService.SaveObraTraducida(model, true);
            }

            return alreadyHasIt == 0;
        }

        protected override EditorialProducto MapEditorialMessage(EditorialProductoForm form)
        {
            return editorialObraTraducidaMapper.Map(form);
        }

        protected override EditorialProductoForm MapEditorialModel(EditorialProducto model, int parentId)
        {
            var editorialObraTraducidaForm = editorialObraTraducidaMapper.Map(model as EditorialObraTraducida);
            editorialObraTraducidaForm.ParentId = parentId;

            return editorialObraTraducidaForm;
        }

        protected override ObraTraducida GetModelById(int id)
        {
            return obraTraducidaService.GetObraTraducidaById(id);
        }
    }
}