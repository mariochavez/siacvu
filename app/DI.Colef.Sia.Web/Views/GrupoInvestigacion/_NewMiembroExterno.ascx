<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MiembroExternoGrupoInvestigacionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre(s)</label>
    <%=Html.TextBox("MiembroExterno.Nombre", Model.InvestigadorExterno.Nombre, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("MiembroExterno.Nombre")%>
</p>
<p>
    <label>Apellido paterno</label>
    <%=Html.TextBox("MiembroExterno.ApellidoPaterno", Model.InvestigadorExterno.ApellidoPaterno, new { @class = "input250", maxlength = 40 })%>
    <%=Html.ValidationMessage("MiembroExterno.ApellidoPaterno")%>
</p>
<p>
    <label>Apellido materno</label>
    <%=Html.TextBox("MiembroExterno.ApellidoMaterno", Model.InvestigadorExterno.ApellidoMaterno, new { @class = "input250", maxlength = 40 })%>
    <%=Html.ValidationMessage("MiembroExterno.ApellidoMaterno")%>
</p>