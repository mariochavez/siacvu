using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class LibroMapper : AutoFormMapper<Libro, LibroForm>, ILibroMapper
    {
		readonly ICatalogoService catalogoService;
        readonly IEventoService eventoService;
        readonly ICoautorExternoLibroMapper coautorExternoLibroMapper;
        readonly ICoautorInternoLibroMapper coautorInternoLibroMapper;
        readonly IProyectoService proyectoService;
        readonly IEditorialLibroMapper editorialLibroMapper;
        private Usuario usuarioLibro = null;
		
        public LibroMapper(IRepository<Libro> repository,
		    ICatalogoService catalogoService,
            ICoautorExternoLibroMapper coautorExternoLibroMapper,
            ICoautorInternoLibroMapper coautorInternoLibroMapper,
            IEventoService eventoService,
            IProyectoService proyectoService,
            IEditorialLibroMapper editorialLibroMapper) 
			: base(repository)
        {
            this.eventoService = eventoService;
            this.catalogoService = catalogoService;
            this.coautorExternoLibroMapper = coautorExternoLibroMapper;
            this.coautorInternoLibroMapper = coautorInternoLibroMapper;
            this.proyectoService = proyectoService;
            this.editorialLibroMapper = editorialLibroMapper;
        }		
		
        protected override int GetIdFromMessage(LibroForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(LibroForm message, Libro model)
        {
            model.TieneProyecto = message.TieneProyecto;
            model.Nombre = message.Nombre;
            model.ISBN = message.ISBN;
            model.NoPaginas = message.NoPaginas;
            model.Tiraje = message.Tiraje;
            model.Numero = message.Numero;
            model.Volumen = message.Volumen;
            model.PalabraClave1 = message.PalabraClave1;
            model.PalabraClave2 = message.PalabraClave2;
            model.PalabraClave3 = message.PalabraClave3;
            model.TipoProducto = message.TipoProducto;
            model.Edicion = message.Edicion;
            model.EstadoProducto = message.EstadoProducto;
            model.Reimpresion = message.Reimpresion;
            model.FormatoPublicacion = message.FormatoPublicacion;
            model.ContenidoLibro = message.ContenidoLibro;
            model.CoautorSeOrdenaAlfabeticamente = message.CoautorSeOrdenaAlfabeticamente;

            if (model.Usuario == null || model.Usuario == usuarioLibro)
                model.PosicionAutor = message.PosicionAutor;

            if (message.EstadoProducto != 0 && message.EstadoProducto != 1)
            {
                if (message.FechaAceptacion.FromYearDateToDateTime() > DateTime.Parse("1910-01-01"))
                    model.FechaAceptacion = message.FechaAceptacion.FromYearDateToDateTime();
                if (message.FechaPublicacion.FromYearDateToDateTime() > DateTime.Parse("1910-01-01"))
                {
                    if (message.FechaAceptacion.FromYearDateToDateTime() == DateTime.Parse("1910-01-01"))
                        model.FechaAceptacion = message.FechaPublicacion.FromYearDateToDateTime();
                }
            }
            else
                model.FechaAceptacion = message.FechaAceptacion.FromYearDateToDateTime();

            model.FechaPublicacion = message.FechaPublicacion.FromYearDateToDateTime();

            model.AreaTematica = catalogoService.GetAreaTematicaById(message.AreaTematicaId);
            model.RevistaPublicacion = catalogoService.GetRevistaPublicacionById(message.RevistaPublicacionId);
            model.Proyecto = proyectoService.GetProyectoById(message.ProyectoId);
            model.Evento = eventoService.GetEventoById(message.EventoId);

            model.Area = catalogoService.GetAreaById(message.AreaId);
            model.Disciplina = catalogoService.GetDisciplinaById(message.DisciplinaId);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.SubdisciplinaId);
        }

        public Libro Map(LibroForm message, Usuario usuario)
        {
            usuarioLibro = usuario;
            var model = Map(message);

            model.ModificadoPor = usuario;

            return model;
        }

        public Libro Map(LibroForm message, Usuario usuario, Investigador investigador)
        {
            usuarioLibro = usuario;
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadoPor = usuario;
                model.Sede = GetLatest(investigador.CargosInvestigador).Sede;
                model.Departamento = GetLatest(investigador.CargosInvestigador).Departamento;
            }

            if (model.Usuario != investigador.Usuario)
            {
                foreach (var coautor in model.CoautorInternoLibros)
                {
                    if (coautor.Investigador == investigador)
                        coautor.Posicion = message.PosicionAutor;
                }
            }

            model.ModificadoPor = usuario;

            return model;
        }

        public Libro Map(LibroForm message, Usuario usuario, Investigador investigador,
            CoautorExternoProductoForm[] coautoresExternos, CoautorInternoProductoForm[] coautoresInternos,
            EditorialProductoForm[] editoriales)
        {
            var model = Map(message, usuario, investigador);

            foreach (var coautorExterno in coautoresExternos)
            {
                var coautor =
                    coautorExternoLibroMapper.Map(coautorExterno);

                coautor.CreadoPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorExterno(coautor);
            }

            foreach (var coautorInterno in coautoresInternos)
            {
                var coautor =
                    coautorInternoLibroMapper.Map(coautorInterno);

                coautor.CreadoPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorInterno(coautor);
            }

            foreach (var editorial in editoriales)
            {
                var editorialProducto = editorialLibroMapper.Map(editorial);

                editorialProducto.CreadoPor = usuario;
                editorialProducto.ModificadoPor = usuario;

                model.AddEditorial(editorialProducto);
            }


            return model;
        }
    }
}