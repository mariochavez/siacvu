using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ProyectoMovilidadAcademicaMapper : AutoFormMapper<ProyectoMovilidadAcademica, ProyectoMovilidadAcademicaForm>, IProyectoMovilidadAcademicaMapper
    {
        readonly ICatalogoService catalogoService;

        public ProyectoMovilidadAcademicaMapper(IRepository<ProyectoMovilidadAcademica> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(ProyectoMovilidadAcademicaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ProyectoMovilidadAcademicaForm message, ProyectoMovilidadAcademica model)
        {
            model.Proyecto = catalogoService.GetProyectoById(message.Proyecto);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadorEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}
