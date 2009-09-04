<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Tipo de art&iacute;culo</label>
    <%=Html.DropDownList("TipoArticulo", Model.TiposArticulos.CreateSelectList<TipoArticuloForm>("Id", "Nombre"),
                        "Seleccione ...", new { @class = "tipo requerido" })%>
    <%=Html.ValidationMessage("TipoArticulo") %>
</p>
<p id="idioma_field">
    <label>Idioma al que se tradujo</label>
    <%=Html.DropDownList("Idioma", Model.Idiomas.CreateSelectList<IdiomaForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Idioma") %>
</p>
<p>
    <label>Estado actual</label>
    <%=Html.DropDownList("EstadoProducto", Model.EstadosProductos.CreateSelectList<EstadoProductoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "estado requerido" })%>
    <%=Html.ValidationMessage("EstadoProducto")%>
</p>
<p>
    <label>Periodo de referencia</label>
    <%=Html.Encode(Model.PeriodoReferenciaPeriodo)%>
</p>
<p>
    <label>A&ntilde;o de aceptaci&oacute;n</label>
    <%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class = "input100-requerido", maxlength = 4 })%>
    <span>(Formato yyyy)</span>
    <%=Html.ValidationMessage("FechaAceptacion")%>
</p>
<p>
    <label>Proyecto de referencia</label>
    <%=Html.DropDownList("Proyecto", Model.Proyectos.CreateSelectList<ProyectoForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("Proyecto") %>
</p>
<p>
    <label>L&iacute;nea tem&aacute;tica</label>
    <%=Html.TextBox("LineaTematicaNombre", Model.LineaTematicaNombre,
            new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "LineaTematica"), maxlength = 100 })%>
    <%=Html.Hidden("LineaTematicaId", Model.LineaTematicaId, new { rel = "#LineaTematicaNombre" })%>
<<<<<<< HEAD:app/DI.Colef.Sia.Web/Views/Productos/Articulo/_DatosArticulo.ascx
    <%=Html.ValidationMessage("LineaTematicaNombre")%>
=======
</p>
<p>
    <label>Tiene proyecto de investigaci&oacute;n de referencia</label>
    <%= Html.CheckBox("TieneProyecto", Model.TieneProyecto)%>
    <%=Html.ValidationMessage("TieneProyecto")%>
>>>>>>> d6dd101e140cff5d058d13bf119e1b62a8a3a453:app/DI.Colef.Sia.Web/Views/Productos/Articulo/_DatosArticulo.ascx
</p>