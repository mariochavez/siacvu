using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CoautorExternoGrupoInvestigacionMapper : AutoFormMapper<MiembroExternoGrupoInvestigacion, CoautorExternoProductoForm>, IMiembroExternoGrupoInvestigacionMapper
    {
        readonly ICatalogoService catalogoService;

        public CoautorExternoGrupoInvestigacionMapper(IRepository<MiembroExternoGrupoInvestigacion> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(CoautorExternoProductoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CoautorExternoProductoForm message, MiembroExternoGrupoInvestigacion model)
        {
            model.InvestigadorExterno = catalogoService.GetInvestigadorExternoById(message.InvestigadorExternoId);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.CoautorSeOrdenaAlfabeticamente = message.CoautorSeOrdenaAlfabeticamente;
            model.Posicion = message.Posicion;

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadoEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}
