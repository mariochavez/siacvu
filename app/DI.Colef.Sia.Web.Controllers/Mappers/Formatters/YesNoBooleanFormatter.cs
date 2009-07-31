using AutoMapper;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers.Formatters
{
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