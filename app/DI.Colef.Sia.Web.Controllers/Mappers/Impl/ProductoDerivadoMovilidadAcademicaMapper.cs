using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ProductoDerivadoMovilidadAcademicaMapper : AutoFormMapper<ProductoDerivadoMovilidadAcademica, ProductoDerivadoMovilidadAcademicaForm>, IProductoDerivadoMovilidadAcademicaMapper
    {
        readonly ICatalogoService catalogoService;

        public ProductoDerivadoMovilidadAcademicaMapper(IRepository<ProductoDerivadoMovilidadAcademica> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(ProductoDerivadoMovilidadAcademicaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ProductoDerivadoMovilidadAcademicaForm message, ProductoDerivadoMovilidadAcademica model)
        {
            model.ProductoDerivado = catalogoService.GetProductoDerivadoById(message.ProductoDerivado);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadorEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}
