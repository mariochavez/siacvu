<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<GrupoInvestigacionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Nombre del grupo de investigaci&oacute;n</label>
    <%=Html.TextBox("NombreGrupoInvestigacion", Model.NombreGrupoInvestigacion, new { @class = "input420-bold-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("NombreGrupoInvestigacion")%>
</p>
<p>
    <label>Fecha de creaci&oacute;n</label>
    <%=Html.TextBox("FechaCreacion", Model.FechaCreacion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span class="cvu"></span>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaCreacion")%>
</p>