using System;
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

            model.Organizacion = catalogoService.GetOrganizacionById(message.Organizacion);
            model.Nivel2 = catalogoService.GetNivelById(message.Nivel2);
            model.Nivel3 = catalogoService.GetNivelById(message.Nivel3);
            model.Nivel4 = catalogoService.GetNivelById(message.Nivel4);
            model.Nivel5 = catalogoService.GetNivelById(message.Nivel5);
            model.Nivel6 = catalogoService.GetNivelById(message.Nivel6);
            model.Pais = catalogoService.GetPaisById(message.Pais);
            model.Area = catalogoService.GetAreaById(message.Area);
            model.Disciplina = catalogoService.GetDisciplinaById(message.Disciplina);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.Subdisciplina);
            model.Sector = catalogoService.GetSectorById(message.Sector);
            model.Rama = catalogoService.GetRamaById(message.Rama);
            model.Clase = catalogoService.GetClaseById(message.Clase);
        }

        public ExperienciaProfesional Map(ExperienciaProfesionalForm message, Usuario usuario)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadorPor = usuario;
            }

            model.ModificadoPor = usuario;

            return model;
        }
    }
}
