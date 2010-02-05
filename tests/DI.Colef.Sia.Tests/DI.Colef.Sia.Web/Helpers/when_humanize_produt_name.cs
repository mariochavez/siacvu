using System;
using System.Web.Mvc;
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
    public class when_humanize_articulo_produt_name : mock_htmlhelper
    {
        static int tipoProducto = 1;
        static string title = String.Empty;

        static string expectedTitle = "Registrar Artículo en revista de investigación";

        Because of = () =>
                         {
                             title = ProductoHelper.ProductoNewTitle(htmlHelper, tipoProducto);
                         };

        It should_be_same_as_expectd_title = () =>
                                                 {
                                                     title.ShouldEqual(expectedTitle);
                                                 };
    }
}
