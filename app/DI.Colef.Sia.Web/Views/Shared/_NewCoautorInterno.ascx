<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<p>
    <label>Investigador(a) interno(a)</label>
    <%=Html.TextBox("CoautorInterno.Nombre", "",
        new { @class = "autocomplete buscar-requerido", url = Url.Action("FilteredInvestigador", "Investigador"), maxlength = 100 })%>
    <%=Html.Hidden("CoautorInterno.InvestigadorId", 0, new { rel = "#CoautorInterno_Nombre" })%>
    <%=Html.ValidationMessage("CoautorInterno.Nombre")%>
    <%=Html.Hidden("CoautorInterno.CoautorSeOrdenaAlfabeticamente", Model.CoautorSeOrdenaAlfabeticamente) %>
</p>
<%if(!Model.CoautorSeOrdenaAlfabeticamente){ %>
    <p>
        <label>Posici&oacute;n</label>
        <%=Html.TextBox("CoautorInterno.Posicion", 2, new { @class = "input100-requerido", maxlength = 2 })%>
    </p>
<% } %>