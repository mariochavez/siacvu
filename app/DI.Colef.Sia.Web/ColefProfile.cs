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

            Mapper.CreateMap<Cargo, CargoForm>();
            Mapper.CreateMap<Puesto, PuestoForm>();
            Mapper.CreateMap<Departamento, DepartamentoForm>();
            Mapper.CreateMap<Sede, SedeForm>();
            Mapper.CreateMap<Categoria, CategoriaForm>();
            Mapper.CreateMap<GradoAcademico, GradoAcademicoForm>();
            Mapper.CreateMap<SNI, SNIForm>();
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