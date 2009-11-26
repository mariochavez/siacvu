<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<AutorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Autor externo</label>
    <%=Html.TextBox("AutorExterno.Nombre", "",
                new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "InvestigadorExterno"), maxlength = 100 })%>
    <%=Html.Hidden("AutorExterno.InvestigadorExternoId", 0, new { rel = "#AutorExterno_Nombre" })%>
    <%=Html.ValidationMessage("AutorExterno.InvestigadorExternoId")%>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <%=Html.TextBox("AutorExterno.Institucion", "",
            new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("AutorExterno.InstitucionId", 0, new { rel = "#AutorExterno_Institucion" })%>
    <%=Html.ValidationMessage("AutorExterno.InstitucionId")%>
</p>