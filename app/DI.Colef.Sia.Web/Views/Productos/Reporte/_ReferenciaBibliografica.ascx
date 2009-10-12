<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ReporteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p class="ReporteTecnico">
    <label></label>
    <%= Html.CheckBox("TieneProyecto", Model.TieneProyecto) %> Tiene proyecto de investigaci&oacute;n de referencia?
</p>
<p class="tieneproyecto_field">
    <label>Nombre del proyecto de investigaci&oacute;n</label>
    <%=Html.TextBox("ProyectoNombre", Model.ProyectoNombre,
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Proyecto"), maxlength = 100 })%>
    <%=Html.Hidden("ProyectoId", Model.ProyectoId, new { rel = "#ProyectoNombre", url = Url.Action("ChangeProyecto") })%>
    <%=Html.ValidationMessage("ProyectoNombre")%>
</p>
<p class="tieneproyecto_field">
    <label>L&iacute;nea tem&aacute;tica</label>
    <span id="lineatematica"><%=Html.Encode(Model.ProyectoLineaTematicaNombre)%>&nbsp;</span>
</p>
<p class="tieneproyecto_field">
    <label>&Aacute;rea tem&aacute;tica</label>
    <span id="areatematica"><%=Html.Encode(Model.ProyectoAreaTematicaNombre)%>&nbsp;</span>
</p>
<p class="tieneproyecto_field">
    <label>Palabra clave 1</label>
    <span id="proyectopalabraclave1"><%=Html.Encode(Model.ProyectoPalabraClave1)%>&nbsp;</span>
</p>
<p class="tieneproyecto_field">
    <label>Palabra clave 2</label>
    <span id="proyectopalabraclave2"><%=Html.Encode(Model.ProyectoPalabraClave2)%>&nbsp;</span>
</p>
<p class="tieneproyecto_field">
    <label>Palabra clave 3</label>
    <span id="proyectopalabraclave3"><%=Html.Encode(Model.ProyectoPalabraClave3)%>&nbsp;</span>
</p>
<p class="notieneproyecto_field">
	<label>Palabra clave 1</label>
	<%=Html.TextBox("PalabraClave1", Model.PalabraClave1, new { @class = "input250", maxlength = 100 })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("PalabraClave1")%>
</p>
<p class="notieneproyecto_field">
	<label>Palabra clave 2</label>
	<%=Html.TextBox("PalabraClave2", Model.PalabraClave2, new { @class = "input250", maxlength = 100 })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("PalabraClave2")%>
</p>
<p class="notieneproyecto_field">
	<label>Palabra clave 3</label>
	<%=Html.TextBox("PalabraClave3", Model.PalabraClave3, new { @class = "input250", maxlength = 100 })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("PalabraClave3")%>
</p>
<p class="ReporteCuaderno">
	<label class="ReporteTecnico">Descripci&oacute;n del informe</label>
	<label class="CuadernoTrabajo">Descripci&oacute;n del cuaderno</label>
	<%=Html.TextArea("Descripcion", Model.Descripcion, 3, 35, new { @class = "input420", maxlength = 200 })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("Descripcion")%>
</p>
<p class="ReporteCuaderno">
	<label class="ReporteTecnico">Objetivo del informe</label>
	<label class="CuadernoTrabajo">Objetivo del cuaderno</label>
	<%=Html.TextArea("Objetivo", Model.Objetivo, 3, 35, new { @class = "input420", maxlength = 200 })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("Objetivo")%>
</p>
<p class="ReporteCuaderno">
	<label>No. de p&aacute;ginas</label>
	<%=Html.TextBox("NoPaginas", Model.NoPaginas, new { @class = "input100-requerido", maxlength = 4, size = 14 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("NoPaginas")%>
</p>
<p class="ReporteCuaderno">
	<label>Fecha de edici&oacute;n</label>
	<%=Html.TextBox("FechaEdicion", Model.FechaEdicion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
	<span>(Formato dd/mm/yyyy)</span>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("FechaEdicion")%>	
</p>