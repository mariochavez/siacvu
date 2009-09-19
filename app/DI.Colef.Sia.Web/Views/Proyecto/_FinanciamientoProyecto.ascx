<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Sector de financiamiento</label>
    <%=Html.DropDownList("SectorFinanciamiento", Model.SectoresFinanciamientos.CreateSelectList<SectorFinanciamientoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("SectorFinanciamiento")%>
</p>
<p>
    <label>Fondo del CONACyT</label>
    <%=Html.DropDownList("FondoConacyt", Model.FondosConacyt.CreateSelectList<FondoConacytForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("FondoConacyt")%>
</p>