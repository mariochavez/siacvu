<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ArticuloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<table class="subform">
    <tr>
        <td class="label required">
            <label>Tipo Articulo:<em>*</em></label>
            <br />
            <%=Html.DropDownList("TipoArticulo", Model.TiposArticulos.CreateSelectList<TipoArticuloForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("TipoArticulo") %>
        </td>
        <td class="label required">
            <label>Idioma:<em>*</em></label>
            <br />
            <%=Html.DropDownList("Idioma", Model.Idiomas.CreateSelectList<IdiomaForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("Idioma") %>
        </td>
        <td class="label required">
            <label>Estado Actual:<em>*</em></label>
            <br />
            <%=Html.DropDownList("Estado", Model.Estados.CreateSelectList<EstadoForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("Estado") %>
        </td>
    </tr>
    <tr>
        <td class="label required">
            <label>Periodo Referencia:<em>*</em></label>
            <br />
            <%=Html.DropDownList("PeriodoReferencia", Model.PeriodosReferencias.CreateSelectList<PeriodoReferenciaForm>("Id", "Periodo"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("PeriodoReferencia") %>
        </td>
        <td class="label required">
            <label>Fecha Aceptacion:<em>*</em></label>
            <br />
            <%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class="datetime", maxlength = 10 })%>
            <span class="helper_message">(Formato dd/mm/yyyy)</span>
            <%=Html.ValidationMessage("FechaAceptacion")%>
        </td>
        <td class="label required">
            <label>Proyecto Referencia:<em>*</em></label>
        </td>
    </tr> 
    <tr>
        <td class="label required">
            <label>Linea Tematica:<em>*</em></label>
            <br />
            <%=Html.DropDownList("LineaTematica", Model.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
                "Seleccione ...")%>
            <%=Html.ValidationMessage("LineaTematica") %>
        </td>
        <td class="label required" colspan="2">
            <label>Titulo Articulo:<em>*</em></label>
            <br />
            <%=Html.TextBox("Titulo", Model.Titulo, new { maxlength = 100 })%>
            <%=Html.ValidationMessage("Titulo")%>
        </td>
    </tr>
</table>
