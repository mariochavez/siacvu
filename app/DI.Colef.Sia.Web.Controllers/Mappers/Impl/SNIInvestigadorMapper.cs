using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class SNIInvestigadorMapper : AutoFormMapper<SNIInvestigador, SNIInvestigadorForm>, ISNIInvestigadorMapper
    {
        readonly ICatalogoService catalogoService;

        public SNIInvestigadorMapper(IRepository<SNIInvestigador> repository,
                                     ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(SNIInvestigadorForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(SNIInvestigadorForm message, SNIInvestigador model)
        {
            model.Fecha = message.Fecha.FromShortDateToDateTime();
            model.ExpedienteSNI = message.ExpedienteSNI;
            model.SNI = catalogoService.GetSNIById(message.SNI);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadorEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}