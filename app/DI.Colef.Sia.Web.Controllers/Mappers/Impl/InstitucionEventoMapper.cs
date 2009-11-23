using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class InstitucionEventoMapper : AutoFormMapper<InstitucionEvento, InstitucionEventoForm>, IInstitucionEventoMapper
    {
		readonly ICatalogoService catalogoService;

        public InstitucionEventoMapper(IRepository<InstitucionEvento> repository,
            ICatalogoService catalogoService)
			: base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(InstitucionEventoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(InstitucionEventoForm message, InstitucionEvento model)
        {
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