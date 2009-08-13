<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ReporteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>Objetivo:</label>

	<%=Html.TextBox("Objetivo", Model.Objetivo, new { @class = "input250", maxlength = 100 })%>
	<%=Html.ValidationMessage("Objetivo")%>
</p>
<p>
	<label>Palabaras Clave:</label>

	<%=Html.TextBox("PalabarasClave", Model.PalabarasClave, new { @class = "input250", maxlength = 100 })%>
	<%=Html.ValidationMessage("PalabarasClave")%>
</p>
<p>
	<label>Fecha:</label>

	<%=Html.TextBox("Fecha", Model.Fecha, new { @class = "datetime input100", maxlength = 10 })%>
	<span class="helper_message">(Formato dd/mm/yyyy)</span>
	<%=Html.ValidationMessage("Fecha")%>
</p>