using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface IAuthenticationService
    {
        Usuario Authenticate(string username, string password);
    }
}