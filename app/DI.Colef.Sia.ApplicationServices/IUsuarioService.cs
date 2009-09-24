using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface IUsuarioService
    {
        //Roles
        Rol GetRolById(int id);
        Rol[] GetAllRoles();
        void SaveRol(Rol rol);
        Rol[] GetActiveRoles();

        //Usuario
        Usuario[] GetAllUsuarios();
        Usuario GetUsuarioById(int id);
        Usuario GetUsuarioByUserName(string username);
        void SaveUsuario(Usuario usuario);

        Investigador GetInvestigadorByUsuario(Usuario usuario);
    }
}
