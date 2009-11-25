<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ReporteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p class="ReporteTecnico">
    <label></label>
    <%= Html.CheckBox("TieneProyecto", Model.TieneProyecto) %> Tiene proyecto de investigaci&oacute;n de referencia?
</p>
<div class="tieneproyecto_field">
    <% Html.RenderPartial("_ShowProyecto", new ShowFieldsForm { ProyectoId = Model.ProyectoId, ProyectoNombre = Model.ProyectoNombre, IsShowForm = false}); %>
</div>
<div class="notieneproyecto_field">
    <% Html.RenderPartial("_ShowInstitucion", new ShowFieldsForm { InstitucionId = Model.InstitucionId, InstitucionNombre = Model.InstitucionNombre, InstitucionLabel = "Instancia a la que se presenta el reporte", IsShowForm = false }); %>
</div>
<div class="notieneproyecto_field">
    <% Html.RenderPartial("_ShowAreaTematica", new ShowFieldsForm { AreaTematicaId = Model.AreaTematicaId, AreaTematicaNombre = Model.AreaTematicaNombre, ModelId = Model.Id, IsShowForm = false}); %>
</div>
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
	<label>A&ntilde;o de edici&oacute;n</label>
	<%=Html.TextBox("FechaEdicion", Model.FechaEdicion, new { @class = "input100-requerido", maxlength = 4 })%>
	<span>(Formato yyyy)</span>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("FechaEdicion")%>	
</p>