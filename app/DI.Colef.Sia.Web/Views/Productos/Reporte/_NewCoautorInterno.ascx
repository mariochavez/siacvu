<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ReporteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>Coautor Interno:</label>

	<%=Html.DropDownList("CoautorInternoReporte.InvestigadorId", Model.CoautoresInternos.CreateSelectList<InvestigadorForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("CoautorInternoReporte.InvestigadorId")%>
</p>