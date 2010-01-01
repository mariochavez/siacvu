<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ConsejoComisionForm>" %>
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
    <label>Duraci&oacute;n</label>
    <%=Html.TextBox("Duracion", Model.Duracion, new { @class = "input100-requerido", maxlength = 2 })%>
    <%=Html.ValidationMessage("Duracion")%>
</p>
<p>
    <label>Reelecci&oacute;n</label>
    <%=Html.CheckBox("Reeleccion", Model.Reeleccion)%>
    <br /><label></label><span>(Marque en caso positivo)</span>
</p>