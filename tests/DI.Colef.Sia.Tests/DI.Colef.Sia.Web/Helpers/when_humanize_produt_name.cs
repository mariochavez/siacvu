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
    public class when_humanize_new_articulo_produt_name : mock_htmlhelper
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
	public class when_humanize_list_articulos_product_name : mock_htmlhelper
	{
	    static TipoProductoEnum tipoProducto = TipoProductoEnum.Articulo;
		static string title = String.Empty;

        static string expectedTitle = "Administración de Artículos en revista de investigación";
		
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
    public class when_humanize_edit_articulo_product_name : mock_htmlhelper
    {
        static TipoProductoEnum tipoProducto = TipoProductoEnum.Articulo;
        static string title = string.Empty;

        private static string expectedTitle =
            "Para modificar el Artículo en revista de investigación utilice los siguientes campos para realizar cambios dentro del sistema.";

        private Because of = () =>
                                 {
                                     title = ProductoHelper.ProductoEditTitle(htmlHelper, tipoProducto);
                                 };

        private It should_be_same_as_expected_title = () =>
                                                          {
                                                              title.ShouldEqual(expectedTitle);
                                                          };
    }

    [Subject("View Helpers")]
    public class when_humanize_show_articulo_product_name : mock_htmlhelper
    {
        static TipoProductoEnum tipoProducto = TipoProductoEnum.Articulo;
        static string title = string.Empty;

        private static string expectedTitle =
            "Aquí se muestra la información detallada de el Artículo en revista de investigación como está en el sistema.";

        private Because of = () =>
                                 {
                                     title = ProductoHelper.ProductoShowTitle(htmlHelper, tipoProducto);
                                 };

        private It should_be_same_as_expected_title = () =>
                                                          {
                                                              title.ShouldEqual(expectedTitle);
                                                          };
    }
}

