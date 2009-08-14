<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models" %>
<p>
    <label>
        Tipo de Capitulo:</label>
    <%=Html.DropDownList("TipoCapitulo", Model.TiposCapitulos.CreateSelectList<TipoCapituloForm>("Id", "Nombre"),
				"Seleccione ...")%>
    <%=Html.ValidationMessage("TipoCapitulo") %>
</p>
<p>
    <label>
        Nombre del Capitulo:</label>
    <%=Html.TextBox("NombreCapitulo", Model.NombreCapitulo, new { @class = "input250-requerido", maxlength = 100 })%>
    <%=Html.ValidationMessage("NombreCapitulo")%>
</p>
<p>
    <label>
        Fecha de Aceptacion:</label>
<<<<<<< HEAD:app/DI.Colef.Sia.Web/Views/Productos/Capitulo/_DatosCapitulo.ascx
    <%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
=======
    <%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class = "datetime input100", maxlength = 10 })%>
    <span class="helper_message">(Formato dd/mm/yyyy)</span>
>>>>>>> 45466c8c7657207d4f25add6278388a85b7ed26a:app/DI.Colef.Sia.Web/Views/Productos/Capitulo/_DatosCapitulo.ascx
    <%=Html.ValidationMessage("FechaAceptacion")%>
</p>
<p>
    <label>
        Fecha de Edicion:</label>
<<<<<<< HEAD:app/DI.Colef.Sia.Web/Views/Productos/Capitulo/_DatosCapitulo.ascx
    <%=Html.TextBox("FechaEdicion", Model.FechaEdicion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
=======
    <%=Html.TextBox("FechaEdicion", Model.FechaEdicion, new { @class = "datetime input100", maxlength = 10 })%>
    <span class="helper_message">(Formato dd/mm/yyyy)</span>
>>>>>>> 45466c8c7657207d4f25add6278388a85b7ed26a:app/DI.Colef.Sia.Web/Views/Productos/Capitulo/_DatosCapitulo.ascx
    <%=Html.ValidationMessage("FechaEdicion")%>
</p>
<p>
    <label>
        Estado actual:</label>
    <%=Html.DropDownList("EstadoProducto", Model.EstadosProductos.CreateSelectList<EstadoProductoForm>("Id", "Nombre"),
				"Seleccione ...")%>
    <%=Html.ValidationMessage("EstadoProducto")%>
</p>
<p>
    <label>
        Periodo de Referencia:</label>
    <%=Html.DropDownList("PeriodoReferencia", Model.PeriodosReferencias.CreateSelectList<PeriodoReferenciaForm>("Id", "Periodo"),
			    "Seleccione ...")%>
    <%=Html.ValidationMessage("PeriodoReferencia") %>
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
        Idioma al que se tradujo:</label>
    <%=Html.DropDownList("Idioma", Model.Idiomas.CreateSelectList<IdiomaForm>("Id", "Nombre"),
				"Seleccione ...")%>
    <%=Html.ValidationMessage("Idioma") %>
</p>
<p>
    <label>
        Proyecto de Referencia:</label>
    <%=Html.DropDownList("Proyecto", Model.Proyectos.CreateSelectList<ProyectoForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("Proyecto") %>
</p>
