using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class GradoAcademicoMapper : AutoFormMapper<GradoAcademico, GradoAcademicoForm>, IGradoAcademicoMapper
    {
        public GradoAcademicoMapper(IRepository<GradoAcademico> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(GradoAcademicoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(GradoAcademicoForm message, GradoAcademico model)
        {
            model.Activo = message.Activo;
			model.Nombre = message.Nombre;
        }
    }
}
