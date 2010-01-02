using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class ObraTraducidaMapper : AutoFormMapper<ObraTraducida, ObraTraducidaForm>, IObraTraducidaMapper
    {
		readonly ICatalogoService catalogoService;
        readonly ICoautorExternoObraTraducidaMapper coautorExternoObraTraducidaMapper;
        readonly ICoautorInternoObraTraducidaMapper coautorInternoObraTraducidaMapper;
        readonly IAutorInternoObraTraducidaMapper autorInternoObraTraducidaMapper;
        readonly IAutorExternoObraTraducidaMapper autorExternoObraTraducidaMapper;
        readonly IEditorialObraTraducidaMapper editorialObraTraducidaMapper;
        private Usuario usuarioObraTraducida = null;

		public ObraTraducidaMapper(IRepository<ObraTraducida> repository,
            ICoautorExternoObraTraducidaMapper coautorExternoObraTraducidaMapper,
            ICoautorInternoObraTraducidaMapper coautorInternoObraTraducidaMapper,
            IAutorInternoObraTraducidaMapper autorInternoObraTraducidaMapper,
            IAutorExternoObraTraducidaMapper autorExternoObraTraducidaMapper,
            IEditorialObraTraducidaMapper editorialObraTraducidaMapper,
            ICatalogoService catalogoService
		) : base(repository)
        {
			this.catalogoService = catalogoService;
            this.coautorExternoObraTraducidaMapper = coautorExternoObraTraducidaMapper;
            this.coautorInternoObraTraducidaMapper = coautorInternoObraTraducidaMapper;
            this.autorInternoObraTraducidaMapper = autorInternoObraTraducidaMapper;
            this.autorExternoObraTraducidaMapper = autorExternoObraTraducidaMapper;
            this.editorialObraTraducidaMapper = editorialObraTraducidaMapper;
        }		
		
        protected override int GetIdFromMessage(ObraTraducidaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(ObraTraducidaForm message, ObraTraducida model)
        {
			model.Nombre = message.Nombre;
            model.Volumen = message.Volumen;
            model.Numero = message.Numero;
            model.PaginaInicial = message.PaginaInicial;
            model.PaginaFinal = message.PaginaFinal;
            model.NombreLibro = message.NombreLibro;
            model.TipoLibro = message.TipoLibro;
            model.Resumen = message.Resumen;
            model.NoPaginas = message.NoPaginas;
            model.NoCitas = message.NoCitas;
            model.ISBN = message.ISBN;
            model.Reimpresion = message.Reimpresion;
            model.Tiraje = message.Tiraje;
            model.NombreTraductor = message.NombreTraductor;
            model.ApellidoPaterno = message.ApellidoPaterno;
            model.ApellidoMaterno = message.ApellidoMaterno;
            model.NombreObraTraducida = message.NombreObraTraducida;
            model.TipoObraTraducida = message.TipoObraTraducida;
            model.PalabraClave1 = message.PalabraClave1;
            model.PalabraClave2 = message.PalabraClave2;
            model.PalabraClave3 = message.PalabraClave3;
            model.EstadoProducto = message.EstadoProducto;
            model.Edicion = message.Edicion;
            model.CoautorSeOrdenaAlfabeticamente = message.CoautorSeOrdenaAlfabeticamente;

            if (model.Usuario == null || model.Usuario == usuarioObraTraducida)
                model.PosicionAutor = message.PosicionAutor;

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

		    model.Idioma = catalogoService.GetIdiomaById(message.Idioma);
		    model.AreaTematica = catalogoService.GetAreaTematicaById(message.AreaTematicaId);
		    model.RevistaPublicacion = catalogoService.GetRevistaPublicacionById(message.RevistaPublicacionId);
		    
        }

        public ObraTraducida Map(ObraTraducidaForm message, Usuario usuario)
        {
            usuarioObraTraducida = usuario;
            var model = Map(message);

            model.ModificadoPor = usuario;

            return model;
        }

        public ObraTraducida Map(ObraTraducidaForm message, Usuario usuario, Investigador investigador)
        {
            usuarioObraTraducida = usuario;
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
                foreach (var coautor in model.CoautorInternoObraTraducidas)
                {
                    if (coautor.Investigador == investigador)
                        coautor.Posicion = message.PosicionAutor;
                }
            }

            model.ModificadoPor = usuario;

            return model;
        }

        public ObraTraducida Map(ObraTraducidaForm message, Usuario usuario, Investigador investigador,
            CoautorExternoProductoForm[] coautoresExternos, CoautorInternoProductoForm[] coautoresInternos,
            AutorExternoProductoForm[] autoresExternos, AutorInternoProductoForm[] autoresInternos, EditorialProductoForm[] editoriales)
        {
            var model = Map(message, usuario, investigador);

            foreach (var coautorExterno in coautoresExternos)
            {
                var coautor = coautorExternoObraTraducidaMapper.Map(coautorExterno);

                coautor.CreadoPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorExterno(coautor);
            }

            foreach (var coautorInterno in coautoresInternos)
            {
                var coautor = coautorInternoObraTraducidaMapper.Map(coautorInterno);

                coautor.CreadoPor = usuario;
                coautor.ModificadoPor = usuario;

                model.AddCoautorInterno(coautor);
            }

            foreach (var autorExterno in autoresExternos)
            {
                var autor = autorExternoObraTraducidaMapper.Map(autorExterno);

                autor.CreadoPor = usuario;
                autor.ModificadoPor = usuario;

                model.AddAutorExterno(autor);
            }

            foreach (var autorInterno in autoresInternos)
            {
                var autor = autorInternoObraTraducidaMapper.Map(autorInterno);

                autor.CreadoPor = usuario;
                autor.ModificadoPor = usuario;

                model.AddAutorInterno(autor);
            }

            foreach (var editorial in editoriales)
            {
                var editorialProducto = editorialObraTraducidaMapper.Map(editorial);

                editorialProducto.CreadoPor = usuario;
                editorialProducto.ModificadoPor = usuario;

                model.AddEditorial(editorialProducto);
            }

            return model;
        }
    }
}
