using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class UsuarioService : IUsuarioService
    {
        readonly IRepository<Rol> rolRepository;
        readonly IRepository<Persona> personaRepository;
        readonly IRepository<Usuario> usuarioRepository;

        public UsuarioService(IRepository<Rol> rolRepository, IRepository<Persona> personaRepository, IRepository<Usuario> usuarioRepository)
        {
            this.rolRepository = rolRepository;
            this.personaRepository = personaRepository;
            this.usuarioRepository = usuarioRepository;
        }

        public Rol GetRolById(int id)
        {
            return rolRepository.Get(id);
        }

        public Rol[] GetAllRoles()
        {
            return ((List<Rol>) rolRepository.GetAll()).ToArray();
        }

        public void SaveRol(Rol rol)
        {
            if(rol.Id == 0)
            {
                rol.Activo = true;
                rol.CreadorEl = DateTime.Now;
            }
            rol.ModificadoEl = DateTime.Now;

            rolRepository.SaveOrUpdate(rol);
        }

        public Persona GetPersonaById(int id)
        {
            return personaRepository.Get(id);
        }

        public Usuario GetUsuarioById(int id)
        {
            return usuarioRepository.Get(id);
        }

        public Usuario GetUsuarioByUserName(string username)
        {
            return null;
        }
    }
}