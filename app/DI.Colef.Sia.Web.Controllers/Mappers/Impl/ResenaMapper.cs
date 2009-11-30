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
            model.PosicionAutor = message.PosicionAutor;

            model.FechaAceptacion = message.FechaAceptacion.FromYearDateToDateTime();
            model.FechaPublicacion = message.FechaPublicacion.FromYearDateToDateTime();

            model.RevistaPublicacion = catalogoService.GetRevistaPublicacionById(message.RevistaPublicacionId);
            model.AreaTematica = catalogoService.GetAreaTematicaById(message.AreaTematicaId);
            model.Subdisciplina = catalogoService.GetSubdisciplinaById(message.SubdisciplinaId);
            model.Pais = catalogoService.GetPaisById(message.Pais);

            if (message.EstadoProducto != 0)
                model.EstadoProducto = message.EstadoProducto;
        }

        public Resena Map(ResenaForm message, Usuario usuario, Investigador investigador)
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

        public Resena Map(ResenaForm message, Usuario usuario, Investigador investigador,
            CoautorExternoProductoForm[] coautoresExternos, CoautorInternoProductoForm[] coautoresInternos,
            AutorExternoProductoForm[] autoresExternos, AutorInternoProductoForm[] autoresInternos, EditorialProductoForm[] editoriales)
        {
            var model = Map(message, usuario, investigador);
            
            foreach (var coautorExterno in coautoresExternos)
            {
                var coautor =
                    coautorExternoResenaMapper.Map(coautorExterno);

                coautor.CreadorPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorExterno(coautor);
            }
        
            foreach (var coautorInterno in coautoresInternos)
            {
                var coautor =
                    coautorInternoResenaMapper.Map(coautorInterno);

                coautor.CreadorPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorInterno(coautor);
            }

            foreach (var autorExterno in autoresExternos)
            {
                var autor = autorExternoResenaMapper.Map(autorExterno);

                autor.CreadorPor = usuario;
                autor.ModificadoPor = usuario;

                model.AddAutorExterno(autor);
            }

            foreach (var autorInterno in autoresInternos)
            {
                var autor = autorInternoResenaMapper.Map(autorInterno);

                autor.CreadorPor = usuario;
                autor.ModificadoPor = usuario;

                model.AddAutorInterno(autor);
            }

            foreach (var editorial in editoriales)
            {
                var editorialProducto = editorialResenaMapper.Map(editorial);

                editorialProducto.CreadorPor = usuario;
                editorialProducto.ModificadoPor = usuario;

                model.AddEditorial(editorialProducto);
            }

            return model;
        }
    }
}