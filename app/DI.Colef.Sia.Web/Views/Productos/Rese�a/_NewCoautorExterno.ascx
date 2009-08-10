<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ReseñaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
			<label>Coautor Externo:</label>
			<br />
			<%=Html.DropDownList("CoautorExternoReseña.InvestigadorExternoId", Model.CoautoresExternos.CreateSelectList<InvestigadorExternoForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("CoautorExternoReseña.InvestigadorExternoId")%>
        </td>
    </tr>                              
</table>