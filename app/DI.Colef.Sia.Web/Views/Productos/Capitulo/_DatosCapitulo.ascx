<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
	<label>Instituci&oacute;n</label>
	<%=Html.TextBox("InstitucionNombre", Model.InstitucionNombre,
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("InstitucionId", Model.InstitucionId, new { rel = "#InstitucionNombre" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("InstitucionNombre")%>
</p>
<p>
	<label>Posici&oacute;n del autor</label>
    <%=Html.TextBox("PosicionAutor", Model.PosicionAutor, new { @class = "input250", maxlength = 5 })%>
	<span class="cvu"></span>
</p>
<p>
    <label>Tiene proyecto de investigaci&oacute;n de referencia</label>
    <%= Html.CheckBox("TieneProyecto", Model.TieneProyecto) %>
    <%=Html.ValidationMessage("TieneProyecto")%>
</p>
<p>
    <label>Proyecto de referencia</label>
    <%=Html.DropDownList("Proyecto", Model.Proyectos.CreateSelectList<ProyectoForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("Proyecto") %>
</p>
<p>
    <label>L&iacute;nea tem&aacute;tica</label>
    <%=Html.TextBox("LineaTematicaNombre", Model.LineaTematicaNombre,
                new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "LineaTematica"), maxlength = 100 })%>
    <%=Html.Hidden("LineaTematicaId", Model.LineaTematicaId, new { rel = "#LineaTematicaNombre" })%>
    <%=Html.ValidationMessage("LineaTematicaNombre")%>
</p>
<p>
    <label>&Aacute;rea tem&aacute;tica</label>
    <%=Html.DropDownList("AreaTematica", Model.AreasTematicas.CreateSelectList<AreaTematicaForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("AreaTematica")%>
</p>
<p>
    <label>Estatus de la publicaci&oacute;n</label>
    <%=Html.DropDownList("EstadoProducto", Model.EstadosProductos.CreateSelectList<EstadoProductoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("EstadoProducto")%>
</p>
<p>
    <label>Fecha de aceptaci&oacute;n</label>
    <%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class = "input100-requerido", maxlength = 4 })%>
    <span class="cvu"></span>
    <span>(Formato yyyy)</span>
    <%=Html.ValidationMessage("FechaAceptacion")%>
</p>
<p>
    <label>Fecha de publicaci&oacute;n</label>
    <%=Html.TextBox("FechaEdicion", Model.FechaEdicion, new { @class = "input100-requerido", maxlength = 4 })%>
    <span>(Formato yyyy)</span>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("FechaEdicion")%>
</p>
<p>
    <label>Periodo de referencia</label>
    <%=Html.Encode(Model.PeriodoReferenciaPeriodo)%>
</p>
<p>
    <label>A&ntilde;o de aceptaci&oacute;n</label>
    <%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class = "input100-requerido", maxlength = 4 })%>
    <span class="cvu"></span>
    <span>(Formato yyyy)</span>
    <%=Html.ValidationMessage("FechaAceptacion")%>
</p>