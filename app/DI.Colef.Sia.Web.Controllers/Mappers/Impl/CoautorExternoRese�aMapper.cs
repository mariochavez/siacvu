using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CoautorExternoReseñaMapper : AutoFormMapper<CoautorExternoReseña, CoautorExternoReseñaForm>, ICoautorExternoReseñaMapper
    {
        readonly ICatalogoService catalogoService;

        public CoautorExternoReseñaMapper(IRepository<CoautorExternoReseña> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(CoautorExternoReseñaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CoautorExternoReseñaForm message, CoautorExternoReseña model)
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
