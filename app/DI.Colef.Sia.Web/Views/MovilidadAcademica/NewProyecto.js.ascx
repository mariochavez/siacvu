<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var class = 'remote';
var rel = '#proyectoform';

<% if(Model.Id == 0) { %>
    class = 'local';
    rel = '#ProyectoMovilidadAcademica.Proyecto';
<% } %>

var html = '
    <% using (Html.BeginForm("AddProyecto", "MovilidadAcademica", FormMethod.Post, new { id = "proyectoform" })){ %>
    <%=Html.Hidden("MovilidadAcademicaId", Model.Id) %>
    <% Html.RenderPartial("_NewProyecto"); %>
    <div class="btn_container_footer">
        <span class="btn btn_small_brown">
            <%=Html.SubmitButton("Guardar", "Agregar Proyecto", new { rel = "' + rel + '", @class = "' + class + '", @style = "border: 0px none;" })%>
        </span>
        <span class="btn btn_small_white">
	        <a href="#" class="cancel" rel="proyecto">Cancelar</a>
        </span>
    </div>
    <% } %>
';

$('#proyecto_form').html(html);
$('#proyecto_new').hide();
$('#proyecto_form').show();
DateTimePicker.setup();
