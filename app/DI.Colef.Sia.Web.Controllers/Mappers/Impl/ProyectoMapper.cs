using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ProyectoMapper : AutoFormMapper<Proyecto, ProyectoForm>, IProyectoMapper
    {
        readonly ICatalogoService catalogoService;
        readonly IResponsableInternoProyectoMapper responsableInternoProyectoMapper;
        readonly IResponsableExternoProyectoMapper responsableExternoProyectoMapper;
        readonly IParticipanteInternoProyectoMapper participanteInternoProyectoMapper;
        readonly IParticipanteExternoProyectoMapper participanteExternoProyectoMapper;

        public ProyectoMapper(IRepository<Proyecto> repository, ICatalogoService catalogoService, 
                              IResponsableInternoProyectoMapper responsableInternoProyectoMapper, 
                              IResponsableExternoProyectoMapper responsableExternoProyectoMapper, 
                              IParticipanteInternoProyectoMapper participanteInternoProyectoMapper, 
                              IParticipanteExternoProyectoMapper participanteExternoProyectoMapper)
            : base(repository)
        {
            this.catalogoService = catalogoService;
            this.responsableInternoProyectoMapper = responsableInternoProyectoMapper;
            this.responsableExternoProyectoMapper = responsableExternoProyectoMapper;
            this.participanteInternoProyectoMapper = participanteInternoProyectoMapper;
            this.participanteExternoProyectoMapper = participanteExternoProyectoMapper;
        }

        protected override int GetIdFromMessage(ProyectoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ProyectoForm message, Proyecto model)
        {
            model.Nombre = message.Nombre;
            model.EstadoProyecto = message.EstadoProyecto;
            model.ProyectoConvenio = message.ProyectoConvenio;
            model.ObjetivoGeneral = message.ObjetivoGeneral;
            model.ImpactoAcademico = message.ImpactoAcademico;
            model.OtroImpacto = message.OtroImpacto;
            model.UsuariosPotenciales = message.UsuariosPotenciales;
            model.BeneficiariosProyecto = message.BeneficiariosProyecto;
            model.Monto = message.Monto;
            model.ProductoEsperado = message.ProductoEsperado;
            model.ServicioUSEG = message.ServicioUSEG;
            model.NombreEstudiante = message.NombreEstudiante;
            model.TipoEstudiante = message.TipoEstudiante;
            model.IncluirWeb = message.IncluirWeb;
            model.Entidad = message.Entidad;
            model.OtraEmpresaInstitucionParticipante = message.OtraEmpresaInstitucionParticipante;
            model.BecarioParticipante = message.BecarioParticipante;

            model.FechaInicial = message.FechaInicial.FromShortDateToDateTime();
            model.FechaFinal = message.FechaFinal.FromShortDateToDateTime();
            model.FechaEntregaCompromiso = message.FechaEntregaCompromiso.FromShortDateToDateTime();
            model.FechaEntregaProducto = message.FechaEntregaProducto.FromShortDateToDateTime();

            model.TipoProyecto = catalogoService.GetTipoProyectoById(message.TipoProyecto);
            model.Convenio = catalogoService.GetConvenioById(message.Convenio);
            model.Sede = catalogoService.GetSedeById(message.Sede);
            model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematica);
            model.ImpactoPoliticaPublica = catalogoService.GetImpactoPoliticaPublicaById(message.ImpactoPoliticaPublica);
            model.Ambito = catalogoService.GetAmbitoById(message.Ambito);
            model.TipoFinanciamiento = catalogoService.GetTipoFinanciamientoById(message.TipoFinanciamiento);
            model.Moneda = catalogoService.GetMonedaById(message.Moneda);
            model.SectorFinanciamiento = catalogoService.GetSectorFinanciamientoById(message.SectorFinanciamiento);
            model.ProductoAcademico = catalogoService.GetProductoAcademicoById(message.ProductoAcademico);
            model.ActividadPrevista = catalogoService.GetActividadPrevistaById(message.ActividadPrevista);
            model.USEG = catalogoService.GetUSEGById(message.USEG);
            model.Institucion = catalogoService.GetInstitucionById(message.Institucion);
            model.NivelEstudio = catalogoService.GetNivelEstudioById(message.NivelEstudio);
            model.Sector = catalogoService.GetSectorById(message.Sector);
            model.Organizacion = catalogoService.GetOrganizacionById(message.Organizacion);
            model.Nivel2 = catalogoService.GetNivelById(message.Nivel2);
            model.Nivel3 = catalogoService.GetNivelById(message.Nivel3);
            model.Nivel4 = catalogoService.GetNivelById(message.Nivel4);
            model.Nivel5 = catalogoService.GetNivelById(message.Nivel5);
            model.Nivel6 = catalogoService.GetNivelById(message.Nivel6);
            model.Departamento = catalogoService.GetDepartamentoById(message.Departamento);
            model.Area = catalogoService.GetAreaById(message.Area);
            model.Disciplina = catalogoService.GetDisciplinaById(message.Disciplina);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.Subdisciplina);

            //if (message.ResponsableInternoProyecto != null)
            //    model.AddResponsableInterno(responsableInternoProyectoMapper.Map(message.ResponsableInternoProyecto));
            //if (message.ResponsableExternoProyecto != null)
            //    model.AddResponsable(responsableExternoProyectoMapper.Map(message.ResponsableExternoProyecto));
            //if (message.ParticipanteInternoProyecto != null)
            //    model.AddParticipante(participanteInternoProyectoMapper.Map(message.ParticipanteInternoProyecto));
            //if (message.ParticipanteExternoProyecto != null)model.AddParticipante(partic
            //ipanteExternoProyectoMapper.Map(message.ParticipanteExternoProyecto));
        }
    }
}