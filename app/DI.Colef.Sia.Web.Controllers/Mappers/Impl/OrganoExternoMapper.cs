using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class OrganoExternoMapper : AutoFormMapper<OrganoExterno, OrganoExternoForm>, IOrganoExternoMapper
    {
        readonly ICatalogoService catalogoService;

        public OrganoExternoMapper(IRepository<OrganoExterno> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(OrganoExternoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(OrganoExternoForm message, OrganoExterno model)
        {
            model.Nombre = message.Nombre;
            model.Siglas = message.Siglas;
            model.Participacion = message.Participacion;

            model.FechaInicial = message.FechaInicial.FromShortDateToDateTime();
            model.FechaFinal = message.FechaFinal.FromShortDateToDateTime();

            model.TipoOrgano = catalogoService.GetTipoOrganoById(message.TipoOrgano);
            model.Sector = catalogoService.GetSectorById(message.Sector);
            model.Ambito = catalogoService.GetAmbitoById(message.Ambito);

            model.Pais = catalogoService.GetPaisById(message.Pais);
            model.Ciudad = message.Ciudad;
        }

        public OrganoExterno Map(OrganoExternoForm message, Usuario usuario)
        {
            var model = Map(message);

            model.ModificadoPor = usuario;

            return model;
        }

        public OrganoExterno Map(OrganoExternoForm message, Usuario usuario, Investigador investigador)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadoPor = usuario;
                model.Sede = GetLatest(investigador.CargosInvestigador).Sede;
                model.Departamento = GetLatest(investigador.CargosInvestigador).Departamento;
            }

            model.ModificadoPor = usuario;

            return model;
        }
    }
}