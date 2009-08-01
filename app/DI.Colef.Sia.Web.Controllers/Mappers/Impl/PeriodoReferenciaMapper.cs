using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class PeriodoReferenciaMapper : AutoFormMapper<PeriodoReferencia, PeriodoReferenciaForm>, IPeriodoReferenciaMapper
    {
        public PeriodoReferenciaMapper(IRepository<PeriodoReferencia> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(PeriodoReferenciaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(PeriodoReferenciaForm message, PeriodoReferencia model)
        {
			model.Periodo = message.Periodo;
		    model.Orden = message.Orden;
		    model.FechaInicial = message.FechaInicial;
		    model.FechaFinal = message.FechaFinal;
        }
    }
}
