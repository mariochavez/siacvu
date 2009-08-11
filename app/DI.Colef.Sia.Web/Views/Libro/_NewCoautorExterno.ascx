<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
            <label>Coautores Externos</label>
            <br />
			<%=Html.DropDownList("CoautorExternoLibro.InvestigadorExternoId", Model.CoautoresExternos.CreateSelectList<InvestigadorExternoForm>("Id", "Nombre"),
			    "Seleccione ...")%>
			<%=Html.ValidationMessage("CoautorExternoLibro.InvestigadorExternoId")%>
        </td>
    </tr>
</table>
