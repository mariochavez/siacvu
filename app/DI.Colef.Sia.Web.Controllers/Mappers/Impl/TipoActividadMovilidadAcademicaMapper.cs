using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TipoActividadMovilidadAcademicaMapper : AutoFormMapper<TipoActividadMovilidadAcademica, TipoActividadMovilidadAcademicaForm>, ITipoActividadMovilidadAcademicaMapper
    {
        readonly ICatalogoService catalogoService;

        public TipoActividadMovilidadAcademicaMapper(IRepository<TipoActividadMovilidadAcademica> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(TipoActividadMovilidadAcademicaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TipoActividadMovilidadAcademicaForm message, TipoActividadMovilidadAcademica model)
        {
            model.TipoActividad = catalogoService.GetTipoActividadById(message.TipoActividadId);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadorEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}
