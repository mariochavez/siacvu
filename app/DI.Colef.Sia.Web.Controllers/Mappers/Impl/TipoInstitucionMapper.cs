using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoInstitucionMapper : AutoFormMapper<TipoInstitucion, TipoInstitucionForm>, ITipoInstitucionMapper
    {
        public TipoInstitucionMapper(IRepository<TipoInstitucion> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(TipoInstitucionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoInstitucionForm message, TipoInstitucion model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
