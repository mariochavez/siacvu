<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre</label>
    <%=Html.TextBox("CoautorExterno.Nombre", Model.InvestigadorExterno.Nombre, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("CoautorExterno.Nombre")%>
</p>
<p>
    <label>Apellido paterno</label>
    <%=Html.TextBox("CoautorExterno.ApellidoPaterno", Model.InvestigadorExterno.ApellidoPaterno, new { @class = "input250", maxlength = 40 })%>
    <%=Html.ValidationMessage("CoautorExterno.ApellidoPaterno")%>
</p>
<p>
    <label>Apellido materno</label>
    <%=Html.TextBox("CoautorExterno.ApellidoMaterno", Model.InvestigadorExterno.ApellidoMaterno, new { @class = "input250", maxlength = 40 })%>
    <%=Html.ValidationMessage("CoautorExterno.ApellidoMaterno")%>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <%=Html.TextBox("CoautorExterno.Institucion", "",
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("CoautorExterno.InstitucionId", 0, new { rel = "#CoautorExterno_Institucion" })%>
    <%=Html.ValidationMessage("CoautorExterno.InstitucionId")%>
</p>