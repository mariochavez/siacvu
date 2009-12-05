using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TesisDirigidaMapper : AutoFormMapper<TesisDirigida, TesisDirigidaForm>, ITesisDirigidaMapper
    {
		readonly ICatalogoService catalogoService;
        readonly ITesisPosgradoService tesisPosgradoService;

		public TesisDirigidaMapper(IRepository<TesisDirigida> repository, ICatalogoService catalogoService,
                                   ITesisPosgradoService tesisPosgradoService) 
			: base(repository)
        {
			this.catalogoService = catalogoService;
		    this.tesisPosgradoService = tesisPosgradoService;
        }		
		
        protected override int GetIdFromMessage(TesisDirigidaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TesisDirigidaForm message, TesisDirigida model)
        {
            model.Titulo = message.Titulo;
            model.NombreAlumno = message.NombreAlumno;
            model.TipoTesis = message.TipoTesis;
            model.FormaParticipacion = message.FormaParticipacion;
            model.ProgramaEstudio = message.ProgramaEstudio;

            model.FechaGrado = message.FechaGrado.FromShortDateToDateTime();

            model.TesisPosgrado = tesisPosgradoService.GetTesisPosgradoById(message.TesisPosgradoId);
            model.GradoAcademico = catalogoService.GetGradoAcademicoById(message.GradoAcademico);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.VinculacionAPyD = catalogoService.GetVinculacionAPyDById(message.VinculacionAPyD);

            model.Sector = catalogoService.GetSectorById(message.SectorId);
            model.Organizacion = catalogoService.GetOrganizacionById(message.OrganizacionId);
            model.Nivel2 = catalogoService.GetNivelById(message.Nivel2Id);

            model.Area = catalogoService.GetAreaById(message.AreaId);
            model.Disciplina = catalogoService.GetDisciplinaById(message.DisciplinaId);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.SubdisciplinaId);
        }

        public TesisDirigida Map(TesisDirigidaForm message, Usuario usuario, Investigador investigador)
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
