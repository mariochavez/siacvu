<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ReporteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
		    <label>Tipo Reporte:<em>*</em></label>
		    <br />
		    <%=Html.DropDownList("TipoReporte", Model.TiposReportes.CreateSelectList<TipoReporteForm>("Id", "Nombre"),
				    "Seleccione ...")%>
		    <%=Html.ValidationMessage("TipoReporte") %>
        </td>
        <td class="label">
			<label>Estado Producto:<em>*</em></label>
			<br />
			<%=Html.DropDownList("EstadoProducto", Model.EstadosProductos.CreateSelectList<EstadoProductoForm>("Id", "Nombre"),
					"Seleccione ...")%>
			<%=Html.ValidationMessage("EstadoProducto") %>
        </td>
    </tr>
    <tr>
        <td class="label">
			<label>Periodo Referencia:<em>*</em></label>
			<br />
			<%=Html.DropDownList("PeriodoReferencia", Model.PeriodosReferencias.CreateSelectList<PeriodoReferenciaForm>("Id", "Periodo"),
					"Seleccione ...")%>
			<%=Html.ValidationMessage("PeriodoReferencia") %>
        </td>
        <td class="label">
			<label>Fecha Aceptacion:<em>*</em></label>
			<br />
			<%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class="datetime", maxlength = 10 })%>
			<span class="helper_message">(Formato dd/mm/yyyy)</span>
			<%=Html.ValidationMessage("FechaAceptacion")%>
        </td>
    </tr>
    <tr>
        <td class="label">
			<label>Proyecto:<em>*</em></label>
			<br />
			<%=Html.DropDownList("Proyecto", Model.Proyectos.CreateSelectList<ProyectoForm>("Id", "Nombre"),
					"Seleccione ...")%>
			<%=Html.ValidationMessage("Proyecto") %>
        </td>
        <td class="label">
			<label>Linea Tematica:<em>*</em></label>
			<br />
			<%=Html.DropDownList("LineaTematica", Model.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
					"Seleccione ...")%>
			<%=Html.ValidationMessage("LineaTematica") %>
        </td>
    </tr> 
    <tr>
        <td class="label">
		    <label>Titulo:<em>*</em></label>
		    <br />
		    <%=Html.TextBox("Titulo", Model.Titulo, new { maxlength = 100 })%>
		    <%=Html.ValidationMessage("Titulo")%>
        </td>
        <td class="label">
			<label>Fecha Edicion:<em>*</em></label>
			<br />
			<%=Html.TextBox("FechaEdicion", Model.FechaEdicion, new { @class="datetime", maxlength = 10 })%>
			<span class="helper_message">(Formato dd/mm/yyyy)</span>
			<%=Html.ValidationMessage("FechaEdicion")%>	
        </td>
    </tr>
</table>
