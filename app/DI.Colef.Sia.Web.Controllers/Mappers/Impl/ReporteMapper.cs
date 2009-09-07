using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ReporteMapper : AutoFormMapper<Reporte, ReporteForm>, IReporteMapper
    {
        readonly ICatalogoService catalogoService;
        readonly ICoautorExternoReporteMapper coautorExternoReporteMapper;
        readonly ICoautorInternoReporteMapper coautorInternoReporteMapper;
        readonly IProyectoService proyectoService;

        public ReporteMapper(IRepository<Reporte> repository, ICatalogoService catalogoService,
                             ICoautorExternoReporteMapper coautorExternoReporteMapper, ICoautorInternoReporteMapper coautorInternoReporteMapper,
                             IProyectoService proyectoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
            this.coautorExternoReporteMapper = coautorExternoReporteMapper;
            this.coautorInternoReporteMapper = coautorInternoReporteMapper;
            this.proyectoService = proyectoService;
        }

        protected override int GetIdFromMessage(ReporteForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ReporteForm message, Reporte model)
        {
            model.Titulo = message.Titulo;
            model.Editorial = message.Editorial;
            model.NoPaginas = message.NoPaginas;
            model.Descripcion = message.Descripcion;
            model.Objetivo = message.Objetivo;
            model.PalabraClave1 = message.PalabraClave1;
            model.PalabraClave2 = message.PalabraClave2;
            model.PalabraClave3 = message.PalabraClave3;
            
            model.FechaEdicion = message.FechaEdicion.FromShortDateToDateTime();
            model.FechaAceptacion = message.FechaAceptacion.FromYearDateToDateTime();
            model.Fecha = message.Fecha.FromShortDateToDateTime();

            model.TipoReporte = catalogoService.GetTipoReporteById(message.TipoReporte);
            model.EstadoProducto = catalogoService.GetEstadoProductoById(message.EstadoProducto);
            model.Proyecto = proyectoService.GetProyectoById(message.Proyecto);
            model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematicaId);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.Pais = catalogoService.GetPaisById(message.Pais);
        }

        public Reporte Map(ReporteForm message, Usuario usuario, PeriodoReferencia periodo)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadorPor = usuario;
                model.PeriodoReferencia = periodo;
            }

            model.ModificadoPor = usuario;

            return model;
        }

        public Reporte Map(ReporteForm message, Usuario usuario, PeriodoReferencia periodo,
            string[] coautoresExternos, string[] coautoresInternos)
        {
            var model = Map(message, usuario, periodo);

            foreach (var coautorId in coautoresExternos)
            {
                var coautor =
                    coautorExternoReporteMapper.Map(new CoautorExternoReporteForm
                                                        {InvestigadorExternoId = int.Parse(coautorId)});

                coautor.CreadorPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorExterno(coautor);
            }

            foreach (var coautorId in coautoresInternos)
            {
                var coautor =
                    coautorInternoReporteMapper.Map(new CoautorInternoReporteForm
                                                        {InvestigadorId = int.Parse(coautorId)});

                coautor.CreadorPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorInterno(coautor);
            }

            return model;
        }
    }
}