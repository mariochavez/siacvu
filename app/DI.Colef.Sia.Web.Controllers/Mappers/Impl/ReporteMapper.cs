using System;
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

        public ReporteMapper(IRepository<Reporte> repository, ICatalogoService catalogoService,
            ICoautorExternoReporteMapper coautorExternoReporteMapper, ICoautorInternoReporteMapper coautorInternoReporteMapper)
            : base(repository)
        {
            this.catalogoService = catalogoService;
            this.coautorExternoReporteMapper = coautorExternoReporteMapper;
            this.coautorInternoReporteMapper = coautorInternoReporteMapper;
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
            model.PalabarasClave = message.PalabarasClave;
            model.FechaEdicion = message.FechaEdicion.FromShortDateToDateTime();
            model.FechaAceptacion = message.FechaAceptacion.FromShortDateToDateTime();
            model.Fecha = message.Fecha.FromShortDateToDateTime();

            model.TipoReporte = catalogoService.GetTipoReporteById(message.TipoReporte);
            model.EstadoProducto = catalogoService.GetEstadoProductoById(message.EstadoProducto);
            model.PeriodoReferencia = catalogoService.GetPeriodoReferenciaById(message.PeriodoReferencia);
            model.Proyecto = catalogoService.GetProyectoById(message.Proyecto);
            model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematica);
            model.Institucion = catalogoService.GetInstitucionById(message.Institucion);
            model.Pais = catalogoService.GetPaisById(message.Pais);

            if (message.CoautorExternoReporte != null)
                model.AddCoautorExterno(coautorExternoReporteMapper.Map(message.CoautorExternoReporte));
            if (message.CoautorInternoReporte != null)
                model.AddCoautorInterno(coautorInternoReporteMapper.Map(message.CoautorInternoReporte));
        }

        public Reporte Map(ReporteForm message, Usuario usuario, Investigador investigador)
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

        public Reporte Map(ReporteForm message, Usuario usuario, Investigador investigador, string[] coautoresExternos, string[] coautoresInternos)
        {
            var model = Map(message, usuario, investigador);

            foreach (var coautorId in coautoresExternos)
            {
                var coautor =
                    coautorExternoReporteMapper.Map(new CoautorExternoReporteForm { InvestigadorExternoId = int.Parse(coautorId) });

                coautor.CreadorPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorExterno(coautor);
            }

            foreach (var coautorId in coautoresInternos)
            {
                var coautor =
                    coautorInternoReporteMapper.Map(new CoautorInternoReporteForm { InvestigadorId = int.Parse(coautorId) });

                coautor.CreadorPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorInterno(coautor);
            }

            return model;
        }
    }
}
