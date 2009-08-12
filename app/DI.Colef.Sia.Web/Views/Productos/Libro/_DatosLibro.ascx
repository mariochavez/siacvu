<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<LibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<table class="subform">
    <tr>
        <td>
            <label>
                Tipo Publicacion:<em>*</em></label>
        </td>
        <td>
            <%=Html.DropDownList("TipoPublicacion", Model.TiposPublicaciones.CreateSelectList<TipoPublicacionForm>("Id", "Nombre"),
								"Seleccione ...")%>
            <%=Html.ValidationMessage("TipoPublicacion") %>
        </td>
    </tr>
    <tr>
        <td>
            <label>
                Estado Producto:<em>*</em></label>
        </td>
        <td>
            <%=Html.DropDownList("EstadoProducto", Model.EstadosProductos.CreateSelectList<EstadoProductoForm>("Id", "Nombre"),
								"Seleccione ...")%>
            <%=Html.ValidationMessage("EstadoProducto") %>
        </td>
    </tr>
    <tr>
        <td>
            <label>
                Periodo Referencia:<em>*</em></label>
        </td>
        <td>
            <%=Html.DropDownList("PeriodoReferencia", Model.PeriodosReferencias.CreateSelectList<PeriodoReferenciaForm>("Id", "Periodo"),
								"Seleccione ...")%>
            <%=Html.ValidationMessage("PeriodoReferencia") %>
        </td>
    </tr>
    <tr>
        <td>
            <label>
                Tiene Proyecto:<em>*</em></label>
        </td>
        <td>
            <%= Html.CheckBox("TieneProyecto", Model.TieneProyecto) %>
            <%=Html.ValidationMessage("TieneProyecto")%>
        </td>
    </tr>
    <tr>
        <td>
            <label>
                Proyecto:<em>*</em></label>
        </td>
        <td>
            <%=Html.DropDownList("Proyecto", Model.Proyectos.CreateSelectList<ProyectoForm>("Id", "Nombre"),
								"Seleccione ...")%>
            <%=Html.ValidationMessage("Proyecto") %>
        </td>
    </tr>
    <tr>
        <td>
            <label>
                Linea Tematica:<em>*</em></label>
        </td>
        <td>
            <%=Html.DropDownList("LineaTematica", Model.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
								"Seleccione ...")%>
            <%=Html.ValidationMessage("LineaTematica") %>
        </td>
    </tr>
    <tr>
        <td>
            <label>
                Fecha Aceptacion:<em>*</em></label>
        </td>
        <td>
            <%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class="datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("FechaAceptacion")%>
        </td>
    </tr>
</table>
