using System;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface IUsuarioService
    {
        //Roles
        Rol GetRolById(int id);
        Rol[] GetAllRoles();
        void SaveRol(Rol rol);

        //Persona
        Persona GetPersonaById(int id);

        //Usuario
        Usuario GetUsuarioById(int id);
        Usuario GetUsuarioByUserName(string username);
    }
}
