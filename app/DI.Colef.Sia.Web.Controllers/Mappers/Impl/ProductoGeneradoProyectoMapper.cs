using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ProductoGeneradoProyectoMapper : AutoFormMapper<ProductoGeneradoProyecto, ProductoGeneradoProyectoForm>, IProductoGeneradoProyectoMapper
    {
        public ProductoGeneradoProyectoMapper(IRepository<ProductoGeneradoProyecto> repository)
            : base(repository)
        {
        }

        protected override int GetIdFromMessage(ProductoGeneradoProyectoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ProductoGeneradoProyectoForm message, ProductoGeneradoProyecto model)
        {
            model.ProductoGenerado = message.ProductoGenerado;
            model.FechaEntrega = message.FechaEntrega.Replace("_","/").FromShortDateToDateTime();

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadoEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
        
    }
}