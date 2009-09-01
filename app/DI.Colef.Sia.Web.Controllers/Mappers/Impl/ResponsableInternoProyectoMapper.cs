using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ResponsableInternoProyectoMapper : AutoFormMapper<ResponsableInternoProyecto, ResponsableInternoProyectoForm>, IResponsableInternoProyectoMapper
    {
        readonly ICatalogoService catalogoService;
        readonly IInvestigadorService investigadorService;

        public ResponsableInternoProyectoMapper(IRepository<ResponsableInternoProyecto> repository, ICatalogoService catalogoService,
                                                IInvestigadorService investigadorService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
            this.investigadorService = investigadorService;
        }

        protected override int GetIdFromMessage(ResponsableInternoProyectoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ResponsableInternoProyectoForm message, ResponsableInternoProyecto model)
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
