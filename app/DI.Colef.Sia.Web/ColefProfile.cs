using System;
using AutoMapper;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;

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
            ForSourceType<DateTime>().AddFormatter<StandardDateFormatter>();
            ForSourceType<bool>().AddFormatter<YesNoBooleanFormatter>();

            CreateMaps();
        }

        private void CreateMaps()
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
        }
    }

    public class ModificadoResolver : ValueResolver<IBaseEntity, string>
    {
        protected override string ResolveCore(IBaseEntity source)
        {
            var date = source.CreadorEl > source.ModificadoEl ? source.CreadorEl : source.ModificadoEl;
            return date <= DateTime.Parse("1980-01-01") ? String.Empty : (date).ToString("dd MMM, yyyy");
        }
    }

    public class StandardDateFormatter : IValueFormatter
    {
        public string FormatValue(ResolutionContext context)
        {
            if (context.SourceValue == null)
                return null;

            if (!(context.SourceValue is DateTime))
                return context.SourceValue.ToNullSafeString();

            var value = (DateTime)context.SourceValue;

            return value <= DateTime.Parse("1980-01-01") ? String.Empty : (value).ToString("MMM/dd/yyyy HH:mm");
        }
    }

    public class YesNoBooleanFormatter : IValueFormatter
    {
        public string FormatValue(ResolutionContext context)
        {
            if (context.SourceValue == null)
                return null;

            if (!(context.SourceValue is bool))
                return context.SourceValue.ToNullSafeString();

            return bool.Parse(context.SourceValue.ToNullSafeString()) ? "Si" : "No";
        }
    }
}