using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CoautorExternoResenaMapper : AutoFormMapper<CoautorExternoResena, CoautorExternoResenaForm>, ICoautorExternoResenaMapper
    {
        readonly ICatalogoService catalogoService;

        public CoautorExternoResenaMapper(IRepository<CoautorExternoResena> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(CoautorExternoResenaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CoautorExternoResenaForm message, CoautorExternoResena model)
        {
            model.InvestigadorExterno = catalogoService.GetInvestigadorExternoById(message.InvestigadorExternoId);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadorEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}
