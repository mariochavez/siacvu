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
        void SaveIdioma(Idioma idioma);

        //Pais
        Pais GetPaisById(int id);
        Pais[] GetAllPais();
        void SavePais(Pais pais);

        //TipoArticulo
        TipoArticulo GetTipoArticuloById(int id);
        TipoArticulo[] GetAllTipoArticulos();
        void SaveTipoArticulo(TipoArticulo tipoArticulo);

        //Institucion
        Institucion GetInstitucionById(int id);
        Institucion[] GetAllInstitucions();
        void SaveInstitucion(Institucion institucion);

        //Indice
        Indice GetIndiceById(int id);
        Indice[] GetAllIndices();
        void SaveIndice(Indice indice);

        //Investigador Externo
        InvestigadorExterno GetInvestigadorExternoById(int id);
        InvestigadorExterno[] GetAllInvestigadorExternos();
        void SaveInvestigadorExterno(InvestigadorExterno investigadorExterno);

        //Tipo Participante
        TipoParticipante GetTipoParticipanteById(int id);
        TipoParticipante[] GetAllTipoParticipantes();
        void SaveTipoParticipante(TipoParticipante tipoParticipante);

        //Linea Investigacion
        LineaInvestigacion GetLineaInvestigacionById(int id);
        LineaInvestigacion[] GetAllLineaInvestigacions();
        void SaveLineaInvestigacion(LineaInvestigacion lineaInvestigacion);

        //Tipo Actividad
        TipoActividad GetTipoActividadById(int id);
        TipoActividad[] GetAllTipoActividads();
        void SaveTipoActividad(TipoActividad tipoActividad);

        //Area
        Area GetAreaById(int id);
        Area[] GetAllAreas();
        void SaveArea(Area area);

        //Disciplina
        Disciplina GetDisciplinaById(int id);
        Disciplina[] GetAllDisciplinas();
        void SaveDisciplina(Disciplina disciplina);

        //Subdisciplina
        Subdisciplina GetSubdisciplinaById(int id);
        Subdisciplina[] GetAllSubdisciplinas();
        void SaveSubdisciplina(Subdisciplina subdisciplina);

        //Linea Tematica
        LineaTematica GetLineaTematicaById(int id);
        LineaTematica[] GetAllLineaTematicas();
        void SaveLineaTematica(LineaTematica lineaTematica);

        //Coautor Externo
        CoautorExterno GetCoautorExternoById(int id);
        CoautorExterno[] GetAllCoautorExternos();
        void SaveCoautorExterno(CoautorExterno coautorExterno);

        //Forma de participacion
        FormaParticipacion GetFormaParticipacionById(int id);
        FormaParticipacion[] GetAllFormaParticipacions();
        void SaveFormaParticipacion(FormaParticipacion formaParticipacion);

        //Responsable Externo del Libro
        ResponsableExterno GetResponsableExternoById(int id);
        ResponsableExterno[] GetAllResponsableExternos();
        void SaveResponsableExterno(ResponsableExterno responsableExterno);

        //Tipo de Capitulo
        TipoCapitulo GetTipoCapituloById(int id);
        TipoCapitulo[] GetAllTipoCapitulos();
        void SaveTipoCapitulo(TipoCapitulo tipoCapitulo);

        //Tipo de Participacion
        TipoParticipacion GetTipoParticipacionById(int id);
        TipoParticipacion[] GetAllTipoParticipacions();
        void SaveTipoParticipacion(TipoParticipacion tipoParticipacion);

        //Periodo de Referencia
        PeriodoReferencia GetPeriodoReferenciaById(int id);
        PeriodoReferencia[] GetAllPeriodoReferencias();
        void SavePeriodoReferencia(PeriodoReferencia periodoReferencia);

        //Revista de Publicacion
        RevistaPublicacion GetRevistaPublicacionById(int id);
        RevistaPublicacion[] GetAllRevistaPublicacions();
        void SaveRevistaPublicacion(RevistaPublicacion revistaPublicacion);
    }
}