<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="participaestudianteList">
    <h5>Estudiantes</h5>
    <% if (Model.EstudianteProyectos != null && Model.EstudianteProyectos.Length > 0){ %>
        <% for (int i = 0; i < Model.EstudianteProyectos.Length; i++){ %>
	        <div class="sublista" id="participaestudiante_<%=Html.Encode(Model.EstudianteProyectos[i].Id) %>">
	            <p>
                    <label>Nombre del estudiante</label>
                    <span class="valor"><%=Html.Encode(Model.EstudianteProyectos[i].NombreEstudiante)%>&nbsp;</span>
                </p>
                <p>
                    <label>Tipo de estudiante</label>
                    <span class="valor"><%=HumanizeHelper.TipoEstudiante(Model.EstudianteProyectos[i].TipoEstudiante)%>&nbsp;</span>
                </p>
                <p>
                    <label>Grado acad&eacute;mico</label>
                    <span class="valor"><%=Html.Encode(Model.EstudianteProyectos[i].GradoAcademicoNombre)%>&nbsp;</span>
                </p>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="participaestudianteEmptyListForm">
            <h6><span>No hay estudiantes registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>
</div><!--end minilista-->