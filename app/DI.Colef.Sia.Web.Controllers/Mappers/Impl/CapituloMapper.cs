using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CapituloMapper : AutoFormMapper<Capitulo, CapituloForm>, ICapituloMapper
    {
		readonly ICatalogoService catalogoService;
        readonly ICoautorExternoCapituloMapper coautorExternoCapituloMapper;
        readonly ICoautorInternoCapituloMapper coautorInternoCapituloMapper;
        readonly IResponsableInternoCapituloMapper responsableInternoCapituloMapper;
        readonly IResponsableExternoCapituloMapper responsableExternoCapituloMapper;

		public CapituloMapper(IRepository<Capitulo> repository,
		    ICatalogoService catalogoService,
            ICoautorExternoCapituloMapper coautorExternoCapituloMapper,
            ICoautorInternoCapituloMapper coautorInternoCapituloMapper,
            IResponsableInternoCapituloMapper responsableInternoCapituloMapper,
            IResponsableExternoCapituloMapper responsableExternoCapituloMapper
		) 
			: base(repository)
        {
			this.catalogoService = catalogoService;
            this.coautorExternoCapituloMapper = coautorExternoCapituloMapper;
            this.coautorInternoCapituloMapper = coautorInternoCapituloMapper;
            this.responsableInternoCapituloMapper = responsableInternoCapituloMapper;
            this.responsableExternoCapituloMapper = responsableExternoCapituloMapper;
        }		
		
        protected override int GetIdFromMessage(CapituloForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CapituloForm message, Capitulo model)
        {
            model.NombreCapitulo = message.NombreCapitulo;
            model.NombreLibro = message.NombreLibro;
            model.Editorial = message.Editorial;
            model.NoPaginas = message.NoPaginas;
            model.Volumen = message.Volumen;
            model.Editores = message.Editores;
            model.Traductor = message.Traductor;
            model.NombreTraductor = message.NombreTraductor;
            model.Resumen = message.Resumen;

            model.FechaAceptacion = message.FechaAceptacion.FromYearDateToDateTime();
            model.FechaEdicion = message.FechaEdicion.FromShortDateToDateTime();
            
            model.TipoCapitulo = catalogoService.GetTipoCapituloById(message.TipoCapitulo);
            model.EstadoProducto = catalogoService.GetEstadoProductoById(message.EstadoProducto);
            model.PeriodoReferencia = catalogoService.GetPeriodoReferenciaById(message.PeriodoReferenciaId);
            model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematica);
            model.Idioma = catalogoService.GetIdiomaById(message.Idioma);
            model.Pais = catalogoService.GetPaisById(message.Pais);
            model.FormaParticipacion = catalogoService.GetFormaParticipacionById(message.FormaParticipacion);
            model.TipoParticipacion = catalogoService.GetTipoParticipacionById(message.TipoParticipacion);
            model.TipoParticipante = catalogoService.GetTipoParticipanteById(message.TipoParticipante);
            model.Area = catalogoService.GetAreaById(message.Area);
            model.Disciplina = catalogoService.GetDisciplinaById(message.Disciplina);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.Subdisciplina);
            model.Proyecto = catalogoService.GetProyectoById(message.Proyecto);
        }

        public Capitulo Map(CapituloForm message, Usuario usuario, Investigador investigador)
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

        public Capitulo Map(CapituloForm message, Usuario usuario, Investigador investigador,
            string[] coautoresExternos, string[] coautoresInternos, 
            string[] responsablesExternos, string[] responsablesInternos)
        {
            var model = Map(message, usuario, investigador);

            foreach (var coautorId in coautoresExternos)
            {
                var coautor =
                    coautorExternoCapituloMapper.Map(new CoautorExternoCapituloForm { InvestigadorExternoId = int.Parse(coautorId) });

                coautor.CreadorPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorExterno(coautor);
            }

            foreach (var coautorId in coautoresInternos)
            {
                var coautor =
                    coautorInternoCapituloMapper.Map(new CoautorInternoCapituloForm { InvestigadorId = int.Parse(coautorId) });

                coautor.CreadorPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorInterno(coautor);
            }

            foreach (var responsableId in responsablesExternos)
            {
                var responsable =
                    responsableExternoCapituloMapper.Map(new ResponsableExternoCapituloForm { InvestigadorExternoId = int.Parse(responsableId) });

                responsable.CreadorPor = usuario;
                responsable.ModificadoPor = usuario;

                model.AddResponsableExterno(responsable);
            }

            foreach (var responsableId in responsablesInternos)
            {
                var responsable =
                    responsableInternoCapituloMapper.Map(new ResponsableInternoCapituloForm { InvestigadorId = int.Parse(responsableId) });

                responsable.CreadorPor = usuario;
                responsable.ModificadoPor = usuario;

                model.AddResponsableInterno(responsable);
            }

            return model;
        }
    }
}