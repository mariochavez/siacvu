using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ConvenioMapper : AutoFormMapper<Convenio, ConvenioForm>, IConvenioMapper
    {
        public ConvenioMapper(IRepository<Convenio> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(ConvenioForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ConvenioForm message, Convenio model)
        {
			model.Nombre = message.Nombre;
            model.FechaFirma = message.FechaFirma.FromShortDateToDateTime();
            model.FechaConclusion = message.FechaConclusion.FromShortDateToDateTime();
            model.TerminoReferencia = message.TerminoReferencia;
            model.ProductoComprometido = message.ProductoComprometido;
        }
    }
}
