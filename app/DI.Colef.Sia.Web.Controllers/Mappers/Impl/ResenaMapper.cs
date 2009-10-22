using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ResenaMapper : AutoFormMapper<Resena, ResenaForm>, IResenaMapper
    {
        readonly ICatalogoService catalogoService;
        readonly ICoautorExternoResenaMapper coautorExternoResenaMapper;
        readonly ICoautorInternoResenaMapper coautorInternoResenaMapper;
        readonly IAutorResenaMapper autorResenaMapper;
        
        public ResenaMapper(IRepository<Resena> repository, ICatalogoService catalogoService, 
                            ICoautorExternoResenaMapper coautorExternoResenaMapper, 
                            ICoautorInternoResenaMapper coautorInternoResenaMapper,
                            IAutorResenaMapper autorResenaMapper)
            : base(repository)
        {
            this.catalogoService = catalogoService;
            this.coautorExternoResenaMapper = coautorExternoResenaMapper;
            this.coautorInternoResenaMapper = coautorInternoResenaMapper;
            this.autorResenaMapper = autorResenaMapper;
        }

        protected override int GetIdFromMessage(ResenaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ResenaForm message, Resena model)
        {
            model.Numero = message.Numero;
            model.Volumen = message.Volumen;
            model.ResenaTraducida = message.ResenaTraducida;
            model.PosicionAutor = message.PosicionAutor;
            model.NombreProducto = message.NombreProducto;
            model.PaginaInicial = message.PaginaInicial;
            model.PaginaFinal = message.PaginaFinal;
            model.TituloLibro = message.TituloLibro;
            model.PalabraClave1 = message.PalabraClave1;
            model.PalabraClave2 = message.PalabraClave2;
            model.PalabraClave3 = message.PalabraClave3;

            model.FechaEdicion = message.FechaEdicion.FromYearDateToDateTime();
            model.FechaAceptacion = message.FechaAceptacion.FromShortDateToDateTime();
            model.FechaPublicacion = message.FechaPublicacion.FromShortDateToDateTime();

            model.RevistaPublicacion = catalogoService.GetRevistaPublicacionById(message.RevistaPublicacionId);
            model.TipoResena = catalogoService.GetTipoResenaById(message.TipoResena);
            model.EstadoProducto = message.EstadoProducto;
            model.AreaTematica = catalogoService.GetAreaTematicaById(message.AreaTematica);
            model.Idioma = catalogoService.GetIdiomaById(message.Idioma);
            model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematicaId);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.Editorial = catalogoService.GetEditorialById(message.Editorial);
            model.Pais = catalogoService.GetPaisById(message.Pais);

            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.Subdisciplina);

            var disciplina = catalogoService.GetSubdisciplinaById(message.Subdisciplina).Disciplina.Id;
            model.Disciplina = catalogoService.GetDisciplinaById(disciplina);

            var area = catalogoService.GetDisciplinaById(disciplina).Area.Id;
            model.Area = catalogoService.GetAreaById(area);
        }

        public Resena Map(ResenaForm message, Usuario usuario, Investigador investigador)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadorPor = usuario;
                model.Sede = investigador.CargosInvestigador[investigador.CargosInvestigador.Count - 1].Sede;
                model.Departamento = investigador.CargosInvestigador[investigador.CargosInvestigador.Count - 1].Departamento;
            }

            model.ModificadoPor = usuario;

            return model;
        }

        public Resena Map(ResenaForm message, Usuario usuario, Investigador investigador,
            CoautorExternoProductoForm[] coautoresExternos, CoautorInternoProductoForm[] coautoresInternos,
            AutorResenaForm[] autores)
        {
            var model = Map(message, usuario, investigador);
            
            foreach (var coautorExterno in coautoresExternos)
            {
                var coautor =
                    coautorExternoResenaMapper.Map(coautorExterno);

                coautor.CreadorPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorExterno(coautor);
            }
        
            foreach (var coautorInterno in coautoresInternos)
            {
                var coautor =
                    coautorInternoResenaMapper.Map(coautorInterno);

                coautor.CreadorPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorInterno(coautor);
            }

            foreach (var autorResena in autores)
            {
                var autor =
                    autorResenaMapper.Map(autorResena);

                autor.CreadorPor = usuario;
                autor.ModificadoPor = usuario;

                model.AddAutor(autor);
            }

            return model;
        }
    }
}