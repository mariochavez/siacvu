using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class GradoAcademicoInvestigadorMapper : AutoFormMapper<GradoAcademicoInvestigador, GradoAcademicoInvestigadorForm>, IGradoAcademicoInvestigadorMapper
    {
        readonly ICatalogoService catalogoService;

        public GradoAcademicoInvestigadorMapper(IRepository<GradoAcademicoInvestigador> repository,
                                                ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(GradoAcademicoInvestigadorForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(GradoAcademicoInvestigadorForm message, GradoAcademicoInvestigador model)
        {
            model.Fecha = message.Fecha.FromShortDateToDateTime();
            model.Programa = message.Programa;
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.Pais = catalogoService.GetPaisById(message.Pais);
            model.GradoAcademico = catalogoService.GetGradoAcademicoById(message.GradoAcademico);

            if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadorEl = DateTime.Now;
            }
            model.ModificadoEl = DateTime.Now;
        }
    }
}