using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class CursoMapper : AutoFormMapper<Curso, CursoForm>, ICursoMapper
    {
        readonly ICatalogoService catalogoService;

        public CursoMapper(IRepository<Curso> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(CursoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(CursoForm message, Curso model)
        {
            model.NumeroHoras = message.NumeroHoras;
            model.Nombre = message.Nombre;
            model.TipoCurso = message.TipoCurso;
            model.EsDiplomado = message.EsDiplomado;
            model.NombreDiplomado = message.NombreDiplomado;

            model.FechaInicial = message.FechaInicial.FromShortDateToDateTime();
            model.FechaFinal = message.FechaFinal.FromShortDateToDateTime();
            
            model.ProgramaEstudio = catalogoService.GetProgramaEstudioById(message.ProgramaEstudioId);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);

            model.NivelEstudio = catalogoService.GetNivelEstudioById(message.NivelEstudio);

            model.Pais = catalogoService.GetPaisById(message.Pais);
            model.Diplomado = catalogoService.GetDiplomadoById(message.Diplomado);
            model.Nivel2 = catalogoService.GetNivelById(message.Nivel2);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.Subdisciplina);
        }

        public Curso Map(CursoForm message, Usuario usuario, Investigador investigador)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadorPor = usuario;
                model.Sede = GetLatest(investigador.CargosInvestigador).Sede;
                model.Departamento = GetLatest(investigador.CargosInvestigador).Departamento;
            }

            model.ModificadoPor = usuario;

            return model;
        }
    }
}
