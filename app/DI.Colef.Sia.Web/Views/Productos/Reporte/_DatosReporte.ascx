<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ReporteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>Posici&oacute;n del autor</label>
    <%=Html.TextBox("PosicionAutor", Model.PosicionAutor, new { @class = "input100", maxlength = 3 })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("PosicionAutor")%>
</p>
<p>
	<label>Estatus de la publicaci&oacute;n</label>
	<%=Html.DropDownList("EstadoProducto", Model.EstadosProductos.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("EstadoProducto") %>
</p>
<p id="EstatusAceptado">
    <label>Fecha de aceptaci&oacute;n</label>
    <%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaAceptacion")%>
</p>
<p id="EstatusPublicado">
    <label>Fecha de publicaci&oacute;n</label>
    <%=Html.TextBox("FechaPublicacion", Model.FechaPublicacion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaPublicacion")%>
</p>