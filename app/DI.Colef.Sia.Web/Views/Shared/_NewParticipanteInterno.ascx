<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipanteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Participante interno</label>
    <%=Html.TextBox("ParticipanteInterno.Nombre", "",
        new { @class = "autocomplete buscar-requerido", url = Url.Action("Search", "Investigador"), maxlength = 100 })%>
    <%=Html.Hidden("ParticipanteInterno.InvestigadorId", 0, new { rel = "#ParticipanteInterno_Nombre" })%>
    <%=Html.ValidationMessage("ParticipanteInterno.Nombre")%>
    <%=Html.Hidden("ParticipanteInterno.ParticipanteSeOrdenaAlfabeticamente", Model.ParticipanteSeOrdenaAlfabeticamente)%>
</p>
<%if(!Model.ParticipanteSeOrdenaAlfabeticamente){ %>
    <p>
        <label>Posici&oacute;n</label>
        <%=Html.TextBox("ParticipanteInterno.Posicion", 2, new { @class = "input100-requerido", maxlength = 2 })%>
    </p>
<% } %>