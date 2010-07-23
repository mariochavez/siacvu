using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using Machine.Specifications;
using Tests.Extensions;

namespace Tests.DI.Colef.Sia.Data
{
    [Subject(typeof(UsuarioQuerying))]
    public class UsuarioQueryingTests : ConnectionSetup
    {
        static IUsuarioQuerying usuarioQuerying;
        static Usuario[] usuarios;

        Because of = () =>
            {
                usuarioQuerying = new UsuarioQuerying();
                usuarios = usuarioQuerying.FindUsuariosToBeInvestigador();
            };

        It should_found_one_user = () =>
            {
                usuarios.ShouldNotBeEmpty();
                usuarios.Length.ShouldEqual(1);
            };
    }

    [Subject(typeof(InvestigadorQuerying))]
    public class InvestigadorQueryingTests : ConnectionSetup
    {
        //static IInvestigadorQuerying investigadorQuerying;
        //static Investigador[] investigadores;

        //Because of = () =>
        //{
        //    investigadorQuerying = new InvestigadorQuerying();
        //    //investigadores = investigadorQuerying.FindUsuariosToBeInvestigador();
        //};

        //It should_found_one_user = () =>
        //{
        //    investigadores.ShouldNotBeEmpty();
        //    investigadores.Length.ShouldBeGreaterThan(1);
        //};
    }
}
