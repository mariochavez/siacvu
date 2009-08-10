using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CoautorInternoReseñaMapper : AutoFormMapper<CoautorInternoReseña, CoautorInternoReseñaForm>, ICoautorInternoReseñaMapper
    {
        readonly IInvestigadorService investigadorService;

        public CoautorInternoReseñaMapper(IRepository<CoautorInternoReseña> repository, IInvestigadorService investigadorService)
            : base(repository)
        {
            this.investigadorService = investigadorService;
        }

        protected override int GetIdFromMessage(CoautorInternoReseñaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CoautorInternoReseñaForm message, CoautorInternoReseña model)
        {
            model.Investigador = investigadorService.GetInvestigadorById(message.InvestigadorId);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadorEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}
