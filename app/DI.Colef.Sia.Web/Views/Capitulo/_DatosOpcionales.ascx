<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
		<td>
			<label>Volumen:<em>*</em></label>
		</td>
		<td>
			<%=Html.TextBox("Volumen", Model.Volumen, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("Volumen")%>
		</td>
	</tr>
	
	<tr>
		<td>
			<label>Editores:<em>*</em></label>
		</td>
		<td>
			<%=Html.TextBox("Editores", Model.Editores, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("Editores")%>
		</td>
	</tr>
	
	<tr>
		<td>
			<label>Tipo de Participacion:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("TipoParticipacion", Model.TiposParticipaciones.CreateSelectList<TipoParticipacionForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("TipoParticipacion") %>
		</td>
	</tr>
	
	<tr>
	    <td>
			<label>Tipo de Participante:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("TipoParticipante", Model.TiposParticipantes.CreateSelectList<TipoParticipanteForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("TipoParticipante") %>
		</td>
	</tr>
	
	<tr>
		<td>
			<label>Area:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("Area", Model.Areas.CreateSelectList<AreaForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Area") %>
		</td>
	</tr>
	
	<tr>
		<td>
			<label>Disciplina:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("Disciplina", Model.Disciplinas.CreateSelectList<DisciplinaForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Disciplina") %>
		</td>
	</tr>
	
	<tr>
		<td>
			<label>Subdisciplina:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("Subdisciplina", Model.Subdisciplinas.CreateSelectList<SubdisciplinaForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("Subdisciplina") %>
		</td>
    </tr>
	
	<tr>
		<td>
			<label>Traductor/Co-Traductor:<em>*</em></label>
		</td>
		<td>
			<%=Html.TextBox("Traductor", Model.Traductor, new { maxlength = 100 })%>
		    <%=Html.ValidationMessage("Traductor")%>
		</td>
	</tr>
	
	<tr>
		<td>
			<label>Nombre del Traductor:<em>*</em></label>
		</td>
		<td>
			<%=Html.TextBox("NombreTraductor", Model.NombreTraductor, new { maxlength = 100 })%>
			<%=Html.ValidationMessage("NombreTraductor")%>
		</td>
	</tr>
	
	<tr>
		<td>
			<label>Resumen:<em>*</em></label>
		</td>
		<td>
		    <%=Html.TextArea("Resumen", Model.Resumen, 3, 35, new { maxlength = 100 })%>			
			<%=Html.ValidationMessage("Resumen")%>
		</td>
	</tr>
</table>