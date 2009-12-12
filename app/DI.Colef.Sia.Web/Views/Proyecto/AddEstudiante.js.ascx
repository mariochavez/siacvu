<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EstudianteProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter = $('#participaestudianteList div[id^=participaestudiante_]').length;

var html = '
    <div class="sublista" id="participaestudiante_<%=Html.Encode(Model.Id) %>">
        <h6>
            <a href="<%=Url.Action("DeleteEstudiante", null, new{ id = Model.ParentId, estudianteId = Model.Id}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.NombreEstudiante)%>
            <%=Html.Hidden("Estudiante['  + counter + '].NombreEstudiante", Model.NombreEstudiante)%>
            <span>
                Tipo de estudiante <%=HumanizeHelper.TipoEstudiante(Model.TipoEstudiante)%>
                <%=Html.Hidden("Estudiante['  + counter + '].TipoEstudiante", Model.TipoEstudiante)%>
                Grado acad&eacute;mico <%=Html.Encode(Model.GradoAcademicoNombre)%>
                <%=Html.Hidden("Estudiante['  + counter + '].GradoAcademico", Model.GradoAcademicoId)%>
            </span>
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#participaestudianteForm').hide();
$('#participaestudianteNew').show();
$('#participaestudianteForm').html('');

$('#participaestudianteEmptyListForm').html('');
$('#participaestudianteList div:first').before(html);

$('#participaestudiante_<%=Html.Encode(Model.Id)%>:first').hide();
$('#participaestudiante_<%=Html.Encode(Model.Id)%>:first').fadeIn('slow');

setupSublistRows();