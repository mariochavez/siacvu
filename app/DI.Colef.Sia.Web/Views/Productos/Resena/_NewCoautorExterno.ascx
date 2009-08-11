<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResenaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
			<label>Coautor Externo:</label>
			<br />
			<%=Html.DropDownList("CoautorExternoResena.InvestigadorExternoId", Model.CoautoresExternos.CreateSelectList<InvestigadorExternoForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("CoautorExternoResena.InvestigadorExternoId")%>
        </td>
    </tr>                              
</table>