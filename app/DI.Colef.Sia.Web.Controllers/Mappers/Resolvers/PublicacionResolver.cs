using System;
using AutoMapper;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers.Resolvers
{
    public class ArticuloPublicacionResolver : ValueResolver<Articulo, string>
    {
        protected override string ResolveCore(Articulo source)
        {
            return source.FechaPublicacion <= DateTime.Parse("1910-01-01") ? String.Empty : (source.FechaPublicacion).ToString("yyyy");
        }
    }

    public class ResenaPublicacionResolver : ValueResolver<Resena, string>
    {
        protected override string ResolveCore(Resena source)
        {
            return source.FechaPublicacion <= DateTime.Parse("1910-01-01") ? String.Empty : (source.FechaPublicacion).ToString("yyyy");
        }
    }
}