using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class EditorialLibroMapper : AutoFormMapper<EditorialLibro, EditorialProductoForm>, IEditorialLibroMapper
    {
        readonly ICatalogoService catalogoService;

        public EditorialLibroMapper(IRepository<EditorialLibro> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(EditorialProductoForm message)
        {
            return message.Id;
        }

        public override EditorialProductoForm Map(EditorialLibro model)
        {
            var message = base.Map(model);
            if (message.EditorialId > 0)
                message.EditorialNombre = model.Editorial.Nombre;

            return message;
        }

        protected override void MapToModel(EditorialProductoForm message, EditorialLibro model)
        {
            var editorial = catalogoService.GetEditorialById(message.EditorialId);
            if (editorial != null && String.Compare(editorial.Nombre, message.EditorialNombre) >= 0)
            {
                model.Editorial = editorial;
            }else
            {
                model.EditorialNombre = message.EditorialNombre;
                model.Editorial = null;
            }

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadoEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}
