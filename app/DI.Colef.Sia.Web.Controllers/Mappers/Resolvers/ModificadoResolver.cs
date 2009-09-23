using System;
using AutoMapper;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers.Resolvers
{
    public class ModificadoResolver : ValueResolver<IBaseEntity, string>
    {
        protected override string ResolveCore(IBaseEntity source)
        {
            var date = source.CreadorEl > source.ModificadoEl ? source.CreadorEl : source.ModificadoEl;
            return date <= DateTime.Parse("1910-01-01") ? String.Empty : (date).ToString("dd MMM, yyyy");
        }
    }
}