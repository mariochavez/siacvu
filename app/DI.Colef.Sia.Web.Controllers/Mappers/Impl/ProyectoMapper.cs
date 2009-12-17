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
        readonly IResponsableProyectoMapper responsableProyectoMapper;
        readonly IParticipanteInternoProyectoMapper participanteInternoProyectoMapper;
        readonly IParticipanteExternoProyectoMapper participanteExternoProyectoMapper;
        readonly IRecursoFinancieroProyectoMapper recursoFinancieroProyectoMapper;
        readonly IEstudianteProyectoMapper estudianteProyectoMapper;
        readonly IProductoGeneradoProyectoMapper productoGeneradoProyectoMapper;
        readonly IConvenioService convenioService;

        public ProyectoMapper(IRepository<Proyecto> repository, ICatalogoService catalogoService,
                              IResponsableProyectoMapper responsableProyectoMapper,
                              IParticipanteInternoProyectoMapper participanteInternoProyectoMapper,
                              IParticipanteExternoProyectoMapper participanteExternoProyectoMapper,
                              IRecursoFinancieroProyectoMapper recursoFinancieroProyectoMapper,
                              IConvenioService convenioService, IEstudianteProyectoMapper estudianteProyectoMapper,
                              IProductoGeneradoProyectoMapper productoGeneradoProyectoMapper)
            : base(repository)
        {
            this.catalogoService = catalogoService;
            this.responsableProyectoMapper = responsableProyectoMapper;
            this.participanteInternoProyectoMapper = participanteInternoProyectoMapper;
            this.participanteExternoProyectoMapper = participanteExternoProyectoMapper;
            this.estudianteProyectoMapper = estudianteProyectoMapper;
            this.recursoFinancieroProyectoMapper = recursoFinancieroProyectoMapper;
            this.productoGeneradoProyectoMapper = productoGeneradoProyectoMapper;
            this.convenioService = convenioService;
        }

        protected override int GetIdFromMessage(ProyectoForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ProyectoForm message, Proyecto model)
        {
            model.Nombre = message.Nombre;
            model.TipoProyecto = catalogoService.GetTipoProyectoById(message.TipoProyecto);

            model.FechaInicial = message.FechaInicial.FromShortDateToDateTime();
            model.FechaFinal = message.FechaFinal.FromShortDateToDateTime();
            model.FechaProrroga = message.FechaProrroga.FromShortDateToDateTime();
            model.EstadoProyecto = message.EstadoProyecto;
            model.FechaConclusion = message.FechaConclusion.FromShortDateToDateTime();

            model.ConRecursos = message.ConRecursos;
            model.ConConvenio = message.ConConvenio;
            model.Convenio = convenioService.GetConvenioById(message.Convenio);
            model.SectorFinanciamiento = catalogoService.GetSectorById(message.SectorFinanciamiento);
            model.FondoConacyt = catalogoService.GetFondoConacytById(message.FondoConacyt);

            model.ObjetivoGeneral = message.ObjetivoGeneral;
            model.AreaTematica = catalogoService.GetAreaTematicaById(message.AreaTematicaId);
            model.ImpactoPoliticaPublica = message.ImpactoPoliticaPublica;
            model.VinculacionAPyD = catalogoService.GetVinculacionAPyDById(message.VinculacionAPyD);
            model.ResumenProyecto = message.ResumenProyecto;

            model.Area = catalogoService.GetAreaById(message.AreaId);
            model.Disciplina = catalogoService.GetDisciplinaById(message.DisciplinaId);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.SubdisciplinaId);

            model.Actividades = message.Actividades;
            model.ProductoAcademicoEsperado = message.ProductoAcademicoEsperado;
            model.ParticipaEstudiante = message.ParticipaEstudiante;

            model.Sector = catalogoService.GetSectorById(message.SectorId);
            model.Organizacion = catalogoService.GetOrganizacionById(message.OrganizacionId);
            model.Nivel2 = catalogoService.GetNivelById(message.Nivel2Id);

            model.SectorEconomico = catalogoService.GetSectorById(message.SectorEconomicoId);
            model.Rama = catalogoService.GetRamaById(message.RamaId);
            model.Clase = catalogoService.GetClaseById(message.ClaseId);

        }

        public Proyecto Map(ProyectoForm message, Usuario usuario)
        {
            var model = Map(message);

            model.ModificadoPor = usuario;

            return model;
        }

        public Proyecto Map(ProyectoForm message, Usuario usuario, Investigador investigador)
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

        public Proyecto Map(ProyectoForm message, Usuario usuario, Investigador investigador, ResponsableProyectoForm[] responsables,
            ParticipanteInternoProductoForm[] participantesInternos, ParticipanteExternoProductoForm[] participantesExternos, 
            RecursoFinancieroProyectoForm[] recursos, EstudianteProyectoForm[] estudiantes, ProductoGeneradoProyectoForm[] productos)
        {
            var model = Map(message, usuario, investigador);

            foreach (var responsableProyecto in responsables)
            {
                var responsable =
                    responsableProyectoMapper.Map(responsableProyecto);

                responsable.CreadoPor = usuario;
                responsable.ModificadoPor = usuario;

                model.AddResponsable(responsable);
            }

            foreach (var participanteProyecto in participantesInternos)
            {
                var participante =
                    participanteInternoProyectoMapper.Map(participanteProyecto);

                participante.CreadoPor = usuario;
                participante.ModificadoPor = usuario;

                model.AddParticipanteInterno(participante);
            }

            foreach (var participanteProyecto in participantesExternos)
            {
                var participante =
                    participanteExternoProyectoMapper.Map(participanteProyecto);

                participante.CreadoPor = usuario;
                participante.ModificadoPor = usuario;

                model.AddParticipanteExterno(participante);
            }

            foreach (var recursoProyecto in recursos)
            {
                var recurso =
                    recursoFinancieroProyectoMapper.Map(recursoProyecto);

                recurso.CreadoPor = usuario;
                recurso.ModificadoPor = usuario;

                model.AddRecursoFinanciero(recurso);
            }

            foreach (var estudianteProyecto in estudiantes)
            {
                var estudiante =
                    estudianteProyectoMapper.Map(estudianteProyecto);

                estudiante.CreadoPor = usuario;
                estudiante.ModificadoPor = usuario;

                model.AddEstudiante(estudiante);
            }

            foreach (var productoProyecto in productos)
            {
                var producto =
                    productoGeneradoProyectoMapper.Map(productoProyecto);

                producto.CreadoPor = usuario;
                producto.ModificadoPor = usuario;

                model.AddProducto(producto);
            }

            return model;
        }
    }
}