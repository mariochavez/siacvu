<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ReporteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p class="ReporteTecnico">
    <label></label>
    <%= Html.CheckBox("TieneProyecto", Model.TieneProyecto) %> ¿Existe proyecto de investigaci&oacute;n de referencia?
</p>
<div class="tieneproyecto_field">
    <% Html.RenderPartial("_ShowProyecto", new ShowFieldsForm { ProyectoId = Model.ProyectoId, ProyectoNombre = Model.ProyectoNombre, IsShowForm = false}); %>
</div>
<div class="ReporteDocumento">
    <% Html.RenderPartial("_EditInstitucion", new InstitucionForm { Instituciones = Model.InstitucionReportes, ModelId = Model.Id } ); %>
</div>
<p class="DocumentoTrabajo">
	<label>Serie/N&uacute;mero</label>
	<%=Html.TextBox("Numero", Model.Numero, new { @class = "input100-requerido", maxlength = 4, size = 14 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Numero")%>
</p>
<p class="ReporteDocumento">
	<label class="ReporteTecnico">Descripci&oacute;n del informe</label>
	<label class="DocumentoTrabajo">Descripci&oacute;n del cuaderno</label>
	<%=Html.TextArea("Descripcion", Model.Descripcion, 3, 35, new { @class = "input420", maxlength = 200 })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("Descripcion")%>
</p>
<p class="ReporteDocumento">
	<label class="ReporteTecnico">Objetivo del informe</label>
	<label class="DocumentoTrabajo">Objetivo del cuaderno</label>
	<%=Html.TextArea("Objetivo", Model.Objetivo, 3, 35, new { @class = "input420", maxlength = 200 })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("Objetivo")%>
</p>
<p class="ReporteDocumento">
	<label>No. de p&aacute;ginas</label>
	<%=Html.TextBox("NoPaginas", Model.NoPaginas, new { @class = "input100-requerido", maxlength = 4, size = 14 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("NoPaginas")%>
</p>