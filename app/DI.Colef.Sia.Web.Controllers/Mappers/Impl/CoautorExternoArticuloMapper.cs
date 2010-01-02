using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CoautorExternoArticuloMapper : AutoFormMapper<CoautorExternoArticulo, CoautorExternoProductoForm>, ICoautorExternoArticuloMapper
    {
        readonly ICatalogoService catalogoService;

        public CoautorExternoArticuloMapper(IRepository<CoautorExternoArticulo> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(CoautorExternoProductoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CoautorExternoProductoForm message, CoautorExternoArticulo model)
        {
            model.InvestigadorExterno = catalogoService.GetInvestigadorExternoById(message.InvestigadorExternoId);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.Posicion = message.Posicion;
            model.CoautorSeOrdenaAlfabeticamente = message.CoautorSeOrdenaAlfabeticamente;

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadoEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}
