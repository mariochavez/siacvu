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

        public ArticuloMapper(IRepository<Articulo> repository,
            ICoautorExternoArticuloMapper coautorExternoArticuloMapper,
            ICoautorInternoArticuloMapper coautorInternoArticuloMapper,
            ICatalogoService catalogoService
        )
            : base(repository)
        {
            this.coautorExternoArticuloMapper = coautorExternoArticuloMapper;
            this.coautorInternoArticuloMapper = coautorInternoArticuloMapper;
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(ArticuloForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ArticuloForm message, Articulo model)
        {
            model.Titulo = message.Titulo;
            model.Volumen = message.Volumen;
            model.Numero = message.Numero;
            model.PaginaInicial = message.PaginaInicial;
            model.PaginaFinal = message.PaginaFinal;
            model.Participantes = message.Participantes;
            model.PalabrasClaves = message.PalabrasClaves;

            model.FechaAceptacion = message.FechaAceptacion.FromShortDateToDateTime();
            model.FechaEdicion = message.FechaEdicion.FromShortDateToDateTime();
            model.FechaPublicacion = message.FechaPublicacion.FromShortDateToDateTime();

            model.Indice1 = catalogoService.GetIndiceById(message.Indice1);
            model.Indice2 = catalogoService.GetIndiceById(message.Indice2);
            model.Indice3 = catalogoService.GetIndiceById(message.Indice3);
            model.TipoArticulo = catalogoService.GetTipoArticuloById(message.TipoArticulo);
            model.Idioma = catalogoService.GetIdiomaById(message.Idioma);
            model.EstadoProducto = catalogoService.GetEstadoProductoById(message.EstadoProducto);
            model.PeriodoReferencia = catalogoService.GetPeriodoReferenciaById(message.PeriodoReferencia);
            model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematica);
            model.Pais = catalogoService.GetPaisById(message.Pais);
            model.RevistaPublicacion = catalogoService.GetRevistaPublicacionById(message.RevistaPublicacion);
            model.Institucion = catalogoService.GetInstitucionById(message.Institucion);
            model.LineaInvestigacion = catalogoService.GetLineaInvestigacionById(message.LineaInvestigacion);
            model.TipoActividad = catalogoService.GetTipoActividadById(message.TipoActividad);
            model.TipoParticipante = catalogoService.GetTipoParticipanteById(message.TipoParticipante);
            model.Area = catalogoService.GetAreaById(message.Area);
            model.Disciplina = catalogoService.GetDisciplinaById(message.Disciplina);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.Subdisciplina);

            if (message.CoautorExternoArticulo != null)
                model.AddCoautorExterno(coautorExternoArticuloMapper.Map(message.CoautorExternoArticulo));
            if (message.CoautorInternoArticulo != null)
                model.AddCoautorInterno(coautorInternoArticuloMapper.Map(message.CoautorInternoArticulo));
        }

        public Articulo Map(ArticuloForm message, Usuario usuario, Investigador investigador)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Investigador = investigador;
                model.CreadorPor = usuario;
                //model.CoautorExternoArticulos[0].CreadorPor = usuario;
                //model.CoautorInternoArticulos[0].CreadorPor = usuario;
            }

            model.ModificadoPor = usuario;

            return model;
        }
    }
}
