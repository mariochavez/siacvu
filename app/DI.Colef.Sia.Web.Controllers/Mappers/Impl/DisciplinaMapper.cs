using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class DisciplinaMapper : AutoFormMapper<Disciplina, DisciplinaForm>, IDisciplinaMapper
    {
        readonly ICatalogoService catalogoService;

        public DisciplinaMapper(IRepository<Disciplina> repository, ICatalogoService catalogoService) : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(DisciplinaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(DisciplinaForm message, Disciplina model)
        {
			model.Nombre = message.Nombre;
            model.CodigoConacyt = message.CodigoConacyt;
            model.Area = catalogoService.GetAreaById(message.Area);
        }
    }
}
