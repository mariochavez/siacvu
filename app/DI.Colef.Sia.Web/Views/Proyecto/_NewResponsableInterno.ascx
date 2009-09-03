<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Investigador Interno</label>

	<%=Html.DropDownList("ResponsableInternoProyecto.InvestigadorId", Model.ResponsablesInternos.CreateSelectList<InvestigadorForm>("Id", "NombreCoautor"),
	"Seleccione ...", new { rel = "#responsableinterno" })%>
	<%=Html.ValidationMessage("ResponsableInternoProyecto.InvestigadorId") %>
</p>