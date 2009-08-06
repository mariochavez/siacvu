<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
            <label>Coautores Internos:</label>
            <br />
            <%=Html.DropDownList("CoautorInternoArticulo.Investigador", Model.CoautoresInternos.CreateSelectList<InvestigadorForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("CoautorInternoArticulo.Investigador")%>
        </td>
    </tr>                            
</table>