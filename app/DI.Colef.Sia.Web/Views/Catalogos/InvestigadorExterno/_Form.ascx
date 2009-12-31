<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InvestigadorExternoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.ViewData"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre</label>
    <%=Html.TextBox("Nombre", Model.Nombre, new { @class = "input250-requerido", maxlength = 40 })%>
    <span>(Debe de ser un nombre &uacute;nico)</span>
    <%=Html.ValidationMessage("Nombre") %>
</p>
<p>
    <label>Apellido paterno</label>
    <%=Html.TextBox("ApellidoPaterno", Model.ApellidoPaterno, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("ApellidoPaterno")%>
</p>
<p>
    <label>Apellido paterno</label>
    <%=Html.TextBox("ApellidoMaterno", Model.ApellidoMaterno, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("ApellidoMaterno")%>
</p>