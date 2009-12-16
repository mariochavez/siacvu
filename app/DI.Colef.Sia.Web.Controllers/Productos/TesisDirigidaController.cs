using System;
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
    public class TesisDirigidaController : BaseController<TesisDirigida, TesisDirigidaForm>
    {
        readonly ICatalogoService catalogoService;
        readonly IGradoAcademicoMapper gradoAcademicoMapper;
        readonly ITesisDirigidaMapper tesisDirigidaMapper;
        readonly ITesisDirigidaService tesisDirigidaService;
        readonly IVinculacionAPyDMapper vinculacionApyDMapper;
        readonly ICustomCollection customCollection;
        readonly ITesisPosgradoMapper tesisPosgradoMapper;
        readonly ITesisPosgradoService tesisPosgradoService;
        readonly ISectorMapper sectorMapper;
        readonly IArchivoService archivoService;
        readonly IAreaMapper areaMapper;
        readonly IInstitucionMapper institucionMapper;

        public TesisDirigidaController(ITesisDirigidaService tesisDirigidaService,
                               ITesisDirigidaMapper tesisDirigidaMapper,
                               IArchivoService archivoService,
                               ICatalogoService catalogoService,
                               IUsuarioService usuarioService, IGradoAcademicoMapper gradoAcademicoMapper,
                               ISubdisciplinaMapper subdisciplinaMapper, 
                               ISearchService searchService,
                               IVinculacionAPyDMapper vinculacionApyDMapper,
                               INivelMapper nivelMapper, ICustomCollection customCollection,
                               ITesisPosgradoMapper tesisPosgradoMapper, ITesisPosgradoService tesisPosgradoService,
                               IOrganizacionMapper organizacionMapper, ISectorMapper sectorMapper,
                               IDisciplinaMapper disciplinaMapper, IAreaMapper areaMapper, IInstitucionMapper institucionMapper)
            : base(usuarioService, searchService, catalogoService, disciplinaMapper, subdisciplinaMapper, organizacionMapper, nivelMapper)
        {
            this.catalogoService = catalogoService;
            this.tesisDirigidaService = tesisDirigidaService;
            this.tesisDirigidaMapper = tesisDirigidaMapper;
            this.gradoAcademicoMapper = gradoAcademicoMapper;
            this.vinculacionApyDMapper = vinculacionApyDMapper;
            this.customCollection = customCollection;
            this.archivoService = archivoService;
            this.tesisPosgradoMapper = tesisPosgradoMapper;
            this.tesisPosgradoService = tesisPosgradoService;
            this.sectorMapper = sectorMapper;
            this.areaMapper = areaMapper;
            this.institucionMapper = institucionMapper;
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
            
            return View(data);
        }

        [Authorize(Roles = "Investigadores, DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = CreateViewDataWithTitle(Title.Edit);

            var tesisDirigida = tesisDirigidaService.GetTesisDirigidaById(id);

            if (tesisDirigida.Firma.Aceptacion1 == 1 && tesisDirigida.Firma.Aceptacion2 == 0 && User.IsInRole("Investigadores"))
                return RedirectToHomeIndex(String.Format("La tesis dirigida {0} esta en firma y no puede ser editada", tesisDirigida.Titulo));
            
            if (User.IsInRole("DGAA"))
            {
                if ((tesisDirigida.Firma.Aceptacion1 == 1 && tesisDirigida.Firma.Aceptacion2 == 1) ||
                    (tesisDirigida.Firma.Aceptacion1 == 0 && tesisDirigida.Firma.Aceptacion2 == 0) ||
                    (tesisDirigida.Firma.Aceptacion1 == 0 && tesisDirigida.Firma.Aceptacion2 == 2)
                   )
                    return
                        RedirectToHomeIndex(String.Format(
                                                "La tesis dirigida {0} ya fue aceptada o no ha sido enviada a firma",
                                                tesisDirigida.Titulo));
            }

            if (User.IsInRole("Investigadores"))
            {
                if (tesisDirigida.Usuario.Id != CurrentUser().Id)
                    return RedirectToHomeIndex("no lo puede modificar");
            }

            var tesisDirigidaForm = tesisDirigidaMapper.Map(tesisDirigida);

            data.Form = SetupNewForm(tesisDirigidaForm);
            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = CreateViewDataWithTitle(Title.Show);

            var tesisDirigida = tesisDirigidaService.GetTesisDirigidaById(id);

            var tesisDirigidaForm = tesisDirigidaMapper.Map(tesisDirigida);

            data.Form = SetupShowForm(tesisDirigidaForm);

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(TesisDirigidaForm form)
        {
            var tesisDirigida = tesisDirigidaMapper.Map(form, CurrentUser(), CurrentInvestigador());
            ModelState.AddModelErrors(tesisDirigida.ValidationResults(), true, "TesisDirigida");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }
            
            tesisDirigidaService.SaveTesisDirigida(tesisDirigida);
            SetMessage(String.Format("Tesis dirigida {0} ha sido creada", IndexValueHelper.GetTesisIndexStringValue(tesisDirigidaMapper.Map(tesisDirigida))));

            return Rjs("Save", tesisDirigida.Id);
        }

        //[CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(TesisDirigidaForm form)
        {
            var tesisDirigida = tesisDirigidaMapper.Map(form, CurrentUser(), CurrentInvestigador());
            ModelState.AddModelErrors(tesisDirigida.ValidationResults(), true, "TesisDirigida");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }
            
            tesisDirigidaService.SaveTesisDirigida(tesisDirigida, true);
            SetMessage(String.Format("Tesis dirigida {0} ha sido modificada", IndexValueHelper.GetTesisIndexStringValue(tesisDirigidaMapper.Map(tesisDirigida))));

            return Rjs("Save", tesisDirigida.Id);
        }

        [CookieLessAuthorize(Roles = "Investigadores")]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddFile(FormCollection form)
        {
            var id = Convert.ToInt32(form["Id"]);
            var tesisDirigida = tesisDirigidaService.GetTesisDirigidaById(id);

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

            if (form["TipoArchivo"] == "ComprobanteTesisDirigida")
            {
                archivo.TipoProducto = tesisDirigida.TipoProducto;
                archivoService.Save(archivo);
                tesisDirigida.ComprobanteTesisDirigida = archivo;
            }

            tesisDirigidaService.SaveTesisDirigida(tesisDirigida);

            return Content("Uploaded");
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeInstitucionShort(int select)
        {
            var institucionForm = institucionMapper.Map(catalogoService.GetInstitucionById(select));

            var form = new ShowFieldsForm
                           {
                               InstitucionId = institucionForm.Id,
                               InstitucionPaisNombre = institucionForm.PaisNombre
                           };

            return Rjs("ChangeInstitucionShort", form);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult ChangeTesisPosgrado(int select)
        {
            var tesisPosgradoForm = tesisPosgradoMapper.Map(tesisPosgradoService.GetTesisPosgradoById(select));

            return Rjs("ChangeTesisPosgrado", tesisPosgradoForm);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<TesisDirigida>(x => x.Titulo, q);
            return Content(data);
        }

        TesisDirigidaForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        TesisDirigidaForm SetupNewForm(TesisDirigidaForm form)
        {
            form = form ?? new TesisDirigidaForm
                               {
                                   TesisPosgrado = new TesisPosgradoForm()
                               };

            //Lista de Catalogos Pendientes
            form.GradosAcademicos = gradoAcademicoMapper.Map(catalogoService.GetActiveGrados());
            form.FormasParticipaciones = customCollection.FormaParticipacionCustomCollection();
            form.TiposTesis = customCollection.TipoTesisCustomCollection();
            form.VinculacionesAPyDs = vinculacionApyDMapper.Map(catalogoService.GetActiveVinculacionAPyDs());
            form.TesisPosgrados = tesisPosgradoMapper.Map(tesisPosgradoService.FindUnsedTesisInvestigador(CurrentInvestigador()));

            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = GetDisciplinasByAreaId(form.AreaId);
            form.Subdisciplinas = GetSubdisciplinasByDisciplinaId(form.DisciplinaId);

            form.Sectores = sectorMapper.Map(catalogoService.GetActiveSectores());
            form.Organizaciones = GetOrganizacionesBySectorId(form.SectorId);
            form.Niveles = GetNivelesByOrganizacionId(form.OrganizacionId);

            if (form.TesisPosgradoId != 0)
                form.TesisPosgrado =
                    tesisPosgradoMapper.Map(tesisPosgradoService.GetTesisPosgradoById(form.TesisPosgradoId));

            form.IsShowForm = false;

            return form;
        }

        void FormSetCombos(TesisDirigidaForm form)
        {
            ViewData["TesisPosgradoId"] = form.TesisPosgradoId;
            ViewData["TipoTesis"] = form.TipoTesis;
            ViewData["VinculacionAPyD"] = form.VinculacionAPyDId;
            ViewData["GradoAcademico"] = form.GradoAcademicoId;
            ViewData["FormaParticipacion"] = form.FormaParticipacion;

            ViewData["AreaId"] = form.AreaId;
            ViewData["DisciplinaId"] = form.DisciplinaId;
            ViewData["SubdisciplinaId"] = form.SubdisciplinaId;

            ViewData["SectorId"] = form.SectorId;
            ViewData["OrganizacionId"] = form.OrganizacionId;
            ViewData["Nivel2Id"] = form.Nivel2Id;
        }

        private TesisDirigidaForm SetupShowForm(TesisDirigidaForm form)
        {
            form = form ?? new TesisDirigidaForm();

            form.IsShowForm = true;

            form.ShowFields = new ShowFieldsForm
                                  {
                                      InstitucionNombre = form.Institucion.Nombre,
                                      InstitucionPaisNombre = form.Institucion.PaisNombre,

                                      SubdisciplinaNombre = form.SubdisciplinaNombre,
                                      DisciplinaNombre = form.DisciplinaNombre,
                                      AreaNombre = form.AreaNombre,

                                      Nivel2Nombre = form.Nivel2Nombre,
                                      OrganizacionNombre = form.OrganizacionNombre,
                                      SectorNombre = form.SectorNombre,

                                      IsShowForm = true,
                                      InstitucionLabel = "Institución"
                                  };
            return form;
        }
    }
}