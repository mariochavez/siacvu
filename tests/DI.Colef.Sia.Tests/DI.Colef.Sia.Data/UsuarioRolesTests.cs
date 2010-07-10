using System.Linq;
using DecisionesInteligentes.Colef.Sia.ApplicationServices;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using Machine.Specifications;
using SharpArch.Data.NHibernate;

namespace Tests.DI.Colef.Sia.Data
{
    [Subject(typeof(Usuario))]
    public class when_query_user_1_it_should_have_roles : ConnectionSetup
    {
        static IUsuarioService usuarioService;
        static Usuario usuario;

        Establish context = () =>
                                        {
                                            usuarioService = new UsuarioService(new Repository<Rol>(),
                                                                                new Repository<Telefono>(),
                                                                                new Repository<CorreoElectronico>(),
                                                                                new Repository<Direccion>(),
                                                                                new Repository<Usuario>(),
                                                                                new InvestigadorQuerying());
                                        };

        Because of = () =>
                                 {
                                     usuario = usuarioService.GetUsuarioById(1);
                                 };

        It should_have_roles = () =>
                                           {
                                               usuario.Roles.Count().ShouldBeGreaterThan(1);
                                           };
    }

    [Subject(typeof(Usuario))]
    public class when_user_has_a_new_rol : ConnectionSetup
    {
        static IUsuarioService usuarioService;
        static Usuario usuario;
        static Rol rol;

        Establish context = () =>
        {
            usuarioService = new UsuarioService(new Repository<Rol>(),
                                                new Repository<Telefono>(),
                                                new Repository<CorreoElectronico>(),
                                                new Repository<Direccion>(),
                                                new Repository<Usuario>(),
                                                new InvestigadorQuerying());

            usuario = usuarioService.GetUsuarioById(1);
            rol = usuarioService.GetRolById(3);
        };

        Because of = () =>
        {
            usuario.AddRole(rol);
            usuarioService.SaveUsuario(usuario);
            usuario = null;
            usuario = usuarioService.GetUsuarioById(1);

            //rol.AddUsuario(usuario);
            //usuarioService.SaveRol(rol);
            //usuario = null;
            //usuario = usuarioService.GetUsuarioById(1);
        };

        private It should_have_several_roles = () =>
                                                   {
                                                       usuario.Roles.Count.ShouldBeGreaterThan(1);
                                                   };
    }
}
