<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var class = 'remote';
var rel = '#tipoactividadform';

<% if(Model.Id == 0) { %>
    class = 'local';
    rel = '#TipoActividadMovilidadAcademica.TipoActividad';
<% } %>

var html = '
    <% using (Html.BeginForm("AddTipoActividad", "MovilidadAcademica", FormMethod.Post, new { id = "tipoactividadform" })){ %>
    <%=Html.Hidden("MovilidadAcademicaId", Model.Id) %>
    <% Html.RenderPartial("_NewTipoActividad"); %>
    <div class="btn_container_footer">
        <span class="btn btn_small_brown">
            <%=Html.SubmitButton("Guardar", "Agregar Tipo Actividad", new { rel = "' + rel + '", @class = "' + class + '", @style = "border: 0px none;" })%>
        </span>
        <span class="btn btn_small_white">
	        <a href="#" class="cancel" rel="tipoactividad">Cancelar</a>
        </span>
    </div>
    <% } %>
';

$('#tipoactividad_form').html(html);
$('#tipoactividad_new').hide();
$('#tipoactividad_form').show();
DateTimePicker.setup();