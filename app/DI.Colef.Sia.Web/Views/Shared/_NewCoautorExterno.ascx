<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Coautor externo</label>
    <%=Html.TextBox("CoautorExterno.Nombre", "",
                new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "InvestigadorExterno"), maxlength = 100 })%>
    <%=Html.Hidden("CoautorExterno.InvestigadorExternoId", 0, new { rel = "#CoautorExterno_Nombre" })%>
    <%=Html.ValidationMessage("CoautorExterno.InvestigadorExternoId")%>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <%=Html.TextBox("CoautorExterno.Institucion", "",
                new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("CoautorExterno.InstitucionId", 0, new { rel = "#CoautorExterno_Institucion" })%>
    <%=Html.ValidationMessage("CoautorExterno.InstitucionId")%>
</p>