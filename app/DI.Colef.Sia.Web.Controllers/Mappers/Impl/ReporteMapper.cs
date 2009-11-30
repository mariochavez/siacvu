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
            model.NoPaginas = message.NoPaginas;
            model.Descripcion = message.Descripcion;
            model.Objetivo = message.Objetivo;
            model.PalabraClave1 = message.PalabraClave1;
            model.PalabraClave2 = message.PalabraClave2;
            model.PalabraClave3 = message.PalabraClave3;
            model.TieneProyecto = message.TieneProyecto;
            model.TipoReporte = message.TipoReporte;
            model.Numero = message.Numero;
            model.PosicionAutor = message.PosicionAutor;
            
            model.FechaAceptacion = message.FechaAceptacion.FromYearDateToDateTime();
            model.FechaPublicacion = message.FechaPublicacion.FromYearDateToDateTime();

            model.EstadoProducto = message.EstadoProducto;
            model.Proyecto = proyectoService.GetProyectoById(message.ProyectoId);
            model.Institucion = catalogoService.GetInstitucionById(message.InstitucionId);
            model.AreaTematica = catalogoService.GetAreaTematicaById(message.AreaTematicaId);
        }

        public Reporte Map(ReporteForm message, Usuario usuario, Investigador investigador)
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

        public Reporte Map(ReporteForm message, Usuario usuario, Investigador investigador,
            CoautorExternoProductoForm[] coautoresExternos, CoautorInternoProductoForm[] coautoresInternos)
        {
            var model = Map(message, usuario, investigador);

            if (coautoresExternos != null)
            {
                foreach (var coautorExterno in coautoresExternos)
                {
                    var coautor =
                        coautorExternoReporteMapper.Map(coautorExterno);

                    coautor.CreadorPor = usuario;
                    coautor.ModificadoPor = usuario;

                    model.AddCoautorExterno(coautor);
                }
            }

            if (coautoresInternos != null)
            {
                foreach (var coautorInterno in coautoresInternos)
                {
                    var coautor =
                        coautorInternoReporteMapper.Map(coautorInterno);

                    coautor.CreadorPor = usuario;
                    coautor.ModificadoPor = usuario;

                    model.AddCoautorInterno(coautor);
                }
            }

            return model;
        }
    }
}