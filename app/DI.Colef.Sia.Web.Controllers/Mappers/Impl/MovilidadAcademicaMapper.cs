using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class MovilidadAcademicaMapper : AutoFormMapper<MovilidadAcademica, MovilidadAcademicaForm>, IMovilidadAcademicaMapper
    {
        readonly ICatalogoService catalogoService;

        public MovilidadAcademicaMapper(IRepository<MovilidadAcademica> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(MovilidadAcademicaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(MovilidadAcademicaForm message, MovilidadAcademica model)
        {
            model.FechaInicial = message.FechaInicial.FromShortDateToDateTime();
            model.FechaFinal = message.FechaFinal.FromShortDateToDateTime();

            model.TipoEstancia = catalogoService.GetTipoEstanciaById(message.TipoEstancia);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
        }

        public MovilidadAcademica Map(MovilidadAcademicaForm message, Usuario usuario)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadorPor = usuario;
            }

            model.ModificadoPor = usuario;

            return model;
        }
    }
}
