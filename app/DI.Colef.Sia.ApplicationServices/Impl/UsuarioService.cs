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
        readonly IRepository<Telefono> telefonoRepository;
        readonly IRepository<CorreoElectronico> correoElectronicoRepository;
        readonly IRepository<Usuario> usuarioRepository;
        readonly IInvestigadorQuerying investigadorQuerying;

        public UsuarioService(IRepository<Rol> rolRepository, IRepository<Telefono> telefonoRepository, IRepository<CorreoElectronico> correoElectronicoRepository,
            IRepository<Usuario> usuarioRepository,
            IInvestigadorQuerying investigadorQuerying)
        {
            this.rolRepository = rolRepository;
            this.telefonoRepository = telefonoRepository;
            this.correoElectronicoRepository = correoElectronicoRepository;
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
                rol.CreadoEl = DateTime.Now;
            }
            rol.ModificadoEl = DateTime.Now;

            rolRepository.SaveOrUpdate(rol);
        }

        public Rol[] GetActiveRoles()
        {
            return ((List<Rol>)rolRepository.FindAll(new Dictionary<string, object> { { "Activo", true } })).ToArray();
        }

        public Telefono GetTelefonoById(int id)
        {
            return telefonoRepository.Get(id);
        }

        public Telefono[] GetAllTelefonos()
        {
            return ((List<Telefono>) telefonoRepository.GetAll()).ToArray();
        }

        public void SaveTelefono(Telefono telefono)
        {
            if (telefono.Id == 0)
            {
                telefono.Activo = true;
                telefono.CreadoEl = DateTime.Now;
            }

            telefono.ModificadoEl = DateTime.Now;

            telefonoRepository.SaveOrUpdate(telefono);
        }

        public Telefono[] GetActiveTelefonos()
        {
            return
                ((List<Telefono>)telefonoRepository.FindAll(new Dictionary<string, object> {{"Activo", true}})).ToArray();
        }

        public CorreoElectronico GetCorreoElectronicoById(int id)
        {
            return correoElectronicoRepository.Get(id);
        }

        public CorreoElectronico[] GetAllCorreosElectronicos()
        {
            return ((List<CorreoElectronico>) correoElectronicoRepository.GetAll()).ToArray();
        }

        public void SaveCorreoElectronico(CorreoElectronico correoElectronico)
        {
            if (correoElectronico.Id == 0)
            {
                correoElectronico.Activo = true;
                correoElectronico.CreadoEl = DateTime.Now;
            }

            correoElectronico.ModificadoEl = DateTime.Now;

            correoElectronicoRepository.SaveOrUpdate(correoElectronico);
        }

        public CorreoElectronico[] GetActiveCorreosElectronicos()
        {
            return
                ((List<CorreoElectronico>)
                 correoElectronicoRepository.FindAll(new Dictionary<string, object> {{"Activo", true}})).ToArray();
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