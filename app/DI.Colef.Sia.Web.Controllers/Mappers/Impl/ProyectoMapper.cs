using System;
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
        readonly IRecursoFinancieroProyectoMapper recursoFinancieroProyectoMapper;

        public ProyectoMapper(IRepository<Proyecto> repository, ICatalogoService catalogoService,
                              IResponsableInternoProyectoMapper responsableInternoProyectoMapper,
                              IResponsableExternoProyectoMapper responsableExternoProyectoMapper,
                              IParticipanteInternoProyectoMapper participanteInternoProyectoMapper,
                              IParticipanteExternoProyectoMapper participanteExternoProyectoMapper,
                              IRecursoFinancieroProyectoMapper recursoFinancieroProyectoMapper)
            : base(repository)
        {
            this.catalogoService = catalogoService;
            this.responsableInternoProyectoMapper = responsableInternoProyectoMapper;
            this.responsableExternoProyectoMapper = responsableExternoProyectoMapper;
            this.participanteInternoProyectoMapper = participanteInternoProyectoMapper;
            this.participanteExternoProyectoMapper = participanteExternoProyectoMapper;
            this.recursoFinancieroProyectoMapper = recursoFinancieroProyectoMapper;
        }

        protected override int GetIdFromMessage(ProyectoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ProyectoForm message, Proyecto model)
        {
            model.Nombre = message.Nombre;
            model.Responsable = message.Responsable;
            model.Objetivos = message.Objetivos;
            model.EstadoProyecto = message.EstadoProyecto;
            model.ProductoEsperado = message.ProductoEsperado;
            model.ConFinanciamiento = message.ConFinanciamiento;
            //model.ProyectoConvenio = message.ProyectoConvenio;
            //model.ObjetivoGeneral = message.ObjetivoGeneral;
            //model.ImpactoAcademico = message.ImpactoAcademico;
            //model.OtroImpacto = message.OtroImpacto;
            //model.UsuariosPotenciales = message.UsuariosPotenciales;
            //model.BeneficiariosProyecto = message.BeneficiariosProyecto;
            //model.Monto = message.Monto;
            //model.ServicioUSEG = message.ServicioUSEG;
            //model.NombreEstudiante = message.NombreEstudiante;
            //model.TipoEstudiante = message.TipoEstudiante;
            //model.IncluirWeb = message.IncluirWeb;
            //model.Entidad = message.Entidad;
            //model.OtraEmpresaInstitucionParticipante = message.OtraEmpresaInstitucionParticipante;
            //model.BecarioParticipante = message.BecarioParticipante;

            model.FechaInicial = message.FechaInicial.FromShortDateToDateTime();
            model.FechaFinal = message.FechaFinal.FromShortDateToDateTime();
            model.FechaRegistro = message.FechaRegistro.FromShortDateToDateTime();
            model.FechaTramite = message.FechaTramite.FromShortDateToDateTime();
            //model.FechaEntregaCompromiso = message.FechaEntregaCompromiso.FromShortDateToDateTime();
            //model.FechaEntregaProducto = message.FechaEntregaProducto.FromShortDateToDateTime();

            model.TipoProyecto = catalogoService.GetTipoProyectoById(message.TipoProyecto);
            model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematica);
            model.Coordinacion = catalogoService.GetCoordinacionById(message.Coordinacion);
            //model.Convenio = catalogoService.GetConvenioById(message.Convenio);
            //model.Sede = catalogoService.GetSedeById(message.Sede);
            //model.ImpactoPoliticaPublica = catalogoService.GetImpactoPoliticaPublicaById(message.ImpactoPoliticaPublica);
            //model.Ambito = catalogoService.GetAmbitoById(message.Ambito);
            //model.TipoFinanciamiento = catalogoService.GetTipoFinanciamientoById(message.TipoFinanciamiento);
            //model.Moneda = catalogoService.GetMonedaById(message.Moneda);
            //model.SectorFinanciamiento = catalogoService.GetSectorFinanciamientoById(message.SectorFinanciamiento);
            //model.ProductoAcademico = catalogoService.GetProductoAcademicoById(message.ProductoAcademico);
            //model.ActividadPrevista = catalogoService.GetActividadPrevistaById(message.ActividadPrevista);
            //model.USEG = catalogoService.GetUSEGById(message.USEG);
            //model.Institucion = catalogoService.GetInstitucionById(message.Institucion);
            //model.NivelEstudio = catalogoService.GetNivelEstudioById(message.NivelEstudio);
            //model.Sector = catalogoService.GetSectorById(message.Sector);
            //model.Organizacion = catalogoService.GetOrganizacionById(message.Organizacion);
            //model.Nivel2 = catalogoService.GetNivelById(message.Nivel2);
            //model.Nivel3 = catalogoService.GetNivelById(message.Nivel3);
            //model.Nivel4 = catalogoService.GetNivelById(message.Nivel4);
            //model.Nivel5 = catalogoService.GetNivelById(message.Nivel5);
            //model.Nivel6 = catalogoService.GetNivelById(message.Nivel6);
            //model.Departamento = catalogoService.GetDepartamentoById(message.Departamento);
            //model.Area = catalogoService.GetAreaById(message.Area);
            //model.Disciplina = catalogoService.GetDisciplinaById(message.Disciplina);
            //model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.Subdisciplina);
        }

        public Proyecto Map(ProyectoForm message, Usuario usuario)
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

        public Proyecto Map(ProyectoForm message, Usuario usuario, string[] participantesExternos, 
            string[] participantesInternos, string[] responsablesExternos, string[] responsablesInternos, 
            string[] institucionRecursoFinanciero, string[] monedaRecursoFinanciero, string[] montoRecursoFinanciero, 
            string[] recursoRecursoFinanciero)
        {
            var model = Map(message, usuario);

            foreach (var participanteId in participantesExternos)
            {
                var participante =
                    participanteExternoProyectoMapper.Map(new ParticipanteExternoProyectoForm
                                                              {InvestigadorExternoId = int.Parse(participanteId)});

                participante.CreadorPor = usuario;
                participante.ModificadoPor = usuario;

                model.AddParticipanteExterno(participante);
            }

            foreach (var participanteId in participantesInternos)
            {
                var participante =
                    participanteInternoProyectoMapper.Map(new ParticipanteInternoProyectoForm
                                                              {InvestigadorId = int.Parse(participanteId)});

                participante.CreadorPor = usuario;
                participante.ModificadoPor = usuario;

                model.AddParticipanteInterno(participante);
            }

            foreach (var responsableId in responsablesExternos)
            {
                var responsable =
                    responsableExternoProyectoMapper.Map(new ResponsableExternoProyectoForm
                                                             {InvestigadorExternoId = int.Parse(responsableId)});

                responsable.CreadorPor = usuario;
                responsable.ModificadoPor = usuario;

                model.AddResponsableExterno(responsable);
            }

            foreach (var responsableId in responsablesInternos)
            {
                var responsable =
                    responsableInternoProyectoMapper.Map(new ResponsableInternoProyectoForm
                                                             {InvestigadorId = int.Parse(responsableId)});

                responsable.CreadorPor = usuario;
                responsable.ModificadoPor = usuario;

                model.AddResponsableInterno(responsable);
            }

            for (var i = 0; i < institucionRecursoFinanciero.Length; i++)
            {
                var recurso = recursoFinancieroProyectoMapper.Map(new RecursoFinancieroProyectoForm
                                                                      {
                                                                          InstitucionId = int.Parse(institucionRecursoFinanciero[i]),
                                                                          MonedaId = int.Parse(monedaRecursoFinanciero[i]),
                                                                          Monto = long.Parse(montoRecursoFinanciero[i]),
                                                                          Recurso = recursoRecursoFinanciero[i]
                                                                      });
                recurso.CreadorPor = usuario;
                recurso.ModificadoPor = usuario;

                model.AddRecursoFinanciero(recurso);
            }

            return model;
        }
    }
}