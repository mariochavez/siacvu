using System;
using AutoMapper;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers.Formatters;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers.Resolvers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;

namespace DecisionesInteligentes.Colef.Sia.Web
{
    public class ColefProfile : Profile
    {
        public const string VIEW_MODEL = "Colef";

        protected override string ProfileName
        {
            get { return VIEW_MODEL; }
        }

        protected override void Configure()
        {
            base.Configure();
            AllowNullDestinationValues = false;
            ForSourceType<DateTime>().AddFormatter<StandardDateTimeFormatter>();
            ForSourceType<DateTime>().AddFormatter<StandardDateFormatter>();
            ForSourceType<DateTime>().AddFormatter<YearDateFormatter>();
            ForSourceType<bool>().AddFormatter<YesNoBooleanFormatter>();

            CreateMaps();
        }

        private void CreateMaps()
        {
            CreateCatalogosMaps();
            CreateArticulosMaps();
            CreateCapitulosMaps();
            CreateCursosMaps();
            CreateTesisMaps();
            CreateDictamenMaps();
            CreateParticipacionMaps();
            CreateParticipacionMedioMaps();
            CreateDistincionMaps();
            CreateOrganosExternosMaps();
            CreateOrganosInternosMaps();
            CreateEventosMaps();
            CreateReportesMaps();
            CreateResenasMaps();
            CreateFormacionAcademicaMaps();
            CreateLibrosMaps();
            CreateEstanciaInstitucionExternaMaps();
            CreateEstanciaAcademicaExternaMaps();
            CreateGrupoInvestigacionMaps();
            CreateExperienciaProfesionalMaps();
            CreateApoyoConacytMaps();
            CreateProyectoMaps();
            CreateIdiomasInvestigadorMaps();
            CreateParticipacionAcademiaMaps();

            Mapper.CreateMap<Usuario, UsuarioForm>()
                .ForMember(d => d.FechaIngreso,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaNacimiento,
                           o => o.AddFormatter<StandardDateFormatter>());

            Mapper.CreateMap<Investigador, InvestigadorForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaIngreso,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaContrato,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.UsuarioFechaNacimiento,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.UsuarioFechaIngreso,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.Usuario,
                           o => o.Ignore())
                .ForMember(d => d.Nombre,
                           o => o.Ignore())
                .ForMember(d => d.AreaTematica,
                           o => o.Ignore());

            Mapper.CreateMap<EstadoInvestigador, EstadoInvestigadorForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaInicial,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaFinal,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.Estado,
                           o => o.Ignore());

            Mapper.CreateMap<GradoAcademicoInvestigador, GradoAcademicoInvestigadorForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.Fecha,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.GradoAcademico,
                           o => o.Ignore());

            Mapper.CreateMap<CategoriaInvestigador, CategoriaInvestigadorForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.Fecha,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.Categoria,
                           o => o.Ignore());

            Mapper.CreateMap<CargoInvestigador, CargoInvestigadorForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.Cargo,
                           o => o.Ignore())
                .ForMember(d => d.Departamento,
                           o => o.Ignore())
                .ForMember(d => d.Puesto,
                           o => o.Ignore())
                .ForMember(d => d.DireccionRegional,
                           o => o.Ignore());

            Mapper.CreateMap<SNIInvestigador, SNIInvestigadorForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.Fecha,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.SNI,
                           o => o.Ignore());

            Mapper.CreateMap<Archivo, ArchivoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
        }

        private void CreateOrganosInternosMaps()
        {
            Mapper.CreateMap<OrganoInterno, OrganoInternoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaInicial,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaFinal,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.ConsejoComision,
                           o => o.Ignore());
        }

        private void CreateParticipacionAcademiaMaps()
        {
            Mapper.CreateMap<ParticipacionAcademia, ParticipacionAcademiaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaAceptacion,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaPublicacion,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaEdicion,
                           o => o.AddFormatter<YearDateFormatter>())
                .ForMember(d => d.Pais,
                           o => o.Ignore())
                .ForMember(d => d.Editorial,
                           o => o.Ignore());
        }

        private void CreateIdiomasInvestigadorMaps()
        {
            Mapper.CreateMap<IdiomasInvestigador, IdiomasInvestigadorForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaEvaluacion,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.Idioma,
                           o => o.Ignore());
        }

        private void CreateProyectoMaps()
        {
            Mapper.CreateMap<Proyecto, ProyectoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaInicial,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaFinal,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaProrroga,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaConclusion,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaEntregaProducto,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.TipoProyecto,
                           o => o.Ignore())
                .ForMember(d => d.Convenio,
                           o => o.Ignore())
                .ForMember(d => d.EstatusProyecto,
                           o => o.Ignore())
                .ForMember(d => d.FondoConacyt,
                           o => o.Ignore())
                .ForMember(d => d.LineaTematica,
                           o => o.Ignore())
                .ForMember(d => d.ImpactoPoliticaPublica,
                           o => o.Ignore())
                .ForMember(d => d.SectorFinanciamiento,
                           o => o.Ignore())
                .ForMember(d => d.ProductoAcademico,
                           o => o.Ignore())
                .ForMember(d => d.ActividadPrevista,
                           o => o.Ignore())
                .ForMember(d => d.USEG,
                           o => o.Ignore())
                .ForMember(d => d.GradoAcademico,
                           o => o.Ignore());

            Mapper.CreateMap<ResponsableInternoProyecto, ResponsableInternoProyectoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<ParticipanteInternoProyecto, ParticipanteInternoProyectoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<ParticipanteExternoProyecto, ParticipanteExternoProyectoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<RecursoFinancieroProyecto, RecursoFinancieroProyectoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.Institucion,
                           o => o.Ignore())
                .ForMember(d => d.Moneda,
                           o => o.Ignore());
        }

        private void CreateApoyoConacytMaps()
        {
            Mapper.CreateMap<ApoyoConacyt, ApoyoConacytForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaInicial,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaFinal,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.TipoApoyo,
                           o => o.Ignore())
                .ForMember(d => d.SubprogramaConacyt,
                           o => o.Ignore());
        }

        private void CreateExperienciaProfesionalMaps()
        {
            Mapper.CreateMap<ExperienciaProfesional, ExperienciaProfesionalForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaInicial,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaFinal,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.Pais,
                           o => o.Ignore());
        }

        private void CreateEstanciaInstitucionExternaMaps()
        {
            Mapper.CreateMap<EstanciaInstitucionExterna, EstanciaInstitucionExternaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaInicial,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaFinal,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.TipoEstancia,
                           o => o.Ignore());
        }

        private void CreateEstanciaAcademicaExternaMaps()
        {
            Mapper.CreateMap<EstanciaAcademicaExterna, EstanciaAcademicaExternaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaInicial,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaFinal,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.TipoEstancia,
                           o => o.Ignore())
                .ForMember(d => d.GradoAcademico,
                           o => o.Ignore());
        }

        private void CreateFormacionAcademicaMaps()
        {
            Mapper.CreateMap<FormacionAcademica, FormacionAcademicaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaObtencion,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.NivelEstudio,
                           o => o.Ignore())
                .ForMember(d => d.Estatus,
                           o => o.Ignore())
                .ForMember(d => d.Pais,
                           o => o.Ignore())
                .ForMember(d => d.EstadoPais,
                           o => o.Ignore());
        }

        private void CreateResenasMaps()
        {
            Mapper.CreateMap<Resena, ResenaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaAceptacion,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaPublicacion,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaEdicion,
                           o => o.AddFormatter<YearDateFormatter>())
                .ForMember(d => d.AnioPublicacion,
                           o => o.ResolveUsing<ResenaPublicacionResolver>())
                .ForMember(d => d.TipoResena,
                           o => o.Ignore())
                .ForMember(d => d.Idioma,
                           o => o.Ignore())
                .ForMember(d => d.Editorial,
                           o => o.Ignore())
                .ForMember(d => d.Pais,
                           o => o.Ignore());

            Mapper.CreateMap<CoautorInternoResena, CoautorInternoProductoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<CoautorExternoResena, CoautorExternoProductoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<AutorResena, AutorResenaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
        }

        private void CreateReportesMaps()
        {
            Mapper.CreateMap<Reporte, ReporteForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaAceptacion,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaEdicion,
                           o => o.AddFormatter<YearDateFormatter>())
                .ForMember(d => d.FechaPublicacion,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.TipoReporte,
                           o => o.Ignore());

            Mapper.CreateMap<CoautorInternoReporte, CoautorInternoProductoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<CoautorExternoReporte, CoautorExternoProductoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
        }

        private void CreateEventosMaps()
        {
            Mapper.CreateMap<Evento, EventoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaEvento,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.Ambito,
                           o => o.Ignore())
                .ForMember(d => d.TipoParticipacion,
                           o => o.Ignore())
                .ForMember(d => d.TipoEvento,
                           o => o.Ignore())
                .ForMember(d => d.Pais,
                           o => o.Ignore());

            Mapper.CreateMap<CoautorInternoEvento, CoautorInternoProductoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<CoautorExternoEvento, CoautorExternoProductoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<InstitucionEvento, InstitucionEventoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
        }

        private void CreateOrganosExternosMaps()
        {
            Mapper.CreateMap<OrganoExterno, OrganoExternoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaInicial,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaFinal,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.TipoOrgano,
                           o => o.Ignore())
                .ForMember(d => d.Sector,
                           o => o.Ignore())
                .ForMember(d => d.Ambito,
                           o => o.Ignore())
                .ForMember(d => d.Pais,
                           o => o.Ignore());
        }

        private void CreateDistincionMaps()
        {
            Mapper.CreateMap<Distincion, DistincionForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaOtorgamiento,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.TipoDistincion,
                           o => o.Ignore())
                .ForMember(d => d.Ambito,
                           o => o.Ignore())
                .ForMember(d => d.Pais,
                           o => o.Ignore())
                .ForMember(d => d.EstadoPais,
                           o => o.Ignore());
        }

        private void CreateTesisMaps()
        {
            Mapper.CreateMap<TesisDirigida, TesisDirigidaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.GradoAcademico,
                           o => o.Ignore())
                .ForMember(d => d.FormaParticipacion,
                           o => o.Ignore())
                .ForMember(d => d.VinculacionAPyD,
                           o => o.Ignore());


            Mapper.CreateMap<TesisPosgrado, TesisPosgradoForm>()
                .ForMember(d => d.FechaGrado,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.GradoAcademico,
                           o => o.Ignore())
                .ForMember(d => d.FormaParticipacion,
                           o => o.Ignore())
                .ForMember(d => d.VinculacionAPyD,
                           o => o.Ignore())
                .ForMember(d => d.ProgramaEstudio,
                           o => o.Ignore());
        }

        private void CreateCursosMaps()
        {
            Mapper.CreateMap<Curso, CursoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaInicial,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaFinal,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.NivelEstudio,
                           o => o.Ignore())
                .ForMember(d => d.Pais,
                           o => o.Ignore())
                .ForMember(d => d.Diplomado,
                           o => o.Ignore());

            Mapper.CreateMap<CursoInvestigador, CursoInvestigadorForm>()
                .ForMember(d => d.FechaInicial,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaFinal,
                           o => o.AddFormatter<StandardDateFormatter>());
        }

        void CreateArticulosMaps()
        {
            Mapper.CreateMap<Articulo, ArticuloForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaAceptacion,
                           o => o.AddFormatter<YearDateFormatter>())
                .ForMember(d => d.FechaPublicacion,
                           o => o.AddFormatter<YearDateFormatter>())
                .ForMember(d => d.FechaEdicion,
                           o => o.AddFormatter<YearDateFormatter>());

            Mapper.CreateMap<CoautorInternoProducto, CoautorInternoProductoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<CoautorExternoProducto, CoautorExternoProductoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
        }

        void CreateCapitulosMaps()
        {
            Mapper.CreateMap<Capitulo, CapituloForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaAceptacion,
                           o => o.AddFormatter<YearDateFormatter>())
                .ForMember(d => d.FechaPublicacion,
                           o => o.AddFormatter<YearDateFormatter>())
                .ForMember(d => d.TipoCapitulo,
                           o => o.Ignore());
                //.ForMember(d => d.Idioma,
                //           o => o.Ignore());

            Mapper.CreateMap<CoautorInternoCapitulo, CoautorInternoProductoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<CoautorExternoCapitulo, CoautorExternoProductoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<AutorInternoCapitulo, AutorInternoProductoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<AutorExternoCapitulo, AutorExternoProductoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());


            Mapper.CreateMap<EditorialCapitulo, EditorialProductoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
        }

        void CreateDictamenMaps()
        {
            Mapper.CreateMap<Dictamen, DictamenForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaDictamen,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FondoConacyt,
                           o => o.Ignore())
                .ForMember(d => d.Editorial,
                           o => o.Ignore())
                .ForMember(d => d.TipoDictamen,
                           o => o.Ignore());
        }

        void CreateParticipacionMaps()
        {
            Mapper.CreateMap<Participacion, ParticipacionForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaPresentacion,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.Autor,
                           o => o.Ignore())
                .ForMember(d => d.OtraParticipacion,
                           o => o.Ignore())
                .ForMember(d => d.TipoPresentacion,
                           o => o.Ignore())
                .ForMember(d => d.Pais,
                           o => o.Ignore())
                .ForMember(d => d.EstadoPais,
                           o => o.Ignore());
        }

        void CreateLibrosMaps()
        {
            Mapper.CreateMap<Libro, LibroForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaAceptacion,
                           o => o.AddFormatter<YearDateFormatter>())
                .ForMember(d => d.FechaPublicacion,
                           o => o.AddFormatter<YearDateFormatter>())
                .ForMember(d => d.FechaEdicion,
                           o => o.AddFormatter<YearDateFormatter>())
                .ForMember(d => d.Idioma,
                           o => o.Ignore())
                .ForMember(d => d.ContenidoLibro,
                           o => o.Ignore())
                .ForMember(d => d.FormatoPublicacion,
                           o => o.Ignore());

            Mapper.CreateMap<CoautorInternoLibro, CoautorInternoProductoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<CoautorExternoLibro, CoautorExternoProductoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<EditorialLibro, EditorialLibroForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.Editorial,
                           o => o.Ignore());
        }

        void CreateParticipacionMedioMaps()
        {
            Mapper.CreateMap<ParticipacionMedio, ParticipacionMedioForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaPresentacion,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.TipoParticipacion,
                           o => o.Ignore())
                .ForMember(d => d.DirigidoA,
                           o => o.Ignore())
                .ForMember(d => d.Ambito,
                           o => o.Ignore());
        }

        void CreateGrupoInvestigacionMaps()
        {
            Mapper.CreateMap<GrupoInvestigacion, GrupoInvestigacionForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaCreacion,
                           o => o.AddFormatter<StandardDateFormatter>());
        }

        void CreateCatalogosMaps()
        {
            Mapper.CreateMap<Rol, RolForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<Cargo, CargoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<Puesto, PuestoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<DireccionRegional, DireccionRegionalForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<Departamento, DepartamentoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<Sede, SedeForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.DireccionRegional, o => o.Ignore());

            Mapper.CreateMap<Categoria, CategoriaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<GradoAcademico, GradoAcademicoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<SNI, SNIForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<Estado, EstadoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<Idioma, IdiomaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<Pais, PaisForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<Institucion, InstitucionForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.Pais,
                           o => o.Ignore())
                .ForMember(d => d.EstadoPais,
                           o => o.Ignore())
                .ForMember(d => d.Ambito,
                           o => o.Ignore())
                .ForMember(d => d.Sector,
                           o => o.Ignore());

            Mapper.CreateMap<Indice, IndiceForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<InvestigadorExterno, InvestigadorExternoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<TipoParticipante, TipoParticipanteForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<LineaInvestigacion, LineaInvestigacionForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<TipoActividad, TipoActividadForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<Area, AreaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<Disciplina, DisciplinaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.Area,
                           o => o.Ignore());

            Mapper.CreateMap<Subdisciplina, SubdisciplinaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.Disciplina,
                           o => o.Ignore());

            Mapper.CreateMap<LineaTematica, LineaTematicaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<CoautorExterno, CoautorExternoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<FormaParticipacion, FormaParticipacionForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<ResponsableExterno, ResponsableExternoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<TipoParticipacion, TipoParticipacionForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<RevistaPublicacion, RevistaPublicacionForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.Indice1,
                           o => o.Ignore())
                .ForMember(d => d.Indice2,
                           o => o.Ignore())
                .ForMember(d => d.Indice3,
                           o => o.Ignore())
                .ForMember(d => d.Indice4,
                           o => o.Ignore())
                .ForMember(d => d.AreaInvestigacion,
                           o => o.Ignore())
                .ForMember(d => d.Pais,
                           o => o.Ignore());

            Mapper.CreateMap<Nivel, NivelForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.Organizacion
                           , o => o.Ignore());

            Mapper.CreateMap<Sector, SectorForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<ProgramaEstudio, ProgramaEstudioForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<Organizacion, OrganizacionForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.Sector,
                           o => o.Ignore());

            Mapper.CreateMap<Dependencia, DependenciaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<EstadoPais, EstadoPaisForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.Pais,
                           o => o.Ignore());

            Mapper.CreateMap<MedioImpreso, MedioImpresoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<MedioElectronico, MedioElectronicoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<Genero, GeneroForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<Ambito, AmbitoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<TipoOrgano, TipoOrganoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<OtraParticipacion, OtraParticipacionForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<TipoPresentacion, TipoPresentacionForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<TipoDictamen, TipoDictamenForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<TipoDistincion, TipoDistincionForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<TipoEvento, TipoEventoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<TipoFinanciamiento, TipoFinanciamientoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<TipoReporte, TipoReporteForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<NivelEstudio, NivelEstudioForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<Convenio, ConvenioForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<IdentificadorLibro, IdentificadorLibroForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<TipoEstancia, TipoEstanciaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<TipoProyecto, TipoProyectoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<ProductoDerivado, ProductoDerivadoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<TipoResena, TipoResenaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<Clase, ClaseForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.Rama,
                           o => o.Ignore());

            Mapper.CreateMap<Rama, RamaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.Sector,
                           o => o.Ignore());

            Mapper.CreateMap<SubprogramaConacyt, SubprogramaConacytForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<TipoApoyo, TipoApoyoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<ActividadPrevista, ActividadPrevistaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<ImpactoPoliticaPublica, ImpactoPoliticaPublicaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<Moneda, MonedaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<ProductoAcademico, ProductoAcademicoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<USEG, USEGForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<Coordinacion, CoordinacionForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<EstatusFormacionAcademica, EstatusFormacionAcademicaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<DirigidoA, DirigidoAForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<EstatusProyecto, EstatusProyectoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<FondoConacyt, FondoConacytForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<AreaTematica, AreaTematicaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.LineaTematica,
                           o => o.Ignore());

            Mapper.CreateMap<TipoArchivo, TipoArchivoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<FormatoPublicacion, FormatoPublicacionForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<Editorial, EditorialForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.Pais,
                           o => o.Ignore());
            Mapper.CreateMap<VinculacionAPyD, VinculacionAPyDForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<Diplomado, DiplomadoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<ConsejoComision, ConsejoComisionForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<AreaInvestigacion, AreaInvestigacionForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<ContenidoLibro, ContenidoLibroForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
        }
    }
}