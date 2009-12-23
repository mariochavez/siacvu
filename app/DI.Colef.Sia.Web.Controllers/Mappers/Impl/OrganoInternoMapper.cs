using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class OrganoInternoMapper : AutoFormMapper<OrganoInterno, OrganoInternoForm>, IOrganoInternoMapper
    {
		readonly ICatalogoService catalogoService;
        readonly IInvestigadorService investigadorService;

        public OrganoInternoMapper(IRepository<OrganoInterno> repository, ICatalogoService catalogoService, IInvestigadorService investigadorService) 
			: base(repository)
        {
			this.catalogoService = catalogoService;
            this.investigadorService = investigadorService;
        }
		
        protected override int GetIdFromMessage(OrganoInternoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(OrganoInternoForm message, OrganoInterno model)
        {
            model.Periodo = message.Periodo;

		    model.FechaInicial = message.FechaInicial.FromShortDateToDateTime();
		    model.FechaFinal = message.FechaFinal.FromShortDateToDateTime();
		    
            model.ConsejoComision = catalogoService.GetConsejoComisionById(message.ConsejoComision);
            model.Investigador = investigadorService.GetInvestigadorById(message.InvestigadorId);
        }

        public OrganoInterno Map(OrganoInternoForm message, Usuario usuario)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.CreadoPor = usuario;
                model.Sede = GetLatest(model.Investigador.CargosInvestigador).Sede;
                model.Departamento = GetLatest(model.Investigador.CargosInvestigador).Departamento;
                model.Usuario = usuario;
            }

            model.ModificadoPor = usuario;

            return model;
        }
    }
}