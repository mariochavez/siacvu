using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class EditorialDictamenMapper: AutoFormMapper<EditorialDictamen, EditorialProductoForm>, IEditorialDictamenMapper
    {
		readonly ICatalogoService catalogoService;

        public EditorialDictamenMapper(IRepository<EditorialDictamen> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(EditorialProductoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(EditorialProductoForm message, EditorialDictamen model)
        {
            model.Editorial = catalogoService.GetEditorialById(message.EditorialId);
			
			if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadoEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}