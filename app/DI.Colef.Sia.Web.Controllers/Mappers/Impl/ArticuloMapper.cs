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

            model.FechaAceptacion = message.FechaAceptacion.FromYearDateToDateTime();
            model.FechaEdicion = message.FechaEdicion.FromShortDateToDateTime();

            model.Indice1 = catalogoService.GetIndiceById(message.Indice1);
            model.Indice2 = catalogoService.GetIndiceById(message.Indice2);
            model.Indice3 = catalogoService.GetIndiceById(message.Indice3);
            model.TipoArticulo = catalogoService.GetTipoArticuloById(message.TipoArticulo);
            model.Idioma = catalogoService.GetIdiomaById(message.Idioma);
            model.EstadoProducto = catalogoService.GetEstadoProductoById(message.EstadoProducto);
            model.PeriodoReferencia = catalogoService.GetPeriodoReferenciaById(message.PeriodoReferenciaId);
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
            model.Proyecto = catalogoService.GetProyectoById(message.Proyecto);
        }

        public Articulo Map(ArticuloForm message, Usuario usuario, Investigador investigador)
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

        public Articulo Map(ArticuloForm message, Usuario usuario, Investigador investigador, 
            string[] coautoresExternos, string[] coautoresInternos)
        {
            var model = Map(message, usuario, investigador);

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
