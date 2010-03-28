using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface ICatalogoService
    {
        //Departamento
        Departamento GetDepartamentoById(int id);
        Departamento[] GetAllDepartamentos();
        Departamento[] GetActiveDepartamentos();
        void SaveDepartamento(Departamento departamento);

        //Puesto
        Puesto GetPuestoById(int id);
        Puesto[] GetAllPuestos();
        Puesto[] GetActivePuestos();
        void SavePuesto(Puesto puesto);

        //Sede
        Sede GetSedeById(int id);
        Sede[] GetAllSedes();
        Sede[] GetActiveSedes();
        void SaveSede(Sede sede);

        //Categoria
        Categoria GetCategoriaById(int id);
        Categoria[] GetAllCategorias();
        Categoria[] GetActiveCategorias();
        void SaveCategoria(Categoria categoria);

        //Grado Academico
        GradoAcademico GetGradoAcademicoById(int id);
        GradoAcademico[] GetAllGradoAcademicos();
        GradoAcademico[] GetActiveGrados();
        void SaveGradoAcademico(GradoAcademico gradoAcademico);

        //Sistema Nacional de Investigadores(SNI)
        SNI GetSNIById(int id);
        SNI[] GetAllSNIs();
        SNI[] GetActiveSNIs();
        void SaveSNI(SNI sni);

        //Estatus
        Estado GetEstadoById(int id);
        Estado[] GetAllEstados();
        Estado[] GetActiveEstados();
        void SaveEstado(Estado estado);

        //Idioma
        Idioma GetIdiomaById(int id);
        Idioma[] GetAllIdiomas();
        Idioma[] GetActiveIdiomas();
        void SaveIdioma(Idioma idioma);

        //Pais
        Pais GetPaisById(int id);
        Pais[] GetAllPaises();
        Pais[] GetActivePaises();
        void SavePais(Pais pais);

        //Institucion
        Institucion GetInstitucionById(int id);
        Institucion[] GetAllInstituciones();
        Institucion[] GetActiveInstituciones();
        void SaveInstitucion(Institucion institucion);

        //Indice
        Indice GetIndiceById(int id);
        Indice[] GetAllIndices();
        Indice[] GetActiveIndices();
        void SaveIndice(Indice indice);

        //Investigador Externo
        InvestigadorExterno GetInvestigadorExternoById(int id);
        InvestigadorExterno[] GetAllInvestigadorExternos();
        InvestigadorExterno[] GetActiveInvestigadorExternos();
        void SaveInvestigadorExterno(InvestigadorExterno investigadorExterno);

        //Linea Investigacion
        LineaInvestigacion GetLineaInvestigacionById(int id);
        LineaInvestigacion[] GetAllLineaInvestigaciones();
        LineaInvestigacion[] GetActiveLineaInvestigaciones();
        void SaveLineaInvestigacion(LineaInvestigacion lineaInvestigacion);

        //Tipo Actividad
        TipoActividad GetTipoActividadById(int id);
        TipoActividad[] GetAllTipoActividades();
        TipoActividad[] GetActiveActividades();
        void SaveTipoActividad(TipoActividad tipoActividad);

        //Area
        Area GetAreaById(int id);
        Area[] GetAllAreas();
        Area[] GetActiveAreas();
        void SaveArea(Area area);

        //Disciplina
        Disciplina GetDisciplinaById(int id);
        Disciplina[] GetAllDisciplinas();
        Disciplina[] GetActiveDisciplinas();
        void SaveDisciplina(Disciplina disciplina);
        Disciplina[] GetDisciplinasByAreaId(int id);

        //Subdisciplina
        Subdisciplina GetSubdisciplinaById(int id);
        Subdisciplina[] GetAllSubdisciplinas();
        Subdisciplina[] GetActiveSubdisciplinas();
        void SaveSubdisciplina(Subdisciplina subdisciplina);
        Subdisciplina[] GetSubdisciplinasByDisciplinaId(int id);

        //Linea Tematica
        LineaTematica GetLineaTematicaById(int id);
        LineaTematica[] GetAllLineaTematicas();
        LineaTematica[] GetActiveLineaTematicas();
        void SaveLineaTematica(LineaTematica lineaTematica);

        //Tipo de Participacion
        TipoParticipacion GetTipoParticipacionById(int id);
        TipoParticipacion[] GetAllTipoParticipaciones();
        TipoParticipacion[] GetActiveTipoParticipaciones();
        void SaveTipoParticipacion(TipoParticipacion tipoParticipacion);
        TipoParticipacion[] GetTipoParticipacionCapitulos();
        TipoParticipacion[] GetTipoParticipacionEventos();
        TipoParticipacion[] GetTipoParticipacionParticipacionMedios();

        //Revista de Publicacion
        RevistaPublicacion GetRevistaPublicacionById(int id);
        RevistaPublicacion[] GetAllRevistaPublicaciones();
        RevistaPublicacion[] GetActiveRevistaPublicaciones();
        void SaveRevistaPublicacion(RevistaPublicacion revistaPublicacion);

        //Sector
        Sector GetSectorById(int id);
        Sector[] GetAllSectores();
        Sector[] GetActiveSectores();
        void SaveSector(Sector sector);
        Sector[] GetActiveSectoresEconomicos();
        Sector[] GetActiveSectoresFinanciamientos();
        Sector[] GetActiveSectoresOrganosExternos();

        //Nivel
        Nivel GetNivelById(int id);
        Nivel[] GetAllNiveles();
        Nivel[] GetActiveNiveles();
        void SaveNivel(Nivel nivel);
        Nivel[] GetNivelesByOrganizacionId(int id);

        //Programa de estudio
        ProgramaEstudio GetProgramaEstudioById(int id);
        ProgramaEstudio[] GetAllProgramaEstudios();
        ProgramaEstudio[] GetActiveProgramaEstudios();
        void SaveProgramaEstudio(ProgramaEstudio programaEstudio);

        //Organizacion
        Organizacion GetOrganizacionById(int id);
        Organizacion[] GetAllOrganizaciones();
        Organizacion[] GetActiveOrganizaciones();
        void SaveOrganizacion(Organizacion organizacion);
        Organizacion[] GetOrganizacionesBySectorId(int id);

        //Dependencia
        Dependencia GetDependenciaById(int id);
        Dependencia[] GetAllDependencias();
        Dependencia[] GetActiveDependencias();
        void SaveDependencia(Dependencia dependencia);

        //Ambito
        Ambito GetAmbitoById(int id);
        Ambito[] GetAllAmbitos();
        Ambito[] GetActiveAmbitos();
        void SaveAmbito(Ambito ambito);

        //Estados del Pais
        EstadoPais GetEstadoPaisById(int id);
        EstadoPais[] GetAllEstadoPaises();
        EstadoPais[] GetActiveEstadoPaises();
        void SaveEstadoPais(EstadoPais estadoPais);
        EstadoPais[] GetEstadoPaisesByPaisId(int id);

        //Medio Electronico
        MedioElectronico GetMedioElectronicoById(int id);
        MedioElectronico[] GetAllMedioElectronicos();
        MedioElectronico[] GetActiveMedioElectronicos();
        void SaveMedioElectronico(MedioElectronico medioElectronico);

        //Medio Impreso
        MedioImpreso GetMedioImpresoById(int id);
        MedioImpreso[] GetAllMedioImpresos();
        MedioImpreso[] GetActiveMedioImpresos();
        void SaveMedioImpreso(MedioImpreso medioImpreso);

        //Tipo Dictamen
        TipoDictamen GetTipoDictamenById(int id);
        TipoDictamen[] GetAllTipoDictamenes();
        TipoDictamen[] GetActiveTipoDictamenes();
        void SaveTipoDictamen(TipoDictamen tipoDictamen);

        //Tipo Distincion
        TipoDistincion GetTipoDistincionById(int id);
        TipoDistincion[] GetAllTipoDistinciones();
        TipoDistincion[] GetActiveTipoDistinciones();
        void SaveTipoDistincion(TipoDistincion tipoDistincion);

        //Tipo Evento
        TipoEvento GetTipoEventoById(int id);
        TipoEvento[] GetAllTipoEventos();
        TipoEvento[] GetActiveTipoEventos();
        void SaveTipoEvento(TipoEvento tipoEvento);

        //Tipo Organo
        TipoOrgano GetTipoOrganoById(int id);
        TipoOrgano[] GetAllTipoOrganos();
        TipoOrgano[] GetActiveTipoOrganos();
        void SaveTipoOrgano(TipoOrgano tipoOrgano);

        //Nivel de Estudios
        NivelEstudio GetNivelEstudioById(int id);
        NivelEstudio[] GetAllNivelEstudios();
        NivelEstudio[] GetActiveNivelEstudios();
        void SaveNivelEstudio(NivelEstudio nivelEstudio);

        //Tipo de Proyecto
        TipoProyecto GetTipoProyectoById(int id);
        TipoProyecto[] GetAllTipoProyectos();
        TipoProyecto[] GetActiveTipoProyectos();
        void SaveTipoProyecto(TipoProyecto tipoProyecto);

        //Tipo de Estancia
        TipoEstancia GetTipoEstanciaById(int id);
        TipoEstancia[] GetAllTipoEstancias();
        TipoEstancia[] GetActiveTipoEstancias();
        void SaveTipoEstancia(TipoEstancia tipoEstancia);

        //Clase
        Clase GetClaseById(int id);
        Clase[] GetAllClases();
        Clase[] GetActiveClases();
        void SaveClase(Clase clase);
        Clase[] GetClasesByRamaId(int id);

        //Rama
        Rama GetRamaById(int id);
        Rama[] GetAllRamas();
        Rama[] GetActiveRamas();
        void SaveRama(Rama rama);
        Rama[] GetRamasBySectorId(int id);

        //Tipo Apoyo
        TipoApoyo GetTipoApoyoById(int id);
        TipoApoyo[] GetAllTipoApoyos();
        TipoApoyo[] GetActiveTipoApoyos();
        void SaveTipoApoyo(TipoApoyo tipoApoyo);

        //Subprograma Conacyt
        SubprogramaConacyt GetSubprogramaConacytById(int id);
        SubprogramaConacyt[] GetAllSubprogramasConacyt();
        SubprogramaConacyt[] GetActiveSubprogramasConacyt();
        void SaveSubprogramaConacyt(SubprogramaConacyt subprogramaConacyt);

        //Moneda
        Moneda GetMonedaById(int id);
        Moneda[] GetAllMonedas();
        Moneda[] GetActiveMonedas();
        void SaveMoneda(Moneda moneda);
        
        //Estatus de Formacion Academica
        EstatusFormacionAcademica GetEstatusFormacionAcademicaById(int id);
        EstatusFormacionAcademica[] GetAllEstatusFormacionAcademicas();
        EstatusFormacionAcademica[] GetActiveEstatusFormacionAcademicas();
        void SaveEstatusFormacionAcademica(EstatusFormacionAcademica estatusFormacionAcademica);

        //Dirigido a
        DirigidoA GetDirigidoAById(int id);
        DirigidoA[] GetAllDirigidoAs();
        DirigidoA[] GetActiveDirigidoAs();
        void SaveDirigidoA(DirigidoA dirigidoA);

        //Fondo CONACyT
        FondoConacyt GetFondoConacytById(int id);
        FondoConacyt[] GetAllFondoConacyts();
        FondoConacyt[] GetActiveFondoConacyts();
        void SaveFondoConacyt(FondoConacyt fondoConacyt);

        //Area Tematica
        AreaTematica GetAreaTematicaById(int id);
        AreaTematica[] GetAllAreaTematicas();
        AreaTematica[] GetActiveAreaTematicas();
        void SaveAreaTematica(AreaTematica areaTematica);
        AreaTematica[] GetAreaTematicasByLineaTematicaId(int id);

        //Tipo Archivo
        TipoArchivo GetTipoArchivoById(int id);
        TipoArchivo[] GetAllTipoArchivos();
        TipoArchivo[] GetActiveTipoArchivos();
        void SaveTipoArchivo(TipoArchivo tipoArchivo);

        //Editorial
        Editorial GetEditorialById(int id);
        Editorial[] GetAllEditorials();
        Editorial[] GetActiveEditorials();
        void SaveEditorial(Editorial editorial);

        //Glosario
        Glosario GetGlosarioById(int id);
        Glosario[] GetAllGlosarios();
        void SaveGlosario(Glosario glosario);
        string GetGlosario(string contexto, string campo);


        //Vinculacion APyD
        VinculacionAPyD GetVinculacionAPyDById(int id);
        VinculacionAPyD[] GetAllVinculacionAPyDs();
        VinculacionAPyD[] GetActiveVinculacionAPyDs();
        void SaveVinculacionAPyD(VinculacionAPyD vinculacionAPyD);

        // Direccion Regional
        DireccionRegional GetDireccionRegionalById(int id);
        DireccionRegional[] GetAllDireccionesRegionales();
        DireccionRegional[] GetActiveDireccionesRegionales();
        void SaveDireccionRegional(DireccionRegional direccionRegional);

        //Consejo o Comision
        ConsejoComision GetConsejoComisionById(int id);
        ConsejoComision[] GetAllConsejoComisions();
        ConsejoComision[] GetActiveConsejoComisions();
        void SaveConsejoComision(ConsejoComision consejoComision);

        //Area de investigacion
        AreaInvestigacion GetAreaInvestigacionById(int id);
        AreaInvestigacion[] GetAllAreaInvestigacions();
        AreaInvestigacion[] GetActiveAreaInvestigacions();
        void SaveAreaInvestigacion(AreaInvestigacion areaInvestigacion);
    }
}