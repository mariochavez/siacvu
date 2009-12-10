<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<p>
    <label>Objetivo del evento</label>
    <%=Html.TextArea("ObjetivoEvento", Model.ObjetivoEvento, 5, 35, new { @class = "input420-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("ObjetivoEvento")%>
</p>
<p>
    <label>Financiamiento interno</label>
    <%=Html.TextBox("FinanciamientoInterno", Model.FinanciamientoInterno, new { @class = "input100-requerido", maxlength = 4 })%>
    <%=Html.ValidationMessage("FinanciamientoInterno")%>
</p>
<p>
    <label>Financiamiento externo</label>
    <%=Html.TextBox("FinanciamientoExterno", Model.FinanciamientoExterno, new { @class = "input100-requerido", maxlength = 4 })%>
    <%=Html.ValidationMessage("FinanciamientoExterno")%>
</p>
<p>
    <label>Sesiones de trabajo programadas</label>
    <%=Html.TextBox("SesionesTrabajo", Model.SesionesTrabajo, new { @class = "input100-requerido", maxlength = 4 })%>
    <%=Html.ValidationMessage("SesionesTrabajo")%>
</p>