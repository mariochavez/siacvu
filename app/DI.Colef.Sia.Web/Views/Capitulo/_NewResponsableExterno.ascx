<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
            <label>Responsables Externos:</label>
            <br />
            <%=Html.DropDownList("ResponsableExternoCapitulo.InvestigadorExterno", Model.ResponsablesExternos.CreateSelectList<InvestigadorExternoForm>("Id", "Nombre"),
                "Seleccione ...")%>
			<%=Html.ValidationMessage("ResponsableExternoCapitulo.InvestigadorExterno") %>
        </td>
    </tr>
</table>