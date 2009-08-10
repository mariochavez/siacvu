using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ReseñaMapper : AutoFormMapper<Reseña, ReseñaForm>, IReseñaMapper
    {
        readonly ICatalogoService catalogoService;
        readonly ICoautorExternoReseñaMapper coautorExternoReseñaMapper;
        readonly ICoautorInternoReseñaMapper coautorInternoReseñaMapper;


        public ReseñaMapper(IRepository<Reseña> repository, ICatalogoService catalogoService, 
            ICoautorExternoReseñaMapper coautorExternoReseñaMapper, ICoautorInternoReseñaMapper coautorInternoReseñaMapper)
            : base(repository)
        {
            this.catalogoService = catalogoService;
            this.coautorExternoReseñaMapper = coautorExternoReseñaMapper;
            this.coautorInternoReseñaMapper = coautorInternoReseñaMapper;
        }

        protected override int GetIdFromMessage(ReseñaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ReseñaForm message, Reseña model)
        {
            model.ReferenciaBibliograficaLibro = message.ReferenciaBibliograficaLibro;
            model.ReferenciaBibliograficaRevista = message.ReferenciaBibliograficaRevista;
            model.NombreProducto = message.NombreProducto;
            model.PaginaInicial = message.PaginaInicial;
            model.PaginaFinal = message.PaginaFinal;
            model.TituloLibro = message.TituloLibro;
            model.NombreRevista = message.NombreRevista;
            model.Editorial = message.Editorial;
            model.PalabrasClave = message.PalabrasClave;
            model.FechaEdicion = message.FechaEdicion.FromShortDateToDateTime();
            model.FechaAceptacion = message.FechaAceptacion.FromShortDateToDateTime();

            model.EstadoProducto = catalogoService.GetEstadoProductoById(message.EstadoProducto);
            model.PeriodoReferencia = catalogoService.GetPeriodoReferenciaById(message.PeriodoReferencia);
            model.Proyecto = catalogoService.GetProyectoById(message.Proyecto);
            model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematica);
            model.Pais = catalogoService.GetPaisById(message.Pais);
            model.Area = catalogoService.GetAreaById(message.Area);
            model.Disciplina = catalogoService.GetDisciplinaById(message.Disciplina);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.Subdisciplina);

            if (message.CoautorExternoReseña != null)
                model.AddCoautorExterno(coautorExternoReseñaMapper.Map(message.CoautorExternoReseña));
            if (message.CoautorInternoReseña != null)
                model.AddCoautorInterno(coautorInternoReseñaMapper.Map(message.CoautorInternoReseña));
        }

        public Reseña Map(ReseñaForm message, Usuario usuario, Investigador investigador)
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
