<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProductoGeneradoProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter = $('#productogeneradoList div[id^=productogenerado_]').length;

var html = '
    <div class="sublista" id="productogenerado_<%=Html.Encode(Model.Id) %>">
        <h6>
            <a href="<%=Url.Action("DeleteProducto", null, new{ id = Model.ParentId, productoGeneradoId = Model.Id}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=HumanizeHelper.ProductoGenerado(Model.ProductoGenerado)%>
            <%=Html.Hidden("ProductoGenerado['  + counter + '].ProductoGenerado", Model.ProductoGenerado)%>
            <span>
                Fecha de entrega <%=Html.Encode(Model.FechaEntrega)%>
                <%=Html.Hidden("ProductoGenerado['  + counter + '].FechaEntrega", Model.FechaEntrega.Replace("/", "_"))%>
            </span>
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#productogeneradoForm').hide();
$('#productogeneradoNew').show();
$('#productogeneradoForm').html('');

$('#productogeneradoEmptyListForm').html('');
$('#productogeneradoList div:first').before(html);

$('#productogenerado_<%=Html.Encode(Model.Id)%>:first').hide();
$('#productogenerado_<%=Html.Encode(Model.Id)%>:first').fadeIn('slow');

setupSublistRows();