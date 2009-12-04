<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Participante Interno</label>

	<%=Html.DropDownList("ParticipanteInternoProyecto.InvestigadorId", Model.ParticipantesInternos.CreateSelectList<InvestigadorForm>("Id", "NombreCoautor"),
    "Seleccione ...", new { rel = "#participanteinterno" })%>
	<%=Html.ValidationMessage("ParticipanteInternoProyecto.InvestigadorId") %>
</p>