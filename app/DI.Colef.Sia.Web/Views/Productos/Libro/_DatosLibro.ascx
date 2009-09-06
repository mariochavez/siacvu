<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Tipo de publicaci&oacute;n</label>
    <%=Html.DropDownList("TipoPublicacion", Model.TiposPublicaciones.CreateSelectList<TipoPublicacionForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "tipo requerido" })%>
    <%=Html.ValidationMessage("TipoPublicacion") %>
</p>
<p id="idioma_field">
    <label>Idioma al que se tradujo</label>
    <%=Html.DropDownList("Idioma", Model.Idiomas.CreateSelectList<IdiomaForm>("Id", "Nombre"),
                        "Seleccione ...", new { @class = "requerido" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Idioma") %>
</p>
<p>
    <label>Estado del producto</label>
    <%=Html.DropDownList("EstadoProducto", Model.EstadosProductos.CreateSelectList<EstadoProductoForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("EstadoProducto") %>
</p>
<p>
    <label>Periodo de referencia</label>
    <%=Html.Encode(Model.PeriodoReferenciaPeriodo)%>
</p>
<p>
    <label>Tiene proyecto</label>
    <%= Html.CheckBox("TieneProyecto", Model.TieneProyecto) %>
    <%=Html.ValidationMessage("TieneProyecto")%>
</p>
<p id="SelectProyecto_p">
    <label>Proyecto</label>
    <%=Html.DropDownList("Proyecto", Model.Proyectos.CreateSelectList<ProyectoForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("Proyecto") %>
</p>
<p>
    <label>L&iacute;nea tem&aacute;tica</label>
    <%=Html.TextBox("LineaTematicaNombre", Model.LineaTematicaNombre,
            new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "LineaTematica"), maxlength = 100 })%>
    <%=Html.Hidden("LineaTematicaId", Model.LineaTematicaId, new { rel = "#LineaTematicaNombre" })%>
    <%=Html.ValidationMessage("LineaTematicaNombre") %>
</p>
<p>
    <label>A&ntilde;o de aceptaci&oacute;n</label>
    <%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class = "input100-requerido", maxlength = 4 })%>
    <span>(Formato yyyy)</span>
    <%=Html.ValidationMessage("FechaAceptacion")%>
</p>