<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipacionMedioForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>Nota Period&iacute;stica</label>
	<%=Html.TextBox("NotaPeriodistica", Model.NotaPeriodistica, new { @class = "input250", maxlength = 100 })%>
	<%=Html.ValidationMessage("NotaPeriodistica")%>
</p>
<p>
	<label>Palabra Clave 1</label>
	<%=Html.TextBox("PalabraClave1", Model.PalabraClave1, new { @class = "input250", maxlength = 100 })%>
	<%=Html.ValidationMessage("PalabraClave1")%>
</p>
<p>
	<label>Palabra Clave 2</label>
	<%=Html.TextBox("PalabraClave2", Model.PalabraClave2, new { @class = "input250", maxlength = 100 })%>
	<%=Html.ValidationMessage("PalabraClave2")%>
</p>
<p>
	<label>Palabra Clave 3</label>
    <%=Html.TextBox("PalabraClave3", Model.PalabraClave3, new { @class = "input250", maxlength = 100 })%>
	<%=Html.ValidationMessage("PalabraClave3")%>
</p>