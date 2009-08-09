using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CoautorExternoEventoMapper : AutoFormMapper<CoautorExternoEvento, CoautorExternoEventoForm>, ICoautorExternoEventoMapper
    {
        readonly ICatalogoService catalogoService;

        public CoautorExternoEventoMapper(IRepository<CoautorExternoEvento> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(CoautorExternoEventoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CoautorExternoEventoForm message, CoautorExternoEvento model)
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
