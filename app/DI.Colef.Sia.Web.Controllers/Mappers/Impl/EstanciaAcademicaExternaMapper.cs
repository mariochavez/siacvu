using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class EstanciaAcademicaExternaMapper : AutoFormMapper<EstanciaAcademicaExterna, EstanciaAcademicaExternaForm>, IEstanciaAcademicaExternaMapper
    {
		readonly ICatalogoService catalogoService;

		public EstanciaAcademicaExternaMapper(IRepository<EstanciaAcademicaExterna> repository,
            ICatalogoService catalogoService) 
			: base(repository)
        {
			this.catalogoService = catalogoService;
        }		
		
        protected override int GetIdFromMessage(EstanciaAcademicaExternaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(EstanciaAcademicaExternaForm message, EstanciaAcademicaExterna model)
        {
		    model.LineasInvestigacion = message.LineasInvestigacion;
            model.Actividades = message.Actividades;
            model.Logros = message.Logros;

		    model.FechaInicial = message.FechaInicial.FromShortDateToDateTime();
		    model.FechaFinal = message.FechaFinal.FromShortDateToDateTime();

            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.InvestigadorExterno = message.InvestigadorExterno;
            model.TipoEstancia = catalogoService.GetTipoEstanciaById(message.TipoEstancia);
            model.GradoAcademico = catalogoService.GetGradoAcademicoById(message.GradoAcademico);
            model.Departamento = catalogoService.GetDepartamentoById(message.Departamento);
            model.Sede = catalogoService.GetSedeById(message.Sede);

            var institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            if (institucion != null && string.Compare(institucion.Nombre, message.InstitucionNombre) >= 0)
            {
                model.Institucion = institucion;
                model.InstitucionNombre = string.Empty;
            }
            else
            {
                model.InstitucionNombre = message.InstitucionNombre;
                model.Institucion = null;
            }
        }

        public EstanciaAcademicaExterna Map(EstanciaAcademicaExternaForm message, Usuario usuario)
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

        public override EstanciaAcademicaExternaForm Map(EstanciaAcademicaExterna model)
        {
            var message = base.Map(model);

            if (message.InstitucionId > 0)
                message.InstitucionNombre = model.Institucion.Nombre;

            return message;
        }
    }
}