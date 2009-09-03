<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InstitucionForm>" %>
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
    <label>Responsable</label>
    <%=Html.TextBox("Responsable", Model.Responsable, new { @class = "input250-requerido", maxlength = 40 })%>    
    <%=Html.ValidationMessage("Responsable")%>
</p>
<p>
    <label>Email</label>
    <%=Html.TextBox("Email", Model.Email, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("Email")%>
</p>