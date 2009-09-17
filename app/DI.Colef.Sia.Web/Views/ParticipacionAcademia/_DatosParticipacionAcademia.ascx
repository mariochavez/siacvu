<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipacionAcademiaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
	<label>Nombre del producto</label>

	<%=Html.TextBox("NombreProducto", Model.NombreProducto, new { @class = "input420-bold-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("NombreProducto")%>						
</p>
<p>
    <label>Estado actual</label>
    <%=Html.DropDownList("EstadoProducto", Model.EstadosProductos.CreateSelectList<EstadoProductoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("EstadoProducto")%>
</p>
<p>
    <label>A&ntilde;o de aceptaci&oacute;n</label>
    <%=Html.TextBox("FechaAceptacion", Model.FechaAceptacion, new { @class = "input100-requerido", maxlength = 4 })%>
    <span>(Formato yyyy)</span>
    <%=Html.ValidationMessage("FechaAceptacion")%>					
</p>
<p>
	<label>Periodo Referencia</label>
	<%=Html.Encode(Model.PeriodoReferenciaPeriodo)%>
</p>
<p>
	<label>Proyecto</label>

	<%=Html.DropDownList("Proyecto", Model.Proyectos.CreateSelectList<ProyectoForm>("Id", "Nombre"),
        "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("Proyecto") %>
</p>
<p>
    <label>Fecha de edici&oacute;n</label>    
    <%=Html.TextBox("FechaEdicion", Model.FechaEdicion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <%=Html.ValidationMessage("FechaEdicion")%>
</p>
<p>
    <label>L&iacute;nea tem&aacute;tica</label>
    <%=Html.TextBox("LineaTematicaNombre", Model.LineaTematicaNombre,
            new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "LineaTematica"), maxlength = 100 })%>
    <%=Html.Hidden("LineaTematicaId", Model.LineaTematicaId, new { rel = "#LineaTematicaNombre" })%>
    <%=Html.ValidationMessage("LineaTematicaNombre")%>
</p>
<p>
    <label>Pa&iacute;s</label>
    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("Pais") %>
</p>
<p>
	<label>Revista</label>

	<%=Html.TextBox("Revista", Model.Revista, new { @class = "input250-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Revista")%>						
</p>
<p>
    <label>Instituci&oacute;n</label>
    <%=Html.TextBox("InstitucionNombre", Model.InstitucionNombre,
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("InstitucionId", Model.InstitucionId, new { rel = "#InstitucionNombre" })%>
    <%=Html.ValidationMessage("InstitucionNombre")%>
</p>
<p>
	<label>Volumen</label>

	<%=Html.TextBox("Volumen", Model.Volumen, new { @class = "input100", maxlength = 100 })%>
	<%=Html.ValidationMessage("Volumen")%>						
</p>
<p>
	<label>N&uacute;mero del volumen</label>

	<%=Html.TextBox("NoVolumen", Model.NoVolumen, new { @class = "input100", maxlength = 4 })%>
	<%=Html.ValidationMessage("NoVolumen")%>						
</p>
<p>
	<label>Editorial</label>
		
	<%=Html.TextBox("Editorial", Model.Editorial, new { @class = "input250", maxlength = 100 })%>
	<%=Html.ValidationMessage("Editorial")%>						
</p>