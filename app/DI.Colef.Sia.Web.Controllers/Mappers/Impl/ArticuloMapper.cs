using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ArticuloMapper : AutoFormMapper<Articulo, ArticuloForm>, IArticuloMapper
    {
        readonly ICatalogoService catalogoService;
        readonly ICoautorExternoArticuloMapper coautorExternoArticuloMapper;
        readonly ICoautorInternoArticuloMapper coautorInternoArticuloMapper;
        readonly IProyectoService proyectoService;

        public ArticuloMapper(IRepository<Articulo> repository,
                              ICoautorExternoArticuloMapper coautorExternoArticuloMapper,
                              ICoautorInternoArticuloMapper coautorInternoArticuloMapper,
                              ICatalogoService catalogoService, IProyectoService proyectoService
        )
            : base(repository)
        {
            this.coautorExternoArticuloMapper = coautorExternoArticuloMapper;
            this.coautorInternoArticuloMapper = coautorInternoArticuloMapper;
            this.catalogoService = catalogoService;
            this.proyectoService = proyectoService;
        }

        protected override int GetIdFromMessage(ArticuloForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ArticuloForm message, Articulo model)
        {
            model.Titulo = message.Titulo;
            model.TieneProyecto = message.TieneProyecto;
            model.Volumen = message.Volumen;
            model.Numero = message.Numero;
            model.PalabraClave1 = message.PalabraClave1;
            model.PalabraClave2 = message.PalabraClave2;
            model.PalabraClave3 = message.PalabraClave3;
            model.PosicionAutor = message.PosicionAutor;
            model.ArticuloTraducido = message.ArticuloTraducido;
            model.PaginaInicial = message.PaginaInicial;
            model.PaginaFinal = message.PaginaFinal;

            model.FechaPublicacion = message.FechaPublicacion.FromShortDateToDateTime();
            model.FechaAceptacion = message.FechaAceptacion.FromShortDateToDateTime();
            model.FechaEdicion = message.FechaEdicion.FromYearDateToDateTime();

            model.TipoArticulo = catalogoService.GetTipoArticuloById(message.TipoArticulo);
            model.Idioma = catalogoService.GetIdiomaById(message.Idioma);
            model.EstadoProducto = message.EstadoProducto;
            model.RevistaPublicacion = catalogoService.GetRevistaPublicacionById(message.RevistaPublicacionId);
            model.AreaTematica = catalogoService.GetAreaTematicaById(message.AreaTematicaId);

            model.Proyecto = proyectoService.GetProyectoById(message.ProyectoId);
        }

        public Articulo Map(ArticuloForm message, Usuario usuario, Investigador investigador)
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

        public Articulo Map(ArticuloForm message, Usuario usuario, Investigador investigador,
            CoautorExternoProductoForm[] coautoresExternos, CoautorInternoProductoForm[] coautoresInternos)
        {
            var model = Map(message, usuario, investigador);

            foreach (var coautoresExterno in coautoresExternos)
            {
                var coautor =
                    coautorExternoArticuloMapper.Map(coautoresExterno);
                
                coautor.CreadorPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorExterno(coautor);
            }

            foreach (var coautorInterno in coautoresInternos)
            {
                var coautor =
                    coautorInternoArticuloMapper.Map(coautorInterno);

                coautor.CreadorPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorInterno(coautor);
            }

            return model;
        }
    }
}