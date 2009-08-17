<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ReporteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>Coautor Externo</label>
	<%=Html.DropDownList("CoautorExternoReporte.InvestigadorExternoId", Model.CoautoresExternos.CreateSelectList<InvestigadorExternoForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("CoautorExternoReporte.InvestigadorExternoId")%>
</p>