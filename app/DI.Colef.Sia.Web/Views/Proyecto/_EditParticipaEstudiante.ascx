<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>
<div class="minilista" id="participaestudianteList">
    <h5>Estudiante</h5>

    <% if (Model.EstudianteProyectos != null && Model.EstudianteProyectos.Length > 0){ %>
        <% for (int i = 0; i < Model.EstudianteProyectos.Length; i++){ %>
	        <div class="sublista" id="participaestudiante_<%=Html.Encode(Model.EstudianteProyectos[i].NombreEstudiante.Replace(" ", "_")) %>">
	            <h6>
	                <a href="<%=Url.Action("DeleteEstudiante", null, new{id = Model.Id, nombreEstudiante = Model.EstudianteProyectos[i].NombreEstudiante.Replace(" ", "_")}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
	                <%=Html.Encode(Model.EstudianteProyectos[i].NombreEstudiante)%>
	                <%=Html.Hidden("Estudiante[" + i + "].NombreEstudiante", Model.EstudianteProyectos[i].NombreEstudiante)%>
	                <span>
	                    Tipo de estudiante <%=HumanizeHelper.TipoEstudiante(Model.EstudianteProyectos[i].TipoEstudiante)%>
	                    <%=Html.Hidden("Estudiante[" + i + "].TipoEstudiante", Model.EstudianteProyectos[i].TipoEstudiante)%>    
	                    Grado acad&eacute;mico <%=Html.Encode(Model.EstudianteProyectos[i].GradoAcademicoNombre)%>
	                    <%=Html.Hidden("Estudiante[" + i + "].GradoAcademico", Model.EstudianteProyectos[i].GradoAcademicoId)%>
	                </span>
	            </h6>
			</div><!--end sublista-->
        <% } %>
    <% } else { %>
        <div class="sublista" id="participaestudianteEmptyListForm">
            <h6><span>No hay estudiantes registrados</span></h6>
		</div><!--end elementodescripcion-->
    <% } %>

	<div id="participaestudianteNew" class="minilistaboton">
		<p>
			<span>
		    	<%=Html.ActionLink("+ Nuevo estudiante", "NewEstudiante", new { Id = Model.Id }, new { @class = "remote get" })%>
			</span>
		</p>
	</div><!--end minilistaboton-->

</div><!--end minilista-->
	
<div id="participaestudianteForm" class="display:hidden;"></div>