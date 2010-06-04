using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.DomainModel;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class InstitucionProductoMapper<TModel> : InstitucionAutoMapper<TModel>, IInstitucionProductoMapper<TModel> where TModel : Entity, new()
    {
        public InstitucionProductoMapper(IRepository<TModel> repository, ICatalogoService catalogoService)
            : base(repository, catalogoService){}
    }

    public class InstitucionAutoMapper<TModel> : AutoFormMapper<InstitucionProducto, InstitucionProductoForm> where TModel : Entity, new()
    {
        readonly IRepository<TModel> repository;
        readonly ICatalogoService catalogoService;

        public InstitucionAutoMapper(IRepository<TModel> repository, ICatalogoService catalogoService)
            : base(null)
        {
            this.repository = repository;
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(InstitucionProductoForm message)
        {
            return message.Id;
        }

        public override InstitucionProducto Map(InstitucionProductoForm message)
        {
            var model = repository.Get(GetIdFromMessage(message)) ?? new TModel();
            MapToModel(message, model as InstitucionProducto);

            return model as InstitucionProducto;
        }

        public new InstitucionProductoForm[] Map(InstitucionProducto[] model)
        {
            var messages = Map<InstitucionProducto[], InstitucionProductoForm[]>(model);

            for (var i = 0; i < model.Length; i++)
            {
                if (messages[i].InstitucionId > 0)
                    messages[i].InstitucionNombre = model[i].Institucion.Nombre;
            }

            return messages;
        }

        public override InstitucionProductoForm Map(InstitucionProducto model)
        {
            var message = base.Map(model);
            if (message.InstitucionId > 0)
                message.InstitucionNombre = model.Institucion.Nombre;

            return message;
        }

        protected override void MapToModel(InstitucionProductoForm message, InstitucionProducto model)
        {
            var institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            if(institucion != null && string.Compare(institucion.Nombre, message.InstitucionNombre) >= 0)
            {
                model.Institucion = institucion;
            }
            else
            {
                model.InstitucionNombre = message.InstitucionNombre;
                model.Institucion = null;
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
