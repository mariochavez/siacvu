using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class GrupoInvestigacionMapper : AutoFormMapper<GrupoInvestigacion, GrupoInvestigacionForm>, IGrupoInvestigacionMapper
    {
		readonly ICatalogoService catalogoService;

		public GrupoInvestigacionMapper(IRepository<GrupoInvestigacion> repository, ICatalogoService catalogoService)
            : base(repository)
        {
			this.catalogoService = catalogoService;
        }		
		
        protected override int GetIdFromMessage(GrupoInvestigacionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(GrupoInvestigacionForm message, GrupoInvestigacion model)
        {
			model.NombreGrupoInvestigacion = message.NombreGrupoInvestigacion;
            model.Lider = message.Lider;
            model.Nombre = message.Nombre;
            model.Miembros = message.Miembros;
            model.Impacto = message.Impacto;
            model.VinculacionSectorProductivo = message.VinculacionSectorProductivo;
            model.VinculacionSectorSocial = message.VinculacionSectorSocial;
            model.Colaboracion = message.Colaboracion;
            model.Administracion = message.Administracion;
            model.ProgramaRegistrado = message.ProgramaRegistrado;

		    model.FechaCreacion = message.FechaCreacion.FromShortDateToDateTime();

            model.Sector = catalogoService.GetSectorById(message.SectorId);
            model.Organizacion = catalogoService.GetOrganizacionById(message.OrganizacionId);
            model.Nivel2 = catalogoService.GetNivelById(message.Nivel2Id);
        }

        public GrupoInvestigacion Map(GrupoInvestigacionForm message, Usuario usuario)
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
