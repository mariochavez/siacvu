<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<HomeForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers" %>

var html = '
<p>
    <span>
        <%=Html.ActionLinkForAreas<HomeController>(x => x.Show(Model.IdProducto , Model.TipoProducto), "Ver")%>
    </span>
</p>
';

$('#accion_<%=Html.Encode(Model.IdProducto)%>_<%=Html.Encode(Model.TipoProducto)%> .elementobotones').html(html);
$('#accion_<%=Html.Encode(Model.IdProducto)%>_<%=Html.Encode(Model.TipoProducto)%> .elementobotones a').removeLoading();
showMessage('El <%=HumanizeHelper.GetNombreProducto(Model.TipoProducto) %> <%=Html.Encode(Model.NombreProducto) %> ha sido enviado a firma');
$('#accion_<%=Html.Encode(Model.IdProducto)%>_<%=Html.Encode(Model.TipoProducto)%> div.elementodescripcion h6 span').html('trabajo firmado en proceso de validaci&oacute;n');

$('#accion_<%=Html.Encode(Model.IdProducto)%>_<%=Html.Encode(Model.TipoProducto)%>').effect("highlight", {}, 3000);

