using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CoautorExternoLibroMapper : AutoFormMapper<CoautorExternoLibro, CoautorExternoProductoForm>, ICoautorExternoLibroMapper
    {
		readonly ICatalogoService catalogoService;
		
		public CoautorExternoLibroMapper(IRepository<CoautorExternoLibro> repository,
            ICatalogoService catalogoService) 
			: base(repository)
        {
			this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(CoautorExternoProductoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CoautorExternoProductoForm message, CoautorExternoLibro model)
        {
            model.InvestigadorExterno = catalogoService.GetInvestigadorExternoById(message.InvestigadorExternoId);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
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
