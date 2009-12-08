<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipanteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre</label>
    <%=Html.TextBox("ParticipanteExterno.InvestigadorExternoNombre", Model.InvestigadorExterno.Nombre, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("ParticipanteExterno.Nombre")%>
</p>
<p>
    <label>Apellido paterno</label>
    <%=Html.TextBox("ParticipanteExterno.InvestigadorExternoApellidoPaterno", Model.InvestigadorExterno.ApellidoPaterno, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("ParticipanteExterno.ApellidoPaterno")%>
</p>
<p>
    <label>Apellido materno</label>
    <%=Html.TextBox("ParticipanteExterno.InvestigadorExternoApellidoMaterno", Model.InvestigadorExterno.ApellidoMaterno, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("ParticipanteExterno.ApellidoMaterno")%>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <%=Html.TextBox("ParticipanteExterno.Institucion", "",
            new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("ParticipanteExterno.InstitucionId", 0, new { rel = "#ParticipanteExterno_Institucion" })%>
    <%=Html.ValidationMessage("ParticipanteExterno.InstitucionId")%>
</p>