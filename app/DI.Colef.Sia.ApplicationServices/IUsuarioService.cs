﻿using DecisionesInteligentes.Colef.Sia.Core;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public interface IUsuarioService
    {
        //Roles
        Rol GetRolById(int id);
        Rol[] GetAllRoles();
        void SaveRol(Rol rol);
        Rol[] GetActiveRoles();

        //Telefonos
        Telefono GetTelefonoById(int id);
        Telefono[] GetAllTelefonos();
        void SaveTelefono(Telefono telefono);
        Telefono[] GetActiveTelefonos();

        //Usuario
        Usuario[] GetAllUsuarios();
        Usuario GetUsuarioById(int id);
        Usuario GetUsuarioByUserName(string username);
        void SaveUsuario(Usuario usuario);

        Investigador GetInvestigadorByUsuario(Usuario usuario);
    }
}
