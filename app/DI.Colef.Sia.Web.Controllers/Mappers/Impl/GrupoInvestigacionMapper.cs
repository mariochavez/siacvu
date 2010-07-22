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
        readonly IMiembroExternoGrupoInvestigacionMapper miembroExternoGrupoInvestigacionMapper;
        readonly IMiembroInternoGrupoInvestigacionMapper miembroInternoGrupoInvestigacionMapper;
        private Usuario usuarioGrupoInvestigacion;

		public GrupoInvestigacionMapper(IRepository<GrupoInvestigacion> repository,
            IMiembroExternoGrupoInvestigacionMapper miembroExternoGrupoInvestigacionMapper,
            IMiembroInternoGrupoInvestigacionMapper miembroInternoGrupoInvestigacionMapper,
            ICatalogoService catalogoService
            ) : base(repository)
        {
			this.catalogoService = catalogoService;
            this.miembroExternoGrupoInvestigacionMapper = miembroExternoGrupoInvestigacionMapper;
		    this.miembroInternoGrupoInvestigacionMapper = miembroInternoGrupoInvestigacionMapper;
        }		
		
        protected override int GetIdFromMessage(GrupoInvestigacionForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(GrupoInvestigacionForm message, GrupoInvestigacion model)
        {
			model.NombreGrupoInvestigacion = message.NombreGrupoInvestigacion;
            model.Lider = message.Lider;
            model.Impacto = message.Impacto;
            model.VinculacionSectorProductivo = message.VinculacionSectorProductivo;
            model.VinculacionSectorSocial = message.VinculacionSectorSocial;
            model.Colaboracion = message.Colaboracion;
            model.Administracion = message.Administracion;
            model.ProgramaRegistrado = message.ProgramaRegistrado;
            model.NombreLider = message.NombreLider;

		    model.FechaCreacion = message.FechaCreacion.FromShortDateToDateTime();

            model.Sector = catalogoService.GetSectorById(message.SectorId);
            model.Organizacion = catalogoService.GetOrganizacionById(message.OrganizacionId);
            model.Nivel2 = catalogoService.GetNivelById(message.Nivel2Id);

            if (model.Usuario == null || model.Usuario == usuarioGrupoInvestigacion)
            {
                model.PosicionCoautor = message.PosicionCoautor;
                model.PosicionAutor = message.PosicionAutor;
            }
        }

        public GrupoInvestigacion Map(GrupoInvestigacionForm message, Usuario usuario)
        {
            usuarioGrupoInvestigacion = usuario;
            var model = Map(message);

            model.ModificadoPor = usuario;

            return model;
        }

        public GrupoInvestigacion Map(GrupoInvestigacionForm message, Usuario usuario, Investigador investigador)
        {
            usuarioGrupoInvestigacion = usuario;
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadoPor = usuario;
            }

            if (model.Usuario != investigador.Usuario)
            {
                foreach (var miembro in model.MiembroInternoGrupoInvestigaciones)
                {
                    if (miembro.Investigador == investigador)
                        miembro.Posicion = message.PosicionCoautor;
                }
            }

            model.ModificadoPor = usuario;

            return model;
        }

        public GrupoInvestigacion Map(GrupoInvestigacionForm message, Usuario usuario, Investigador investigador,
            CoautorExternoProductoForm[] miembrosExternos, CoautorInternoProductoForm[] miembrosInternos)
        {
            var model = Map(message, usuario, investigador);

            foreach (var miembroExterno in miembrosExternos)
            {
                var miembro =
                    miembroExternoGrupoInvestigacionMapper.Map(miembroExterno);

                miembro.CreadoPor = usuario;
                miembro.ModificadoPor = usuario;

                model.AddMiembroExterno(miembro);
            }

            foreach (var miembroInterno in miembrosInternos)
            {
                var miembro = miembroInternoGrupoInvestigacionMapper.Map(miembroInterno);

                miembro.CreadoPor = usuario;
                miembro.ModificadoPor = usuario;

                model.AddMiembroInterno(miembro);
            }

            return model;
        }
    }
}