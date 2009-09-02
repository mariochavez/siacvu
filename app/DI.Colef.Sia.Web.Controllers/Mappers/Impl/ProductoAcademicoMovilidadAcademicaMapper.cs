using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ProductoAcademicoMovilidadAcademicaMapper : AutoFormMapper<ProductoAcademicoMovilidadAcademica, ProductoAcademicoMovilidadAcademicaForm>, IProductoAcademicoMovilidadAcademicaMapper
    {
		readonly ICatalogoService catalogoService;
		
		public ProductoAcademicoMovilidadAcademicaMapper(IRepository<ProductoAcademicoMovilidadAcademica> repository,	ICatalogoService catalogoService) 
			: base(repository)
        {
			this.catalogoService = catalogoService;
        }
		
        protected override int GetIdFromMessage(ProductoAcademicoMovilidadAcademicaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ProductoAcademicoMovilidadAcademicaForm message, ProductoAcademicoMovilidadAcademica model)
        {
			model.ProductoAcademico = catalogoService.GetProductoAcademicoById(message.ProductoAcademicoId);
			
			if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadorEl = DateTime.Now;
            }

            model.ModificadoEl = DateTime.Now;
        }
    }
}
