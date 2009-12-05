<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MiembroExternoGrupoInvestigacionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre</label>
    <%=Html.TextBox("MiembroExterno.InvestigadorExternoNombre", Model.InvestigadorExterno.Nombre, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("MiembroExterno.Nombre")%>
</p>
<p>
    <label>Apellido paterno</label>
    <%=Html.TextBox("MiembroExterno.InvestigadorExternoApellidoPaterno", Model.InvestigadorExterno.ApellidoPaterno, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("MiembroExterno.ApellidoPaterno")%>
</p>
<p>
    <label>Apellido materno</label>
    <%=Html.TextBox("MiembroExterno.InvestigadorExternoApellidoMaterno", Model.InvestigadorExterno.ApellidoMaterno, new { @class = "input250-requerido", maxlength = 40 })%>
    <%=Html.ValidationMessage("MiembroExterno.ApellidoMaterno")%>
</p>