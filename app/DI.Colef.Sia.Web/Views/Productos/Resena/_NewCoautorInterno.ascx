<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResenaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
			<label>Coautor Interno:</label>
			<br />
			<%=Html.DropDownList("CoautorInternoResena.InvestigadorId", Model.CoautoresInternos.CreateSelectList<InvestigadorForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("CoautorInternoResena.InvestigadorId")%>
        </td>
    </tr>                            
</table>