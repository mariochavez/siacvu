<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TesisDirigidaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>T&iacute;tulo</label>
	<%=Html.TextBox("Titulo", Model.Titulo, new { @class = "input420-bold-requerido", maxlength = 100 })%>
	<span class="cvu"></span>
	<%=Html.ValidationMessage("Titulo")%>
</p>
<p>
    <label>Fecha de conclusi&oacute;n</label>
    <%=Html.TextBox("FechaConclusion", Model.FechaConclusion, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("FechaConclusion")%>
</p>
<p>
    <label>Pa&iacute;s</label>
    <%=Html.DropDownList("Pais", Model.Paises.CreateSelectList<PaisForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("Pais") %>
</p>
<p>
    <label>Grado acad&eacute;mico</label>
    <%=Html.DropDownList("GradoAcademico", Model.GradosAcademicos.CreateSelectList<GradoAcademicoForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <span class="cvu"></span>                
    <%=Html.ValidationMessage("GradoAcademico") %>
</p>
<p id="FechaGrado_p">
    <label>Fecha de obtenci&oacute;n del grado</label>
    <%=Html.TextBox("FechaGrado", Model.FechaGrado, new { @class = "datetime input100-requerido", maxlength = 10 })%>
    <span>(Formato dd/mm/yyyy)</span>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("FechaGrado")%>
</p>
<p>
    <label>Forma de participaci&oacute;n</label>
    <%=Html.DropDownList("FormaParticipacion", Model.FormasParticipaciones.CreateSelectList<FormaParticipacionForm>("Id", "Nombre"),
                "Seleccione ...", new { @class = "requerido" })%>
    <%=Html.ValidationMessage("FormaParticipacion") %>
</p>
<p>
    <label>Instituci&oacute;n</label>
    <%=Html.TextBox("InstitucionNombre", Model.InstitucionNombre,
            new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "Institucion"), maxlength = 100 })%>
    <%=Html.Hidden("InstitucionId", Model.InstitucionId, new { rel = "#InstitucionNombre" })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("InstitucionNombre")%>
</p>
<p>
    <label>Programa de estudio</label>
    <%=Html.TextBox("ProgramaEstudioNombre", Model.ProgramaEstudioNombre,
        new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "ProgramaEstudio"), maxlength = 100 })%>
    <%=Html.Hidden("ProgramaEstudioId", Model.ProgramaEstudioId, new { rel = "#ProgramaEstudioNombre" })%>
    <%=Html.ValidationMessage("ProgramaEstudioNombre")%>
</p>
<p>
    <label>L&iacute;nea tem&aacute;tica</label>
    <%=Html.TextBox("LineaTematicaNombre", Model.LineaTematicaNombre,
                    new { @class = "autocomplete buscar-requerido", rel = Url.Action("Search", "LineaTematica"), maxlength = 100 })%>
    <%=Html.Hidden("LineaTematicaId", Model.LineaTematicaId, new { rel = "#LineaTematicaNombre" })%>
    <%=Html.ValidationMessage("LineaTematicaNombre")%>
</p>
<p>
    <label>Periodo de referencia</label>
    <%=Html.Encode(Model.PeriodoReferenciaPeriodo)%>
</p>
<p>
    <label>Nombre del alumno</label>
    <%=Html.TextBox("NombreAlumno", Model.NombreAlumno, new { @class = "input250-requerido", maxlength = 100 })%>
    <span class="cvu"></span>
    <%=Html.ValidationMessage("NombreAlumno")%>
</p>