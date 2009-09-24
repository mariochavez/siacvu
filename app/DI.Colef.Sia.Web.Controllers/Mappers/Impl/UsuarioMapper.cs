using System;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Models;
using DecisionesInteligentes.Colef.Sia.Web.Extensions;
using SharpArch.Core.PersistenceSupport;

namespace DecisionesInteligentes.Colef.Sia.Web.Controllers.Mappers
{
    public class UsuarioMapper : AutoFormMapper<Usuario, UsuarioForm>, IUsuarioMapper
    {
        readonly IRolMapper rolMapper;

        public UsuarioMapper(IRepository<Usuario> repository, IRolMapper rolMapper) : base(repository)
        {
            this.rolMapper = rolMapper;
        }

        protected override int GetIdFromMessage(UsuarioForm message)
        {
            return message.Id;
        }

        protected override void MapToModel(UsuarioForm message, Usuario model)
        {
            //
            model.Nombre = message.Nombre;
            model.ApellidoPaterno = message.ApellidoPaterno;
            model.ApellidoMaterno = message.ApellidoMaterno;
            model.UsuarioNombre = message.UsuarioNombre;
            //model.Clave = message.Clave;
            model.Direccion = message.Direccion;
            model.Telefono = message.Telefono;
            model.CorreoElectronico = message.CorreoElectronico;
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

            if (message.Rol != null)
                model.AddRole(rolMapper.Map(message.Rol));
        }

        public Usuario Map(UsuarioForm message, Usuario usuario)
        {
            var model = Map(message);

            if (model.IsTransient())
            {
                model.Roles[0].CreadorPor = usuario;
            }

            return model;
        }
    }
}
