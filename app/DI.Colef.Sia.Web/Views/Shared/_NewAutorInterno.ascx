<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<AutorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Autor interno</label>
    <%=Html.TextBox("AutorInterno.Nombre", "",
        new { @class = "autocomplete buscar-requerido", url = Url.Action("Search", "Investigador"), maxlength = 100 })%>
    <%=Html.Hidden("AutorInterno.InvestigadorId", 0, new { rel = "#AutorInterno_Nombre" })%>
    <%=Html.ValidationMessage("AutorInterno.Nombre")%>
</p>