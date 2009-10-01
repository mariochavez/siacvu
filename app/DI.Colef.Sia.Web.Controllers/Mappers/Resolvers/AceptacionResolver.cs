using System;
using AutoMapper;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers.Resolvers
{
    public class AceptacionResolver : ValueResolver<Capitulo, string>
    {
        protected override string ResolveCore(Capitulo source)
        {
            return source.FechaAceptacion <= DateTime.Parse("1910-01-01") ? String.Empty : (source.FechaAceptacion).ToString("yyyy");
        }
        
    }
}