using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ResenaMapper : AutoFormMapper<Resena, ResenaForm>, IResenaMapper
    {
        readonly ICatalogoService catalogoService;
        readonly ICoautorExternoResenaMapper _coautorExternoResenaMapper;
        readonly ICoautorInternoResenaMapper _coautorInternoResenaMapper;


        public ResenaMapper(IRepository<Resena> repository, ICatalogoService catalogoService, 
            ICoautorExternoResenaMapper _coautorExternoResenaMapper, ICoautorInternoResenaMapper _coautorInternoResenaMapper)
            : base(repository)
        {
            this.catalogoService = catalogoService;
            this._coautorExternoResenaMapper = _coautorExternoResenaMapper;
            this._coautorInternoResenaMapper = _coautorInternoResenaMapper;
        }

        protected override int GetIdFromMessage(ResenaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ResenaForm message, Resena model)
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

            if (message.CoautorExternoResena != null)
                model.AddCoautorExterno(_coautorExternoResenaMapper.Map(message.CoautorExternoResena));
            if (message.CoautorInternoResena != null)
                model.AddCoautorInterno(_coautorInternoResenaMapper.Map(message.CoautorInternoResena));
        }

        public Resena Map(ResenaForm message, Usuario usuario, Investigador investigador)
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
