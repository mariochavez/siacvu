using System;
using System.Reflection;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using Machine.Specifications;
using Rhino.Mocks;
using Tests.Extensions;

namespace Tests.DI.Colef.Sia.Data
{
    [Subject(typeof(ProductoQuerying))]
    public class when_bandeja_investigador_is_loaded : ConnectionSetup
    {
        static IProductoQuerying productoQuerying;
        static ProductoDTO[] productosDto;

        Because of = () =>
            {
                Usuario usuario = MockRepository.GenerateStub<Usuario>();
                Type userType = typeof(Usuario);
                PropertyInfo pi = userType.GetProperty("Id");
                pi.SetValue(usuario, 3, null);

                productoQuerying = new ProductoQuerying();
                productosDto = productoQuerying.GetProductosBandeja(usuario);
            };

        It should_found_3_products = () =>
            {
                productosDto.ShouldNotBeEmpty();
                productosDto.Length.ShouldEqual(3);
            };
    }
}
