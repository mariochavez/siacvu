using System;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface ICatalogoService
    {
        //Cargo
        Cargo GetCargoById(int id);
        Cargo[] GetAllCargos();
        Cargo[] GetActiveCargos();
        void SaveCargo(Cargo cargo);

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

        //TipoArticulo
        TipoArticulo GetTipoArticuloById(int id);
        TipoArticulo[] GetAllTipoArticulos();
        TipoArticulo[] GetActiveArticulos();
        void SaveTipoArticulo(TipoArticulo tipoArticulo);

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

        //Tipo Participante
        TipoParticipante GetTipoParticipanteById(int id);
        TipoParticipante[] GetAllTipoParticipantes();
        TipoParticipante[] GetActiveParticipantes();
        void SaveTipoParticipante(TipoParticipante tipoParticipante);

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

        //Subdisciplina
        Subdisciplina GetSubdisciplinaById(int id);
        Subdisciplina[] GetAllSubdisciplinas();
        Subdisciplina[] GetActiveSubdisciplinas();
        void SaveSubdisciplina(Subdisciplina subdisciplina);

        //Linea Tematica
        LineaTematica GetLineaTematicaById(int id);
        LineaTematica[] GetAllLineaTematicas();
        LineaTematica[] GetActiveLineaTematicas();
        void SaveLineaTematica(LineaTematica lineaTematica);

        //Coautor Externo
        CoautorExterno GetCoautorExternoById(int id);
        CoautorExterno[] GetAllCoautorExternos();
        CoautorExterno[] GetActiveCoautorExternos();
        void SaveCoautorExterno(CoautorExterno coautorExterno);

        //Forma de participacion
        FormaParticipacion GetFormaParticipacionById(int id);
        FormaParticipacion[] GetAllFormaParticipaciones();
        FormaParticipacion[] GetActiveFormaParticipaciones();
        void SaveFormaParticipacion(FormaParticipacion formaParticipacion);

        //Responsable Externo del Libro
        ResponsableExterno GetResponsableExternoById(int id);
        ResponsableExterno[] GetAllResponsableExternos();
        ResponsableExterno[] GetActiveResponsableExternos();
        void SaveResponsableExterno(ResponsableExterno responsableExterno);

        //Tipo de Capitulo
        TipoCapitulo GetTipoCapituloById(int id);
        TipoCapitulo[] GetAllTipoCapitulos();
        TipoCapitulo[] GetActiveTipoCapitulos();
        void SaveTipoCapitulo(TipoCapitulo tipoCapitulo);

        //Tipo de Participacion
        TipoParticipacion GetTipoParticipacionById(int id);
        TipoParticipacion[] GetAllTipoParticipaciones();
        TipoParticipacion[] GetActiveTipoParticipaciones();
        void SaveTipoParticipacion(TipoParticipacion tipoParticipacion);

        //Periodo de Referencia
        PeriodoReferencia GetPeriodoReferenciaById(int id);
        PeriodoReferencia[] GetAllPeriodoReferencias();
        PeriodoReferencia[] GetActivePeriodoReferencias();
        void SavePeriodoReferencia(PeriodoReferencia periodoReferencia);

        //Revista de Publicacion
        RevistaPublicacion GetRevistaPublicacionById(int id);
        RevistaPublicacion[] GetAllRevistaPublicaciones();
        RevistaPublicacion[] GetActiveRevistaPublicaciones();
        void SaveRevistaPublicacion(RevistaPublicacion revistaPublicacion);
    }
}