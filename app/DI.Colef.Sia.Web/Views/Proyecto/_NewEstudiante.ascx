<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<p>
    <label>Nombre del estudiante</label>
	<%=Html.TextBox("Estudiante.NombreEstudiante", "", new { @class = "input420-requerido" })%>
	<%=Html.ValidationMessage("Estudiante.NombreEstudiante")%>
</p>
<p>
    <label>Tipo de estudiante</label>
	<%=Html.DropDownList("Estudiante.TipoEstudiante", Model.TiposEstudiantes.CreateSelectList<CustomSelectForm>("Id", "Nombre"),
                    "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("Estudiante.TipoEstudiante")%>
</p>
<p>
    <label>Grado acad&eacute;mico</label>
	<%=Html.DropDownList("Estudiante.GradoAcademico", Model.GradosAcademicos.CreateSelectList<GradoAcademicoForm>("Id", "Nombre"),
                    "Seleccione ...", new { @class = "requerido" })%>
	<%=Html.ValidationMessage("Estudiante.GradoAcademico")%>
</p>