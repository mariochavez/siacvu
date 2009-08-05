using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CoautorExternoArticuloMapper : AutoFormMapper<CoautorExternoArticulo, CoautorExternoArticuloForm>, ICoautorExternoArticuloMapper
    {
        readonly ICatalogoService catalogoService;

        public CoautorExternoArticuloMapper(IRepository<CoautorExternoArticulo> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(CoautorExternoArticuloForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CoautorExternoArticuloForm message, CoautorExternoArticulo model)
        {
            model.InvestigadorExterno = catalogoService.GetInvestigadorExternoById(message.InvestigadorExterno);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadorEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}
