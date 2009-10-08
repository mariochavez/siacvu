<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResponsableForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Responsable externo</label>
    <%=Html.TextBox("ResponsableExterno.Nombre", "",
                new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "InvestigadorExterno"), maxlength = 100 })%>
    <%=Html.Hidden("ResponsableExterno.InvestigadorExternoId", 0, new { rel = "#ResponsableExterno_Nombre" })%>
    <%=Html.ValidationMessage("ResponsableExterno.InvestigadorExternoId")%>
</p>
<p>
    <label>Forma de participaci&oacute;n</label>
    <%=Html.TextBox("ResponsableExterno.FormaParticipacion", "",
                new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "FormaParticipacion"), maxlength = 100 })%>
    <%=Html.Hidden("ResponsableExterno.FormaParticipacionId", 0, new { rel = "#ResponsableExterno_FormaParticipacion" })%>
    <%=Html.ValidationMessage("ResponsableExterno.FormaParticipacionId")%>
</p>