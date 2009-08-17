<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>Tipo de Capitulo</label>
    <%=Html.DropDownList("TipoCapitulo", Model.TiposCapitulos.CreateSelectList<TipoCapituloForm>("Id", "Nombre"),
				"Seleccione ...")%>
    <%=Html.ValidationMessage("TipoCapitulo") %>
</p>
<p>
    <label>Nombre del Capitulo</label>
    <%=Html.TextBox("NombreCapitulo", Model.NombreCapitulo, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("NombreCapitulo")%>
</p>
<p>
    <label>Fecha de Aceptaci&oacute;n</label>
    <%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaAceptacion")%>
</p>
<p>
    <label>Fecha de Edici&oacute;n</label>
    <%=Html.TextBox("FechaEdicion", Model.FechaEdicion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaEdicion")%>
</p>
<p>
    <label>Estado actual</label>
    <%=Html.DropDownList("EstadoProducto", Model.EstadosProductos.CreateSelectList<EstadoProductoForm>("Id", "Nombre"),
				"Seleccione ...")%>
    <%=Html.ValidationMessage("EstadoProducto")%>
</p>
<p>
    <label>Periodo de Referencia</label>
    <%=Html.DropDownList("PeriodoReferencia", Model.PeriodosReferencias.CreateSelectList<PeriodoReferenciaForm>("Id", "Periodo"),
			    "Seleccione ...")%>
    <%=Html.ValidationMessage("PeriodoReferencia") %>
</p>
<p>
    <label>Linea Tem&aacute;tica</label>
    <%=Html.DropDownList("LineaTematica", Model.LineasTematicas.CreateSelectList<LineaTematicaForm>("Id", "Nombre"),
			    "Seleccione ...")%>
    <%=Html.ValidationMessage("LineaTematica") %>
</p>
<p>
    <label>Idioma al que se tradujo</label>
    <%=Html.DropDownList("Idioma", Model.Idiomas.CreateSelectList<IdiomaForm>("Id", "Nombre"),
				"Seleccione ...")%>
    <%=Html.ValidationMessage("Idioma") %>
</p>
<p>
    <label>Proyecto de Referencia</label>
    <%=Html.DropDownList("Proyecto", Model.Proyectos.CreateSelectList<ProyectoForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("Proyecto") %>
</p>
