<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EditorialForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Editorial</label>
    <%=Html.TextBox("Editorial.Nombre", "",
            new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Editorial"), maxlength = 100 })%>
    <%=Html.Hidden("Editorial.EditorialId", 0, new { rel = "#Editorial_Nombre" })%>
    <%=Html.ValidationMessage("Editorial.Nombre")%>
</p>