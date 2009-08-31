using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class AuthenticationService : IAuthenticationService
    {
        readonly IRepository<Usuario> repositoryUsuario;

        public AuthenticationService(IRepository<Usuario> repositoryUsuario)
        {
            this.repositoryUsuario = repositoryUsuario;
        }

        public Usuario Authenticate(string username, string password)
        {
            var usuario = repositoryUsuario.FindOne(new Dictionary<string, object> {{"UsuarioNombre", username}});
            if (usuario != null && usuario.Clave == password)
                return usuario;

            return null;
        }
    }
}