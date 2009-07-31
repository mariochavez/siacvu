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

            Mapper.CreateMap<Usuario, UsuarioForm>();

            Mapper.CreateMap<Investigador, InvestigadorForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaIngreso,
                           o => o.AddFormatter<StandardDateFormatter>());

            Mapper.CreateMap<EstadoInvestigador, EstadoInvestigadorForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.Fecha,
                           o => o.AddFormatter<StandardDateFormatter>());

            Mapper.CreateMap<GradoAcademicoInvestigador, GradoAcademicoInvestigadorForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.Fecha,
                           o => o.AddFormatter<StandardDateFormatter>());

            Mapper.CreateMap<CategoriaInvestigador, CategoriaInvestigadorForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.Fecha,
                           o => o.AddFormatter<StandardDateFormatter>());

            Mapper.CreateMap<CargoInvestigador, CargoInvestigadorForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.Fecha,
                           o => o.AddFormatter<StandardDateFormatter>());

            Mapper.CreateMap<SNIInvestigador, SNIInvestigadorForm>()
                .ForMember(d => d.Modificacion,
                           o => o.ResolveUsing<ModificadoResolver>())
                .ForMember(d => d.FechaInicial,
                           o => o.AddFormatter<StandardDateFormatter>())
                .ForMember(d => d.FechaFinal,
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
        }
    }
}