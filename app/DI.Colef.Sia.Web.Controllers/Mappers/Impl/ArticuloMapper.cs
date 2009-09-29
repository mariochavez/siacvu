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
            model.Participantes = message.Participantes;
            model.PalabraClave1 = message.PalabraClave1;
            model.PalabraClave2 = message.PalabraClave2;
            model.PalabraClave3 = message.PalabraClave3;
            model.PosicionAutor = message.PosicionAutor;
            model.ArticuloTraducido = message.ArticuloTraducido;
            model.FechaPublicacion = message.FechaPublicacion.FromShortDateToDateTime();
            model.FechaAceptacion = message.FechaAceptacion.FromShortDateToDateTime();
            model.FechaEdicion = message.FechaEdicion.FromShortDateToDateTime();

            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);

            model.AreaTematica = catalogoService.GetAreaTematicaById(message.AreaTematica);
            model.Indice1 = catalogoService.GetIndiceById(message.Indice1);
            model.Indice2 = catalogoService.GetIndiceById(message.Indice2);
            model.Indice3 = catalogoService.GetIndiceById(message.Indice3);
            model.TipoArticulo = catalogoService.GetTipoArticuloById(message.TipoArticulo);
            model.Idioma = catalogoService.GetIdiomaById(message.Idioma);
            model.EstadoProducto = catalogoService.GetEstadoProductoById(message.EstadoProducto);
            model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematicaId);
            model.Pais = catalogoService.GetPaisById(message.Pais);
            model.RevistaPublicacion = catalogoService.GetRevistaPublicacionById(message.RevistaPublicacionId);
            model.LineaInvestigacion = catalogoService.GetLineaInvestigacionById(message.LineaInvestigacion);
            model.TipoActividad = catalogoService.GetTipoActividadById(message.TipoActividad);
            model.TipoParticipante = catalogoService.GetTipoParticipacionById(message.TipoParticipante);
            model.Area = catalogoService.GetAreaById(message.Area);
            model.Disciplina = catalogoService.GetDisciplinaById(message.Disciplina);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.Subdisciplina);
            model.Proyecto = proyectoService.GetProyectoById(message.ProyectoId);

            if (model.EstadoProducto == null || model.EstadoProducto.Nombre != "Publicado")
            {
                model.PaginaInicial = 0;
                model.PaginaFinal = 0;
            }
            else
            {
                model.PaginaInicial = message.PaginaInicial;
                model.PaginaFinal = message.PaginaFinal;
            }
        }

        public Articulo Map(ArticuloForm message, Usuario usuario, PeriodoReferencia periodo)
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

        public Articulo Map(ArticuloForm message, Usuario usuario, PeriodoReferencia periodo, 
            string[] coautoresExternos, string[] coautoresInternos)
        {
            var model = Map(message, usuario, periodo);

            foreach (var coautorId in coautoresExternos)
            {
                var coautor =
                    coautorExternoArticuloMapper.Map(new CoautorExternoArticuloForm { InvestigadorExternoId = int.Parse(coautorId) });
                
                coautor.CreadorPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorExterno(coautor);
            }

            foreach (var coautorId in coautoresInternos)
            {
                var coautor =
                    coautorInternoArticuloMapper.Map(new CoautorInternoArticuloForm { InvestigadorId = int.Parse(coautorId) });

                coautor.CreadorPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorInterno(coautor);
            }

            return model;
        }
    }
}