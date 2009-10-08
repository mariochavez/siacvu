<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
	<label>Posici&oacute;n del autor</label>
    <%=Html.TextBox("PosicionAutor", Model.PosicionAutor, new { @class = "input100", maxlength = 3 })%>
	<span class="cvu"></span>
</p>
<p>
    <label>Nombre de la revista</label>
    <%=Html.TextBox("RevistaPublicacionTitulo", Model.RevistaPublicacionTitulo,
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "RevistaPublicacion"), maxlength = 100 }) %>
    <%=Html.Hidden("RevistaPublicacionId", Model.RevistaPublicacionId, new { rel = "#RevistaPublicacionTitulo", url = Url.Action("ChangeRevista") })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("RevistaPublicacionTitulo")%>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <span id="institucion"><%= Html.Encode(Model.RevistaPublicacionInstitucionNombre)%>&nbsp;</span>
</p>
<p>
    <label>Pa&iacute;s</label>
    <span id="pais"><%= Html.Encode(Model.RevistaPublicacionPaisNombre)%>&nbsp;</span>
</p>
<p>
    <label>&Iacute;ndice 1</label>
    <span id="indice1"><%= Html.Encode(Model.RevistaPublicacionIndice1Nombre)%>&nbsp;</span>
</p>
<p>
    <label>&Iacute;ndice 2</label>
    <span id="indice2"><%= Html.Encode(Model.RevistaPublicacionIndice2Nombre)%>&nbsp;</span>
</p>
<p>
    <label>&Iacute;ndice 3</label>
    <span id="indice3"><%= Html.Encode(Model.RevistaPublicacionIndice3Nombre)%>&nbsp;</span>
</p>
<p>
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
<p>
    <label>Estatus de la publicaci&oacute;n</label>
    <%=Html.DropDownList("EstadoProducto", Model.EstadosProductos.CreateSelectList<EstadoProductoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "estado requerido" })%>
    <%=Html.ValidationMessage("EstadoProducto")%>
</p>
<p id="EstatusAceptado">
    <label>Fecha de aceptaci&oacute;n</label>
    <%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaAceptacion")%>
</p>
<p class="EstatusPublicado">
    <label>Fecha de publicaci&oacute;n</label>
    <%=Html.TextBox("FechaPublicacion", Model.FechaPublicacion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaPublicacion")%>
</p>
<p>
    <label>Periodo de referencia</label>
    <%=Html.Encode(Model.PeriodoReferenciaPeriodo)%>
</p>