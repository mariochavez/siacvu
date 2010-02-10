using System;
using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.Core;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers;
using Machine.Specifications;
using Rhino.Mocks;

namespace Tests.DI.Colef.Sia.Web.Helpers
{
    public class mock_htmlhelper
    {
        protected static HtmlHelper htmlHelper = null;

        Establish context = () =>
                                {
                                    var viewContext = MockRepository.GenerateStub<ViewContext>();
                                    var viewDataContainer = MockRepository.GenerateStub<IViewDataContainer>();
                                    htmlHelper =
                                        MockRepository.GenerateStub<HtmlHelper>(viewContext, viewDataContainer);
                                };
    }

    [Subject("View Helpers")]
    public class when_humanize_edit_articulo_product_title : mock_htmlhelper
    {
        static TipoProductoEnum tipoProducto = TipoProductoEnum.Articulo;
        static string title = string.Empty;

        private static string expectedTitle = "Modificar Artículo en revista de investigación";

        Because of = () =>
        {
            title = ProductoHelper.ProductoEditTitle(htmlHelper, tipoProducto);
        };

        It should_be_same_as_expected_title = () =>
        {
            title.ShouldEqual(expectedTitle);
        };
    }

    [Subject("View Helpers")]
    public class when_humanize_list_articulos_product_title : mock_htmlhelper
    {
        static TipoProductoEnum tipoProducto = TipoProductoEnum.Articulo;
        static string title = String.Empty;

        static string expectedTitle = "Administración de Artículos en revistas de investigación";

        Because of = () =>
        {
            title = ProductoHelper.ProductoListTitle(htmlHelper, tipoProducto);
        };
        It should_be_same_as_expected_title = () =>
        {
            title.ShouldEqual(expectedTitle);
        };
    }

    [Subject("View Helpers")]
    public class when_humanize_new_articulo_produt_title : mock_htmlhelper
    {
        static TipoProductoEnum tipoProducto = TipoProductoEnum.Articulo;
        static string title = String.Empty;

        static string expectedTitle = "Registrar Artículo en revista de investigación";

        Because of = () =>
                         {
                             title = ProductoHelper.ProductoNewTitle(htmlHelper, tipoProducto);
                         };

        It should_be_same_as_expected_title = () =>
                                                 {
                                                     title.ShouldEqual(expectedTitle);
                                                 };
    }

    [Subject("View Helpers")]
    public class when_humanize_show_articulo_product_title : mock_htmlhelper
    {
        static TipoProductoEnum tipoProducto = TipoProductoEnum.Articulo;
        static string title = string.Empty;

        private static string expectedTitle = "Consulta de Artículo en revista de investigación";

        Because of = () =>
        {
            title = ProductoHelper.ProductoShowTitle(htmlHelper, tipoProducto);
        };

        It should_be_same_as_expected_title = () =>
        {
            title.ShouldEqual(expectedTitle);
        };
    }

    [Subject("View Helpers")]
    public class when_humanize_list_articulo_product_subtitle : mock_htmlhelper
    {
        static TipoProductoEnum tipoProducto = TipoProductoEnum.Articulo;
        static string subTitle = String.Empty;

        static string expectedSubTitle = "Agregar Artículos en revistas de investigación";

        Because of = () =>
        {
            subTitle = ProductoHelper.ProductoListSubTitle(htmlHelper, tipoProducto);
        };

        It should_be_same_as_expected_SubTitle = () =>
        {
            subTitle.ShouldEqual(expectedSubTitle);
        };
    }

    [Subject("View Helpers")]
    public class when_humanize_edit_articulo_product_message : mock_htmlhelper
    {
        private static TipoProductoEnum tipoProducto = TipoProductoEnum.Articulo;
        private static string message = String.Empty;

        private static string expectedMessage = "Para modificar el Artículo en revista de investigación utilice los siguientes campos para realizar cambios dentro del sistema.";

        private Because of = () =>
                                 {
                                     message = ProductoHelper.ProductoEditMessage(htmlHelper, tipoProducto);
                                 };

        private It should_be_same_as_expected_message = () =>
                                                            {
                                                                message.ShouldEqual(expectedMessage);
                                                            };

    }

    [Subject("View Helpers")]
    public class when_humanize_list_articulos_product_message : mock_htmlhelper
    {
        private static TipoProductoEnum tipoProducto = TipoProductoEnum.Articulo;
        private static string message = String.Empty;

        private static string expectedMessage = "Puede agregar un Artículo en revista de investigación, presionando en el botón de título + Nuevo.";

        private Because of = () =>
                                 {
                                     message = ProductoHelper.ProductoListMessage(htmlHelper, tipoProducto);
                                 };

        private It should_be_same_as_expected_message = () =>
                                                            {
                                                                message.ShouldEqual(expectedMessage);
                                                            };
    }

    [Subject("View Helpers")]
    public class when_humanize_new_articulo_produt_message : mock_htmlhelper
    {
        private static TipoProductoEnum tipoProducto = TipoProductoEnum.Articulo;
        private static string message = String.Empty;

        private static string expectedMessage = "Favor de llenar los siguientes campos para registrar un nuevo Artículo en revista de investigación dentro del sistema. ";

        private Because of = () =>
                                 {
                                     message = ProductoHelper.ProductoNewMessage(htmlHelper, tipoProducto);
                                 };

        private It should_be_same_as_expected_message = () =>
                                                            {
                                                                message.ShouldEqual(expectedMessage);
                                                            };
    }

    [Subject("View Helpers")]
    public class when_humanize_show_articulo_product_message : mock_htmlhelper
    {
        private static TipoProductoEnum tipoProducto = TipoProductoEnum.Articulo;
        private static string message = String.Empty;

        private static string expectedMessage = "Aquí se muestra la información detallada de el Artículo en revista de investigación como está en el sistema.";

        private Because of = () =>
        {
            message = ProductoHelper.ProductoShowMessage(htmlHelper, tipoProducto);
        };

        private It should_be_same_as_expected_message = () =>
        {
            message.ShouldEqual(expectedMessage);
        };
    }
}
