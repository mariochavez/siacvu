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
        readonly IEditorialDictamenMapper editorialDictamenMapper;

		public DictamenMapper(IRepository<Dictamen> repository,
		    ICatalogoService catalogoService,
            IEditorialDictamenMapper editorialDictamenMapper
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

        protected override void MapToModel(DictamenForm message, Dictamen model)
        {
            model.Nombre = message.Nombre;
            model.FechaDictamen = message.FechaDictamen.FromShortDateToDateTime();

			model.TipoDictamen = catalogoService.GetTipoDictamenById(message.TipoDictamen);
            model.FondoConacyt = catalogoService.GetFondoConacytById(message.FondoConacyt);
            model.RevistaPublicacion = catalogoService.GetRevistaPublicacionById(message.RevistaPublicacionId);
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