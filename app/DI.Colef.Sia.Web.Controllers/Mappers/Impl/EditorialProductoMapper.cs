using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.DomainModel;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    //public class EditorialProductoMapper : AutoFormMapper<EditorialProducto, EditorialProductoForm>, IEditorialProductoMapper
    //{
    //    readonly ICatalogoService catalogoService;

    //    public EditorialProductoMapper(IRepository<EditorialProducto> repository, ICatalogoService catalogoService)
    //        : base(null)
    //    {

    //        this.catalogoService = catalogoService;
    //    }

    //    protected override int GetIdFromMessage(EditorialProductoForm message)
    //    {
    //        return message.Id;
    //    }

    //    public override EditorialProductoForm Map(EditorialProducto model)
    //    {
    //        var message = base.Map(model);
    //        if (message.EditorialId > 0)
    //            message.EditorialNombre = model.Editorial.Nombre;

    //        return message;
    //    }

    //    protected override void MapToModel(EditorialProductoForm message, EditorialProducto model)
    //    {
    //        var editorial = catalogoService.GetEditorialById(message.EditorialId);
    //        if (editorial != null && String.Compare(editorial.Nombre, message.EditorialNombre) >= 0)
    //        {
    //            model.Editorial = editorial;
    //        }
    //        else
    //        {
    //            model.EditorialNombre = message.EditorialNombre;
    //            model.Editorial = null;
    //        }

    //        model.Pais = catalogoService.GetPaisById(message.PaisId);

    //        if (model.IsTransient())
    //        {
    //            model.Activo = true;
    //            model.CreadoEl = DateTime.Now;
    //        }
    //        model.ModificadoEl = DateTime.Now;
    //    }
    //}

    public class EditorialProductoMapper<TModel> : EditorialAutoMapper<TModel>, IEditorialProductoMapper<TModel> where TModel : Entity, new()
    {
        public EditorialProductoMapper(IRepository<TModel> repository, ICatalogoService catalogoService)
            : base(repository, catalogoService)
        {
        }
    }

    public class EditorialAutoMapper<TModel> : AutoFormMapper<EditorialProducto, EditorialProductoForm> where TModel : Entity, new()
    {
        readonly IRepository<TModel> repository;
        readonly ICatalogoService catalogoService;

        public EditorialAutoMapper(IRepository<TModel> repository, ICatalogoService catalogoService)
            : base(null)
        {
            this.repository = repository;
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(EditorialProductoForm message)
        {
            return message.Id;
        }

        public override EditorialProducto Map(EditorialProductoForm message)
        {
            TModel model = repository.Get(GetIdFromMessage(message)) ?? new TModel();
            MapToModel(message, model as EditorialProducto);
            return model as EditorialProducto;
        }

        public new EditorialProductoForm[] Map(EditorialProducto[] model)
        {
            var messages = Map<EditorialProducto[], EditorialProductoForm[]>(model);
            for (int i = 0; i < model.Length; i++)
            {
                if (messages[i].EditorialId > 0)
                    messages[i].EditorialNombre = model[i].Editorial.Nombre;
            }

            return messages;
        }

        public override EditorialProductoForm Map(EditorialProducto model)
        {
            var message = base.Map(model);
            if (message.EditorialId > 0)
                message.EditorialNombre = model.Editorial.Nombre;

            return message;
        }

        protected override void MapToModel(EditorialProductoForm message, EditorialProducto model)
        {
            var editorial = catalogoService.GetEditorialById(message.EditorialId);
            if (editorial != null && String.Compare(editorial.Nombre, message.EditorialNombre) >= 0)
            {
                model.Editorial = editorial;
            }
            else
            {
                model.EditorialNombre = message.EditorialNombre;
                model.Editorial = null;
            }

            model.Pais = catalogoService.GetPaisById(message.PaisId);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadoEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}
