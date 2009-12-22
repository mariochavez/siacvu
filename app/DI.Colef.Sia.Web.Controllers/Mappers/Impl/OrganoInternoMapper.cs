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
        readonly IUsuarioService usuarioService;

		public OrganoInternoMapper(IRepository<OrganoInterno> repository,
            ICatalogoService catalogoService,
            IUsuarioService usuarioService) 
			: base(repository)
        {
			this.catalogoService = catalogoService;
            this.usuarioService = usuarioService;
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
            model.Usuario = usuarioService.GetUsuarioById(message.Usuario);
        }

        public OrganoInterno Map(OrganoInternoForm message, Usuario usuario, Investigador investigador)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.CreadoPor = usuario;
                model.Sede = GetLatest(investigador.CargosInvestigador).Sede;
                model.Departamento = GetLatest(investigador.CargosInvestigador).Departamento;
            }

            model.ModificadoPor = usuario;

            return model;
        }
    }
}