using System;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class FirmaMapper : AutoFormMapper<Firma, FirmaForm>, IFirmaMapper
    {
        readonly ICatalogoService catalogoService;
        readonly IUsuarioService usuarioService;
		
		public FirmaMapper(IRepository<Firma> repository,
            ICatalogoService catalogoService,
            IUsuarioService usuarioService)
			: base(repository)
        {
			this.catalogoService = catalogoService;
            this.usuarioService = usuarioService;
        }
		
        protected override int GetIdFromMessage(FirmaForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(FirmaForm message, Firma model)
        {
            model.TipoProducto = message.TipoProducto;
		    model.Firma1 = message.Firma1.FromShortDateToDateTime();
		    model.Aceptacion1 = message.Aceptacion1;
		    model.Firma2 = message.Firma2.FromShortDateToDateTime();
		    model.Aceptacion2 = message.Aceptacion2;
		    model.Firma3 = message.Firma3.FromShortDateToDateTime();
		    model.Aceptacion3 = message.Aceptacion3;

            model.Usuario1 = usuarioService.GetUsuarioById(message.Usuario1);
            model.Usuario2 = usuarioService.GetUsuarioById(message.Usuario2);
            model.Usuario3 = usuarioService.GetUsuarioById(message.Usuario3);
			
			if (model.IsTransient())
            {
                model.Activo = true;
                model.CreadorEl = DateTime.Now;
            }

            model.ModificadoEl = DateTime.Now;
        }
    }
}
