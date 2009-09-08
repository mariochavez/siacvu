using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class EstatusFormacionAcademicaMapper : AutoFormMapper<EstatusFormacionAcademica, EstatusFormacionAcademicaForm>, IEstatusFormacionAcademicaMapper
    {
        public EstatusFormacionAcademicaMapper(IRepository<EstatusFormacionAcademica> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(EstatusFormacionAcademicaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(EstatusFormacionAcademicaForm message, EstatusFormacionAcademica model)
        {
			model.Nombre = message.Nombre;
        }
    }
}
