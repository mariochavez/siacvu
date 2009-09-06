﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResenaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Tipo de publicaci&oacute;n</label>
    <%=Html.DropDownList("TipoResena", Model.TiposResenas.CreateSelectList<TipoResenaForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("TipoResena")%>
</p>
<p>
    <label>Estado del producto</label>
    <%=Html.DropDownList("EstadoProducto", Model.EstadosProductos.CreateSelectList<EstadoProductoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("EstadoProducto") %>
</p>
<p>
	<label>Periodo de referencia</label>
	<%=Html.Encode(Model.PeriodoReferenciaPeriodo)%>
</p>
<p>
	<label>A&ntilde;o de aceptaci&oacute;n</label>
	<%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class = "input100-requerido", maxlength = 4 })%>
	<span>(Formato yyyy)</span>
	<%=Html.ValidationMessage("FechaAceptacion")%>
</p>
<p>
	<label>Proyecto</label>
	<%=Html.DropDownList("Proyecto", Model.Proyectos.CreateSelectList<ProyectoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("Proyecto") %>
</p>
<p>
	<label>L&iacute;nea tem&aacute;tica</label>
    <%=Html.TextBox("LineaTematicaNombre", Model.LineaTematicaNombre,
                    new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "LineaTematica"), maxlength = 100 })%>
    <%=Html.Hidden("LineaTematicaId", Model.LineaTematicaId, new { rel = "#LineaTematicaNombre" })%>
</p>
<p>
    <label>Fecha de edici&oacute;n</label>
    <%=Html.TextBox("FechaEdicion", Model.FechaEdicion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaEdicion")%>
</p>
<p>
    <label>Tiene proyecto</label>
    <%= Html.CheckBox("TieneProyecto", Model.TieneProyecto) %>
    <%=Html.ValidationMessage("TieneProyecto")%>
</p>