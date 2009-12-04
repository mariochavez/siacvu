using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class MiembroExternoGrupoInvestigacionMapper : AutoFormMapper<MiembroExternoGrupoInvestigacion, MiembroExternoGrupoInvestigacionForm>, IMiembroExternoGrupoInvestigacionMapper
    {
        readonly ICatalogoService catalogoService;
		
		public MiembroExternoGrupoInvestigacionMapper(IRepository<MiembroExternoGrupoInvestigacion> repository,
            ICatalogoService catalogoService
            ) : base(repository)
        {
			this.catalogoService = catalogoService;
        }
		
        protected override int GetIdFromMessage(MiembroExternoGrupoInvestigacionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(MiembroExternoGrupoInvestigacionForm message, MiembroExternoGrupoInvestigacion model)
        {
            model.InvestigadorExterno = catalogoService.GetInvestigadorExternoById(message.InvestigadorExternoId);
			
			if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadoEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}