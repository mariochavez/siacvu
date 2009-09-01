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
        readonly ICoautorExternoLibroMapper coautorExternoLibroMapper;
        readonly ICoautorInternoLibroMapper coautorInternoLibroMapper;
        readonly IProyectoService proyectoService;
		
        public LibroMapper(IRepository<Libro> repository,
		    ICatalogoService catalogoService,
            ICoautorExternoLibroMapper coautorExternoLibroMapper,
            ICoautorInternoLibroMapper coautorInternoLibroMapper,
            IProyectoService proyectoService
		) 
			: base(repository)
        {
			this.catalogoService = catalogoService;
            this.coautorExternoLibroMapper = coautorExternoLibroMapper;
            this.coautorInternoLibroMapper = coautorInternoLibroMapper;
            this.proyectoService = proyectoService;
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
            model.Editorial = message.Editorial;
            model.NoPaginas = message.NoPaginas;
            model.Tiraje = message.Tiraje;
            model.PalabrasClave = message.PalabrasClave;
            model.CoTraductor = message.CoTraductor;
            model.Traductor = message.Traductor;

            model.FechaAceptacion = message.FechaAceptacion.FromYearDateToDateTime();
            model.FechaEdicion = message.FechaEdicion.FromShortDateToDateTime();

            model.TipoPublicacion = catalogoService.GetTipoPublicacionById(message.TipoPublicacion);
		    model.EstadoProducto = catalogoService.GetEstadoProductoById(message.EstadoProducto);
            model.Proyecto = proyectoService.GetProyectoById(message.Proyecto);
		    model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematicaId);
		    model.Pais = catalogoService.GetPaisById(message.Pais);
		    model.Idioma = catalogoService.GetIdiomaById(message.Idioma);
		    model.FormaParticipacion = catalogoService.GetFormaParticipacionById(message.FormaParticipacion);
            model.IdentificadorLibro = catalogoService.GetIdentificadorLibroById(message.IdentificadorLibro);
            model.Area = catalogoService.GetAreaById(message.Area);
            model.Disciplina = catalogoService.GetDisciplinaById(message.Disciplina);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.Subdisciplina);
        }

        public Libro Map(LibroForm message, Usuario usuario, PeriodoReferencia periodo)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadorPor = usuario;
                model.PeriodoReferencia = periodo;
            }

            model.ModificadoPor = usuario;

            return model;
        }

        public Libro Map(LibroForm message, Usuario usuario, PeriodoReferencia periodo,
            string[] coautoresExternos, string[] coautoresInternos)
        {
            var model = Map(message, usuario, periodo);

            foreach (var coautorId in coautoresExternos)
            {
                var coautor =
                    coautorExternoLibroMapper.Map(new CoautorExternoLibroForm
                                                         {InvestigadorExternoId = int.Parse(coautorId)});

                coautor.CreadorPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorExterno(coautor);
            }

            foreach (var coautorId in coautoresInternos)
            {
                var coautor =
                    coautorInternoLibroMapper.Map(new CoautorInternoLibroForm
                                                         {InvestigadorId = int.Parse(coautorId)});

                coautor.CreadorPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorInterno(coautor);
            }

            return model;
        }
    }
}