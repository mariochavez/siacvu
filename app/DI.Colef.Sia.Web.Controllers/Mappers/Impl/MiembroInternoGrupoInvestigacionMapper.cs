using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class MiembroInternoGrupoInvestigacionMapper : AutoFormMapper<MiembroInternoGrupoInvestigacion, CoautorInternoProductoForm>, IMiembroInternoGrupoInvestigacionMapper
    {
        readonly IInvestigadorService investigadorService;

        public MiembroInternoGrupoInvestigacionMapper(IRepository<MiembroInternoGrupoInvestigacion> repository, IInvestigadorService investigadorService)
            : base(repository)
        {
            this.investigadorService = investigadorService;
        }

        protected override int GetIdFromMessage(CoautorInternoProductoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CoautorInternoProductoForm message, MiembroInternoGrupoInvestigacion model)
        {
            model.Investigador = investigadorService.GetInvestigadorById(message.InvestigadorId);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadoEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
            model.Posicion = message.Posicion;
            model.CoautorSeOrdenaAlfabeticamente = message.CoautorSeOrdenaAlfabeticamente;
        }
    }
}
