using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CursoMapper : AutoFormMapper<Curso, CursoForm>, ICursoMapper
    {
        readonly ICatalogoService catalogoService;
        readonly IInvestigadorService investigadorService;

        public CursoMapper(IRepository<Curso> repository, ICatalogoService catalogoService,
            IInvestigadorService investigadorService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
            this.investigadorService = investigadorService;
        }

        protected override int GetIdFromMessage(CursoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CursoForm message, Curso model)
        {
            model.NumeroHoras = message.NumeroHoras;

            model.PeriodoReferencia = catalogoService.GetPeriodoReferenciaById(message.PeriodoReferencia);
            model.ProgramaEstudio = catalogoService.GetProgramaEstudioById(message.ProgramaEstudio);
            model.Institucion = catalogoService.GetInstitucionById(message.Institucion);

            model.Nivel = catalogoService.GetNivelById(message.Nivel);
            model.Nivel2 = catalogoService.GetNivelById(message.Nivel2);
            model.Nivel3 = catalogoService.GetNivelById(message.Nivel3);
            model.Nivel4 = catalogoService.GetNivelById(message.Nivel4);
            model.Nivel5 = catalogoService.GetNivelById(message.Nivel5);

            model.Sector = catalogoService.GetSectorById(message.Sector);
            model.Organizacion = catalogoService.GetOrganizacionById(message.Organizacion);
            model.Pais = catalogoService.GetPaisById(message.Pais);
            model.Area = catalogoService.GetAreaById(message.Area);
            model.Disciplina = catalogoService.GetDisciplinaById(message.Disciplina);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.Subdisciplina);
            //model.Investigador = investigadorService.GetInvestigadorById(message.Investigador);
        }

        public Curso Map(CursoForm message, Usuario usuario, Investigador investigador)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Investigador = investigador;
                model.CreadorPor = usuario;
            }

            model.ModificadoPor = usuario;

            return model;
        }
    }
}
