using System;
using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface IUserService
    {
        Rol GetRolById(int id);
        Rol[] GetAllRoles();
        void SaveRol(Rol rol);
    }
}
