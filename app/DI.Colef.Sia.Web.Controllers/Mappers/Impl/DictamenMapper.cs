using System;
using System.Linq;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class DictamenMapper : AutoFormMapper<Dictamen, DictamenForm>, IDictamenMapper
    {
		readonly ICatalogoService catalogoService;
        readonly IEditorialProductoMapper<EditorialDictamen> editorialDictamenMapper;

		public DictamenMapper(IRepository<Dictamen> repository,
		    ICatalogoService catalogoService,
            IEditorialProductoMapper<EditorialDictamen> editorialDictamenMapper
		) 
			: base(repository)
        {
			this.catalogoService = catalogoService;
            this.editorialDictamenMapper = editorialDictamenMapper;
        }		
		
        protected override int GetIdFromMessage(DictamenForm message)
        {
            return message.Id;
        }

        public override DictamenForm Map(Dictamen model)
        {
            var message = base.Map(model);
            if (message.RevistaPublicacionId > 0)
                message.RevistaPublicacionTitulo = model.RevistaPublicacion.Titulo;

            message.EditorialDictamenes = editorialDictamenMapper.Map(model.EditorialDictamenes.Cast<EditorialProducto>().ToArray());

            return message;
        }

        protected override void MapToModel(DictamenForm message, Dictamen model)
        {
            model.Nombre = message.Nombre;
            model.FechaDictamen = message.FechaDictamen.FromShortDateToDateTime();

			model.TipoDictamen = catalogoService.GetTipoDictamenById(message.TipoDictamen);
            model.FondoConacyt = catalogoService.GetFondoConacytById(message.FondoConacyt);
            model.RevistaPublicacion = catalogoService.GetRevistaPublicacionById(message.RevistaPublicacionId);

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
        }

        public Dictamen Map(DictamenForm message, Usuario usuario)
        {
            var model = Map(message);

            model.ModificadoPor = usuario;

            return model;
        }

        public Dictamen Map(DictamenForm message, Usuario usuario, Investigador investigador)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Usuario = usuario;
                model.CreadoPor = usuario;
                model.Sede = GetLatest(investigador.CargosInvestigador).Sede;
                model.Departamento = GetLatest(investigador.CargosInvestigador).Departamento;
            }

            model.ModificadoPor = usuario;

            return model;
        }

        public Dictamen Map(DictamenForm message, Usuario usuario, Investigador investigador, EditorialProductoForm[] editoriales)
        {
            var model = Map(message, usuario, investigador);

            foreach (var editorial in editoriales)
            {
                var editorialProducto = editorialDictamenMapper.Map(editorial);

                editorialProducto.CreadoPor = usuario;
                editorialProducto.ModificadoPor = usuario;

                model.AddEditorial(editorialProducto);
            }

            return model;
        }
    }
}