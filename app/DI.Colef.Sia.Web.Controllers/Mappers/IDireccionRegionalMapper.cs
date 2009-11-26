using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public interface IDireccionRegionalMapper : IMapper<DireccionRegional, DireccionRegionalForm>
    {
    }

    public class DireccionRegionalMapper : AutoFormMapper<DireccionRegional, DireccionRegionalForm>, IDireccionRegionalMapper
    {
        public DireccionRegionalMapper(IRepository<DireccionRegional> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(DireccionRegionalForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(DireccionRegionalForm message, DireccionRegional model)
        {
            model.Nombre = message.Nombre;
        }
    }
}
