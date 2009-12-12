<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<HomeForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
<p>
    <span>
        <%=Html.ActionLink("Ver", "Show", new { id = Model.IdProducto, tipoProducto = Model.TipoProducto })%>
    </span>
</p>
';

$('#accion_<%=Html.Encode(Model.GuidNumber)%><%=Html.Encode(Model.IdProducto)%><%=Html.Encode(Model.TipoProducto)%> .elementobotones').html('');
$('#accion_<%=Html.Encode(Model.GuidNumber)%><%=Html.Encode(Model.IdProducto)%><%=Html.Encode(Model.TipoProducto)%> .elementobotones').html(html);
$('#accion_<%=Html.Encode(Model.GuidNumber)%><%=Html.Encode(Model.IdProducto)%><%=Html.Encode(Model.TipoProducto)%> .elementobotones a').removeLoading();
showMessage('Producto <%=Html.Encode(Model.NombreProducto) %> ha sido firmado enviado a firma');
