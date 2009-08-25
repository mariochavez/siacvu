<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ReporteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>Objetivo</label>
	<%=Html.TextBox("Objetivo", Model.Objetivo, new { @class = "input250", maxlength = 100 })%>
	<%=Html.ValidationMessage("Objetivo")%>
</p>
<p>
	<label>Palabra clave 1</label>
	<%=Html.TextBox("PalabraClave1", Model.PalabraClave1, new { @class = "input250", maxlength = 100 })%>
	<%=Html.ValidationMessage("PalabraClave1")%>
</p>
<p>
	<label>Palabra clave 2</label>
	<%=Html.TextBox("PalabraClave2", Model.PalabraClave2, new { @class = "input250", maxlength = 100 })%>
	<%=Html.ValidationMessage("PalabraClave2")%>
</p>
<p>
	<label>Palabra clave 3</label>
	<%=Html.TextBox("PalabraClave3", Model.PalabraClave3, new { @class = "input250", maxlength = 100 })%>
	<%=Html.ValidationMessage("PalabraClave3")%>
</p>
<p>
	<label>Fecha</label>
	<%=Html.TextBox("Fecha", Model.Fecha, new { @class = "datetime input100", maxlength = 10 })%>
	<span>(Formato dd/mm/yyyy)</span>
	<%=Html.ValidationMessage("Fecha")%>
</p>