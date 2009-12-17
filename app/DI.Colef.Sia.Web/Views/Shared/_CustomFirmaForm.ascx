<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<FirmaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<% using (Html.BeginForm("DgaaSign", Model.Controller, FormMethod.Post, new { id = "firmaform" })){ %>
    <%=Html.Hidden("ProductoId", Model.Id)%>
    <%=Html.Hidden("TipoProducto", Model.TipoProducto)%>
    <p>Para confirmar que el contenido del producto es v&aacute;lido, indique la puntuaci&oacute;n y presione el 
    bot&oacute;n con la leyenda <strong>Validar</strong></p>
    <p>
        <%=Html.TextBox("PuntuacionSieva", 0.00, new { @class = "input100-requerido" })%>
    </p>
    <div class="minilistaboton">
        <p><span><%=Html.ActionLink("Validar", "DgaaValidateProduct", null, new { @class = "remoteform", rel = "#firmaform" })%></span></p>
    </div>

    <p>Para rechazar el contenido del producto indique el motivo del rechazo y presione el bot&oacute;n con la
    leyenda <strong>Rechazar</strong></p>
    <p>
        <%=Html.TextArea("Descripcion", "",5, 35, new { @class = "input250-requerido" })%>
    </p>
    <div class="minilistaboton">
        <p><span><%=Html.ActionLink("Rechazar", "DgaaRejectProduct", null, new { @class = "remoteform", rel = "#firmaform" })%></span></p>
    </div>
<% } %>