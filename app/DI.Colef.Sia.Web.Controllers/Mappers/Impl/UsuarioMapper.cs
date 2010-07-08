using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class UsuarioMapper : AutoFormMapper<Usuario, UsuarioForm>, IUsuarioMapper
    {
        readonly IRolMapper rolMapper;
        readonly ITelefonoMapper telefonoMapper;
        readonly ICorreoElectronicoMapper correoElectronicoMapper;
        private readonly IDireccionMapper direccionMapper;

        public UsuarioMapper(IRepository<Usuario> repository, IRolMapper rolMapper, 
            ITelefonoMapper telefonoMapper, ICorreoElectronicoMapper correoElectronicoMapper, IDireccionMapper direccionMapper) 
            : base(repository)
        {
            this.rolMapper = rolMapper;
            this.telefonoMapper = telefonoMapper;
            this.correoElectronicoMapper = correoElectronicoMapper;
            this.direccionMapper = direccionMapper;
        }

        protected override int GetIdFromMessage(UsuarioForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(UsuarioForm message, Usuario model)
        {
            model.Nombre = message.Nombre;
            model.ApellidoPaterno = message.ApellidoPaterno;
            model.ApellidoMaterno = message.ApellidoMaterno;
            model.UsuarioNombre = message.UsuarioNombre;
            model.EstadoCivil = message.EstadoCivil;
            model.Sexo = message.Sexo;
            model.DocumentosIdentidad = message.DocumentosIdentidad;
            model.CURP = message.CURP;
            model.RFC = message.RFC;
            model.CedulaProfesional = message.CedulaProfesional;
            model.Nacionalidad = message.Nacionalidad;
            model.CodigoRH = message.CodigoRH;
            model.FechaNacimiento = message.FechaNacimiento.FromShortDateToDateTime();
            model.FechaIngreso = message.FechaIngreso.FromShortDateToDateTime();
            model.Investigador = message.Investigador;
            model.Activo = message.Activo;

            if (message.Direccion != null)
            {
                var direccion = direccionMapper.Map(message.Direccion);

                if (model.Direcciones.Count > 0)
                    model.Direcciones[0] = direccion;
                model.AddDireccion(direccion);
            }

            if (message.Rol != null)
                model.AddRole(rolMapper.Map(message.Rol));

            if (message.Telefono != null)
                model.AddTelefono(telefonoMapper.Map(message.Telefono));

            if(message.CorreoElectronico != null)
                model.AddCorreoElectronico(correoElectronicoMapper.Map(message.CorreoElectronico));
        }

        public Usuario Map(UsuarioForm message, Usuario usuario)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Roles[0].CreadoPor = usuario;
                model.Telefonos[0].CreadoPor = usuario;
                model.CorreosElectronicos[0].CreadoPor = usuario;
                model.Direcciones[0].CreadoPor = usuario;
            }

            return model;
        }
    }
}
