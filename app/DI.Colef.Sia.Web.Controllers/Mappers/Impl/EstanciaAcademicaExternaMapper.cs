using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class EstanciaAcademicaExternaMapper : AutoFormMapper<EstanciaAcademicaExterna, EstanciaAcademicaExternaForm>, IEstanciaAcademicaExternaMapper
    {
		readonly ICatalogoService catalogoService;

		public EstanciaAcademicaExternaMapper(IRepository<EstanciaAcademicaExterna> repository,
            ICatalogoService catalogoService) 
			: base(repository)
        {
			this.catalogoService = catalogoService;
        }		
		
        protected override int GetIdFromMessage(EstanciaAcademicaExternaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(EstanciaAcademicaExternaForm message, EstanciaAcademicaExterna model)
        {
		    model.LineasInvestigacion = message.LineasInvestigacion;
            model.Actividades = message.Actividades;
            model.Logros = message.Logros;

		    model.FechaInicial = message.FechaInicial.FromShortDateToDateTime();
		    model.FechaFinal = message.FechaFinal.FromShortDateToDateTime();

            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.TipoEstancia = catalogoService.GetTipoEstanciaById(message.TipoEstancia);
            model.GradoAcademico = catalogoService.GetGradoAcademicoById(message.GradoAcademico);
        }

        public EstanciaAcademicaExterna Map(EstanciaAcademicaExternaForm message, Usuario usuario, Investigador investigador)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadoPor = usuario;
            }

            model.ModificadoPor = usuario;

            return model;
        }
    }
}