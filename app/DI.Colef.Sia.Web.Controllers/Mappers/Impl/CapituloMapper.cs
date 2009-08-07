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
        readonly IInvestigadorService investigadorService;
        readonly ICoautorExternoCapituloMapper coautorExternoCapituloMapper;
        readonly ICoautorInternoCapituloMapper coautorInternoCapituloMapper;
        readonly IResponsableInternoCapituloMapper responsableInternoCapituloMapper;
        readonly IResponsableExternoCapituloMapper responsableExternoCapituloMapper;

		public CapituloMapper(IRepository<Capitulo> repository,
		    ICatalogoService catalogoService,
            IInvestigadorService investigadorService,
            ICoautorExternoCapituloMapper coautorExternoCapituloMapper,
            ICoautorInternoCapituloMapper coautorInternoCapituloMapper,
            IResponsableInternoCapituloMapper responsableInternoCapituloMapper,
            IResponsableExternoCapituloMapper responsableExternoCapituloMapper
		) 
			: base(repository)
        {
			this.catalogoService = catalogoService;
            this.investigadorService = investigadorService;
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

            model.FechaAceptacion = message.FechaAceptacion.FromShortDateToDateTime();
            model.FechaEdicion = message.FechaEdicion.FromShortDateToDateTime();

            if (model.IsTransient())
            {
                model.TipoCapitulo = catalogoService.GetTipoCapituloById(message.TipoCapitulo);
                model.Estado = catalogoService.GetEstadoById(message.Estado);
                model.PeriodoReferencia = catalogoService.GetPeriodoReferenciaById(message.PeriodoReferencia);
                model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematica);
                model.Idioma = catalogoService.GetIdiomaById(message.Idioma);
                model.Pais = catalogoService.GetPaisById(message.Pais);
                model.FormaParticipacion = catalogoService.GetFormaParticipacionById(message.FormaParticipacion);
                model.TipoParticipacion = catalogoService.GetTipoParticipacionById(message.TipoParticipacion);
                model.TipoParticipante = catalogoService.GetTipoParticipanteById(message.TipoParticipante);
                model.Area = catalogoService.GetAreaById(message.Area);
                model.Disciplina = catalogoService.GetDisciplinaById(message.Disciplina);
                model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.Subdisciplina);
                model.Investigador = investigadorService.GetInvestigadorById(message.Investigador);
            }

            if(message.CoautorExternoCapitulo != null)
                model.AddCoautorExterno(coautorExternoCapituloMapper.Map(message.CoautorExternoCapitulo));

		    if(message.CoautorInternoCapitulo != null)
                model.AddCoautorInterno(coautorInternoCapituloMapper.Map(message.CoautorInternoCapitulo));

		    if(message.ResponsableInternoCapitulo != null)
                model.AddResponsableInterno(responsableInternoCapituloMapper.Map(message.ResponsableInternoCapitulo));

		    if(message.ResponsableExternoCapitulo != null)
                model.AddResponsableExterno(responsableExternoCapituloMapper.Map(message.ResponsableExternoCapitulo));
        }

        public Capitulo Map(CapituloForm message, Usuario usuario, Investigador investigador)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Investigador = investigador;
                model.CreadorPor = usuario;
                model.CoautorExternoCapitulos[0].CreadorPor = usuario;
                model.CoautorInternoCapitulos[0].CreadorPor = usuario;
                model.ResponsableExternoCapitulos[0].CreadorPor = usuario;
                model.ResponsableInternoCapitulos[0].CreadorPor = usuario;
            }

            model.ModificadoPor = usuario;

            return model;
        }
    }
}