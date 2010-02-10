using System.Web.Mvc;
using DecisionesInteligentes.Colef.Sia.Web.Controllers;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Catalogos;
using DecisionesInteligentes.Colef.Sia.Web.Controllers.Productos;
using Machine.Specifications;
using MvcContrib.TestHelper;
using System.Web.Routing;
using Rhino.Mocks;

namespace Tests.DI.Colef.Sia.Controllers
{
    public class setup_routes
    {
        Establish context = () =>
                                {
                                    RouteTable.Routes.Clear();
                                    RouteRegistrar.RegisterRoutesTo(RouteTable.Routes);
                                };
    }
    
    public class mock_htmlhelper : setup_routes
    {
        protected static HtmlHelper htmlHelper = null;

        Establish context = () =>
                                {
                                    var viewContext = MockRepository.GenerateStub<ViewContext>();
                                    var viewDataContainer = MockRepository.GenerateStub<IViewDataContainer>();
                                    htmlHelper = new HtmlHelper(viewContext, viewDataContainer, RouteTable.Routes);
                                };
    }

    [Subject("Routes")]
    public class when_navigating_to_home_page : setup_routes
    {
        It should_map_to_home = () =>
                                    {
                                        "~/".Route().ShouldMapTo<HomeController>(x => x.Index());
                                    };

        It should_map_to_edit = () =>
        {
            "~/Home/1/edit/1".Route().ShouldMapTo<HomeController>(x => x.Edit(1, 1));
        };

        It should_map_to_sign = () =>
        {
            "~/Home/1/sign/1".Route().ShouldMapTo<HomeController>(x => x.Sign(1, 1));
        };

        It should_map_to_index = () =>
        {
            "~/Home/index".Route().ShouldMapTo<HomeController>(x => x.Index());
        };
    }

    [Subject("Routes")]
    public class when_navigating_to_productos_page : setup_routes
    {
        It should_map_to_articulo_index = () =>
        {
            "~/Productos/Articulo".Route().ShouldMapTo<ArticuloController>(x => x.Index());
        };

        It should_map_to_articulo_show = () =>
        {
            "~/Productos/Articulo/1/show".Route().ShouldMapTo<ArticuloController>(x => x.Show(1));
        };

        It should_map_to_articulo_edit = () =>
        {
            "~/Productos/Articulo/1/edit".Route().ShouldMapTo<ArticuloController>(x => x.Edit(1));
        };

        It should_map_to_articulo_new = () =>
        {
            "~/Productos/Articulo/new".Route().ShouldMapTo<ArticuloController>(x => x.New());
        };
    }

    [Subject("Routes")]
    public class when_navigating_to_catalogos_page : setup_routes
    {
        It should_map_to_institucion_index = () =>
        {
            "~/Catalogos/Institucion".Route().ShouldMapTo<InstitucionController>(x => x.Index());
        };

        It should_map_to_institucion_show = () =>
        {
            "~/Catalogos/Institucion/1/show".Route().ShouldMapTo<InstitucionController>(x => x.Show(1));
        };

        It should_map_to_institucion_edit = () =>
        {
            "~/Catalogos/Institucion/1/edit".Route().ShouldMapTo<InstitucionController>(x => x.Edit(1));
        };

        It should_map_to_institucion_new = () =>
        {
            "~/Catalogos/Institucion/new".Route().ShouldMapTo<InstitucionController>(x => x.New());
        };
    }
}
