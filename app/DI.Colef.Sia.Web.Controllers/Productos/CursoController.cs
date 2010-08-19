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
    public class CursoController : BaseController<Curso, CursoForm>
    {
        readonly IAreaMapper areaMapper;
        readonly ICursoInvestigadorMapper cursoInvestigadorMapper;
        readonly ICursoInvestigadorService cursoInvestigadorService;
        readonly ICursoMapper cursoMapper;
        readonly ICursoService cursoService;
        readonly ICustomCollection customCollection;
        readonly INivelEstudioMapper nivelEstudioMapper;
        readonly IProductoService productoService;
        readonly ISectorMapper sectorMapper;

        public CursoController(ICursoService cursoService,
                               ICursoMapper cursoMapper,
                               IArchivoService archivoService,
                               ICatalogoService catalogoService, IUsuarioService usuarioService,
                               INivelMapper nivelMapper,
                               INivelEstudioMapper nivelEstudioMapper,
                               ISubdisciplinaMapper subdisciplinaMapper,
                               ISearchService searchService, ICustomCollection customCollection,
                               ICursoInvestigadorService cursoInvestigadorService,
                               ICursoInvestigadorMapper cursoInvestigadorMapper,
                               IOrganizacionMapper organizacionMapper, ISectorMapper sectorMapper,
                               IDisciplinaMapper disciplinaMapper,
                               IInstitucionMapper institucionMapper, IAreaMapper areaMapper,
                               IProductoService productoService)
            : base(
                usuarioService, searchService, catalogoService, disciplinaMapper, subdisciplinaMapper,
                organizacionMapper, nivelMapper)
        {
            base.catalogoService = catalogoService;
            base.institucionMapper = institucionMapper;

            this.nivelEstudioMapper = nivelEstudioMapper;
            this.cursoService = cursoService;
            this.cursoMapper = cursoMapper;
            this.customCollection = customCollection;
            this.cursoInvestigadorMapper = cursoInvestigadorMapper;
            this.cursoInvestigadorService = cursoInvestigadorService;
            this.sectorMapper = sectorMapper;
            this.areaMapper = areaMapper;
            this.productoService = productoService;
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Index()
        {
            var data = new GenericViewData<CursoForm>();
            var productos = productoService.GetProductosByUsuario<Curso>(CurrentUser(), x => x.Nombre,
                                                                         x => x.TipoCurso);
            data.ProductList = productos;

            return View(data);
        }

        [Authorize(Roles = "Investigadores")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult New()
        {
            if (CurrentInvestigador() == null)
                return NoInvestigadorProfile("Por tal motivo no puede crear nuevos productos.");

            var data = new GenericViewData<CursoForm> {Form = SetupNewForm()};

            return View(data);
        }

        [Authorize(Roles = "Investigadores, DGAA")]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Edit(int id)
        {
            var data = new GenericViewData<CursoForm>();

            var curso = cursoService.GetCursoById(id);

            if (curso.Firma.Aceptacion1 == 1 && curso.Firma.Aceptacion2 == 0 && User.IsInRole("Investigadores"))
                return RedirectToIndex(String.Format("El curso {0} esta en firma y no puede ser editado", curso.Nombre));

            if (User.IsInRole("DGAA"))
            {
                if ((curso.Firma.Aceptacion1 == 1 && curso.Firma.Aceptacion2 == 1) ||
                    (curso.Firma.Aceptacion1 == 0 && curso.Firma.Aceptacion2 == 0) ||
                    (curso.Firma.Aceptacion1 == 0 && curso.Firma.Aceptacion2 == 2)
                    )
                    return
                        RedirectToIndex(String.Format(
                            "El curso {0} ya fue aceptado o no ha sido enviado a firma",
                            curso.Nombre));
            }

            if (User.IsInRole("Investigadores"))
            {
                if (curso.Usuario.Id != CurrentUser().Id)
                    return RedirectToIndex("no lo puede modificar");
            }

            var cursoForm = cursoMapper.Map(curso);

            data.Form = SetupNewForm(cursoForm);
            FormSetCombos(data.Form);

            ViewData.Model = data;
            return View();
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Show(int id)
        {
            var data = new GenericViewData<CursoForm>();

            var curso = cursoService.GetCursoById(id);

            var cursoForm = cursoMapper.Map(curso);

            data.Form = SetupShowForm(cursoForm);
            data.Form.InstitucionLabel = "Institución";
            data.Form.IsShowForm = true;

            ViewData.Model = data;
            return View();
        }

        [CustomTransaction]
        [Authorize(Roles = "Investigadores")]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(CursoForm form)
        {
            var curso = cursoMapper.Map(form, CurrentUser(), CurrentInvestigador());

            ModelState.AddModelErrors(curso.ValidationResults(), true, "Curso");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            cursoService.SaveCurso(curso);
            SetMessage(String.Format("Curso {0} ha sido registrado",
                                     IndexValueHelper.GetCursoIndexStringValue(cursoMapper.Map(curso))));

            return Rjs("Save", curso.Id);
        }

        [Authorize]
        [ValidateAntiForgeryToken]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update(CursoForm form)
        {
            var curso = new Curso();

            if (User.IsInRole("Investigadores"))
                curso = cursoMapper.Map(form, CurrentUser(), CurrentInvestigador());
            if (User.IsInRole("DGAA"))
                curso = cursoMapper.Map(form, CurrentUser());

            ModelState.AddModelErrors(curso.ValidationResults(), true, "Curso");

            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            cursoService.SaveCurso(curso, true);
            SetMessage(String.Format("Curso {0} ha sido modificado",
                                     IndexValueHelper.GetCursoIndexStringValue(cursoMapper.Map(curso))));

            return Rjs("Save", curso.Id);
        }

        [CookieLessAuthorize]
        [CustomTransaction]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AddFile(FormCollection form)
        {
            var id = Convert.ToInt32(form["Id"]);
            var curso = cursoService.GetCursoById(id);

            var archivo = MapArchivo<ArchivoCurso>();
            curso.AddArchivo(archivo);

            cursoService.SaveCurso(curso);

            return Content("Uploaded");
        }

        [Authorize(Roles = "DGAA")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult DgaaValidateProduct(FirmaForm firmaForm)
        {
            var curso = cursoService.GetCursoById(firmaForm.ProductoId);

            curso.Firma.Aceptacion2 = 1;
            curso.Firma.Usuario2 = CurrentUser();
            curso.Firma.PuntuacionSieva = firmaForm.PuntuacionSieva;

            ModelState.AddModelErrors(curso.ValidationResults(), false, "Firma");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            curso.Puntuacion = firmaForm.PuntuacionSieva;
            cursoService.SaveCurso(curso, true);

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
            var curso = cursoService.GetCursoById(firmaForm.ProductoId);
            curso.Firma.Aceptacion1 = 0;
            curso.Firma.Aceptacion2 = 2;
            curso.Firma.Descripcion = firmaForm.Descripcion;
            curso.Firma.Usuario1 = CurrentUser();
            curso.Firma.Usuario2 = CurrentUser();

            ModelState.AddModelErrors(curso.ValidationResults(), false, "Firma");
            if (!ModelState.IsValid)
            {
                return Rjs("ModelError");
            }

            cursoService.SaveCurso(curso, true);

            var data = new FirmaForm
                           {
                               TipoProducto = firmaForm.TipoProducto,
                               Aceptacion2 = 2
                           };

            return Rjs("DgaaSign", data);
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
        public ActionResult ChangeCursoInvestigador(int select)
        {
            var cursoInvestigadorForm =
                cursoInvestigadorMapper.Map(cursoInvestigadorService.GetCursoInvestigadorById(select));

            return Rjs("ChangeCursoInvestigador", cursoInvestigadorForm);
        }

        [Authorize]
        [AcceptVerbs(HttpVerbs.Get)]
        public override ActionResult Search(string q)
        {
            var data = searchService.Search<Curso>(x => x.Nombre, q);
            return Content(data);
        }

        CursoForm SetupNewForm()
        {
            return SetupNewForm(null);
        }

        CursoForm SetupNewForm(CursoForm form)
        {
            form = form ?? new CursoForm
                               {
                                   CursoInvestigador = new CursoInvestigadorForm()
                               };

            form.TiposCursos = customCollection.TipoCursoCustomCollection();

            form.NivelEstudios = nivelEstudioMapper.Map(catalogoService.GetActiveNivelEstudios());
            form.CursosInvestigadores =
                cursoInvestigadorMapper.Map(cursoInvestigadorService.FindUnsedCursosInvestigador(CurrentInvestigador()));

            form.Areas = areaMapper.Map(catalogoService.GetActiveAreas());
            form.Disciplinas = GetDisciplinasByAreaId(form.AreaId);
            form.Subdisciplinas = GetSubdisciplinasByDisciplinaId(form.DisciplinaId);

            form.Sectores = sectorMapper.Map(catalogoService.GetActiveSectores());
            form.Organizaciones = GetOrganizacionesBySectorId(form.SectorId);
            form.Niveles = GetNivelesByOrganizacionId(form.OrganizacionId);

            if (form.CursoInvestigadorId != 0)
                form.CursoInvestigador =
                    cursoInvestigadorMapper.Map(
                        cursoInvestigadorService.GetCursoInvestigadorById(form.CursoInvestigadorId));

            form.InstitucionLabel = "Institución";
            form.IsShowForm = false;

            return form;
        }

        void FormSetCombos(CursoForm form)
        {
            ViewData["TipoCurso"] = form.TipoCurso;
            ViewData["NivelEstudio"] = form.NivelEstudioId;
            ViewData["CursoInvestigadorId"] = form.CursoInvestigadorId;

            ViewData["AreaId"] = form.AreaId;
            ViewData["DisciplinaId"] = form.DisciplinaId;
            ViewData["SubdisciplinaId"] = form.SubdisciplinaId;

            ViewData["SectorId"] = form.SectorId;
            ViewData["OrganizacionId"] = form.OrganizacionId;
            ViewData["Nivel2Id"] = form.Nivel2Id;
        }

        static CursoForm SetupShowForm(CursoForm form)
        {
            form = form ?? new CursoForm();

            form.IsShowForm = true;

            form.ShowFields = new ShowFieldsForm
                                  {
                                      SubdisciplinaNombre = form.SubdisciplinaNombre,
                                      DisciplinaNombre = form.DisciplinaNombre,
                                      AreaNombre = form.AreaNombre,
                                      Nivel2Nombre = form.Nivel2Nombre,
                                      OrganizacionNombre = form.OrganizacionNombre,
                                      SectorNombre = form.SectorNombre,
                                      InstitucionNombre = form.Institucion.Nombre,
                                      InstitucionPaisNombre = form.Institucion.PaisNombre,
                                      IsShowForm = true,
                                      InstitucionLabel = "Institución"
                                  };
            return form;
        }
    }
}