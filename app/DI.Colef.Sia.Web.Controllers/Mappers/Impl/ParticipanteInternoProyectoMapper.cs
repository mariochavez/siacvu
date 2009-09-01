using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ParticipanteInternoProyectoMapper : AutoFormMapper<ParticipanteInternoProyecto, ParticipanteInternoProyectoForm>, IParticipanteInternoProyectoMapper
    {
        readonly ICatalogoService catalogoService;
        readonly IInvestigadorService investigadorService;

        public ParticipanteInternoProyectoMapper(IRepository<ParticipanteInternoProyecto> repository, ICatalogoService catalogoService,
                                                 IInvestigadorService investigadorService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
            this.investigadorService = investigadorService;
        }

        protected override int GetIdFromMessage(ParticipanteInternoProyectoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ParticipanteInternoProyectoForm message, ParticipanteInternoProyecto model)
        {
            model.Investigador = investigadorService.GetInvestigadorById(message.InvestigadorId);
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