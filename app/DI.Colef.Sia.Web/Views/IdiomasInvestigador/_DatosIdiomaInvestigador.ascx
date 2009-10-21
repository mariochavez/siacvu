<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<IdiomasInvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
	<label>Idioma</label>

	<%=Html.DropDownList("Idioma", Model.Idiomas.CreateSelectList<IdiomaForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("Idioma") %>
</p>
<p>
	<label>Lengua materna</label>

	<%=Html.TextBox("LenguaMaterna", Model.LenguaMaterna, new { @class = "input250", maxlength = 100 })%>
	<%=Html.ValidationMessage("LenguaMaterna")%>						
</p>
<p>
	<label>Traductor</label>

	<%= Html.CheckBox("Traductor", Model.Traductor) %>
	<%=Html.ValidationMessage("Traductor")%>
</p>
<p>
	<label>Profesor</label>

	<%= Html.CheckBox("Profesor", Model.Profesor) %>
	<%=Html.ValidationMessage("Profesor")%>
</p>
<p>
	<label>Nivel de conversaci&oacute;n</label>

	<%=Html.DropDownList("NivelConversacion", Model.NivelesConversacion.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("NivelConversacion")%>
</p>
<p>
	<label>Nivel de lectura</label>

	<%=Html.DropDownList("NivelLectura", Model.NivelesLectura.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("NivelLectura")%>
</p>
<p>
	<label>Nivel de escritura</label>

	<%=Html.DropDownList("NivelEscritura", Model.NivelesEscritura.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
		"Seleccione ...")%>
	<%=Html.ValidationMessage("NivelEscritura")%>
</p>
<p>
	<label>Fecha de evaluaci&oacute;n</label>

	<%=Html.TextBox("FechaEvaluacion", Model.FechaEvaluacion, new { @class="datetime input100", maxlength = 10 })%>
	<span>(Formato dd/mm/yyyy)</span>
	<%=Html.ValidationMessage("FechaEvaluacion")%>
</p>
<p>
	<label>Nombre del documento probatorio</label>

	<%=Html.TextBox("NombreDocumentoProbatorio", Model.NombreDocumentoProbatorio, new { @class = "input250", maxlength = 100 })%>
	<%=Html.ValidationMessage("NombreDocumentoProbatorio")%>
</p>
<p>
	<label>Puntuaci&oacute;n/porcentaje</label>

	<%=Html.TextBox("Puntuacion", Model.Puntuacion, new { @class = "input250", maxlength = 10 })%>
	<%=Html.ValidationMessage("Puntuacion")%>
</p>