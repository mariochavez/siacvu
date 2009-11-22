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
            model.Volumen = message.Volumen;
            model.EstadoProducto = message.EstadoProducto;

            model.FechaAceptacion = message.FechaAceptacion.FromShortDateToDateTime();
            model.FechaPublicacion = message.FechaPublicacion.FromShortDateToDateTime();
            model.FechaEdicion = message.FechaEdicion.FromYearDateToDateTime();

            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.Pais = catalogoService.GetPaisById(message.Pais);
            model.RevistaPublicacion = catalogoService.GetRevistaPublicacionById(message.RevistaPublicacionId);
            model.Editorial = catalogoService.GetEditorialById(message.Editorial);
            model.Proyecto = proyectoService.GetProyectoById(message.Proyecto);
            model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematicaId);
        }

        public ParticipacionAcademia Map(ParticipacionAcademiaForm message, Usuario usuario, Investigador investigador)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadorPor = usuario;
                model.Sede = GetLatest(investigador.CargosInvestigador).Sede;
                model.Departamento = GetLatest(investigador.CargosInvestigador).Departamento;
            }

            model.ModificadoPor = usuario;

            return model;
        }
    }
}
