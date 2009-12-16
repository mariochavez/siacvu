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
        readonly ICatalogoService catalogoService;
        readonly IIdiomaMapper idiomaMapper;
        readonly IArchivoService archivoService;
        readonly IRevistaPublicacionMapper revistaPublicacionMapper;
        readonly IAreaTematicaMapper areaTematicaMapper;
        readonly IAutorExternoObraTraducidaMapper autorExternoObraTraducidaMapper;
        readonly IAutorInternoObraTraducidaMapper autorInternoObraTraducidaMapper;
        readonly ICoautorExternoObraTraducidaMapper coautorExternoObraTraducidaMapper;
        readonly ICoautorInternoObraTraducidaMapper coautorInternoObraTraducidaMapper;
        readonly ICustomCollection customCollection;
        readonly IEditorialObraTraducidaMapper editorialObraTraducidaMapper;
        readonly ILineaTematicaMapper lineaTematicaMapper;
        readonly IInvestigadorExternoMapper investigadorExternoMapper;
        
    
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
                                    IEditorialObraTraducidaMapper editorialObraTraducidaMapper,
                                    IInvestigadorExternoMapper investigadorExternoMapper
            ) : base(usuarioService, searchService, catalogoService)
        {
			this.catalogoService = catalogoService;
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
            ViewData["Idioma"] = (from e in data.Form.Idiomas where e.Nombre == "Español" select e.Id).FirstOrDefault();
            ViewData["Edicion"] = (from e in data.Form.Ediciones where e.Nombre == "Primera edición" select e.Id).FirstOrDefault();

            return View(data);
        }

        [Authorize(Roles = "Investigadores, DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            CoautorInternoObraTraducida coautorInternoObraTraducida;
            int posicionAutor;
            var coautorExists = 0;
            var data = CreateViewDataWithTitle(Title.Edit);

            var obraTraducida = obraTraducidaService.GetObraTraducidaById(id);

            if (obraTraducida.Firma.Aceptacion1 == 1 && obraTraducida.Firma.Aceptacion2 == 0 && User.IsInRole("Investigadores"))
                return RedirectToHomeIndex(String.Format("La obra traducida {0} esta en firma y no puede ser editada", obraTraducida.Nombre));
            if (User.IsInRole("DGAA"))
            {
                if ((obraTraducida.Firma.Aceptacion1 == 1 && obraTraducida.Firma.Aceptacion2 == 1) ||
                    (obraTraducida.Firma.Aceptacion1 == 0 && obraTraducida.Firma.Aceptacion2 == 0) ||
                    (obraTraducida.Firma.Aceptacion1 == 0 && obraTraducida.Firma.Aceptacion2 == 2)
                   )
                    return
                        RedirectToHomeIndex(String.Format(
                                                "La obra traducida {0} ya fue aceptada o no ha sido enviada a firma",
                                                obraTraducida.Nombre));
            }
            if (User.IsInRole("Investigadores"))
            {
                coautorExists =
                    obraTraducida.CoautorInternoObraTraducidas.Where(
                        x => x.Investigador.Id == CurrentInvestigador().Id).Count();

                if (obraTraducida.Usuario.Id != CurrentUser().Id && coautorExists == 0)
                    return RedirectToHomeIndex("no lo puede modificar");
            }

            var obraTraducidaForm = obraTraducidaMapper.Map(obraTraducida);

            data.Form = SetupNewForm(obraTraducidaForm);

            FormSetCombos(data.Form);

            if (coautorExists != 0)
            {
                coautorInternoObraTraducida =
                    obraTraducida.CoautorInternoObraTraducidas.Where(x => x.Investigador.Id == CurrentInvestigador().Id).
                        FirstOrDefault();

                posicionAutor = coautorInternoObraTraducida.Posicion;
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

            //if (!IsValidateModel(obraTraducida, form, Title.New, "ObraTraducida"))
            //{
            //    var obraTraducidaForm = obraTraducidaMapper.Map(obraTraducida);

            //    ((GenericViewData<ObraTraducidaForm>)ViewData.Model).Form = SetupNewForm(obraTraducidaForm);
            //    FormSetCombos(obraTraducidaForm);
            //    return ViewNew();
            //}

            obraTraducidaService.SaveObraTraducida(obraTraducida);
            SetMessage(String.Format("Obra traducida {0} ha sido creada", obraTraducida.Nombre));

            return Rjs("Save", obraTraducida.Id);
        }

        [Authorize(Roles = "Investigadores")]
        //[CustomTransaction]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(ObraTraducidaForm form)
        {
            var obraTraducida = obraTraducidaMapper.Map(form, CurrentUser(), CurrentInvestigador());

            ModelState.AddModelErrors(obraTraducida.ValidationResults(), true, "ObraTraducida");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            //if (!IsValidateModel(obraTraducida, form, Title.Edit))
            //{
            //    var obraTraducidaForm = obraTraducidaMapper.Map(obraTraducida);

            //    ((GenericViewData<ObraTraducidaForm>)ViewData.Model).Form = SetupNewForm(obraTraducidaForm);
            //    FormSetCombos(obraTraducidaForm);
            //    return ViewEdit();
            //}
            
            obraTraducidaService.SaveObraTraducida(obraTraducida, true);
            SetMessage(String.Format("Obra traducida {0} ha sido modificada", obraTraducida.Nombre));

            return Rjs("Save", obraTraducida.Id);
        }

        [CookieLessAuthorize(Roles = "Investigadores")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddFile(FormCollection form)
        {
            var id = Convert.ToInt32(form["Id"]);
            var obraTraducida = obraTraducidaService.GetObraTraducidaById(id);

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
                archivo.TipoProducto = obraTraducida.TipoProducto;
                archivoService.Save(archivo);
                obraTraducida.ComprobanteAceptado = archivo;
            }
            else if (form["TipoArchivo"] == "Publicado")
            {
                archivo.TipoProducto = obraTraducida.TipoProducto;
                archivoService.Save(archivo);
                obraTraducida.ComprobantePublicado = archivo;
            }
            else if (form["TipoArchivo"] == "ComprobanteobraTraducida")
            {
                archivo.TipoProducto = obraTraducida.TipoProducto;
                archivoService.Save(archivo);
                obraTraducida.ComprobanteObraTraducida = archivo;
            }

            obraTraducidaService.SaveObraTraducida(obraTraducida);

            return Content("Uploaded");
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

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorInterno(int id)
        {
            var obraTraducida = obraTraducidaService.GetObraTraducidaById(id);
            var form = new CoautorForm { Controller = "ObraTraducida", IdName = "ObraTraducidaId" };

            if (obraTraducida != null)
                form.Id = obraTraducida.Id;

            return Rjs("NewCoautorInterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
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
        [Authorize(Roles = "Investigadores")]
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

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewCoautorExterno(int id)
        {
            var obraTraducida = obraTraducidaService.GetObraTraducidaById(id);
            var form = new CoautorForm { Controller = "ObraTraducida", IdName = "ObraTraducidaId", InvestigadorExterno = new InvestigadorExternoForm() };

            if (obraTraducida != null)
                form.Id = obraTraducida.Id;

            return Rjs("NewCoautorExterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
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
        [Authorize(Roles = "Investigadores")]
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

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewAutorInterno(int id)
        {
            var obraTraducida = obraTraducidaService.GetObraTraducidaById(id);
            var form = new AutorForm { Controller = "ObraTraducida", IdName = "ObraTraducidaId" };

            if (obraTraducida != null)
                form.Id = obraTraducida.Id;

            return Rjs("NewAutorInterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
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
        [Authorize(Roles = "Investigadores")]
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

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewAutorExterno(int id)
        {
            var obraTraducida = obraTraducidaService.GetObraTraducidaById(id);

            var form = new AutorForm { Controller = "ObraTraducida", IdName = "ObraTraducidaId", InvestigadorExterno = new InvestigadorExternoForm() };

            if (obraTraducida != null)
                form.Id = obraTraducida.Id;

            return Rjs("NewAutorExterno", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
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
        [Authorize(Roles = "Investigadores")]
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

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult NewEditorial(int id)
        {
            var obraTraducida = obraTraducidaService.GetObraTraducidaById(id);

            var form = new EditorialForm { Controller = "ObraTraducida", IdName = "ObraTraducidaId" };

            if (obraTraducida != null)
                form.Id = obraTraducida.Id;

            return Rjs("NewEditorial", form);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddEditorial([Bind(Prefix = "Editorial")] EditorialProductoForm form, int obraTraducidaId)
        {
            var editorialObraTraducida = editorialObraTraducidaMapper.Map(form);

            ModelState.AddModelErrors(editorialObraTraducida.ValidationResults(), false, "Editorial", String.Empty);
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            if (obraTraducidaId != 0)
            {
                editorialObraTraducida.CreadoPor = CurrentUser();
                editorialObraTraducida.ModificadoPor = CurrentUser();

                var obraTraducida = obraTraducidaService.GetObraTraducidaById(obraTraducidaId);

                var alreadyHasIt =
                    obraTraducida.EditorialObraTraducidas.Where(
                        x => x.Editorial.Id == editorialObraTraducida.Editorial.Id).Count();

                if (alreadyHasIt == 0)
                {
                    obraTraducida.AddEditorial(editorialObraTraducida);
                    obraTraducidaService.SaveObraTraducida(obraTraducida);
                }
            }

            var editorialObraTraducidaForm = editorialObraTraducidaMapper.Map(editorialObraTraducida);
            editorialObraTraducidaForm.ParentId = obraTraducidaId;

            return Rjs("AddEditorial", editorialObraTraducidaForm);
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Delete)]
        public ActionResult DeleteEditorial(int id, int editorialId)
        {
            var obraTraducida = obraTraducidaService.GetObraTraducidaById(id);

            if (obraTraducida != null)
            {
                var editorial = obraTraducida.EditorialObraTraducidas.Where(x => x.Editorial.Id == editorialId).First();
                obraTraducida.DeleteEditorial(editorial);

                obraTraducidaService.SaveObraTraducida(obraTraducida);
            }

            var form = new EditorialForm { ModelId = id, EditorialId = editorialId };

            return Rjs("DeleteEditorial", form);
        }
                
        ObraTraducidaForm SetupNewForm()
        {
            return SetupNewForm(null);
        }
        
        ObraTraducidaForm SetupNewForm(ObraTraducidaForm form)
        {
			form = form ?? new ObraTraducidaForm();

            form.TiposObraTraducidas = customCollection.TipoObraTraducidaCustomCollection();
            form.EstadosProductos = customCollection.EstadoProductoCustomCollection();
            form.TiposLibro = customCollection.TipoLibroCustomCollection();
            form.Reimpresiones = customCollection.ReimpresionCustomCollection();
            form.Ediciones = customCollection.EdicionCustomCollection();
            form.Idiomas = idiomaMapper.Map(catalogoService.GetActiveIdiomas());
			
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
        }

        static ObraTraducidaForm SetupShowForm(ObraTraducidaForm form)
        {
            form = form ?? new ObraTraducidaForm();

            form.ShowFields = new ShowFieldsForm
            {
                AreaTematicaNombre = form.AreaTematica.Nombre,
                AreaTematicaLineaTematicaNombre = form.AreaTematica.LineaTematicaNombre,

                EstadoProducto = form.EstadoProducto,
                FechaAceptacion = form.FechaAceptacion,
                FechaPublicacion = form.FechaPublicacion,

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
    }
}