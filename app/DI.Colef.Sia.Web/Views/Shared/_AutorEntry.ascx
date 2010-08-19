<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<BaseForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

<p>
    <label>Investigador(a)</label>
    <span class="valor"><%=Html.Encode(Model.InvestigadorNombre) %></span>
    <span id="CoautorSeOrdenaAlfabeticamente_field" class="noeffect">
         <label class="right">Posici&oacute;n</label>
         <%=Html.TextBox("PosicionCoautor", Model.PosicionCoautor, new { @class = "input100-requerido", maxlength = 2 })%>
        <span class="cvu"></span>
        <%=Html.ValidationMessage("PosicionCoautor")%>
    </span>
</p>