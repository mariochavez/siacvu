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
        readonly IProductoAcademicoMovilidadAcademicaMapper productoAcademicoMovilidadAcademicaMapper;

        public MovilidadAcademicaMapper(IRepository<MovilidadAcademica> repository, ICatalogoService catalogoService, 
            ITipoActividadMovilidadAcademicaMapper tipoActividadMovilidadAcademicaMapper, 
            IProductoDerivadoMovilidadAcademicaMapper productoDerivadoMovilidadAcademicaMapper, 
            IProyectoMovilidadAcademicaMapper proyectoMovilidadAcademicaMapper,
            IProductoAcademicoMovilidadAcademicaMapper productoAcademicoMovilidadAcademicaMapper)
            : base(repository)
        {
            this.catalogoService = catalogoService;
            this.tipoActividadMovilidadAcademicaMapper = tipoActividadMovilidadAcademicaMapper;
            this.productoDerivadoMovilidadAcademicaMapper = productoDerivadoMovilidadAcademicaMapper;
            this.proyectoMovilidadAcademicaMapper = proyectoMovilidadAcademicaMapper;
            this.productoAcademicoMovilidadAcademicaMapper = productoAcademicoMovilidadAcademicaMapper;
        }

        protected override int GetIdFromMessage(MovilidadAcademicaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(MovilidadAcademicaForm message, MovilidadAcademica model)
        {
            model.Adscripcion = message.Adscripcion;
            model.AdscripcionFisica = message.AdscripcionFisica;

            model.FechaInicial = message.FechaInicial.FromShortDateToDateTime();
            model.FechaFinal = message.FechaFinal.FromShortDateToDateTime();

            model.TipoEstancia = catalogoService.GetTipoEstanciaById(message.TipoEstancia);
            model.TipoInstitucion = catalogoService.GetTipoInstitucionById(message.TipoInstitucion);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematicaId);
            model.Convenio = catalogoService.GetConvenioById(message.Convenio);
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

        public MovilidadAcademica Map(MovilidadAcademicaForm message, Usuario usuario,
            string[] tiposActividad, string[] proyectos, string[] productoDerivados, string[] productoAcademicos)
        {
            var model = Map(message, usuario);

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

            foreach (var productoAcaId in productoAcademicos)
            {
                var productoAca =
                    productoAcademicoMovilidadAcademicaMapper.Map(new ProductoAcademicoMovilidadAcademicaForm { ProductoAcademicoId = int.Parse(productoAcaId) });

                productoAca.CreadorPor = usuario;
                productoAca.ModificadoPor = usuario;

                model.AddProductoAcademico(productoAca);
            }

            return model;
        }
    }
}
