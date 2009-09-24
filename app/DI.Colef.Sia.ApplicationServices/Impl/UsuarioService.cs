using System;
using System.Collections.Generic;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.ApplicationServices
{
    public class UsuarioService : IUsuarioService
    {
        readonly IRepository<Rol> rolRepository;
        readonly IRepository<Usuario> usuarioRepository;
        readonly IInvestigadorQuerying investigadorQuerying;

        public UsuarioService(IRepository<Rol> rolRepository, 
            IRepository<Usuario> usuarioRepository,
            IInvestigadorQuerying investigadorQuerying)
        {
            this.rolRepository = rolRepository;
            this.usuarioRepository = usuarioRepository;
            this.investigadorQuerying = investigadorQuerying;
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

        public Rol[] GetActiveRoles()
        {
            return ((List<Rol>)rolRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public Usuario[] GetAllUsuarios()
        {
            return ((List<Usuario>)usuarioRepository.GetAll()).ToArray();
        }

        public Usuario GetUsuarioById(int id)
        {
            return usuarioRepository.Get(id);
        }

        public Usuario GetUsuarioByUserName(string username)
        {
            var parameters = new Dictionary<string, object> {{"UsuarioNombre", username}};

            return usuarioRepository.FindOne(parameters);   
        }

        public void SaveUsuario(Usuario usuario)
        {
            usuarioRepository.SaveOrUpdate(usuario);
        }

        public Investigador GetInvestigadorByUsuario(Usuario usuario)
        {
            return investigadorQuerying.FindInvestigadorByUsuario(usuario);
        }
    }
}