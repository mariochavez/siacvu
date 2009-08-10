<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
		<td>
			<label>Tipo de Capitulo:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("TipoCapitulo", Model.TiposCapitulos.CreateSelectList<TipoCapituloForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("TipoCapitulo") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Nombre del Capitulo:<em>*</em></label>
		</td>
		<td>
			<%=Html.TextBox("NombreCapitulo", Model.NombreCapitulo, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("NombreCapitulo")%>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Fecha de Aceptacion:<em>*</em></label>
		</td>
		<td>
			<%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class="datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("FechaAceptacion")%>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Fecha de Edicion:<em>*</em></label>
		</td>
	    <td>
			<%=Html.TextBox("FechaEdicion", Model.FechaEdicion, new { @class="datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("FechaEdicion")%>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Estado actual:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("EstadoProducto", Model.EstadosProductos.CreateSelectList<EstadoProductoForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("EstadoProducto")%>
	    </td>
	</tr>
		
	<tr>
		<td>
			<label>Periodo de Referencia:<em>*</em></label>
		</td>
	    <td>
			<%=Html.DropDownList("PeriodoReferencia", Model.PeriodosReferencias.CreateSelectList<PeriodoReferenciaForm>("Id", "Periodo"),
			    "Seleccione ...")%>
			<%=Html.ValidationMessage("PeriodoReferencia") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Linea Tematica:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("LineaTematica", Model.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
			    "Seleccione ...")%>
			<%=Html.ValidationMessage("LineaTematica") %>
        </td>
	</tr>
		
	<tr>
		<td>
			<label>Idioma al que se tradujo:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("Idioma", Model.Idiomas.CreateSelectList<IdiomaForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Idioma") %>
		</td>
	</tr>
	<tr>
		<td>
			<label>Proyecto de Referencia:<em>*</em></label>
		</td>
		<td>
		</td>
	</tr>
</table>