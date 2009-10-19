using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ParticipacionAcademiaMapper : AutoFormMapper<ParticipacionAcademia, ParticipacionAcademiaForm>, IParticipacionAcademiaMapper
    {
        readonly ICatalogoService catalogoService;
        readonly IProyectoService proyectoService;

        public ParticipacionAcademiaMapper(IRepository<ParticipacionAcademia> repository, ICatalogoService catalogoService, IProyectoService proyectoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
            this.proyectoService = proyectoService;
        }

        protected override int GetIdFromMessage(ParticipacionAcademiaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ParticipacionAcademiaForm message, ParticipacionAcademia model)
        {
            model.NombreProducto = message.NombreProducto;
            model.Revista = message.Revista;
            model.Volumen = message.Volumen;
            model.NoVolumen = message.NoVolumen;
            model.Editorial = message.Editorial;

            model.FechaAceptacion = message.FechaAceptacion.FromYearDateToDateTime();
            model.FechaEdicion = message.FechaEdicion.FromShortDateToDateTime();

            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.Pais = catalogoService.GetPaisById(message.Pais);
            model.EstadoProducto = catalogoService.GetEstadoProductoById(message.EstadoProducto);
            model.Proyecto = proyectoService.GetProyectoById(message.Proyecto);
            model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematicaId);
        }

        public ParticipacionAcademia Map(ParticipacionAcademiaForm message, Usuario usuario)
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
