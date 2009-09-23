using System;
using AutoMapper;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers.Formatters
{
    public class StandardDateTimeFormatter : IValueFormatter
    {
        public string FormatValue(ResolutionContext context)
        {
            if (context.SourceValue == null)
                return null;

            if (!(context.SourceValue is DateTime))
                return context.SourceValue.ToNullSafeString();

            var value = (DateTime)context.SourceValue;

            return value <= DateTime.Parse("1910-01-01") ? String.Empty : (value).ToString("dd/MMM/yyyy HH:mm");
        }
    }
}