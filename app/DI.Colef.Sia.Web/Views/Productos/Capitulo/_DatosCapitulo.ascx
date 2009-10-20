<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
	<label>Posici&oacute;n del autor</label>
    <%=Html.TextBox("PosicionAutor", Model.PosicionAutor, new { @class = "input100", maxlength = 3 })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("PosicionAutor")%>
</p>
<p>
    <label></label>
    <%= Html.CheckBox("TieneProyecto", Model.TieneProyecto) %> Tiene proyecto de investigaci&oacute;n de referencia?
</p>
<p id="tieneproyecto_field">
    <label>Nombre del proyecto de investigaci&oacute;n</label>
    <%=Html.TextBox("ProyectoNombre", Model.ProyectoNombre,
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Proyecto"), maxlength = 100 })%>
    <%=Html.Hidden("ProyectoId", Model.ProyectoId, new { rel = "#ProyectoNombre" })%>
    <%=Html.ValidationMessage("ProyectoNombre")%>
</p>
<p id="notieneproyecto_field">
    <label>&Aacute;rea tem&aacute;tica</label>
    <%=Html.DropDownList("AreaTematica", Model.AreasTematicas.CreateSelectList<AreaTematicaForm>("Id", "Nombre"),
                        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("AreaTematica")%>    
</p>
<p>
    <label>Estatus actual</label>
    <%=Html.DropDownList("EstadoProducto", Model.EstadosProductos.CreateSelectList<EstadoProductoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("EstadoProducto")%>
</p>
<p id="EstatusAceptado">
    <label>Fecha de aceptaci&oacute;n</label>
    <%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaAceptacion")%>
</p>
<p class="EstatusPublicado">
    <label>Fecha de publicaci&oacute;n</label>
    <%=Html.TextBox("FechaPublicacion", Model.FechaPublicacion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaPublicacion")%>
</p>