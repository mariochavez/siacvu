<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>
        Tipo Publicacion:<em>*</em></label>
    <%=Html.DropDownList("TipoPublicacion", Model.TiposPublicaciones.CreateSelectList<TipoPublicacionForm>("Id", "Nombre"),
								"Seleccione ...")%>
    <%=Html.ValidationMessage("TipoPublicacion") %>
</p>
<p>
    <label>
        Estado Producto:<em>*</em></label>
    <%=Html.DropDownList("EstadoProducto", Model.EstadosProductos.CreateSelectList<EstadoProductoForm>("Id", "Nombre"),
								"Seleccione ...")%>
    <%=Html.ValidationMessage("EstadoProducto") %>
</p>
<p>
    <label>
        Periodo Referencia:<em>*</em></label>
    <%=Html.DropDownList("PeriodoReferencia", Model.PeriodosReferencias.CreateSelectList<PeriodoReferenciaForm>("Id", "Periodo"),
								"Seleccione ...")%>
    <%=Html.ValidationMessage("PeriodoReferencia") %>
</p>
<p>
    <label>
        Tiene Proyecto:<em>*</em></label>
    <%= Html.CheckBox("TieneProyecto", Model.TieneProyecto) %>
    <%=Html.ValidationMessage("TieneProyecto")%>
</p>
<p>
    <label>
        Proyecto:<em>*</em></label>
    <%=Html.DropDownList("Proyecto", Model.Proyectos.CreateSelectList<ProyectoForm>("Id", "Nombre"),
								"Seleccione ...")%>
    <%=Html.ValidationMessage("Proyecto") %>
</p>
<p>
    <label>
        Linea Tematica:<em>*</em></label>
    <%=Html.DropDownList("LineaTematica", Model.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
								"Seleccione ...")%>
    <%=Html.ValidationMessage("LineaTematica") %>
</p>
<p>
    <label>
        Fecha Aceptacion:<em>*</em></label>
    <%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class="datetime", maxlength = 10 })%>
    <span class="helper_message">(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaAceptacion")%>
</p>