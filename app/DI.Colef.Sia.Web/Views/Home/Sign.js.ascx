<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
<p>
    <span>
        <%=Html.ActionLink("Ver", "Show", new { id = Model.Id, tipoProducto = Model.Id })%>
    </span>
</p>
';

$('#accion_<%=Html.Encode(Model.Id)%> .elementobotones').html('');
$('#accion_<%=Html.Encode(Model.Id)%> .elementobotones').html(html);
$('#accion_<%=Html.Encode(Model.Id)%> .elementobotones a').removeLoading();
showMessage('Producto ha sido firmado enviado a firma');
