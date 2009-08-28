using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ApoyoConacytMapper : AutoFormMapper<ApoyoConacyt, ApoyoConacytForm>, IApoyoConacytMapper
    {
        readonly ICatalogoService catalogoService;

        public ApoyoConacytMapper(IRepository<ApoyoConacyt> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(ApoyoConacytForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ApoyoConacytForm message, ApoyoConacyt model)
        {
            model.NoApoyo = message.NoApoyo;
            model.PalabraClave1 = message.PalabraClave1;
            model.PalabraClave2 = message.PalabraClave2;
            model.PalabraClave3 = message.PalabraClave3;
            model.FechaInicial = message.FechaInicial.FromShortDateToDateTime();
            model.FechaFinal = message.FechaFinal.FromShortDateToDateTime();

            model.TipoApoyo = catalogoService.GetTipoApoyoById(message.TipoApoyo);
            model.SubprogramaConacyt = catalogoService.GetSubprogramaConacytById(message.SubprogramaConacyt);
        }

        public ApoyoConacyt Map(ApoyoConacytForm message, Usuario usuario)
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
