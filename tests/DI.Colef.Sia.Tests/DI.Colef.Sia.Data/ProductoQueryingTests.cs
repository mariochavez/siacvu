using System;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Core.DataInterfaces;
using Machine.Specifications;
using NHibernate;
using NHibernate.Criterion;
using SharpArch.Data.NHibernate;

namespace Tests.DI.Colef.Sia.Data
{
    [Subject(typeof(ProductoQuerying))]
    public class when_bandeja_investigador_is_loaded : ConnectionSetup
    {
        static IProductoQuerying productoQuerying;
        static object[] productosDto;

        Because of = () =>
            {
                Rol rol = new Rol(); //MockRepository.GenerateStub<Rol>();
                Type rolType = typeof(Rol);
                PropertyInfo pi = rolType.GetProperty("Id");
                pi.SetValue(rol, 1, null);
                rol.Nombre = "Investigador";

                Usuario usuario = new Usuario(); //MockRepository.GenerateStub<Usuario>();
                Type userType = typeof(Usuario);
                pi = userType.GetProperty("Id");
                pi.SetValue(usuario, 3, null);

                pi = userType.GetProperty("Roles");
                IList<Rol> roles = new List<Rol> {rol};
                pi.SetValue(usuario, roles, null);

                productoQuerying = new ProductoQuerying();
                productosDto = productoQuerying.GetBandejaProductos(usuario, TipoBandeja.WorkInProgress);
            };

        It should_return_products = () =>
            {
                productosDto.ShouldNotBeEmpty();
                productosDto.Length.ShouldEqual(4);
            };

        It should_found_4_products_of_produccion_academica = () =>
            {
                
                var produccionAcademica = ((ArrayList)productosDto[0]).ToArray(typeof (ProductoDTO));
                produccionAcademica.Length.ShouldEqual(3);
            };

        It should_found_1_product_of_vinculacion_difusion = () =>
            {
                var produccionAcademica =
                    ((ArrayList) productosDto[3]).ToArray(
                        typeof (ProductoDTO));
                produccionAcademica.Length.ShouldEqual(1);
            };
    }

    [Subject(typeof(ProductoQuerying))]
    public class when_testing_NH_projections : ConnectionSetup
    {
        static IProjection projection;
        static ICriteria criteria;
        static IList<DataDTO> data;

        Because of = () =>
                         {
                             projection = Projections.Distinct(
                                 Projections.ProjectionList()
                                     .Add(Projections.Property("u.Nombre"),
                                          "UsuarioNombre")
                                     .Add(Projections.Property("u.ApellidoPaterno"),
                                          "UsuarioApellidoPaterno")
                                     .Add(Projections.Property("u.ApellidoMaterno"),
                                          "UsuarioApellidoMaterno")
                                     .Add(Projections.Property("Id"), "Id"));

                             criteria = NHibernateSession.Current.CreateCriteria(typeof (Articulo))
                                 .CreateAlias("Usuario", "u")
                                 .Add(Expression.Eq("u.Id", 3))
                                 .SetProjection(projection)
                                 .SetResultTransformer(NHibernate.Transform.Transformers.AliasToBean(typeof (DataDTO)));

                             data = criteria.List<DataDTO>();
                         };

        It should_have_data = () =>
                                  {
                                      data.ShouldNotBeEmpty();
                                  };
        
    }

    public class DataDTO
    {
        public int Id { get; set; }
        public string UsuarioNombre { get; set; }
        public string UsuarioApellidoPaterno { get; set; }
        public string UsuarioApellidoMaterno { get; set; }
    }
}
