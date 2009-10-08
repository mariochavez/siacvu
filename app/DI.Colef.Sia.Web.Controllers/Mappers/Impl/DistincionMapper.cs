using System;
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
            model.Descripcion = message.Descripcion;
            model.FechaOtorgamiento = message.FechaOtorgamiento.FromShortDateToDateTime();
            model.Ciudad = message.Ciudad;

            model.TipoDistincion = catalogoService.GetTipoDistincionById(message.TipoDistincion);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.Ambito = catalogoService.GetAmbitoById(message.Ambito);
            model.Pais = catalogoService.GetPaisById(message.Pais);
            model.EstadoPais = catalogoService.GetEstadoPaisById(message.EstadoPais);
        }

        public Distincion Map(DistincionForm message, Usuario usuario, PeriodoReferencia periodo, Investigador investigador)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadorPor = usuario;
                model.PeriodoReferencia = periodo;
                model.Sede = investigador.CargosInvestigador[investigador.CargosInvestigador.Count - 1].Sede;
                model.Departamento = investigador.CargosInvestigador[investigador.CargosInvestigador.Count - 1].Departamento;
            }

            model.ModificadoPor = usuario;

            return model;
        }
    }
}
