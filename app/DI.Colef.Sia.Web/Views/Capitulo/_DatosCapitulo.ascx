<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
		<td>
			<label>Tipo Capitulo:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("TipoCapitulo", Model.TiposCapitulos.CreateSelectList<TipoCapituloForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("TipoCapitulo") %>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Nombre Capitulo:<em>*</em></label>
		</td>
		<td>
			<%=Html.TextBox("NombreCapitulo", Model.NombreCapitulo, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("NombreCapitulo")%>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Fecha Aceptacion:<em>*</em></label>
		</td>
		<td>
			<%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class="datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("FechaAceptacion")%>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Fecha Edicion:<em>*</em></label>
		</td>
	    <td>
			<%=Html.TextBox("FechaEdicion", Model.FechaEdicion, new { @class="datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("FechaEdicion")%>
		</td>
	</tr>
		
	<tr>
		<td>
			<label>Estado:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("Estado", Model.Estados.CreateSelectList<EstadoForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Estado") %>
	    </td>
	</tr>
		
	<tr>
		<td>
			<label>Periodo Referencia:<em>*</em></label>
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
			<label>Idioma:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("Idioma", Model.Idiomas.CreateSelectList<IdiomaForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Idioma") %>
		</td>
	</tr>
</table>