using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ExperienciaProfesionalMapper : AutoFormMapper<ExperienciaProfesional, ExperienciaProfesionalForm>, IExperienciaProfesionalMapper
    {
		readonly ICatalogoService catalogoService;

		public ExperienciaProfesionalMapper(IRepository<ExperienciaProfesional> repository, 
                                            ICatalogoService catalogoService
		) 
			: base(repository)
        {
			this.catalogoService = catalogoService;
        }		
		
        protected override int GetIdFromMessage(ExperienciaProfesionalForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ExperienciaProfesionalForm message, ExperienciaProfesional model)
        {
            model.Entidad = message.Entidad;
            model.Nombramiento = message.Nombramiento;
            model.FechaInicial = message.FechaInicial.FromShortDateToDateTime();
            model.FechaFinal = message.FechaFinal.FromShortDateToDateTime();
            model.LineaInvestigacion1 = message.LineaInvestigacion1;
            model.LineaInvestigacion2 = message.LineaInvestigacion2;
            model.LineaInvestigacion3 = message.LineaInvestigacion3;
            model.PrincipalesLogros = message.PrincipalesLogros;

            model.Pais = catalogoService.GetPaisById(message.Pais);

            model.SectorEconomico = catalogoService.GetSectorById(message.SectorEconomicoId);
            model.Rama = catalogoService.GetRamaById(message.RamaId);
            model.Clase = catalogoService.GetClaseById(message.ClaseId);

            model.Sector = catalogoService.GetSectorById(message.SectorId);
            model.Organizacion = catalogoService.GetOrganizacionById(message.OrganizacionId);
            model.Nivel2 = catalogoService.GetNivelById(message.Nivel2Id);

            model.Area = catalogoService.GetAreaById(message.AreaId);
            model.Disciplina = catalogoService.GetDisciplinaById(message.DisciplinaId);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.SubdisciplinaId);
        }

        public ExperienciaProfesional Map(ExperienciaProfesionalForm message, Usuario usuario)
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