<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ShowFieldsForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<% if(!Model.IsShowForm){ %>
    <p>
        <label>Estatus de la publicaci&oacute;n</label>
        <%=Html.DropDownList("EstadoProducto", Model.EstadosProductos.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
            "Seleccione ...", new { @class = "requerido" })%>
        <%=Html.ValidationMessage("EstadoProducto")%>
    </p>
    <p id="EstatusAceptado">
        <label>A&ntilde;o de aceptaci&oacute;n</label>
        <%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class = "input100-requerido", maxlength = 4 })%>
        <span>(Formato yyyy)</span>
        <%=Html.ValidationMessage("FechaAceptacion")%>
    </p>
    <p class="EstatusPublicado">
        <label>A&ntilde;o de publicaci&oacute;n</label>
        <%=Html.TextBox("FechaPublicacion", Model.FechaPublicacion, new { @class = "input100-requerido", maxlength = 4 })%>
        <span>(Formato yyyy)</span>
        <%=Html.ValidationMessage("FechaPublicacion")%>
    </p>
<% } else { %>
    <p>
        <label>Estatus de la publicaci&oacute;n</label>
        <span class="valor"><%= HumanizeHelper.EstadoProducto(Model.EstadoProducto)%>&nbsp;</span>
    </p>
    <% if (Model.EstadoProducto == 2) { %>
        <p>
            <label>A&ntilde;o de aceptaci&oacute;n</label>
            <span class="valor"><%= Html.Encode(Model.FechaAceptacion)%>&nbsp;</span>
            <span>Formato (yyyy)</span>
        </p>
    <% } if (Model.EstadoProducto == 3){ %>
        <p>
            <label>A&ntilde;o de publicaci&oacute;n</label>
            <span class="valor"><%= Html.Encode(Model.FechaPublicacion)%>&nbsp;</span>
            <span>Formato (yyyy)</span>
        </p>
    <% } %>
<% } %>