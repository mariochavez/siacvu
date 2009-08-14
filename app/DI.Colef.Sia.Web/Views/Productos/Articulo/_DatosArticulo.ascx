<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>
        Tipo Articulo:</label>
    <%=Html.DropDownList("TipoArticulo", Model.TiposArticulos.CreateSelectList<TipoArticuloForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("TipoArticulo") %>
</p>
<p>
    <label>
        Idioma:</label>
    <%=Html.DropDownList("Idioma", Model.Idiomas.CreateSelectList<IdiomaForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("Idioma") %>
</p>
<p>
    <label>
        Estado Actual:</label>
    <%=Html.DropDownList("EstadoProducto", Model.EstadosProductos.CreateSelectList<EstadoProductoForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("EstadoProducto")%>
</p>
<p>
    <label>
        Periodo Referencia:</label>
    <%=Html.DropDownList("PeriodoReferencia", Model.PeriodosReferencias.CreateSelectList<PeriodoReferenciaForm>("Id", "Periodo"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("PeriodoReferencia") %>
</p>
<p>
    <label>
        Fecha Aceptacion:</label>
    <%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaAceptacion")%>
</p>
<p>
    <label>
        Proyecto Referencia:</label>
    <%=Html.DropDownList("Proyecto", Model.Proyectos.CreateSelectList<ProyectoForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("Proyecto") %>
</p>
<p>
    <label>
        Linea Tematica:</label>
    <%=Html.DropDownList("LineaTematica", Model.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("LineaTematica") %>
</p>
<p>
    <label>
        Titulo Articulo:</label>
    <%=Html.TextBox("Titulo", Model.Titulo, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("Titulo")%>
</p>
