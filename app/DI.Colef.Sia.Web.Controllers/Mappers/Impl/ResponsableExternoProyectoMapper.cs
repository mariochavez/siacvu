using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ResponsableExternoProyectoMapper : AutoFormMapper<ResponsableExternoProyecto, ResponsableExternoProyectoForm>, IResponsableExternoProyectoMapper
    {
        readonly ICatalogoService catalogoService;

        public ResponsableExternoProyectoMapper(IRepository<ResponsableExternoProyecto> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(ResponsableExternoProyectoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ResponsableExternoProyectoForm message, ResponsableExternoProyecto model)
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
