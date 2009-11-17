using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class TesisPosgradoMapper : AutoFormMapper<TesisPosgrado, TesisPosgradoForm>, ITesisPosgradoMapper
    {
        readonly ICatalogoService catalogoService;

        public TesisPosgradoMapper(IRepository<TesisPosgrado> repository, ICatalogoService catalogoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
        }

        protected override int GetIdFromMessage(TesisPosgradoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(TesisPosgradoForm message, TesisPosgrado model)
        {
            model.Titulo = message.Titulo;
            model.NombreAlumno = message.NombreAlumno;
            model.FechaGrado = message.FechaGrado.FromShortDateToDateTime();

            model.VinculacionAPyD = catalogoService.GetVinculacionAPyDById(message.VinculacionAPyD);
            model.FormaParticipacion = catalogoService.GetFormaParticipacionById(message.FormaParticipacion);
            model.GradoAcademico = catalogoService.GetGradoAcademicoById(message.GradoAcademico);
            model.ProgramaEstudio = catalogoService.GetProgramaEstudioById(message.ProgramaEstudio);
        }
    }
}