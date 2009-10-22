<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TesisDirigidaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p class="AlumnoInternoExterno">
    <label>T&iacute;tulo de la tesis</label>
	<%=Html.TextBox("Titulo", Model.Titulo, new { @class = "input420-bold-requerido", maxlength = 100 })%>
	<%=Html.ValidationMessage("Titulo")%>
</p>
<p class="AlumnoInternoExterno">
    <label>Vinculaci&oacute;n con la APyD</label>
    <%=Html.DropDownList("VinculacionAPyD", Model.VinculacionesAPyDs.CreateSelectList<VinculacionAPyDForm>("Id", "Nombre"),
                "Seleccione ...")%>
    <%=Html.ValidationMessage("VinculacionAPyD")%>
</p>
<p class="AlumnoInternoExterno">
    <label>Forma de participaci&oacute;n</label>
    <%=Html.DropDownList("FormaParticipacion", Model.FormasParticipaciones.CreateSelectList<FormaParticipacionForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("FormaParticipacion") %>
</p>
<p class="AlumnoInternoExterno">
    <label></label>
    <%= Html.CheckBox("Concluida", Model.Concluida)%> Tesis concluida?
</p>
<p id="TesisConcluida">
    <label>Fecha de conclusi&oacute;n</label>
    <%=Html.TextBox("FechaConclusion", Model.FechaConclusion, new { @class = "datetime input100", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("FechaConclusion")%>
</p>
<p class="AlumnoInterno">
    <label>Nombre del alumno (autor)</label>
    <%=Html.DropDownList("Alumno", Model.Alumnos.CreateSelectList<AlumnoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido cascade", rel = Url.Action("ChangeAlumno") })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Alumno")%>
</p>
<p class="AlumnoInterno">
    <label>Programa de estudio</label>
    <span id="programaestudiointerno"><%= Html.Encode(Model.AlumnoProgramaEstudioNombre) %>&nbsp;</span>
</p>
<p class="AlumnoInterno">
    <label>Grado acad&eacute;mico obtenido/por obtener</label>
    <span id="gradoacademicointerno"><%= Html.Encode(Model.AlumnoGradoAcademicoNombre) %>&nbsp;</span>
</p>
<p class="AlumnoInterno">
    <label>Fecha de obtenci&oacute;n del grado</label>
    <%=Html.TextBox("FechaGrado", Model.FechaGrado, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("FechaGrado")%>
</p>
<p class="AlumnoInterno">
    <label>Pa&iacute;s</label>
    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Pais") %>
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
            new { @class = "autocomplete buscar", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("InstitucionId", Model.InstitucionId, new { rel = "#InstitucionNombre", url = Url.Action("ChangeInstitucion") })%>
    <%=Html.ValidationMessage("InstitucionNombre")%>
</p>
<p class="AlumnoExterno">
    <label>Pa&iacute;s</label>
    <span id="institucionpais"><%= Html.Encode(Model.InstitucionPaisNombre) %>&nbsp;</span>
</p>