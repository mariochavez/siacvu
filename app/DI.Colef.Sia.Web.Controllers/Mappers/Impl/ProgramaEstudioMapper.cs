using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ProgramaEstudioMapper : AutoFormMapper<ProgramaEstudio, ProgramaEstudioForm>, IProgramaEstudioMapper
    {
        public ProgramaEstudioMapper(IRepository<ProgramaEstudio> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(ProgramaEstudioForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ProgramaEstudioForm message, ProgramaEstudio model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
