<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
		<td>
			<label>Responsable Interno Capitulos:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("ResponsableInternoCapitulo.Investigador", Model.ResponsablesInternos.CreateSelectList<InvestigadorForm>("Id", "Nombre"),
                "Seleccione ...")%>
			<%=Html.ValidationMessage("ResponsableInternoCapitulo.Investigador") %>
		</td>
	</tr>
	
	<tr>
		<td>
			<label>Responsable Externo Capitulos:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("ResponsableExternoCapitulo.InvestigadorExterno", Model.ResponsablesExternos.CreateSelectList<InvestigadorExternoForm>("Id", "Nombre"),
                "Seleccione ...")%>
			<%=Html.ValidationMessage("ResponsableExternoCapitulo.InvestigadorExterno") %>
		</td>
	</tr>
	
	<tr>
		<td>
			<label>Forma Participacion:<em>*</em></label>
		</td>
		<td>
			<%=Html.DropDownList("FormaParticipacion", Model.FormasParticipaciones.CreateSelectList<FormaParticipacionForm>("Id", "Nombre"),
			    "Seleccione ...")%>
			<%=Html.ValidationMessage("FormaParticipacion") %>
		</td>
	</tr>
</table>
