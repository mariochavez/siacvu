using System;
using DecisionesInteligentes.Colef.Sia.Core;
using Machine.Specifications;

namespace Tests.DI.Colef.Sia.Core
{
    [Subject("Entity Helper")]
    public class when_try_to_get_coautointerno_table_from_articulo_entity
    {
        protected static string tableName = String.Empty;

        Because of = () =>
                                 {
                                     tableName = EntityHelper.GetCoautorTable<Articulo>();
                                 };

        It should_not_be_empty = () => tableName.ShouldNotEqual(String.Empty);
        It should_be_coautointernoarticulos = () => tableName.ShouldEqual("CoautorInternoArticulos");
    }

    [Subject("Entity Helper")]
    public class when_try_to_get_tipoproducto_from_articulodifusion_entity
    {
        protected static int tipoProducto;

        Because of = () =>
        {
            tipoProducto = (int) EntityHelper.GetTipoProducto<ArticuloDifusion>();
        };

        It should_be_16 = () => tipoProducto.ShouldEqual(16);
    }

    [Subject("Entity Helper")]
    public class when_ask_if_evento_has_revista
    {
        protected static bool hasRevista;

        Because of = () =>
        {
            hasRevista = EntityHelper.HasRevista<Evento>();
        };

        It should_be_false = () => hasRevista.ShouldEqual(false);
    }

    [Subject("Entity Helper")]
    public class when_ask_if_articulo_has_revista
    {
        protected static bool hasRevista;

        Because of = () =>
        {
            hasRevista = EntityHelper.HasRevista<Articulo>();
        };

        It should_be_true = () => hasRevista.ShouldEqual(true);
    }
}
