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
        readonly IProyectoService proyectoService;


        public ResenaMapper(IRepository<Resena> repository, ICatalogoService catalogoService, 
                            ICoautorExternoResenaMapper coautorExternoResenaMapper, 
                            ICoautorInternoResenaMapper coautorInternoResenaMapper,
                            IProyectoService proyectoService)
            : base(repository)
        {
            this.catalogoService = catalogoService;
            this.coautorExternoResenaMapper = coautorExternoResenaMapper;
            this.coautorInternoResenaMapper = coautorInternoResenaMapper;
            this.proyectoService = proyectoService;
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
            model.PalabraClave1 = message.PalabraClave1;
            model.PalabraClave2 = message.PalabraClave2;
            model.PalabraClave3 = message.PalabraClave3;
            model.TieneProyecto = message.TieneProyecto;

            model.FechaEdicion = message.FechaEdicion.FromShortDateToDateTime();
            model.FechaAceptacion = message.FechaAceptacion.FromYearDateToDateTime();

            model.TipoResena = catalogoService.GetTipoResenaById(message.TipoResena);
            model.EstadoProducto = catalogoService.GetEstadoProductoById(message.EstadoProducto);
            model.Proyecto = proyectoService.GetProyectoById(message.Proyecto);
            model.LineaTematica = catalogoService.GetLineaTematicaById(message.LineaTematicaId);
            model.Pais = catalogoService.GetPaisById(message.Pais);
            model.Area = catalogoService.GetAreaById(message.Area);
            model.Disciplina = catalogoService.GetDisciplinaById(message.Disciplina);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.Subdisciplina);
        }

        public Resena Map(ResenaForm message, Usuario usuario, PeriodoReferencia periodo)
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

        public Resena Map(ResenaForm message, Usuario usuario, PeriodoReferencia periodo,
            string[] coautoresExternos, string[] coautoresInternos)
        {
            var model = Map(message, usuario, periodo);

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
