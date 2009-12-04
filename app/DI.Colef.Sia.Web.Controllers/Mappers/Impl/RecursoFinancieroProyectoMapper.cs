using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class RecursoFinancieroProyectoMapper : AutoFormMapper<RecursoFinancieroProyecto, RecursoFinancieroProyectoForm>, IRecursoFinancieroProyectoMapper
    {
        readonly ICatalogoService catalogoService;

        public RecursoFinancieroProyectoMapper(IRepository<RecursoFinancieroProyecto> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(RecursoFinancieroProyectoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(RecursoFinancieroProyectoForm message, RecursoFinancieroProyecto model)
        {
            model.Recurso = message.Recurso;
            model.Monto = message.Monto;

            model.Moneda = catalogoService.GetMonedaById(message.Moneda);
            model.Institucion = catalogoService.GetInstitucionById(message.Institucion);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadoEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}