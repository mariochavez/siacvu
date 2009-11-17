using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class EstanciaInstitucionExternaMapper : AutoFormMapper<EstanciaInstitucionExterna, EstanciaInstitucionExternaForm>, IEstanciaInstitucionExternaMapper
    {
        readonly ICatalogoService catalogoService;

        public EstanciaInstitucionExternaMapper(IRepository<EstanciaInstitucionExterna> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(EstanciaInstitucionExternaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(EstanciaInstitucionExternaForm message, EstanciaInstitucionExterna model)
        {
            model.Actividades = message.Actividades;
            model.Logros = message.Logros;

            model.FechaInicial = message.FechaInicial.FromShortDateToDateTime();
            model.FechaFinal = message.FechaFinal.FromShortDateToDateTime();

            model.TipoEstancia = catalogoService.GetTipoEstanciaById(message.TipoEstancia);
            model.Nivel2 = catalogoService.GetNivelById(message.Nivel2);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
        }

        public EstanciaInstitucionExterna Map(EstanciaInstitucionExternaForm message, Usuario usuario, Investigador investigador)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadorPor = usuario;
                model.Sede = GetLatest(investigador.CargosInvestigador).Sede;
                model.Departamento = GetLatest(investigador.CargosInvestigador).Departamento;
            }

            model.ModificadoPor = usuario;

            return model;
        }
    }
}