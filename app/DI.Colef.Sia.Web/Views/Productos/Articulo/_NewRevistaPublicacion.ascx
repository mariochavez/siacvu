<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>T&iacute;tulo</label>
    <%=Html.TextBox("RevistaPublicacion.Titulo", Model.RevistaPublicacion.Titulo, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.Hidden("RevistaPublicacion.Id", Model.RevistaPublicacion.Id)%>
    <span>(Debe de ser un nombre &uacute;nico)</span>
    <%=Html.ValidationMessage("RevistaPublicacion.Titulo")%>
</p>