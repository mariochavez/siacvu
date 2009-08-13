<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResenaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Estado Producto:</label>
 
    <%=Html.DropDownList("EstadoProducto", Model.EstadosProductos.CreateSelectList<EstadoProductoForm>("Id", "Nombre"),
        "Seleccione ...")%>
    <%=Html.ValidationMessage("EstadoProducto") %>
</p>
<p>
	<label>Periodo Referencia:</label>

	<%=Html.DropDownList("PeriodoReferencia", Model.PeriodosReferencias.CreateSelectList<PeriodoReferenciaForm>("Id", "Periodo"),
			"Seleccione ...")%>
	<%=Html.ValidationMessage("PeriodoReferencia") %>
</p>
<p>
	<label>Fecha Aceptacion:</label>

	<%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class = "datetime input100", maxlength = 10 })%>
	<span class="helper_message">(Formato dd/mm/yyyy)</span>
	<%=Html.ValidationMessage("FechaAceptacion")%>
</p>
<p>
	<label>Proyecto:</label>

	<%=Html.DropDownList("Proyecto", Model.Proyectos.CreateSelectList<ProyectoForm>("Id", "Nombre"),
			"Seleccione ...")%>
	<%=Html.ValidationMessage("Proyecto") %>
</p>
<p>
	<label>Linea Tematica:</label>

	<%=Html.DropDownList("LineaTematica", Model.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
			"Seleccione ...")%>
	<%=Html.ValidationMessage("LineaTematica") %>
</p>
<p>
    <label>Fecha Edicion:</label>
 
    <%=Html.TextBox("FechaEdicion", Model.FechaEdicion, new { @class = "datetime input100", maxlength = 10 })%>
    <span class="helper_message">(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaEdicion")%>
</p>