<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<AutorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre</label>
    <%=Html.TextBox("AutorExterno.Nombre", Model.InvestigadorExterno.Nombre, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("AutorExterno.Nombre")%>
</p>
<p>
    <label>Apellido paterno</label>
    <%=Html.TextBox("AutorExterno.ApellidoPaterno", Model.InvestigadorExterno.ApellidoPaterno, new { @class = "input250", maxlength = 40 })%>
    <%=Html.ValidationMessage("AutorExterno.ApellidoPaterno")%>
</p>
<p>
    <label>Apellido materno</label>
    <%=Html.TextBox("AutorExterno.ApellidoMaterno", Model.InvestigadorExterno.ApellidoMaterno, new { @class = "input250", maxlength = 40 })%>
    <%=Html.ValidationMessage("AutorExterno.ApellidoMaterno")%>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <%=Html.TextBox("AutorExterno.Institucion", "",
        new { @class = "autocomplete buscar-requerido", url = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("AutorExterno.InstitucionId", 0, new { rel = "#AutorExterno_Institucion" })%>
    <%=Html.ValidationMessage("AutorExterno.InstitucionId")%>
</p>