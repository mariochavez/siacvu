using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using NHibernate;
using NHibernate.Criterion;
using SharpArch.Core.DomainModel;
using SharpArch.Core.PersistenceSupport;
using SharpArch.Data.NHibernate;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class CatalogoService : ICatalogoService
    {
        readonly IRepository<Cargo> cargoRepository;
        readonly IRepository<Departamento> departamentoRepository;
        readonly IRepository<Puesto> puestoRepository;
        readonly IRepository<Sede> sedeRepository;
        readonly IRepository<Categoria> categoriaRepository;
        readonly IRepository<GradoAcademico> gradoAcademicoRepository;
        readonly IRepository<SNI> sniRepository;
        readonly IRepository<Estado> estadoRepository;
        readonly IRepository<Idioma> idiomaRepository;
        readonly IRepository<Pais> paisRepository;
        readonly IRepository<TipoArticulo> tipoArticuloRepository;
        readonly IRepository<Institucion> institucionRepository;
        readonly IRepository<Indice> indiceRepository;
        readonly IRepository<InvestigadorExterno> investigadorExternoRepository;
        readonly IRepository<TipoParticipante> tipoParticipanteRepository;
        readonly IRepository<LineaInvestigacion> lineaInvestigacionRepository;
        readonly IRepository<TipoActividad> tipoActividadRepository;
        readonly IRepository<Area> areaRepository;
        readonly IRepository<Disciplina> disciplinaRepository;
        readonly IRepository<Subdisciplina> subdisciplinaRepository;
        readonly IRepository<LineaTematica> lineaTematicaRepository;
        readonly IRepository<CoautorExterno> coautorExternoRepository;
        readonly IRepository<FormaParticipacion> formaParticipacionRepository;
        readonly IRepository<ResponsableExterno> responsableExternoRepository;
        readonly IRepository<TipoCapitulo> tipoCapituloRepository;
        readonly IRepository<TipoParticipacion> tipoParticipacionRepository;
        readonly IRepository<PeriodoReferencia> periodoReferenciaRepository;
        readonly IRepository<RevistaPublicacion> revistaPublicacionRepository;
        readonly IRepository<Organizacion> organizacionRepository;
        readonly IRepository<Dependencia> dependenciaRepository;

        public CatalogoService(IRepository<Cargo> cargoRepository,
            IRepository<Departamento> departamentoRepository,
            IRepository<Puesto> puestoRepository,
            IRepository<Sede> sedeRepository,
            IRepository<Categoria> categoriaRepository,
            IRepository<GradoAcademico> gradoAcademicoRepository,
            IRepository<SNI> sniRepository,
            IRepository<Estado> estadoRepository,
            IRepository<Idioma> idiomaRepository,
            IRepository<Pais> paisRepository,
            IRepository<TipoArticulo> tipoArticuloRepository,
            IRepository<Institucion> institucionRepository,
            IRepository<Indice> indiceRepository,
            IRepository<InvestigadorExterno> investigadorExternoRepository,
            IRepository<TipoParticipante> tipoParticipanteRepository,
            IRepository<LineaInvestigacion> lineaInvestigacionRepository,
            IRepository<TipoActividad> tipoActividadRepository,
            IRepository<Area> areaRepository,
            IRepository<Disciplina> disciplinaRepository,
            IRepository<Subdisciplina> subdisciplinaRepository,
            IRepository<LineaTematica> lineaTematicaRepository,
            IRepository<CoautorExterno> coautorExternoRepository,
            IRepository<FormaParticipacion> formaParticipacionRepository,
            IRepository<ResponsableExterno> responsableExternoRepository,
            IRepository<TipoCapitulo> tipoCapituloRepository,
            IRepository<TipoParticipacion> tipoParticipacionRepository,
            IRepository<PeriodoReferencia> periodoReferenciaRepository,
            IRepository<RevistaPublicacion> revistaPublicacionRepository,
            IRepository<Organizacion> organizacionRepository,
            IRepository<Dependencia> dependenciaRepository)
        {
            this.cargoRepository = cargoRepository;
            this.departamentoRepository = departamentoRepository;
            this.puestoRepository = puestoRepository;
            this.sedeRepository = sedeRepository;
            this.categoriaRepository = categoriaRepository;
            this.gradoAcademicoRepository = gradoAcademicoRepository;
            this.sniRepository = sniRepository;
            this.estadoRepository = estadoRepository;
            this.idiomaRepository = idiomaRepository;
            this.paisRepository = paisRepository;
            this.tipoArticuloRepository = tipoArticuloRepository;
            this.institucionRepository = institucionRepository;
            this.indiceRepository = indiceRepository;
            this.investigadorExternoRepository = investigadorExternoRepository;
            this.tipoParticipanteRepository = tipoParticipanteRepository;
            this.lineaInvestigacionRepository = lineaInvestigacionRepository;
            this.tipoActividadRepository = tipoActividadRepository;
            this.areaRepository = areaRepository;
            this.disciplinaRepository = disciplinaRepository;
            this.subdisciplinaRepository = subdisciplinaRepository;
            this.lineaTematicaRepository = lineaTematicaRepository;
            this.coautorExternoRepository = coautorExternoRepository;
            this.formaParticipacionRepository = formaParticipacionRepository;
            this.responsableExternoRepository = responsableExternoRepository;
            this.tipoCapituloRepository = tipoCapituloRepository;
            this.tipoParticipacionRepository = tipoParticipacionRepository;
            this.periodoReferenciaRepository = periodoReferenciaRepository;
            this.revistaPublicacionRepository = revistaPublicacionRepository;
            this.organizacionRepository = organizacionRepository;
            this.dependenciaRepository = dependenciaRepository;
        }

        protected virtual ISession Session
        {
            get
            {
                string factoryKey = SessionFactoryAttribute.GetKeyFrom(this);
                return NHibernateSession.CurrentFor(factoryKey);
            }
        }

        protected IList<T> OrderCatalog<T>()
        {
            return OrderCatalog<T>(null);
        }

        protected IList<T> OrderCatalog<T>(string campo)
        {
            campo = campo ?? "Nombre";

            var list = Session.CreateCriteria(typeof(T))
                .AddOrder(Order.Asc(campo))
                .List<T>();

            return list;
        }

        public Cargo GetCargoById(int id)
        {
            return cargoRepository.Get(id);
        }

        public Cargo[] GetAllCargos()
        {
            return ((List<Cargo>)OrderCatalog<Cargo>()).ToArray();
        }

        public Cargo[] GetActiveCargos()
        {
            return ((List<Cargo>)cargoRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveCargo(Cargo cargo)
        {
            if (cargo.Id == 0)
            {
                cargo.Activo = true;
                cargo.CreadorEl = DateTime.Now;
            }
            cargo.ModificadoEl = DateTime.Now;

            cargoRepository.SaveOrUpdate(cargo);
        }

        public Departamento GetDepartamentoById(int id)
        {
            return departamentoRepository.Get(id);
        }

        public Departamento[] GetAllDepartamentos()
        {
            return ((List<Departamento>)OrderCatalog<Departamento>()).ToArray();
        }

        public Departamento[] GetActiveDepartamentos()
        {
            return ((List<Departamento>)departamentoRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveDepartamento(Departamento departamento)
        {
            if (departamento.Id == 0)
            {
                departamento.Activo = true;
                departamento.CreadorEl = DateTime.Now;
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
            return ((List<Puesto>)OrderCatalog<Puesto>()).ToArray();
        }

        public Puesto[] GetActivePuestos()
        {
            return ((List<Puesto>)puestoRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SavePuesto(Puesto puesto)
        {
            if (puesto.Id == 0)
            {
                puesto.Activo = true;
                puesto.CreadorEl = DateTime.Now;
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
            return ((List<Sede>)OrderCatalog<Sede>()).ToArray();
        }

        public Sede[] GetActiveSedes()
        {
            return ((List<Sede>)sedeRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveSede(Sede sede)
        {
            if (sede.Id == 0)
            {
                sede.Activo = true;
                sede.CreadorEl = DateTime.Now;
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
            return ((List<Categoria>)OrderCatalog<Categoria>()).ToArray();
        }

        public Categoria[] GetActiveCategorias()
        {
            return ((List<Categoria>)categoriaRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveCategoria(Categoria categoria)
        {
            if (categoria.Id == 0)
            {
                categoria.Activo = true;
                categoria.CreadorEl = DateTime.Now;
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
            return ((List<GradoAcademico>)OrderCatalog<GradoAcademico>()).ToArray();
        }

        public GradoAcademico[] GetActiveGrados()
        {
            return ((List<GradoAcademico>)gradoAcademicoRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveGradoAcademico(GradoAcademico gradoAcademico)
        {
            if (gradoAcademico.Id == 0)
            {
                gradoAcademico.Activo = true;
                gradoAcademico.CreadorEl = DateTime.Now;
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
            return ((List<SNI>)OrderCatalog<SNI>()).ToArray();
        }

        public SNI[] GetActiveSNIs()
        {
            return ((List<SNI>)sniRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveSNI(SNI sni)
        {
            if (sni.Id == 0)
            {
                sni.Activo = true;
                sni.CreadorEl = DateTime.Now;
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
            return ((List<Estado>)OrderCatalog<Estado>()).ToArray();
        }

        public Estado[] GetActiveEstados()
        {
            return ((List<Estado>)estadoRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveEstado(Estado estado)
        {
            if (estado.Id == 0)
            {
                estado.Activo = true;
                estado.CreadorEl = DateTime.Now;
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
            return ((List<Idioma>)OrderCatalog<Idioma>()).ToArray();
        }

        public Idioma[] GetActiveIdiomas()
        {
            return ((List<Idioma>)idiomaRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveIdioma(Idioma idioma)
        {
            if (idioma.Id == 0)
            {
                idioma.Activo = true;
                idioma.CreadorEl = DateTime.Now;
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
            return ((List<Pais>)OrderCatalog<Pais>()).ToArray();
        }

        public Pais[] GetActivePaises()
        {
            return ((List<Pais>)paisRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SavePais(Pais pais)
        {
            if (pais.Id == 0)
            {
                pais.Activo = true;
                pais.CreadorEl = DateTime.Now;
            }
            pais.ModificadoEl = DateTime.Now;

            paisRepository.SaveOrUpdate(pais);
        }

        public TipoArticulo GetTipoArticuloById(int id)
        {
            return tipoArticuloRepository.Get(id);
        }

        public TipoArticulo[] GetAllTipoArticulos()
        {
            return ((List<TipoArticulo>)OrderCatalog<TipoArticulo>()).ToArray();
        }

        public TipoArticulo[] GetActiveArticulos()
        {
            return ((List<TipoArticulo>)tipoArticuloRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveTipoArticulo(TipoArticulo tipoArticulo)
        {
            if (tipoArticulo.Id == 0)
            {
                tipoArticulo.Activo = true;
                tipoArticulo.CreadorEl = DateTime.Now;
            }
            tipoArticulo.ModificadoEl = DateTime.Now;

            tipoArticuloRepository.SaveOrUpdate(tipoArticulo);
        }

        public Institucion GetInstitucionById(int id)
        {
            return institucionRepository.Get(id);
        }

        public Institucion[] GetAllInstituciones()
        {
            return ((List<Institucion>)OrderCatalog<Institucion>()).ToArray();
        }

        public Institucion[] GetActiveInstituciones()
        {
            return ((List<Institucion>)institucionRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveInstitucion(Institucion institucion)
        {
            if (institucion.Id == 0)
            {
                institucion.Activo = true;
                institucion.CreadorEl = DateTime.Now;
            }
            institucion.ModificadoEl = DateTime.Now;

            institucionRepository.SaveOrUpdate(institucion);
        }

        public Indice GetIndiceById(int id)
        {
            return indiceRepository.Get(id);
        }

        public Indice[] GetAllIndices()
        {
            return ((List<Indice>)OrderCatalog<Indice>()).ToArray();
        }

        public Indice[] GetActiveIndices()
        {
            return ((List<Indice>)indiceRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveIndice(Indice indice)
        {
            if (indice.Id == 0)
            {
                indice.Activo = true;
                indice.CreadorEl = DateTime.Now;
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
            return ((List<InvestigadorExterno>)OrderCatalog<InvestigadorExterno>()).ToArray();
        }

        public InvestigadorExterno[] GetActiveInvestigadorExternos()
        {
            return ((List<InvestigadorExterno>)investigadorExternoRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveInvestigadorExterno(InvestigadorExterno investigadorExterno)
        {
            if (investigadorExterno.Id == 0)
            {
                investigadorExterno.Activo = true;
                investigadorExterno.CreadorEl = DateTime.Now;
            }
            investigadorExterno.ModificadoEl = DateTime.Now;

            investigadorExternoRepository.SaveOrUpdate(investigadorExterno);
        }

        public TipoParticipante GetTipoParticipanteById(int id)
        {
            return tipoParticipanteRepository.Get(id);
        }

        public TipoParticipante[] GetAllTipoParticipantes()
        {
            return ((List<TipoParticipante>)OrderCatalog<TipoParticipante>()).ToArray();
        }

        public TipoParticipante[] GetActiveParticipantes()
        {
            return ((List<TipoParticipante>)tipoParticipanteRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveTipoParticipante(TipoParticipante tipoParticipante)
        {
            if (tipoParticipante.Id == 0)
            {
                tipoParticipante.Activo = true;
                tipoParticipante.CreadorEl = DateTime.Now;
            }
            tipoParticipante.ModificadoEl = DateTime.Now;

            tipoParticipanteRepository.SaveOrUpdate(tipoParticipante);
        }

        public LineaInvestigacion GetLineaInvestigacionById(int id)
        {
            return lineaInvestigacionRepository.Get(id);
        }

        public LineaInvestigacion[] GetAllLineaInvestigaciones()
        {
            return ((List<LineaInvestigacion>)OrderCatalog<LineaInvestigacion>()).ToArray();
        }

        public LineaInvestigacion[] GetActiveLineaInvestigaciones()
        {
            return ((List<LineaInvestigacion>)lineaInvestigacionRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveLineaInvestigacion(LineaInvestigacion lineaInvestigacion)
        {
            if (lineaInvestigacion.Id == 0)
            {
                lineaInvestigacion.Activo = true;
                lineaInvestigacion.CreadorEl = DateTime.Now;
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
            return ((List<TipoActividad>)OrderCatalog<TipoActividad>()).ToArray();
        }

        public TipoActividad[] GetActiveActividades()
        {
            return ((List<TipoActividad>)tipoActividadRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveTipoActividad(TipoActividad tipoActividad)
        {
            if (tipoActividad.Id == 0)
            {
                tipoActividad.Activo = true;
                tipoActividad.CreadorEl = DateTime.Now;
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
            return ((List<Area>)OrderCatalog<Area>()).ToArray();
        }

        public Area[] GetActiveAreas()
        {
            return ((List<Area>)areaRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveArea(Area area)
        {
            if (area.Id == 0)
            {
                area.Activo = true;
                area.CreadorEl = DateTime.Now;
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
            return ((List<Disciplina>)OrderCatalog<Disciplina>()).ToArray();
        }

        public Disciplina[] GetActiveDisciplinas()
        {
            return ((List<Disciplina>)disciplinaRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveDisciplina(Disciplina disciplina)
        {
            if (disciplina.Id == 0)
            {
                disciplina.Activo = true;
                disciplina.CreadorEl = DateTime.Now;
            }
            disciplina.ModificadoEl = DateTime.Now;

            disciplinaRepository.SaveOrUpdate(disciplina);
        }

        public Subdisciplina GetSubdisciplinaById(int id)
        {
            return subdisciplinaRepository.Get(id);
        }

        public Subdisciplina[] GetAllSubdisciplinas()
        {
            return ((List<Subdisciplina>)OrderCatalog<Subdisciplina>()).ToArray();
        }

        public Subdisciplina[] GetActiveSubdisciplinas()
        {
            return ((List<Subdisciplina>)subdisciplinaRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveSubdisciplina(Subdisciplina subdisciplina)
        {
            if (subdisciplina.Id == 0)
            {
                subdisciplina.Activo = true;
                subdisciplina.CreadorEl = DateTime.Now;
            }
            subdisciplina.ModificadoEl = DateTime.Now;

            subdisciplinaRepository.SaveOrUpdate(subdisciplina);
        }

        public LineaTematica GetLineaTematicaById(int id)
        {
            return lineaTematicaRepository.Get(id);
        }

        public LineaTematica[] GetAllLineaTematicas()
        {
            return ((List<LineaTematica>)OrderCatalog<LineaTematica>()).ToArray();
        }

        public LineaTematica[] GetActiveLineaTematicas()
        {
            return ((List<LineaTematica>)lineaTematicaRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveLineaTematica(LineaTematica lineaTematica)
        {
            if (lineaTematica.Id == 0)
            {
                lineaTematica.Activo = true;
                lineaTematica.CreadorEl = DateTime.Now;
            }
            lineaTematica.ModificadoEl = DateTime.Now;

            lineaTematicaRepository.SaveOrUpdate(lineaTematica);
        }

        public CoautorExterno GetCoautorExternoById(int id)
        {
            return coautorExternoRepository.Get(id);
        }

        public CoautorExterno[] GetAllCoautorExternos()
        {
            return ((List<CoautorExterno>)OrderCatalog<CoautorExterno>()).ToArray();
        }

        public CoautorExterno[] GetActiveCoautorExternos()
        {
            return ((List<CoautorExterno>)coautorExternoRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveCoautorExterno(CoautorExterno coautorExterno)
        {
            if (coautorExterno.Id == 0)
            {
                coautorExterno.Activo = true;
                coautorExterno.CreadorEl = DateTime.Now;
            }
            coautorExterno.ModificadoEl = DateTime.Now;

            coautorExternoRepository.SaveOrUpdate(coautorExterno);
        }

        public FormaParticipacion GetFormaParticipacionById(int id)
        {
            return formaParticipacionRepository.Get(id);
        }

        public FormaParticipacion[] GetAllFormaParticipaciones()
        {
            return ((List<FormaParticipacion>)OrderCatalog<FormaParticipacion>()).ToArray();
        }

        public FormaParticipacion[] GetActiveFormaParticipaciones()
        {
            return ((List<FormaParticipacion>)formaParticipacionRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveFormaParticipacion(FormaParticipacion formaParticipacion)
        {
            if (formaParticipacion.Id == 0)
            {
                formaParticipacion.Activo = true;
                formaParticipacion.CreadorEl = DateTime.Now;
            }
            formaParticipacion.ModificadoEl = DateTime.Now;

            formaParticipacionRepository.SaveOrUpdate(formaParticipacion);
        }

        public ResponsableExterno GetResponsableExternoById(int id)
        {
            return responsableExternoRepository.Get(id);
        }

        public ResponsableExterno[] GetAllResponsableExternos()
        {
            return ((List<ResponsableExterno>)OrderCatalog<ResponsableExterno>()).ToArray();
        }

        public ResponsableExterno[] GetActiveResponsableExternos()
        {
            return ((List<ResponsableExterno>)responsableExternoRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveResponsableExterno(ResponsableExterno responsableExterno)
        {
            if (responsableExterno.Id == 0)
            {
                responsableExterno.Activo = true;
                responsableExterno.CreadorEl = DateTime.Now;
            }
            responsableExterno.ModificadoEl = DateTime.Now;

            responsableExternoRepository.SaveOrUpdate(responsableExterno);
        }

        public TipoCapitulo GetTipoCapituloById(int id)
        {
            return tipoCapituloRepository.Get(id);
        }

        public TipoCapitulo[] GetAllTipoCapitulos()
        {
            return ((List<TipoCapitulo>)OrderCatalog<TipoCapitulo>()).ToArray();
        }

        public TipoCapitulo[] GetActiveTipoCapitulos()
        {
            return ((List<TipoCapitulo>)tipoCapituloRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveTipoCapitulo(TipoCapitulo tipoCapitulo)
        {
            if (tipoCapitulo.Id == 0)
            {
                tipoCapitulo.Activo = true;
                tipoCapitulo.CreadorEl = DateTime.Now;
            }
            tipoCapitulo.ModificadoEl = DateTime.Now;

            tipoCapituloRepository.SaveOrUpdate(tipoCapitulo);
        }

        public TipoParticipacion GetTipoParticipacionById(int id)
        {
            return tipoParticipacionRepository.Get(id);
        }

        public TipoParticipacion[] GetAllTipoParticipaciones()
        {
            return ((List<TipoParticipacion>)OrderCatalog<TipoParticipacion>()).ToArray();
        }

        public TipoParticipacion[] GetActiveTipoParticipaciones()
        {
            return ((List<TipoParticipacion>)tipoParticipacionRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveTipoParticipacion(TipoParticipacion tipoParticipacion)
        {
            if (tipoParticipacion.Id == 0)
            {
                tipoParticipacion.Activo = true;
                tipoParticipacion.CreadorEl = DateTime.Now;
            }
            tipoParticipacion.ModificadoEl = DateTime.Now;

            tipoParticipacionRepository.SaveOrUpdate(tipoParticipacion);
        }

        public PeriodoReferencia GetPeriodoReferenciaById(int id)
        {
            return periodoReferenciaRepository.Get(id);
        }

        public PeriodoReferencia[] GetAllPeriodoReferencias()
        {
            return ((List<PeriodoReferencia>)OrderCatalog<PeriodoReferencia>("Orden")).ToArray();
        }

        public PeriodoReferencia[] GetActivePeriodoReferencias()
        {
            return ((List<PeriodoReferencia>)periodoReferenciaRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SavePeriodoReferencia(PeriodoReferencia periodoReferencia)
        {
            if (periodoReferencia.Id == 0)
            {
                periodoReferencia.Activo = true;
                periodoReferencia.CreadorEl = DateTime.Now;
            }
            periodoReferencia.ModificadoEl = DateTime.Now;

            periodoReferenciaRepository.SaveOrUpdate(periodoReferencia);
        }

        public RevistaPublicacion GetRevistaPublicacionById(int id)
        {
            return revistaPublicacionRepository.Get(id);
        }

        public RevistaPublicacion[] GetAllRevistaPublicaciones()
        {
            return ((List<RevistaPublicacion>)OrderCatalog<RevistaPublicacion>("Titulo")).ToArray();
        }

        public RevistaPublicacion[] GetActiveRevistaPublicaciones()
        {
            return ((List<RevistaPublicacion>)revistaPublicacionRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveRevistaPublicacion(RevistaPublicacion revistaPublicacion)
        {
            if (revistaPublicacion.Id == 0)
            {
                revistaPublicacion.Activo = true;
                revistaPublicacion.CreadorEl = DateTime.Now;
            }
            revistaPublicacion.ModificadoEl = DateTime.Now;

            revistaPublicacionRepository.SaveOrUpdate(revistaPublicacion);
        }

        public Organizacion GetOrganizacionById(int id)
        {
            return organizacionRepository.Get(id);
        }

        public Organizacion[] GetAllOrganizaciones()
        {
            return ((List<Organizacion>)OrderCatalog<Organizacion>()).ToArray();
        }

        public Organizacion[] GetActiveOrganizaciones()
        {
            return ((List<Organizacion>)organizacionRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveOrganizacion(Organizacion organizacion)
        {
            if (organizacion.Id == 0)
            {
                organizacion.Activo = true;
                organizacion.CreadorEl = DateTime.Now;
            }
            organizacion.ModificadoEl = DateTime.Now;

            organizacionRepository.SaveOrUpdate(organizacion);
        }

        public Dependencia GetDependenciaById(int id)
        {
            return dependenciaRepository.Get(id);
        }

        public Dependencia[] GetAllDependencias()
        {
            return ((List<Dependencia>)OrderCatalog<Dependencia>()).ToArray();
        }

        public Dependencia[] GetActiveDependencias()
        {
            return ((List<Dependencia>)dependenciaRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public void SaveDependencia(Dependencia dependencia)
        {
            if (dependencia.Id == 0)
            {
                dependencia.Activo = true;
                dependencia.CreadorEl = DateTime.Now;
            }
            dependencia.ModificadoEl = DateTime.Now;

            dependenciaRepository.SaveOrUpdate(dependencia);
        }
    }
}
