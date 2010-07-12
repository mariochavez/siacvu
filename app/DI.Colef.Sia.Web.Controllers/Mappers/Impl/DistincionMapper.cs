using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class DistincionMapper : AutoFormMapper<Distincion, DistincionForm>, IDistincionMapper
    {
        readonly ICatalogoService catalogoService;

        public DistincionMapper(IRepository<Distincion> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(DistincionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(DistincionForm message, Distincion model)
        {
            model.Titulo = message.Titulo;
            model.Descripcion = message.Descripcion;
            model.FechaOtorgamiento = message.FechaOtorgamiento.FromShortDateToDateTime();
            model.Municipio = message.Municipio;

            model.TipoDistincion = catalogoService.GetTipoDistincionById(message.TipoDistincion);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.Ambito = catalogoService.GetAmbitoById(message.Ambito);
            model.Pais = catalogoService.GetPaisById(message.Pais);
            model.EstadoPais = catalogoService.GetEstadoPaisById(message.EstadoPais);

            var institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            if (institucion != null && string.Compare(institucion.Nombre, message.InstitucionNombre) >= 0)
            {
                model.Institucion = institucion;
                model.InstitucionNombre = string.Empty;
            }
            else
            {
                model.InstitucionNombre = message.InstitucionNombre;
                model.Institucion = null;
            }
        }

        public override DistincionForm Map(Distincion model)
        {
            var message =  base.Map(model);

            if (message.InstitucionId > 0)
                message.InstitucionNombre = model.Institucion.Nombre;

            return message;
        }

        public Distincion Map(DistincionForm message, Usuario usuario, Investigador investigador)
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
