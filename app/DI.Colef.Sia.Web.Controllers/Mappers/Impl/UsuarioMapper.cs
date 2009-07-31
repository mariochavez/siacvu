using System;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class UsuarioMapper : AutoFormMapper<Usuario, UsuarioForm>, IUsuarioMapper
    {
        public UsuarioMapper(IRepository<Usuario> repository) : base(repository)
        {
        }

        protected override int GetIdFromMessage(UsuarioForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(UsuarioForm message, Usuario model)
        {
            //
        }
    }
}
