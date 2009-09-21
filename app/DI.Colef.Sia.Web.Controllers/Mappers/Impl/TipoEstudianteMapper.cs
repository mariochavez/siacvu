using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoEstudianteMapper : AutoFormMapper<TipoEstudiante, TipoEstudianteForm>, ITipoEstudianteMapper
    {
        public TipoEstudianteMapper(IRepository<TipoEstudiante> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TipoEstudianteForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoEstudianteForm message, TipoEstudiante model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
