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
            ForSourceType<bool>().AddFormatter<YesNoBooleanFormatter>();

            CreateMaps();
        }

        private void CreateMaps()
        {

            CreateCatalogosMaps();
            CreateArticulosMaps();
            CreateCapitulosMaps();

            Mapper.CreateMap<Usuario, UsuarioForm>();

            Mapper.CreateMap<Investigador, InvestigadorForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaIngreso,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.Usuario,
                           o => o.Ignore())
                .ForMember(d => d.Nombre,
                           o => o.Ignore());

            Mapper.CreateMap<EstadoInvestigador, EstadoInvestigadorForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.Fecha,
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
                .ForMember(d => d.Fecha,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.Cargo,
                           o => o.Ignore())
                .ForMember(d => d.Departamento,
                           o => o.Ignore())
                .ForMember(d => d.Sede,
                           o => o.Ignore());

            Mapper.CreateMap<SNIInvestigador, SNIInvestigadorForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaInicial,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaFinal,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.SNI,
                           o => o.Ignore());
        }

        void CreateArticulosMaps()
        {
            Mapper.CreateMap<Articulo, ArticuloForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaAceptacion,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaEdicion,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaPublicacion,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.TipoArticulo,
                           o => o.Ignore())
                .ForMember(d => d.Idioma,
                           o => o.Ignore())
                .ForMember(d => d.Estado,
                           o => o.Ignore())
                .ForMember(d => d.PeriodoReferencia,
                           o => o.Ignore())
                .ForMember(d => d.LineaTematica,
                           o => o.Ignore())
                .ForMember(d => d.Pais,
                           o => o.Ignore())
                .ForMember(d => d.RevistaPublicacion,
                           o => o.Ignore())
                .ForMember(d => d.LineaInvestigacion,
                           o => o.Ignore())
                .ForMember(d => d.TipoActividad,
                           o => o.Ignore())
                .ForMember(d => d.TipoParticipante,
                           o => o.Ignore())
                .ForMember(d => d.Area,
                           o => o.Ignore())
                .ForMember(d => d.Disciplina,
                           o => o.Ignore())
                .ForMember(d => d.Subdisciplina,
                           o => o.Ignore())
                .ForMember(d => d.Institucion,
                           o => o.Ignore())
                .ForMember(d => d.Indice1,
                           o => o.Ignore())
                .ForMember(d => d.Indice2,
                           o => o.Ignore())
                .ForMember(d => d.Indice3,
                           o => o.Ignore())
                .ForMember(d => d.Investigador,
                           o => o.Ignore());

            Mapper.CreateMap<CoautorInternoArticulo, CoautorInternoArticuloForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.InvestigadorId,
                           o => o.Ignore());

            Mapper.CreateMap<CoautorExternoArticulo, CoautorExternoArticuloForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.InvestigadorExternoId,
                           o => o.Ignore());
        }

        void CreateCapitulosMaps()
        {
            Mapper.CreateMap<Capitulo, CapituloForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaAceptacion,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaEdicion,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.TipoCapitulo,
                           o => o.Ignore())
                .ForMember(d => d.Idioma,
                           o => o.Ignore())
                .ForMember(d => d.Estado,
                           o => o.Ignore())
                .ForMember(d => d.PeriodoReferencia,
                           o => o.Ignore())
                .ForMember(d => d.LineaTematica,
                           o => o.Ignore())
                .ForMember(d => d.Pais,
                           o => o.Ignore())
                .ForMember(d => d.TipoParticipante,
                           o => o.Ignore())
                .ForMember(d => d.Area,
                           o => o.Ignore())
                .ForMember(d => d.Disciplina,
                           o => o.Ignore())
                .ForMember(d => d.Subdisciplina,
                           o => o.Ignore())
                .ForMember(d => d.FormaParticipacion,
                           o => o.Ignore())
                .ForMember(d => d.TipoParticipacion,
                           o => o.Ignore())
                .ForMember(d => d.Investigador,
                           o => o.Ignore());

            Mapper.CreateMap<CoautorInternoCapitulo, CoautorInternoCapituloForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.InvestigadorId,
                           o => o.Ignore());

            Mapper.CreateMap<CoautorExternoCapitulo, CoautorExternoCapituloForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.InvestigadorExternoId,
                           o => o.Ignore());

            Mapper.CreateMap<ResponsableInternoCapitulo, ResponsableInternoCapituloForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.InvestigadorId,
                           o => o.Ignore());

            Mapper.CreateMap<ResponsableExternoCapitulo, ResponsableExternoCapituloForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.InvestigadorExternoId,
                           o => o.Ignore());
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

            Mapper.CreateMap<Departamento, DepartamentoForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

            Mapper.CreateMap<Sede, SedeForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());

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
            Mapper.CreateMap<TipoArticulo, TipoArticuloForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<Institucion, InstitucionForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
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
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<Subdisciplina, SubdisciplinaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
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
            Mapper.CreateMap<TipoCapitulo, TipoCapituloForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<PeriodoReferencia, PeriodoReferenciaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<RevistaPublicacion, RevistaPublicacionForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<Nivel, NivelForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<Sector, SectorForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<ProgramaEstudio, ProgramaEstudioForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<Organizacion, OrganizacionForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
            Mapper.CreateMap<Dependencia, DependenciaForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>());
        }
    }
}