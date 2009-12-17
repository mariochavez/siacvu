using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class IdiomasInvestigadorMapper : AutoFormMapper<IdiomasInvestigador, IdiomasInvestigadorForm>, IIdiomasInvestigadorMapper
    {
        readonly ICatalogoService catalogoService;
        public IdiomasInvestigadorMapper(IRepository<IdiomasInvestigador> repository

        , ICatalogoService catalogoService
        )
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(IdiomasInvestigadorForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(IdiomasInvestigadorForm message, IdiomasInvestigador model)
        {
            model.LenguaMaterna = message.LenguaMaterna;
            model.Traductor = message.Traductor;
            model.Profesor = message.Profesor;
            model.NombreDocumentoProbatorio = message.NombreDocumentoProbatorio;
            model.Puntuacion = message.Puntuacion;

            model.FechaEvaluacion = message.FechaEvaluacion.FromShortDateToDateTime();

            model.Idioma = catalogoService.GetIdiomaById(message.Idioma);
            model.NivelConversacion = message.NivelConversacion;
            model.NivelEscritura = message.NivelEscritura;
            model.NivelLectura = message.NivelLectura;
        }

        public IdiomasInvestigador Map(IdiomasInvestigadorForm message, Usuario usuario)
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
