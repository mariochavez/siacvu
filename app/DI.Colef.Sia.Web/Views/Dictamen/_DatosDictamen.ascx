<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<DictamenForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
	<tr>
		<td>
			<label>Nombre:<em>*</em></label>
		</td>
		<td>
			<%=Html.TextBox("Nombre", Model.Nombre, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("Nombre")%>
		</td>
	</tr>

	<tr>
		<td>
			<label>Tipo Dictamen:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("TipoDictamen", Model.TiposDictamenes.CreateSelectList<TipoDictamenForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("TipoDictamen") %>
		</td>
	</tr>

	<tr>
		<td>
			<label>Tipo Participacion:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("TipoParticipacion", Model.TiposParticipaciones.CreateSelectList<TipoParticipacionForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("TipoParticipacion") %>
		</td>
	</tr>

	<tr>
		<td>
			<label>Institucion:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("Institucion", Model.Instituciones.CreateSelectList<InstitucionForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Institucion") %>
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
</table>
