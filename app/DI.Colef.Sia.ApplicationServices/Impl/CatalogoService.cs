using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using NHibernate;
using NHibernate.Criterion;
using SharpArch.Core.PersistenceSupport;
using SharpArch.Data.NHibernate;
using Expression=NHibernate.Criterion.Expression;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class CatalogoService : ICatalogoService
    {
        readonly IRepository<AreaInvestigacion> areaInvestigacionRepository;
        readonly IRepository<ConsejoComision> consejoComisionRepository;
        readonly IRepository<Ambito> ambitoRepository;
        readonly IRepository<Area> areaRepository;
        readonly IRepository<AreaTematica> areaTematicaRepository;
        readonly IRepository<Categoria> categoriaRepository;
        readonly IRepository<Clase> claseRepository;
        readonly IRepository<Departamento> departamentoRepository;
        readonly IRepository<Dependencia> dependenciaRepository;
        readonly IRepository<DireccionRegional> direccionRegionalRepository;
        readonly IRepository<DirigidoA> dirigidoARepository;
        readonly IRepository<Disciplina> disciplinaRepository;
        readonly IRepository<Editorial> editorialRepository;
        readonly IRepository<Glosario> glosarioRepository;
        readonly IRepository<EstadoPais> estadoPaisRepository;
        readonly IRepository<Estado> estadoRepository;
        readonly IRepository<EstatusFormacionAcademica> estatusFormacionAcademicaRepository;
        readonly IRepository<FondoConacyt> fondoConacytRepository;
        readonly IRepository<GradoAcademico> gradoAcademicoRepository;
        readonly IRepository<Idioma> idiomaRepository;
        readonly IRepository<Indice> indiceRepository;
        readonly IRepository<Institucion> institucionRepository;
        readonly IRepository<InvestigadorExterno> investigadorExternoRepository;
        readonly IRepository<LineaInvestigacion> lineaInvestigacionRepository;
        readonly IRepository<LineaTematica> lineaTematicaRepository;
        readonly IRepository<MedioElectronico> medioElectronicoRepository;
        readonly IRepository<MedioImpreso> medioImpresoRepository;
        readonly IRepository<Moneda> monedaRepository;
        readonly IRepository<NivelEstudio> nivelEstudioRepository;
        readonly IRepository<Nivel> nivelRepository;
        readonly IRepository<Organizacion> organizacionRepository;
        readonly IRepository<Pais> paisRepository;
        readonly IRepository<ProgramaEstudio> programaEstudioRepository;
        readonly IRepository<Puesto> puestoRepository;
        readonly IRepository<Rama> ramaRepository;
        readonly IRepository<RevistaPublicacion> revistaPublicacionRepository;
        readonly IRepository<Sector> sectorRepository;
        readonly IRepository<Sede> sedeRepository;
        readonly IRepository<SNI> sniRepository;
        readonly IRepository<Subdisciplina> subdisciplinaRepository;
        readonly IRepository<SubprogramaConacyt> subprogramaConacytRepository;
        readonly IRepository<TipoActividad> tipoActividadRepository;
        readonly IRepository<TipoApoyo> tipoApoyoRepository;
        readonly IRepository<TipoArchivo> tipoArchivoRepository;
        readonly IRepository<TipoDictamen> tipoDictamenRepository;
        readonly IRepository<TipoDistincion> tipoDistincionRepository;
        readonly IRepository<TipoEstancia> tipoEstanciaRepository;
        readonly IRepository<TipoEvento> tipoEventoRepository;
        readonly IRepository<TipoOrgano> tipoOrganoRepository;
        readonly IRepository<TipoParticipacion> tipoParticipacionRepository;
        readonly IRepository<TipoProyecto> tipoProyectoRepository;
        readonly IRepository<VinculacionAPyD> vinculacionAPyDRepository;

        public CatalogoService(IRepository<TipoProyecto> tipoProyectoRepository,
                               IRepository<EstatusFormacionAcademica> estatusFormacionAcademicaRepository,
                               IRepository<Departamento> departamentoRepository, IRepository<Puesto> puestoRepository,
                               IRepository<Sede> sedeRepository, IRepository<Categoria> categoriaRepository,
                               IRepository<GradoAcademico> gradoAcademicoRepository,
                               IRepository<ConsejoComision> consejoComisionRepository,
                               IRepository<Editorial> editorialRepository, IRepository<SNI> sniRepository,
                               IRepository<Estado> estadoRepository, IRepository<Idioma> idiomaRepository,
                               IRepository<Pais> paisRepository, IRepository<DirigidoA> dirigidoARepository,
                               IRepository<Institucion> institucionRepository, IRepository<Indice> indiceRepository,
                               IRepository<InvestigadorExterno> investigadorExternoRepository,
                               IRepository<LineaInvestigacion> lineaInvestigacionRepository,
                               IRepository<TipoActividad> tipoActividadRepository, IRepository<Area> areaRepository,
                               IRepository<Disciplina> disciplinaRepository,
                               IRepository<Subdisciplina> subdisciplinaRepository,
                               IRepository<LineaTematica> lineaTematicaRepository,
                               IRepository<TipoParticipacion> tipoParticipacionRepository,
                               IRepository<Nivel> nivelRepository,
                               IRepository<Sector> sectorRepository,
                               IRepository<AreaInvestigacion> areaInvestigacionRepository,
                               IRepository<ProgramaEstudio> programaEstudioRepository,
                               IRepository<RevistaPublicacion> revistaPublicacionRepository,
                               IRepository<Organizacion> organizacionRepository,
                               IRepository<Dependencia> dependenciaRepository, IRepository<Ambito> ambitoRepository,
                               IRepository<EstadoPais> estadoPaisRepository,
                               IRepository<TipoEstancia> tipoEstanciaRepository,
                               IRepository<MedioElectronico> medioElectronicoRepository,
                               IRepository<MedioImpreso> medioImpresoRepository,
                               IRepository<TipoDictamen> tipoDictamenRepository,
                               IRepository<TipoDistincion> tipoDistincionRepository,
                               IRepository<TipoEvento> tipoEventoRepository,
                               IRepository<TipoOrgano> tipoOrganoRepository,
                               IRepository<NivelEstudio> nivelEstudioRepository,
                               IRepository<TipoApoyo> tipoApoyoRepository,
                               IRepository<SubprogramaConacyt> subprogramaConacytRepository,
                               IRepository<Rama> ramaRepository,
                               IRepository<Moneda> monedaRepository,
                               IRepository<Clase> claseRepository,
                               IRepository<FondoConacyt> fondoConacytRepository,
                               IRepository<AreaTematica> areaTematicaRepository,
                               IRepository<TipoArchivo> tipoArchivoRepository,
                               IRepository<VinculacionAPyD> vinculacionAPyDRepository,
                               IRepository<DireccionRegional> direccionRegionalRepository,
                               IRepository<Glosario> glosarioRepository)
        {
            this.monedaRepository = monedaRepository;
            this.departamentoRepository = departamentoRepository;
            this.puestoRepository = puestoRepository;
            this.sedeRepository = sedeRepository;
            this.consejoComisionRepository = consejoComisionRepository;
            this.categoriaRepository = categoriaRepository;
            this.gradoAcademicoRepository = gradoAcademicoRepository;
            this.sniRepository = sniRepository;
            this.estadoRepository = estadoRepository;
            this.idiomaRepository = idiomaRepository;
            this.paisRepository = paisRepository;
            this.estatusFormacionAcademicaRepository = estatusFormacionAcademicaRepository;
            this.areaInvestigacionRepository = areaInvestigacionRepository;
            this.institucionRepository = institucionRepository;
            this.indiceRepository = indiceRepository;
            this.investigadorExternoRepository = investigadorExternoRepository;
            this.lineaInvestigacionRepository = lineaInvestigacionRepository;
            this.tipoActividadRepository = tipoActividadRepository;
            this.areaRepository = areaRepository;
            this.dirigidoARepository = dirigidoARepository;
            this.disciplinaRepository = disciplinaRepository;
            this.subdisciplinaRepository = subdisciplinaRepository;
            this.lineaTematicaRepository = lineaTematicaRepository;
            this.tipoParticipacionRepository = tipoParticipacionRepository;
            this.revistaPublicacionRepository = revistaPublicacionRepository;
            this.programaEstudioRepository = programaEstudioRepository;
            this.sectorRepository = sectorRepository;
            this.editorialRepository = editorialRepository;
            this.glosarioRepository = glosarioRepository;
            this.tipoEstanciaRepository = tipoEstanciaRepository;
            this.nivelRepository = nivelRepository;
            this.organizacionRepository = organizacionRepository;
            this.dependenciaRepository = dependenciaRepository;
            this.ambitoRepository = ambitoRepository;
            this.estadoPaisRepository = estadoPaisRepository;
            this.medioElectronicoRepository = medioElectronicoRepository;
            this.medioImpresoRepository = medioImpresoRepository;
            this.tipoDictamenRepository = tipoDictamenRepository;
            this.tipoDistincionRepository = tipoDistincionRepository;
            this.tipoEventoRepository = tipoEventoRepository;
            this.tipoOrganoRepository = tipoOrganoRepository;
            this.nivelEstudioRepository = nivelEstudioRepository;
            this.tipoProyectoRepository = tipoProyectoRepository;
            this.tipoApoyoRepository = tipoApoyoRepository;
            this.subprogramaConacytRepository = subprogramaConacytRepository;
            this.ramaRepository = ramaRepository;
            this.claseRepository = claseRepository;
            this.fondoConacytRepository = fondoConacytRepository;
            this.areaTematicaRepository = areaTematicaRepository;
            this.tipoArchivoRepository = tipoArchivoRepository;
            this.vinculacionAPyDRepository = vinculacionAPyDRepository;
            this.direccionRegionalRepository = direccionRegionalRepository;
        }

        protected virtual ISession Session
        {
            get
            {
                string factoryKey = SessionFactoryAttribute.GetKeyFrom(this);
                return NHibernateSession.CurrentFor(factoryKey);
            }
        }

        #region ICatalogoService Members

        public Departamento GetDepartamentoById(int id)
        {
            return departamentoRepository.Get(id);
        }

        public Departamento[] GetAllDepartamentos()
        {
            return ((List<Departamento>) OrderCatalog<Departamento>(x => x.Nombre)).ToArray();
        }

        public Departamento[] GetActiveDepartamentos()
        {
            return ((List<Departamento>) OrderCatalog<Departamento>(x => x.Nombre, true)).ToArray();
        }

        public void SaveDepartamento(Departamento departamento)
        {
            if (departamento.Id == 0)
            {
                departamento.Activo = true;
                departamento.CreadoEl = DateTime.Now;
            }
            departamento.ModificadoEl = DateTime.Now;

            departamentoRepository.SaveOrUpdate(departamento);
        }

        public Puesto GetPuestoById(int id)
        {
            return puestoRepository.Get(id);
        }

        public Puesto[] GetAllPuestos()
        {
            return ((List<Puesto>) OrderCatalog<Puesto>(x => x.Nombre)).ToArray();
        }

        public Puesto[] GetActivePuestos()
        {
            return ((List<Puesto>) OrderCatalog<Puesto>(x => x.Nombre, true)).ToArray();
        }

        public void SavePuesto(Puesto puesto)
        {
            if (puesto.Id == 0)
            {
                puesto.Activo = true;
                puesto.CreadoEl = DateTime.Now;
            }
            puesto.ModificadoEl = DateTime.Now;

            puestoRepository.SaveOrUpdate(puesto);
        }

        public Sede GetSedeById(int id)
        {
            return sedeRepository.Get(id);
        }

        public Sede[] GetAllSedes()
        {
            return ((List<Sede>) OrderCatalog<Sede>(x => x.Nombre)).ToArray();
        }

        public Sede[] GetActiveSedes()
        {
            return ((List<Sede>) OrderCatalog<Sede>(x => x.Nombre, true)).ToArray();
        }

        public void SaveSede(Sede sede)
        {
            if (sede.Id == 0)
            {
                sede.Activo = true;
                sede.CreadoEl = DateTime.Now;
            }
            sede.ModificadoEl = DateTime.Now;

            sedeRepository.SaveOrUpdate(sede);
        }

        public Categoria GetCategoriaById(int id)
        {
            return categoriaRepository.Get(id);
        }

        public Categoria[] GetAllCategorias()
        {
            return ((List<Categoria>) OrderCatalog<Categoria>(x => x.Nombre)).ToArray();
        }

        public Categoria[] GetActiveCategorias()
        {
            return ((List<Categoria>) OrderCatalog<Categoria>(x => x.Nombre, true)).ToArray();
        }

        public void SaveCategoria(Categoria categoria)
        {
            if (categoria.Id == 0)
            {
                categoria.Activo = true;
                categoria.CreadoEl = DateTime.Now;
            }
            categoria.ModificadoEl = DateTime.Now;

            categoriaRepository.SaveOrUpdate(categoria);
        }

        public GradoAcademico GetGradoAcademicoById(int id)
        {
            return gradoAcademicoRepository.Get(id);
        }

        public GradoAcademico[] GetAllGradoAcademicos()
        {
            return ((List<GradoAcademico>) OrderCatalog<GradoAcademico>(x => x.Nombre)).ToArray();
        }

        public GradoAcademico[] GetActiveGrados()
        {
            return ((List<GradoAcademico>) OrderCatalog<GradoAcademico>(x => x.Nombre, true)).ToArray();
        }

        public void SaveGradoAcademico(GradoAcademico gradoAcademico)
        {
            if (gradoAcademico.Id == 0)
            {
                gradoAcademico.Activo = true;
                gradoAcademico.CreadoEl = DateTime.Now;
            }
            gradoAcademico.ModificadoEl = DateTime.Now;

            gradoAcademicoRepository.SaveOrUpdate(gradoAcademico);
        }

        public SNI GetSNIById(int id)
        {
            return sniRepository.Get(id);
        }

        public SNI[] GetAllSNIs()
        {
            return ((List<SNI>) OrderCatalog<SNI>(x => x.Nombre)).ToArray();
        }

        public SNI[] GetActiveSNIs()
        {
            return ((List<SNI>) OrderCatalog<SNI>(x => x.Nombre, true)).ToArray();
        }

        public void SaveSNI(SNI sni)
        {
            if (sni.Id == 0)
            {
                sni.Activo = true;
                sni.CreadoEl = DateTime.Now;
            }
            sni.ModificadoEl = DateTime.Now;

            sniRepository.SaveOrUpdate(sni);
        }

        public Estado GetEstadoById(int id)
        {
            return estadoRepository.Get(id);
        }

        public Estado[] GetAllEstados()
        {
            return ((List<Estado>) OrderCatalog<Estado>(x => x.Nombre)).ToArray();
        }

        public Estado[] GetActiveEstados()
        {
            return ((List<Estado>) OrderCatalog<Estado>(x => x.Nombre, true)).ToArray();
        }

        public void SaveEstado(Estado estado)
        {
            if (estado.Id == 0)
            {
                estado.Activo = true;
                estado.CreadoEl = DateTime.Now;
            }
            estado.ModificadoEl = DateTime.Now;

            estadoRepository.SaveOrUpdate(estado);
        }

        public Idioma GetIdiomaById(int id)
        {
            return idiomaRepository.Get(id);
        }

        public Idioma[] GetAllIdiomas()
        {
            return ((List<Idioma>) OrderCatalog<Idioma>(x => x.Nombre)).ToArray();
        }

        public Idioma[] GetActiveIdiomas()
        {
            return ((List<Idioma>) OrderCatalog<Idioma>(x => x.Nombre, true)).ToArray();
        }

        public void SaveIdioma(Idioma idioma)
        {
            if (idioma.Id == 0)
            {
                idioma.Activo = true;
                idioma.CreadoEl = DateTime.Now;
            }
            idioma.ModificadoEl = DateTime.Now;

            idiomaRepository.SaveOrUpdate(idioma);
        }

        public Pais GetPaisById(int id)
        {
            return paisRepository.Get(id);
        }

        public Pais[] GetAllPaises()
        {
            return ((List<Pais>) OrderCatalog<Pais>(x => x.Nombre)).ToArray();
        }

        public Pais[] GetActivePaises()
        {
            return ((List<Pais>) OrderCatalog<Pais>(x => x.Nombre, true)).ToArray();
        }

        public void SavePais(Pais pais)
        {
            if (pais.Id == 0)
            {
                pais.Activo = true;
                pais.CreadoEl = DateTime.Now;
            }
            pais.ModificadoEl = DateTime.Now;

            paisRepository.SaveOrUpdate(pais);
        }

        public Institucion GetInstitucionById(int id)
        {
            return institucionRepository.Get(id);
        }

        public Institucion[] GetAllInstituciones()
        {
            return ((List<Institucion>) OrderCatalog<Institucion>(x => x.Nombre)).ToArray();
        }

        public Institucion[] GetActiveInstituciones()
        {
            return ((List<Institucion>) OrderCatalog<Institucion>(x => x.Nombre, true)).ToArray();
        }

        public void SaveInstitucion(Institucion institucion)
        {
            if (institucion.Id == 0)
            {
                institucion.Activo = true;
                institucion.CreadoEl = DateTime.Now;
            }
            institucion.ModificadoEl = DateTime.Now;

            if (institucion.Pais.Nombre == "México")
                institucion.TipoInstitucion = true;
            else
                institucion.TipoInstitucion = false;

            institucionRepository.SaveOrUpdate(institucion);
        }

        public Indice GetIndiceById(int id)
        {
            return indiceRepository.Get(id);
        }

        public Indice[] GetAllIndices()
        {
            return ((List<Indice>) OrderCatalog<Indice>(x => x.Nombre)).ToArray();
        }

        public Indice[] GetActiveIndices()
        {
            return ((List<Indice>) OrderCatalog<Indice>(x => x.Nombre, true)).ToArray();
        }

        public void SaveIndice(Indice indice)
        {
            if (indice.Id == 0)
            {
                indice.Activo = true;
                indice.CreadoEl = DateTime.Now;
            }
            indice.ModificadoEl = DateTime.Now;

            indiceRepository.SaveOrUpdate(indice);
        }

        public InvestigadorExterno GetInvestigadorExternoById(int id)
        {
            return investigadorExternoRepository.Get(id);
        }

        public InvestigadorExterno[] GetAllInvestigadorExternos()
        {
            return ((List<InvestigadorExterno>) OrderCatalog<InvestigadorExterno>(x => x.Nombre)).ToArray();
        }

        public InvestigadorExterno[] GetActiveInvestigadorExternos()
        {
            return ((List<InvestigadorExterno>) OrderCatalog<InvestigadorExterno>(x => x.Nombre, true)).ToArray();
        }

        public void SaveInvestigadorExterno(InvestigadorExterno investigadorExterno)
        {
            if (investigadorExterno.Id == 0)
            {
                investigadorExterno.Activo = true;
                investigadorExterno.CreadoEl = DateTime.Now;
            }
            investigadorExterno.ModificadoEl = DateTime.Now;

            investigadorExternoRepository.SaveOrUpdate(investigadorExterno);
        }

        public LineaInvestigacion GetLineaInvestigacionById(int id)
        {
            return lineaInvestigacionRepository.Get(id);
        }

        public LineaInvestigacion[] GetAllLineaInvestigaciones()
        {
            return ((List<LineaInvestigacion>) OrderCatalog<LineaInvestigacion>(x => x.Nombre)).ToArray();
        }

        public LineaInvestigacion[] GetActiveLineaInvestigaciones()
        {
            return ((List<LineaInvestigacion>) OrderCatalog<LineaInvestigacion>(x => x.Nombre, true)).ToArray();
        }

        public void SaveLineaInvestigacion(LineaInvestigacion lineaInvestigacion)
        {
            if (lineaInvestigacion.Id == 0)
            {
                lineaInvestigacion.Activo = true;
                lineaInvestigacion.CreadoEl = DateTime.Now;
            }
            lineaInvestigacion.ModificadoEl = DateTime.Now;

            lineaInvestigacionRepository.SaveOrUpdate(lineaInvestigacion);
        }

        public TipoActividad GetTipoActividadById(int id)
        {
            return tipoActividadRepository.Get(id);
        }

        public TipoActividad[] GetAllTipoActividades()
        {
            return ((List<TipoActividad>) OrderCatalog<TipoActividad>(x => x.Nombre)).ToArray();
        }

        public TipoActividad[] GetActiveActividades()
        {
            return ((List<TipoActividad>) OrderCatalog<TipoActividad>(x => x.Nombre, true)).ToArray();
        }

        public void SaveTipoActividad(TipoActividad tipoActividad)
        {
            if (tipoActividad.Id == 0)
            {
                tipoActividad.Activo = true;
                tipoActividad.CreadoEl = DateTime.Now;
            }
            tipoActividad.ModificadoEl = DateTime.Now;

            tipoActividadRepository.SaveOrUpdate(tipoActividad);
        }

        public Area GetAreaById(int id)
        {
            return areaRepository.Get(id);
        }

        public Area[] GetAllAreas()
        {
            return ((List<Area>) OrderCatalog<Area>(x => x.Nombre)).ToArray();
        }

        public Area[] GetActiveAreas()
        {
            return ((List<Area>) OrderCatalog<Area>(x => x.Nombre, true)).ToArray();
        }

        public void SaveArea(Area area)
        {
            if (area.Id == 0)
            {
                area.Activo = true;
                area.CreadoEl = DateTime.Now;
            }
            area.ModificadoEl = DateTime.Now;

            areaRepository.SaveOrUpdate(area);
        }

        public Disciplina GetDisciplinaById(int id)
        {
            return disciplinaRepository.Get(id);
        }

        public Disciplina[] GetAllDisciplinas()
        {
            return ((List<Disciplina>) OrderCatalog<Disciplina>(x => x.Nombre)).ToArray();
        }

        public Disciplina[] GetActiveDisciplinas()
        {
            return ((List<Disciplina>) OrderCatalog<Disciplina>(x => x.Nombre, true)).ToArray();
        }

        public void SaveDisciplina(Disciplina disciplina)
        {
            if (disciplina.Id == 0)
            {
                disciplina.Activo = true;
                disciplina.CreadoEl = DateTime.Now;
            }
            disciplina.ModificadoEl = DateTime.Now;

            disciplinaRepository.SaveOrUpdate(disciplina);
        }

        public Disciplina[] GetDisciplinasByAreaId(int id)
        {
            return ((List<Disciplina>) FilterCatalogOptions<Disciplina>(x => x.Nombre, id, "Area")).ToArray();
        }

        public Subdisciplina GetSubdisciplinaById(int id)
        {
            return subdisciplinaRepository.Get(id);
        }

        public Subdisciplina[] GetAllSubdisciplinas()
        {
            return ((List<Subdisciplina>) OrderCatalog<Subdisciplina>(x => x.Nombre)).ToArray();
        }

        public Subdisciplina[] GetActiveSubdisciplinas()
        {
            return ((List<Subdisciplina>) OrderCatalog<Subdisciplina>(x => x.Nombre, true)).ToArray();
        }

        public void SaveSubdisciplina(Subdisciplina subdisciplina)
        {
            if (subdisciplina.Id == 0)
            {
                subdisciplina.Activo = true;
                subdisciplina.CreadoEl = DateTime.Now;
            }
            subdisciplina.ModificadoEl = DateTime.Now;

            subdisciplinaRepository.SaveOrUpdate(subdisciplina);
        }

        public Subdisciplina[] GetSubdisciplinasByDisciplinaId(int id)
        {
            return ((List<Subdisciplina>)FilterCatalogOptions<Subdisciplina>(x => x.Nombre, id, "Disciplina")).ToArray();
        }

        public LineaTematica GetLineaTematicaById(int id)
        {
            return lineaTematicaRepository.Get(id);
        }

        public LineaTematica[] GetAllLineaTematicas()
        {
            return ((List<LineaTematica>) OrderCatalog<LineaTematica>(x => x.Nombre)).ToArray();
        }

        public LineaTematica[] GetActiveLineaTematicas()
        {
            return ((List<LineaTematica>) OrderCatalog<LineaTematica>(x => x.Nombre, true)).ToArray();
        }

        public void SaveLineaTematica(LineaTematica lineaTematica)
        {
            if (lineaTematica.Id == 0)
            {
                lineaTematica.Activo = true;
                lineaTematica.CreadoEl = DateTime.Now;
            }
            lineaTematica.ModificadoEl = DateTime.Now;

            lineaTematicaRepository.SaveOrUpdate(lineaTematica);
        }

        public TipoParticipacion GetTipoParticipacionById(int id)
        {
            return tipoParticipacionRepository.Get(id);
        }

        public TipoParticipacion[] GetAllTipoParticipaciones()
        {
            return ((List<TipoParticipacion>) OrderCatalog<TipoParticipacion>(x => x.Nombre)).ToArray();
        }

        public TipoParticipacion[] GetActiveTipoParticipaciones()
        {
            return ((List<TipoParticipacion>) OrderCatalog<TipoParticipacion>(x => x.Nombre, true)).ToArray();
        }

        public void SaveTipoParticipacion(TipoParticipacion tipoParticipacion)
        {
            if (tipoParticipacion.Id == 0)
            {
                tipoParticipacion.Activo = true;
                tipoParticipacion.CreadoEl = DateTime.Now;
            }
            tipoParticipacion.ModificadoEl = DateTime.Now;

            tipoParticipacionRepository.SaveOrUpdate(tipoParticipacion);
        }

        public TipoParticipacion[] GetTipoParticipacionCapitulos()
        {
            var tipoParticipacionList = Session.CreateCriteria(typeof(TipoParticipacion))
                .Add(Expression.Eq("Tipo", 1))
                .Add(Restrictions.Eq("Activo", true))
                .List<TipoParticipacion>();

            return ((List<TipoParticipacion>) tipoParticipacionList).ToArray();
        }

        public TipoParticipacion[] GetTipoParticipacionEventos()
        {
            var tipoParticipacionList = Session.CreateCriteria(typeof(TipoParticipacion))
                .Add(Expression.Eq("Tipo", 2))
                .Add(Restrictions.Eq("Activo", true))
                .List<TipoParticipacion>();

            return ((List<TipoParticipacion>)tipoParticipacionList).ToArray();
        }

        public TipoParticipacion[] GetTipoParticipacionParticipacionMedios()
        {
            var tipoParticipacionList = Session.CreateCriteria(typeof(TipoParticipacion))
                .Add(Expression.Eq("Tipo", 3))
                .Add(Restrictions.Eq("Activo", true))
                .List<TipoParticipacion>();

            return ((List<TipoParticipacion>)tipoParticipacionList).ToArray();
        }

        public RevistaPublicacion GetRevistaPublicacionById(int id)
        {
            return revistaPublicacionRepository.Get(id);
        }

        public RevistaPublicacion[] GetAllRevistaPublicaciones()
        {
            return ((List<RevistaPublicacion>) OrderCatalog<RevistaPublicacion>(x => x.Titulo)).ToArray();
        }

        public RevistaPublicacion[] GetActiveRevistaPublicaciones()
        {
            return ((List<RevistaPublicacion>) OrderCatalog<RevistaPublicacion>(x => x.Titulo, true)).ToArray();
        }

        public void SaveRevistaPublicacion(RevistaPublicacion revistaPublicacion)
        {
            if (revistaPublicacion.Id == 0)
            {
                revistaPublicacion.Activo = true;
                revistaPublicacion.CreadoEl = DateTime.Now;
                revistaPublicacion.Puntuacion = 0.0m;
            }

            revistaPublicacion.ModificadoEl = DateTime.Now;

            revistaPublicacionRepository.SaveOrUpdate(revistaPublicacion);
        }

        public Nivel[] GetNivelesByOrganizacionId(int id)
        {
            return ((List<Nivel>)FilterCatalogOptions<Nivel>(x => x.Nombre, id, "Organizacion")).ToArray();
        }

        public ProgramaEstudio GetProgramaEstudioById(int id)
        {
            return programaEstudioRepository.Get(id);
        }

        public ProgramaEstudio[] GetAllProgramaEstudios()
        {
            return ((List<ProgramaEstudio>) OrderCatalog<ProgramaEstudio>(x => x.Nombre)).ToArray();
        }

        public ProgramaEstudio[] GetActiveProgramaEstudios()
        {
            return ((List<ProgramaEstudio>) OrderCatalog<ProgramaEstudio>(x => x.Nombre, true)).ToArray();
        }

        public void SaveProgramaEstudio(ProgramaEstudio programaEstudio)
        {
            if (programaEstudio.Id == 0)
            {
                programaEstudio.Activo = true;
                programaEstudio.CreadoEl = DateTime.Now;
            }
            programaEstudio.ModificadoEl = DateTime.Now;

            programaEstudioRepository.SaveOrUpdate(programaEstudio);
        }

        public Sector GetSectorById(int id)
        {
            return sectorRepository.Get(id);
        }

        public Sector[] GetAllSectores()
        {
            return ((List<Sector>) OrderCatalog<Sector>(x => x.Nombre)).ToArray();
        }

        public Sector[] GetActiveSectores()
        {
            var sectorList = Session.CreateCriteria(typeof (Sector))
                .Add(Expression.Eq("TipoSector", 0))
                .Add(Restrictions.Eq("Activo", true))
                .List<Sector>();

            return ((List<Sector>) sectorList).ToArray();
        }

        public void SaveSector(Sector sector)
        {
            if (sector.Id == 0)
            {
                sector.Activo = true;
                sector.CreadoEl = DateTime.Now;
            }
            sector.ModificadoEl = DateTime.Now;

            sectorRepository.SaveOrUpdate(sector);
        }

        public Sector[] GetActiveSectoresEconomicos()
        {
            var sectorList = Session.CreateCriteria(typeof (Sector))
                .Add(Expression.Eq("TipoSector", 1))
                .Add(Restrictions.Eq("Activo", true))
                .List<Sector>();

            return ((List<Sector>) sectorList).ToArray();
        }

        public Sector[] GetActiveSectoresFinanciamientos()
        {
            var sectorList = Session.CreateCriteria(typeof (Sector))
                .Add(Expression.Eq("TipoSector", 2))
                .Add(Restrictions.Eq("Activo", true))
                .List<Sector>();

            return ((List<Sector>) sectorList).ToArray();
        }

        public Sector[] GetActiveSectoresOrganosExternos()
        {
            var sectorList = Session.CreateCriteria(typeof(Sector))
                .Add(Expression.Eq("TipoSector", 3))
                .Add(Restrictions.Eq("Activo", true))
                .List<Sector>();

            return ((List<Sector>)sectorList).ToArray();
        }

        public Nivel GetNivelById(int id)
        {
            return nivelRepository.Get(id);
        }

        public Nivel[] GetAllNiveles()
        {
            return ((List<Nivel>) OrderCatalog<Nivel>(x => x.Nombre)).ToArray();
        }

        public Nivel[] GetActiveNiveles()
        {
            return ((List<Nivel>) OrderCatalog<Nivel>(x => x.Nombre, true)).ToArray();
        }

        public void SaveNivel(Nivel nivel)
        {
            if (nivel.Id == 0)
            {
                nivel.Activo = true;
                nivel.CreadoEl = DateTime.Now;
            }
            nivel.ModificadoEl = DateTime.Now;

            nivelRepository.SaveOrUpdate(nivel);
        }

        public Organizacion GetOrganizacionById(int id)
        {
            return organizacionRepository.Get(id);
        }

        public Organizacion[] GetAllOrganizaciones()
        {
            return ((List<Organizacion>) OrderCatalog<Organizacion>(x => x.Nombre)).ToArray();
        }

        public Organizacion[] GetActiveOrganizaciones()
        {
            return ((List<Organizacion>) OrderCatalog<Organizacion>(x => x.Nombre, true)).ToArray();
        }

        public void SaveOrganizacion(Organizacion organizacion)
        {
            if (organizacion.Id == 0)
            {
                organizacion.Activo = true;
                organizacion.CreadoEl = DateTime.Now;
            }
            organizacion.ModificadoEl = DateTime.Now;

            organizacionRepository.SaveOrUpdate(organizacion);
        }

        public Organizacion[] GetOrganizacionesBySectorId(int id)
        {
            return ((List<Organizacion>) FilterCatalogOptions<Organizacion>(x => x.Nombre, id, "Sector")).ToArray();
        }

        public Dependencia GetDependenciaById(int id)
        {
            return dependenciaRepository.Get(id);
        }

        public Dependencia[] GetAllDependencias()
        {
            return ((List<Dependencia>) OrderCatalog<Dependencia>(x => x.Nombre)).ToArray();
        }

        public Dependencia[] GetActiveDependencias()
        {
            return ((List<Dependencia>) OrderCatalog<Dependencia>(x => x.Nombre, true)).ToArray();
        }

        public void SaveDependencia(Dependencia dependencia)
        {
            if (dependencia.Id == 0)
            {
                dependencia.Activo = true;
                dependencia.CreadoEl = DateTime.Now;
            }
            dependencia.ModificadoEl = DateTime.Now;

            dependenciaRepository.SaveOrUpdate(dependencia);
        }

        public Ambito GetAmbitoById(int id)
        {
            return ambitoRepository.Get(id);
        }

        public Ambito[] GetAllAmbitos()
        {
            return ((List<Ambito>) OrderCatalog<Ambito>(x => x.Nombre)).ToArray();
        }

        public Ambito[] GetActiveAmbitos()
        {
            return ((List<Ambito>) OrderCatalog<Ambito>(x => x.Nombre, true)).ToArray();
        }

        public void SaveAmbito(Ambito ambito)
        {
            if (ambito.Id == 0)
            {
                ambito.Activo = true;
                ambito.CreadoEl = DateTime.Now;
            }
            ambito.ModificadoEl = DateTime.Now;

            ambitoRepository.SaveOrUpdate(ambito);
        }

        public EstadoPais GetEstadoPaisById(int id)
        {
            return estadoPaisRepository.Get(id);
        }

        public EstadoPais[] GetAllEstadoPaises()
        {
            return ((List<EstadoPais>) OrderCatalog<EstadoPais>(x => x.Nombre)).ToArray();
        }

        public EstadoPais[] GetActiveEstadoPaises()
        {
            return ((List<EstadoPais>) OrderCatalog<EstadoPais>(x => x.Nombre, true)).ToArray();
        }

        public void SaveEstadoPais(EstadoPais estadoPais)
        {
            if (estadoPais.Id == 0)
            {
                estadoPais.Activo = true;
                estadoPais.CreadoEl = DateTime.Now;
            }
            estadoPais.ModificadoEl = DateTime.Now;

            estadoPaisRepository.SaveOrUpdate(estadoPais);
        }

        public EstadoPais[] GetEstadoPaisesByPaisId(int id)
        {
            return ((List<EstadoPais>) FilterCatalogOptions<EstadoPais>(x => x.Nombre, id, "Pais")).ToArray();
        }

        public MedioElectronico GetMedioElectronicoById(int id)
        {
            return medioElectronicoRepository.Get(id);
        }

        public MedioElectronico[] GetAllMedioElectronicos()
        {
            return ((List<MedioElectronico>) OrderCatalog<MedioElectronico>(x => x.Nombre)).ToArray();
        }

        public MedioElectronico[] GetActiveMedioElectronicos()
        {
            return ((List<MedioElectronico>) OrderCatalog<MedioElectronico>(x => x.Nombre, true)).ToArray();
        }

        public void SaveMedioElectronico(MedioElectronico medioElectronico)
        {
            if (medioElectronico.Id == 0)
            {
                medioElectronico.Activo = true;
                medioElectronico.CreadoEl = DateTime.Now;
            }
            medioElectronico.ModificadoEl = DateTime.Now;

            medioElectronicoRepository.SaveOrUpdate(medioElectronico);
        }

        public MedioImpreso GetMedioImpresoById(int id)
        {
            return medioImpresoRepository.Get(id);
        }

        public MedioImpreso[] GetAllMedioImpresos()
        {
            return ((List<MedioImpreso>) OrderCatalog<MedioImpreso>(x => x.Nombre)).ToArray();
        }

        public MedioImpreso[] GetActiveMedioImpresos()
        {
            return ((List<MedioImpreso>) OrderCatalog<MedioImpreso>(x => x.Nombre, true)).ToArray();
        }

        public void SaveMedioImpreso(MedioImpreso medioImpreso)
        {
            if (medioImpreso.Id == 0)
            {
                medioImpreso.Activo = true;
                medioImpreso.CreadoEl = DateTime.Now;
            }
            medioImpreso.ModificadoEl = DateTime.Now;

            medioImpresoRepository.SaveOrUpdate(medioImpreso);
        }

        public TipoDictamen GetTipoDictamenById(int id)
        {
            return tipoDictamenRepository.Get(id);
        }

        public TipoDictamen[] GetAllTipoDictamenes()
        {
            return ((List<TipoDictamen>) OrderCatalog<TipoDictamen>(x => x.Nombre)).ToArray();
        }

        public TipoDictamen[] GetActiveTipoDictamenes()
        {
            return ((List<TipoDictamen>) OrderCatalog<TipoDictamen>(x => x.Nombre, true)).ToArray();
        }

        public void SaveTipoDictamen(TipoDictamen tipoDictamen)
        {
            if (tipoDictamen.Id == 0)
            {
                tipoDictamen.Activo = true;
                tipoDictamen.CreadoEl = DateTime.Now;
            }
            tipoDictamen.ModificadoEl = DateTime.Now;

            tipoDictamenRepository.SaveOrUpdate(tipoDictamen);
        }

        public TipoDistincion GetTipoDistincionById(int id)
        {
            return tipoDistincionRepository.Get(id);
        }

        public TipoDistincion[] GetAllTipoDistinciones()
        {
            return ((List<TipoDistincion>) OrderCatalog<TipoDistincion>(x => x.Nombre)).ToArray();
        }

        public TipoDistincion[] GetActiveTipoDistinciones()
        {
            return ((List<TipoDistincion>) OrderCatalog<TipoDistincion>(x => x.Nombre, true)).ToArray();
        }

        public void SaveTipoDistincion(TipoDistincion tipoDistincion)
        {
            if (tipoDistincion.Id == 0)
            {
                tipoDistincion.Activo = true;
                tipoDistincion.CreadoEl = DateTime.Now;
            }
            tipoDistincion.ModificadoEl = DateTime.Now;

            tipoDistincionRepository.SaveOrUpdate(tipoDistincion);
        }

        public TipoEvento GetTipoEventoById(int id)
        {
            return tipoEventoRepository.Get(id);
        }

        public TipoEvento[] GetAllTipoEventos()
        {
            return ((List<TipoEvento>) OrderCatalog<TipoEvento>(x => x.Nombre)).ToArray();
        }

        public TipoEvento[] GetActiveTipoEventos()
        {
            return ((List<TipoEvento>) OrderCatalog<TipoEvento>(x => x.Nombre, true)).ToArray();
        }

        public void SaveTipoEvento(TipoEvento tipoEvento)
        {
            if (tipoEvento.Id == 0)
            {
                tipoEvento.Activo = true;
                tipoEvento.CreadoEl = DateTime.Now;
            }
            tipoEvento.ModificadoEl = DateTime.Now;

            tipoEventoRepository.SaveOrUpdate(tipoEvento);
        }

        public TipoOrgano GetTipoOrganoById(int id)
        {
            return tipoOrganoRepository.Get(id);
        }

        public TipoOrgano[] GetAllTipoOrganos()
        {
            return ((List<TipoOrgano>) OrderCatalog<TipoOrgano>(x => x.Nombre)).ToArray();
        }

        public TipoOrgano[] GetActiveTipoOrganos()
        {
            return ((List<TipoOrgano>) OrderCatalog<TipoOrgano>(x => x.Nombre, true)).ToArray();
        }

        public void SaveTipoOrgano(TipoOrgano tipoOrgano)
        {
            if (tipoOrgano.Id == 0)
            {
                tipoOrgano.Activo = true;
                tipoOrgano.CreadoEl = DateTime.Now;
            }
            tipoOrgano.ModificadoEl = DateTime.Now;

            tipoOrganoRepository.SaveOrUpdate(tipoOrgano);
        }

        public NivelEstudio GetNivelEstudioById(int id)
        {
            return nivelEstudioRepository.Get(id);
        }

        public NivelEstudio[] GetAllNivelEstudios()
        {
            return ((List<NivelEstudio>) OrderCatalog<NivelEstudio>(x => x.Nombre)).ToArray();
        }

        public NivelEstudio[] GetActiveNivelEstudios()
        {
            return ((List<NivelEstudio>) OrderCatalog<NivelEstudio>(x => x.Nombre, true)).ToArray();
        }

        public void SaveNivelEstudio(NivelEstudio nivelEstudio)
        {
            if (nivelEstudio.Id == 0)
            {
                nivelEstudio.Activo = true;
                nivelEstudio.CreadoEl = DateTime.Now;
            }
            nivelEstudio.ModificadoEl = DateTime.Now;

            nivelEstudioRepository.SaveOrUpdate(nivelEstudio);
        }

        public TipoProyecto GetTipoProyectoById(int id)
        {
            return tipoProyectoRepository.Get(id);
        }

        public TipoProyecto[] GetAllTipoProyectos()
        {
            return ((List<TipoProyecto>) OrderCatalog<TipoProyecto>(x => x.Nombre)).ToArray();
        }

        public TipoProyecto[] GetActiveTipoProyectos()
        {
            return ((List<TipoProyecto>) OrderCatalog<TipoProyecto>(x => x.Nombre, true)).ToArray();
        }

        public void SaveTipoProyecto(TipoProyecto tipoProyecto)
        {
            if (tipoProyecto.Id == 0)
            {
                tipoProyecto.Activo = true;
                tipoProyecto.CreadoEl = DateTime.Now;
            }
            tipoProyecto.ModificadoEl = DateTime.Now;

            tipoProyectoRepository.SaveOrUpdate(tipoProyecto);
        }

        public TipoEstancia GetTipoEstanciaById(int id)
        {
            return tipoEstanciaRepository.Get(id);
        }

        public TipoEstancia[] GetAllTipoEstancias()
        {
            return ((List<TipoEstancia>) OrderCatalog<TipoEstancia>(x => x.Nombre)).ToArray();
        }

        public TipoEstancia[] GetActiveTipoEstancias()
        {
            return ((List<TipoEstancia>) OrderCatalog<TipoEstancia>(x => x.Nombre, true)).ToArray();
        }

        public void SaveTipoEstancia(TipoEstancia tipoEstancia)
        {
            if (tipoEstancia.Id == 0)
            {
                tipoEstancia.Activo = true;
                tipoEstancia.CreadoEl = DateTime.Now;
            }
            tipoEstancia.ModificadoEl = DateTime.Now;

            tipoEstanciaRepository.SaveOrUpdate(tipoEstancia);
        }

        public Rama[] GetRamasBySectorId(int id)
        {
            return ((List<Rama>) FilterCatalogOptions<Rama>(x => x.Nombre, id, "Sector")).ToArray();
        }

        public TipoApoyo GetTipoApoyoById(int id)
        {
            return tipoApoyoRepository.Get(id);
        }

        public TipoApoyo[] GetAllTipoApoyos()
        {
            return ((List<TipoApoyo>) OrderCatalog<TipoApoyo>(x => x.Nombre)).ToArray();
        }

        public TipoApoyo[] GetActiveTipoApoyos()
        {
            return ((List<TipoApoyo>) OrderCatalog<TipoApoyo>(x => x.Nombre, true)).ToArray();
        }

        public void SaveTipoApoyo(TipoApoyo tipoApoyo)
        {
            if (tipoApoyo.Id == 0)
            {
                tipoApoyo.Activo = true;
                tipoApoyo.CreadoEl = DateTime.Now;
            }
            tipoApoyo.ModificadoEl = DateTime.Now;

            tipoApoyoRepository.SaveOrUpdate(tipoApoyo);
        }

        public SubprogramaConacyt GetSubprogramaConacytById(int id)
        {
            return subprogramaConacytRepository.Get(id);
        }

        public SubprogramaConacyt[] GetAllSubprogramasConacyt()
        {
            return ((List<SubprogramaConacyt>) OrderCatalog<SubprogramaConacyt>(x => x.Nombre)).ToArray();
        }

        public SubprogramaConacyt[] GetActiveSubprogramasConacyt()
        {
            return ((List<SubprogramaConacyt>)OrderCatalog<SubprogramaConacyt>(x => x.Nombre, true)).ToArray();
        }

        public void SaveSubprogramaConacyt(SubprogramaConacyt subprogramaConacyt)
        {
            if (subprogramaConacyt.Id == 0)
            {
                subprogramaConacyt.Activo = true;
                subprogramaConacyt.CreadoEl = DateTime.Now;
            }
            subprogramaConacyt.ModificadoEl = DateTime.Now;

            subprogramaConacytRepository.SaveOrUpdate(subprogramaConacyt);
        }

        public Clase[] GetClasesByRamaId(int id)
        {
            return ((List<Clase>)FilterCatalogOptions<Clase>(x => x.Nombre, id, "Rama")).ToArray();
        }

        public Rama GetRamaById(int id)
        {
            return ramaRepository.Get(id);
        }

        public Rama[] GetAllRamas()
        {
            return ((List<Rama>) OrderCatalog<Rama>(x => x.Nombre)).ToArray();
        }

        public Rama[] GetActiveRamas()
        {
            return ((List<Rama>) OrderCatalog<Rama>(x => x.Nombre, true)).ToArray();
        }

        public void SaveRama(Rama rama)
        {
            if (rama.Id == 0)
            {
                rama.Activo = true;
                rama.CreadoEl = DateTime.Now;
            }
            rama.ModificadoEl = DateTime.Now;

            ramaRepository.SaveOrUpdate(rama);
        }

        public Clase GetClaseById(int id)
        {
            return claseRepository.Get(id);
        }

        public Clase[] GetAllClases()
        {
            return ((List<Clase>) OrderCatalog<Clase>(x => x.Nombre)).ToArray();
        }

        public Clase[] GetActiveClases()
        {
            return ((List<Clase>) OrderCatalog<Clase>(x => x.Nombre, true)).ToArray();
        }

        public void SaveClase(Clase clase)
        {
            if (clase.Id == 0)
            {
                clase.Activo = true;
                clase.CreadoEl = DateTime.Now;
            }
            clase.ModificadoEl = DateTime.Now;

            claseRepository.SaveOrUpdate(clase);
        }

        public Moneda GetMonedaById(int id)
        {
            return monedaRepository.Get(id);
        }

        public Moneda[] GetAllMonedas()
        {
            return ((List<Moneda>) OrderCatalog<Moneda>(x => x.Nombre)).ToArray();
        }

        public Moneda[] GetActiveMonedas()
        {
            return ((List<Moneda>) OrderCatalog<Moneda>(x => x.Nombre, true)).ToArray();
        }

        public void SaveMoneda(Moneda moneda)
        {
            if (moneda.Id == 0)
            {
                moneda.Activo = true;
                moneda.CreadoEl = DateTime.Now;
            }
            moneda.ModificadoEl = DateTime.Now;

            monedaRepository.SaveOrUpdate(moneda);
        }

        public EstatusFormacionAcademica GetEstatusFormacionAcademicaById(int id)
        {
            return estatusFormacionAcademicaRepository.Get(id);
        }

        public EstatusFormacionAcademica[] GetAllEstatusFormacionAcademicas()
        {
            return ((List<EstatusFormacionAcademica>) OrderCatalog<EstatusFormacionAcademica>(x => x.Nombre)).ToArray();
        }

        public EstatusFormacionAcademica[] GetActiveEstatusFormacionAcademicas()
        {
            return
                ((List<EstatusFormacionAcademica>) OrderCatalog<EstatusFormacionAcademica>(x => x.Nombre, true)).ToArray
                    ();
        }

        public void SaveEstatusFormacionAcademica(EstatusFormacionAcademica estatusFormacionAcademica)
        {
            if (estatusFormacionAcademica.Id == 0)
            {
                estatusFormacionAcademica.Activo = true;
                estatusFormacionAcademica.CreadoEl = DateTime.Now;
            }
            estatusFormacionAcademica.ModificadoEl = DateTime.Now;

            estatusFormacionAcademicaRepository.SaveOrUpdate(estatusFormacionAcademica);
        }

        public DirigidoA GetDirigidoAById(int id)
        {
            return dirigidoARepository.Get(id);
        }

        public DirigidoA[] GetAllDirigidoAs()
        {
            return ((List<DirigidoA>) OrderCatalog<DirigidoA>(x => x.Nombre)).ToArray();
        }

        public DirigidoA[] GetActiveDirigidoAs()
        {
            return ((List<DirigidoA>) OrderCatalog<DirigidoA>(x => x.Nombre, true)).ToArray();
        }

        public void SaveDirigidoA(DirigidoA dirigidoA)
        {
            if (dirigidoA.Id == 0)
            {
                dirigidoA.Activo = true;
                dirigidoA.CreadoEl = DateTime.Now;
            }
            dirigidoA.ModificadoEl = DateTime.Now;

            dirigidoARepository.SaveOrUpdate(dirigidoA);
        }

        public FondoConacyt GetFondoConacytById(int id)
        {
            return fondoConacytRepository.Get(id);
        }

        public FondoConacyt[] GetAllFondoConacyts()
        {
            return ((List<FondoConacyt>) OrderCatalog<FondoConacyt>(x => x.Nombre)).ToArray();
        }

        public FondoConacyt[] GetActiveFondoConacyts()
        {
            return ((List<FondoConacyt>) OrderCatalog<FondoConacyt>(x => x.Nombre, true)).ToArray();
        }

        public void SaveFondoConacyt(FondoConacyt fondoConacyt)
        {
            if (fondoConacyt.Id == 0)
            {
                fondoConacyt.Activo = true;
                fondoConacyt.CreadoEl = DateTime.Now;
            }
            fondoConacyt.ModificadoEl = DateTime.Now;

            fondoConacytRepository.SaveOrUpdate(fondoConacyt);
        }

        public AreaTematica GetAreaTematicaById(int id)
        {
            return areaTematicaRepository.Get(id);
        }

        public AreaTematica[] GetAllAreaTematicas()
        {
            return ((List<AreaTematica>) OrderCatalog<AreaTematica>(x => x.Nombre)).ToArray();
        }

        public AreaTematica[] GetActiveAreaTematicas()
        {
            return ((List<AreaTematica>) OrderCatalog<AreaTematica>(x => x.Nombre, true)).ToArray();
        }

        public void SaveAreaTematica(AreaTematica areaTematica)
        {
            if (areaTematica.Id == 0)
            {
                areaTematica.Activo = true;
                areaTematica.CreadoEl = DateTime.Now;
            }
            areaTematica.ModificadoEl = DateTime.Now;

            areaTematicaRepository.SaveOrUpdate(areaTematica);
        }

        public AreaTematica[] GetAreaTematicasByLineaTematicaId(int id)
        {
            return
                ((List<AreaTematica>) FilterCatalogOptions<AreaTematica>(x => x.Nombre, id, "LineaTematica")).ToArray();
        }

        public TipoArchivo GetTipoArchivoById(int id)
        {
            return tipoArchivoRepository.Get(id);
        }

        public TipoArchivo[] GetAllTipoArchivos()
        {
            return ((List<TipoArchivo>) OrderCatalog<TipoArchivo>(x => x.Nombre)).ToArray();
        }

        public TipoArchivo[] GetActiveTipoArchivos()
        {
            return ((List<TipoArchivo>) OrderCatalog<TipoArchivo>(x => x.Nombre, true)).ToArray();
        }

        public void SaveTipoArchivo(TipoArchivo tipoArchivo)
        {
            if (tipoArchivo.Id == 0)
            {
                tipoArchivo.Activo = true;
                tipoArchivo.CreadoEl = DateTime.Now;
            }
            tipoArchivo.ModificadoEl = DateTime.Now;

            tipoArchivoRepository.SaveOrUpdate(tipoArchivo);
        }

        public Editorial GetEditorialById(int id)
        {
            return editorialRepository.Get(id);
        }

        public Editorial[] GetAllEditorials()
        {
            return ((List<Editorial>) OrderCatalog<Editorial>(x => x.Nombre)).ToArray();
        }

        public Editorial[] GetActiveEditorials()
        {
            return ((List<Editorial>) OrderCatalog<Editorial>(x => x.Nombre, true)).ToArray();
        }

        public void SaveEditorial(Editorial editorial)
        {
            if (editorial.Id == 0)
            {
                editorial.Activo = true;
                editorial.CreadoEl = DateTime.Now;
            }
            editorial.ModificadoEl = DateTime.Now;

            editorialRepository.SaveOrUpdate(editorial);
        }

        public Glosario GetGlosarioById(int id)
        {
            return glosarioRepository.Get(id);
        }

        public Glosario[] GetAllGlosarios()
        {
            return ((List<Glosario>) OrderCatalog<Glosario>(x => x.Campo)).ToArray();
        }

        public void SaveGlosario(Glosario glosario)
        {
            if(glosario.Id == 0)
            {
                glosario.Activo = true;
                glosario.CreadoEl = DateTime.Now;
            }
            glosario.ModificadoEl = DateTime.Now;

            glosarioRepository.SaveOrUpdate(glosario);
        }

        public VinculacionAPyD GetVinculacionAPyDById(int id)
        {
            return vinculacionAPyDRepository.Get(id);
        }

        public VinculacionAPyD[] GetAllVinculacionAPyDs()
        {
            return ((List<VinculacionAPyD>) OrderCatalog<VinculacionAPyD>(x => x.Nombre)).ToArray();
        }

        public VinculacionAPyD[] GetActiveVinculacionAPyDs()
        {
            return ((List<VinculacionAPyD>) OrderCatalog<VinculacionAPyD>(x => x.Nombre, true)).ToArray();
        }

        public void SaveVinculacionAPyD(VinculacionAPyD vinculacionAPyD)
        {
            if (vinculacionAPyD.Id == 0)
            {
                vinculacionAPyD.Activo = true;
                vinculacionAPyD.CreadoEl = DateTime.Now;
            }
            vinculacionAPyD.ModificadoEl = DateTime.Now;

            vinculacionAPyDRepository.SaveOrUpdate(vinculacionAPyD);
        }

        public DireccionRegional GetDireccionRegionalById(int id)
        {
            return direccionRegionalRepository.Get(id);
        }

        public DireccionRegional[] GetAllDireccionesRegionales()
        {
            return ((List<DireccionRegional>) OrderCatalog<DireccionRegional>(x => x.Nombre)).ToArray();
        }

        public DireccionRegional[] GetActiveDireccionesRegionales()
        {
            return ((List<DireccionRegional>) OrderCatalog<DireccionRegional>(x => x.Nombre, true)).ToArray();
        }

        public void SaveDireccionRegional(DireccionRegional direccionRegional)
        {
            if (direccionRegional.Id == 0)
            {
                direccionRegional.Activo = true;
                direccionRegional.CreadoEl = DateTime.Now;
            }
            direccionRegional.ModificadoEl = DateTime.Now;

            direccionRegionalRepository.SaveOrUpdate(direccionRegional);
        }

        public ConsejoComision GetConsejoComisionById(int id)
        {
            return consejoComisionRepository.Get(id);
        }

        public ConsejoComision[] GetAllConsejoComisions()
        {
            return ((List<ConsejoComision>)OrderCatalog<ConsejoComision>(x => x.Nombre)).ToArray();
        }

        public ConsejoComision[] GetActiveConsejoComisions()
        {
            return ((List<ConsejoComision>)OrderCatalog<ConsejoComision>(x => x.Nombre, true)).ToArray();
        }

        public void SaveConsejoComision(ConsejoComision consejoComision)
        {
            if (consejoComision.Id == 0)
            {
                consejoComision.Activo = true;
                consejoComision.CreadoEl = DateTime.Now;
            }
            consejoComision.ModificadoEl = DateTime.Now;

            consejoComisionRepository.SaveOrUpdate(consejoComision);
        }

        public AreaInvestigacion GetAreaInvestigacionById(int id)
        {
            return areaInvestigacionRepository.Get(id);
        }

        public AreaInvestigacion[] GetAllAreaInvestigacions()
        {
            return ((List<AreaInvestigacion>)OrderCatalog<AreaInvestigacion>(x => x.Nombre)).ToArray();
        }

        public AreaInvestigacion[] GetActiveAreaInvestigacions()
        {
            return ((List<AreaInvestigacion>)OrderCatalog<AreaInvestigacion>(x => x.Nombre, true)).ToArray();
        }

        public void SaveAreaInvestigacion(AreaInvestigacion areaInvestigacion)
        {
            if (areaInvestigacion.Id == 0)
            {
                areaInvestigacion.Activo = true;
                areaInvestigacion.CreadoEl = DateTime.Now;
            }
            areaInvestigacion.ModificadoEl = DateTime.Now;

            areaInvestigacionRepository.SaveOrUpdate(areaInvestigacion);
        }

        #endregion

        protected IList<T> OrderCatalog<T>(Expression<Func<T, object>> expression)
        {
            return OrderCatalog(expression, false);
        }

        protected IList<T> OrderCatalog<T>(Expression<Func<T, object>> expression, bool active)
        {
            var propertyInfo = ReflectionHelper.GetProperty(expression);

            var criteria = DetachedCriteria.For(typeof (T))
                .AddOrder(Order.Asc(propertyInfo.Name));

            if (active)
                criteria.Add(Restrictions.Eq("Activo", true));

            var list = criteria.GetExecutableCriteria(Session).List<T>();

            return list;
        }

        protected IList<T> FilterCatalogOptions<T>(Expression<Func<T, object>> expression, int id, string parentCombo)
        {
            var propertyInfo = ReflectionHelper.GetProperty(expression);

            var criteria = DetachedCriteria.For(typeof (T))
                .CreateAlias(parentCombo, "pc")
                .Add(Expression.Eq("pc.Id", id))
                .Add(Restrictions.Eq("Activo", true))
                .AddOrder(Order.Asc(propertyInfo.Name));


            var list = criteria.GetExecutableCriteria(Session).List<T>();

            return list;
        }
    }
}