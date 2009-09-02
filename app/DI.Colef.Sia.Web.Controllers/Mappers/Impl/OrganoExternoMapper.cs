using System;
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
            model.FechaInicial = message.FechaInicial.FromShortDateToDateTime();
            model.FechaFinal = message.FechaFinal.FromShortDateToDateTime();

            model.TipoOrgano = catalogoService.GetTipoOrganoById(message.TipoOrgano);
            model.TipoParticipacion = catalogoService.GetTipoParticipacionOrganoById(message.TipoParticipacion);
            model.Sector = catalogoService.GetSectorById(message.Sector);
            model.Nivel = catalogoService.GetNivelById(message.Nivel);
            model.Ambito = catalogoService.GetAmbitoById(message.Ambito);
        }

        public OrganoExterno Map(OrganoExternoForm message, Usuario usuario)
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
