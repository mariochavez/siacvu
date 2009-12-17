using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class InstitucionEventoMapper : AutoFormMapper<InstitucionEvento, InstitucionProductoForm>, IInstitucionEventoMapper
    {
		readonly ICatalogoService catalogoService;

        public InstitucionEventoMapper(IRepository<InstitucionEvento> repository,
            ICatalogoService catalogoService)
			: base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(InstitucionProductoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(InstitucionProductoForm message, InstitucionEvento model)
        {
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
			
			if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadoEl = DateTime.Now;
            }

            model.ModificadoEl = DateTime.Now;
        }
}
}