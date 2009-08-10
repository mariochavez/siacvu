<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label">
            <label>Tipo Articulo:</label>
            <br />
            <%=Html.DropDownList("TipoArticulo", Model.TiposArticulos.CreateSelectList<TipoArticuloForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("TipoArticulo") %>
        </td>
        <td class="label">
            <label>Idioma:</label>
            <br />
            <%=Html.DropDownList("Idioma", Model.Idiomas.CreateSelectList<IdiomaForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("Idioma") %>
        </td>
    </tr>
    <tr>
        <td class="label">
            <label>Estado Actual:</label>
            <br />
            <%=Html.DropDownList("EstadoProducto", Model.EstadosProductos.CreateSelectList<EstadoProductoForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("EstadoProducto")%>
        </td>
        <td class="label">
            <label>Periodo Referencia:</label>
            <br />
            <%=Html.DropDownList("PeriodoReferencia", Model.PeriodosReferencias.CreateSelectList<PeriodoReferenciaForm>("Id", "Periodo"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("PeriodoReferencia") %>
        </td>
    </tr>
    <tr>
        <td class="label">
            <label>Fecha Aceptacion:</label>
            <br />
            <%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class="datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("FechaAceptacion")%>
        </td>
        <td class="label">
            <label>Proyecto Referencia:</label>
        </td>
    </tr> 
    <tr>
        <td class="label">
            <label>Linea Tematica:</label>
            <br />
            <%=Html.DropDownList("LineaTematica", Model.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("LineaTematica") %>
        </td>
        <td class="label" colspan="2">
            <label>Titulo Articulo:</label>
            <br />
            <%=Html.TextBox("Titulo", Model.Titulo, new { maxlength = 100 })%>
            <%=Html.ValidationMessage("Titulo")%>
        </td>
    </tr>
</table>
