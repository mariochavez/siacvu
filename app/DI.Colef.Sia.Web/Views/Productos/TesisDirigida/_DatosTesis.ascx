<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TesisDirigidaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p class="AlumnoInterno">
    <label>T&iacute;tulo de la tesis</label>
    <%=Html.DropDownList("TesisPosgradoId", Model.TesisPosgrados.CreateSelectList<TesisPosgradoForm>("Id", "Titulo"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("TesisPosgrado")%>
</p>
<p class="AlumnoExterno">
    <label>T&iacute;tulo de la tesis</label>
	<%=Html.TextBox("Titulo", Model.Titulo, new { @class = "input420-bold-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Titulo")%>
</p>
<p class="AlumnoExterno">
    <label>Vinculaci&oacute;n con la APyD</label>
    <%=Html.DropDownList("VinculacionAPyD", Model.VinculacionesAPyDs.CreateSelectList<VinculacionAPyDForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("VinculacionAPyD")%>
</p>
<p class="AlumnoExterno">
    <label>Forma de participaci&oacute;n</label>
    <%=Html.DropDownList("FormaParticipacion", Model.FormasParticipaciones.CreateSelectList<FormaParticipacionForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("FormaParticipacion") %>
</p>
<p class="AlumnoExterno">
    <label>Nombre del alumno (autor)</label>
    <%=Html.TextBox("NombreAlumno", Model.NombreAlumno, new { @class = "input420", maxlength = 100 })%>
    <%=Html.ValidationMessage("NombreAlumno")%>
</p>
<p class="AlumnoExterno">
    <label>Grado acad&eacute;mico obtenido/por obtener</label>
    <%=Html.DropDownList("GradoAcademico", Model.GradosAcademicos.CreateSelectList<GradoAcademicoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <span class="cvu"></span>                
    <%=Html.ValidationMessage("GradoAcademico") %>
</p>
<p class="AlumnoExterno">
    <label>Instituci&oacute;n</label>
    <%=Html.TextBox("InstitucionNombre", Model.InstitucionNombre,
            new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("InstitucionId", Model.InstitucionId, new { rel = "#InstitucionNombre" })%>
    <%=Html.ValidationMessage("InstitucionNombre")%>
</p>