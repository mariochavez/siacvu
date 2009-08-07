<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
            <label>Responsables Internos:</label>
            <br />
            <%=Html.DropDownList("ResponsableInternoCapitulo.InvestigadorId", Model.ResponsablesInternos.CreateSelectList<InvestigadorForm>("Id", "Nombre"),
                "Seleccione ...")%>
			<%=Html.ValidationMessage("ResponsableInternoCapitulo.InvestigadorId") %>
        </td>
    </tr>
</table>