<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Investigador Externo</label>

    <%=Html.DropDownList("ResponsableExternoProyecto.InvestigadorExternoId", Model.ResponsablesExternos.CreateSelectList<InvestigadorExternoForm>("Id", "Nombre"),
    "Seleccione ...", new { rel = "#responsableexterno" })%>
    <%=Html.ValidationMessage("ResponsableExternoProyecto.InvestigadorExternoId") %>
</p>