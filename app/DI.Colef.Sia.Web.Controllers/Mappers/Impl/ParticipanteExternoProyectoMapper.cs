using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ParticipanteExternoProyectoMapper : AutoFormMapper<ParticipanteExternoProyecto, ParticipanteExternoProyectoForm>, IParticipanteExternoProyectoMapper
    {
        readonly ICatalogoService catalogoService;

        public ParticipanteExternoProyectoMapper(IRepository<ParticipanteExternoProyecto> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(ParticipanteExternoProyectoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ParticipanteExternoProyectoForm message, ParticipanteExternoProyecto model)
        {
            model.InvestigadorExterno = catalogoService.GetInvestigadorExternoById(message.InvestigadorExternoId);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadorEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}