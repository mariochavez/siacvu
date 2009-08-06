<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
            <label>Coautores Externos:</label>
            <br />
            <%=Html.DropDownList("CoautorExternoArticulo.InvestigadorExterno", Model.CoautoresExternos.CreateSelectList<InvestigadorExternoForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("CoautorExternoArticulo.InvestigadorExterno")%>
        </td>
    </tr>                              
</table>