using System;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CargoMapper : AutoFormMapper<Cargo, CargoForm>, ICargoMapper
    {
        public CargoMapper(IRepository<Cargo> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(CargoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CargoForm message, Cargo model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
