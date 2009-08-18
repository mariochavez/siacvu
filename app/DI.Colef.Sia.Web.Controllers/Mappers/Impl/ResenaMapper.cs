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
        readonly ICoautorExternoResenaMapper coautorExternoResenaMapper;
        readonly ICoautorInternoResenaMapper coautorInternoResenaMapper;


        public ResenaMapper(IRepository<Resena> repository, ICatalogoService catalogoService, 
            ICoautorExternoResenaMapper coautorExternoResenaMapper, ICoautorInternoResenaMapper coautorInternoResenaMapper)
            : base(repository)
        {
            this.catalogoService = catalogoService;
            this.coautorExternoResenaMapper = coautorExternoResenaMapper;
            this.coautorInternoResenaMapper = coautorInternoResenaMapper;
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
                model.AddCoautorExterno(coautorExternoResenaMapper.Map(message.CoautorExternoResena));
            if (message.CoautorInternoResena != null)
                model.AddCoautorInterno(coautorInternoResenaMapper.Map(message.CoautorInternoResena));
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

        public Resena Map(ResenaForm message, Usuario usuario, Investigador investigador,
            string[] coautoresExternos, string[] coautoresInternos)
        {
            var model = Map(message, usuario, investigador);

            foreach (var coautorId in coautoresExternos)
            {
                var coautor =
                    coautorExternoResenaMapper.Map(new CoautorExternoResenaForm
                                                       {InvestigadorExternoId = int.Parse(coautorId)});

                coautor.CreadorPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorExterno(coautor);
            }

            foreach (var coautorId in coautoresInternos)
            {
                var coautor =
                    coautorInternoResenaMapper.Map(new CoautorInternoResenaForm {InvestigadorId = int.Parse(coautorId)});

                coautor.CreadorPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorInterno(coautor);
            }

            return model;
        }
    }
}
