<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<GrupoInvestigacionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Nombre Grupo Investigacion</label>
    <%=Html.TextBox("NombreGrupoInvestigacion", Model.NombreGrupoInvestigacion, new { @class = "input350-bold-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("NombreGrupoInvestigacion")%>
</p>
<p>
    <label>Fecha Creacion</label>
    <%=Html.TextBox("FechaCreacion", Model.FechaCreacion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span class="helper_message">(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaCreacion")%>
</p>