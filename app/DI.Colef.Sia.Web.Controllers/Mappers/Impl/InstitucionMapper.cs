using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class InstitucionMapper : AutoFormMapper<Institucion, InstitucionForm>, IInstitucionMapper
    {
        public InstitucionMapper(IRepository<Institucion> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(InstitucionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(InstitucionForm message, Institucion model)
        {
            model.Nombre = message.Nombre;
            model.Responsable = message.Responsable;
            model.Email = message.Email;
        }
    }
}
