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
        readonly ITipoActividadMovilidadAcademicaMapper tipoActividadMovilidadAcademicaMapper;
        readonly IProductoDerivadoMovilidadAcademicaMapper productoDerivadoMovilidadAcademicaMapper;
        readonly IProyectoMovilidadAcademicaMapper proyectoMovilidadAcademicaMapper;

        public MovilidadAcademicaMapper(IRepository<MovilidadAcademica> repository, ICatalogoService catalogoService, 
            ITipoActividadMovilidadAcademicaMapper tipoActividadMovilidadAcademicaMapper, 
            IProductoDerivadoMovilidadAcademicaMapper productoDerivadoMovilidadAcademicaMapper, 
            IProyectoMovilidadAcademicaMapper proyectoMovilidadAcademicaMapper)
            : base(repository)
        {
            this.catalogoService = catalogoService;
            this.tipoActividadMovilidadAcademicaMapper = tipoActividadMovilidadAcademicaMapper;
            this.productoDerivadoMovilidadAcademicaMapper = productoDerivadoMovilidadAcademicaMapper;
            this.proyectoMovilidadAcademicaMapper = proyectoMovilidadAcademicaMapper;
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
            model.TipoInstitucion = catalogoService.GetTipoInstitucionById(message.TipoInstitucion);
            model.Institucion = catalogoService.GetInstitucionById(message.Institucion);
            model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematica);
            model.Convenio = catalogoService.GetConvenioById(message.Convenio);

            if (message.TipoActividadMovilidadAcademica != null)
                model.AddTipoActividad(tipoActividadMovilidadAcademicaMapper.Map(message.TipoActividadMovilidadAcademica));
            if (message.ProductoDerivadoMovilidadAcademica != null)
                model.AddProductoDerivado(productoDerivadoMovilidadAcademicaMapper.Map(message.ProductoDerivadoMovilidadAcademica));
            if (message.ProyectoMovilidadAcademica != null)
                model.AddProyecto(proyectoMovilidadAcademicaMapper.Map(message.ProyectoMovilidadAcademica));
        }

        public MovilidadAcademica Map(MovilidadAcademicaForm message, Usuario usuario, Investigador investigador)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Investigador = investigador;
                model.CreadorPor = usuario;
            }

            model.ModificadoPor = usuario;

            return model;
        }

        public MovilidadAcademica Map(MovilidadAcademicaForm message, Usuario usuario, Investigador investigador,
            string[] tiposActividad, string[] proyectos, string[] productoDerivados)
        {
            var model = Map(message, usuario, investigador);

            foreach (var tipoId in tiposActividad)
            {
                var tipo =
                    tipoActividadMovilidadAcademicaMapper.Map(new TipoActividadMovilidadAcademicaForm { TipoActividadId = int.Parse(tipoId) });

                tipo.CreadorPor = usuario;
                tipo.ModificadoPor = usuario;

                model.AddTipoActividad(tipo);
            }

            foreach (var proyectoId in proyectos)
            {
                var proyecto =
                    proyectoMovilidadAcademicaMapper.Map(new ProyectoMovilidadAcademicaForm { ProyectoId = int.Parse(proyectoId) });

                proyecto.CreadorPor = usuario;
                proyecto.ModificadoPor = usuario;

                model.AddProyecto(proyecto);
            }

            foreach (var productoId in productoDerivados)
            {
                var producto =
                    productoDerivadoMovilidadAcademicaMapper.Map(new ProductoDerivadoMovilidadAcademicaForm { ProductoDerivadoId = int.Parse(productoId) });

                producto.CreadorPor = usuario;
                producto.ModificadoPor = usuario;

                model.AddProductoDerivado(producto);
            }

            return model;
        }
    }
}
