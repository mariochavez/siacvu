<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ReporteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
			<label>Coautor Interno:</label>
			<br />
			<%=Html.DropDownList("CoautorInternoReporte.InvestigadorId", Model.CoautoresInternos.CreateSelectList<InvestigadorForm>("Id", "Nombre"),
				"Seleccione ...")%>
			<%=Html.ValidationMessage("CoautorInternoReporte.InvestigadorId")%>
        </td>
    </tr>                            
</table>