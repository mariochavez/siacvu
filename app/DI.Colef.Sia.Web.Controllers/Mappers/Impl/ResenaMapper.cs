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
        readonly IAutorInternoResenaMapper autorInternoResenaMapper;
        readonly IAutorExternoResenaMapper autorExternoResenaMapper;
        readonly IEditorialResenaMapper editorialResenaMapper;
        private Usuario usuarioResena = null;
        
        public ResenaMapper(IRepository<Resena> repository,
                            ICatalogoService catalogoService, 
                            ICoautorExternoResenaMapper coautorExternoResenaMapper, 
                            ICoautorInternoResenaMapper coautorInternoResenaMapper,
                            IAutorInternoResenaMapper autorInternoResenaMapper,
                            IAutorExternoResenaMapper autorExternoResenaMapper,
                            IEditorialResenaMapper editorialResenaMapper
            ) : base(repository)
        {
            this.catalogoService = catalogoService;
            this.coautorExternoResenaMapper = coautorExternoResenaMapper;
            this.coautorInternoResenaMapper = coautorInternoResenaMapper;
            this.autorInternoResenaMapper = autorInternoResenaMapper;
            this.autorExternoResenaMapper = autorExternoResenaMapper;
            this.editorialResenaMapper = editorialResenaMapper;
        }

        protected override int GetIdFromMessage(ResenaForm message)
        {
            return message.Id;
        }

        public override ResenaForm Map(Resena model)
        {
            var message = base.Map(model);
            if (message.RevistaPublicacionId > 0)
                message.RevistaPublicacionTitulo = model.RevistaPublicacion.Titulo;

            return message;
        }

        protected override void MapToModel(ResenaForm message, Resena model)
        {
            model.Numero = message.Numero;
            model.NombreProducto = message.NombreProducto;
            model.PaginaInicial = message.PaginaInicial;
            model.PaginaFinal = message.PaginaFinal;
            model.TituloLibro = message.TituloLibro;
            model.PalabraClave1 = message.PalabraClave1;
            model.PalabraClave2 = message.PalabraClave2;
            model.PalabraClave3 = message.PalabraClave3;
            model.Volumen = message.Volumen;
            model.TipoResena = message.TipoResena;
            model.EstadoProducto = message.EstadoProducto;
            model.CoautorSeOrdenaAlfabeticamente = message.CoautorSeOrdenaAlfabeticamente;
            model.AutorSeOrdenaAlfabeticamente = message.AutorSeOrdenaAlfabeticamente;

            if (model.Usuario == null || model.Usuario == usuarioResena)
            {
                model.PosicionCoautor = message.PosicionCoautor;
                model.PosicionAutor = message.PosicionAutor;
            }

            if (message.EstadoProducto != 0 && message.EstadoProducto != 1)
            {
                if (message.FechaAceptacion.FromYearDateToDateTime() > DateTime.Parse("1910-01-01"))
                    model.FechaAceptacion = message.FechaAceptacion.FromYearDateToDateTime();
                if (message.FechaPublicacion.FromYearDateToDateTime() > DateTime.Parse("1910-01-01"))
                {
                    if (message.FechaAceptacion.FromYearDateToDateTime() == DateTime.Parse("1910-01-01"))
                        model.FechaAceptacion = message.FechaPublicacion.FromYearDateToDateTime();
                }
            }
            else
                model.FechaAceptacion = message.FechaAceptacion.FromYearDateToDateTime();

            model.FechaPublicacion = message.FechaPublicacion.FromYearDateToDateTime();

            var revistaPublicacion = catalogoService.GetRevistaPublicacionById(message.RevistaPublicacionId);
            if (revistaPublicacion != null && String.Compare(revistaPublicacion.Titulo, message.RevistaPublicacionTitulo) >= 0)
            {
                model.RevistaPublicacion = revistaPublicacion;
                model.RevistaPublicacionTitulo = String.Empty;
            }
            else
            {
                model.RevistaPublicacionTitulo = message.RevistaPublicacionTitulo;
                model.RevistaPublicacion = null;
            }

            model.AreaTematica = catalogoService.GetAreaTematicaById(message.AreaTematicaId);
            model.Pais = catalogoService.GetPaisById(message.Pais);

            model.Area = catalogoService.GetAreaById(message.AreaId);
            model.Disciplina = catalogoService.GetDisciplinaById(message.DisciplinaId);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.SubdisciplinaId);
        }

        public Resena Map(ResenaForm message, Usuario usuario)
        {
            usuarioResena = usuario;
            var model = Map(message);

            model.ModificadoPor = usuario;

            return model;
        }

        public Resena Map(ResenaForm message, Usuario usuario, Investigador investigador)
        {
            usuarioResena = usuario;
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadoPor = usuario;
                model.Sede = GetLatest(investigador.CargosInvestigador).Sede;
                model.Departamento = GetLatest(investigador.CargosInvestigador).Departamento;
            }

            if (model.Usuario != investigador.Usuario)
            {
                foreach (var coautor in model.CoautorInternoResenas)
                {
                    if (coautor.Investigador == investigador)
                        coautor.Posicion = message.PosicionCoautor;
                }

                foreach (var autor in model.AutorInternoResenas)
                {
                    if (autor.Investigador == investigador)
                        autor.Posicion = message.PosicionAutor;
                }
            }

            model.ModificadoPor = usuario;

            return model;
        }

        public Resena Map(ResenaForm message, Usuario usuario, Investigador investigador,
            CoautorExternoProductoForm[] coautoresExternos, CoautorInternoProductoForm[] coautoresInternos,
            AutorExternoProductoForm[] autoresExternos, AutorInternoProductoForm[] autoresInternos, EditorialProductoForm[] editoriales)
        {
            var model = Map(message, usuario, investigador);
            
            foreach (var coautorExterno in coautoresExternos)
            {
                var coautor =
                    coautorExternoResenaMapper.Map(coautorExterno);

                coautor.CreadoPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorExterno(coautor);
            }
        
            foreach (var coautorInterno in coautoresInternos)
            {
                var coautor =
                    coautorInternoResenaMapper.Map(coautorInterno);

                coautor.CreadoPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorInterno(coautor);
            }

            foreach (var autorExterno in autoresExternos)
            {
                var autor = autorExternoResenaMapper.Map(autorExterno);

                autor.CreadoPor = usuario;
                autor.ModificadoPor = usuario;

                model.AddAutorExterno(autor);
            }

            foreach (var autorInterno in autoresInternos)
            {
                var autor = autorInternoResenaMapper.Map(autorInterno);

                autor.CreadoPor = usuario;
                autor.ModificadoPor = usuario;

                model.AddAutorInterno(autor);
            }

            foreach (var editorial in editoriales)
            {
                var editorialProducto = editorialResenaMapper.Map(editorial);

                editorialProducto.CreadoPor = usuario;
                editorialProducto.ModificadoPor = usuario;

                model.AddEditorial(editorialProducto);
            }

            return model;
        }
    }
}