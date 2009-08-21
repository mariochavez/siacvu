<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#tipoactividadform';

<% if(Model.Id == 0) { %>
    cssclass = 'local';
    rel = '#TipoActividadMovilidadAcademica.TipoActividadId';
<% } %>

var html = '
    <% using (Html.BeginForm("AddTipoActividad", "MovilidadAcademica", FormMethod.Post, new { id = "tipoactividadform" })){ %>
    <%=Html.Hidden("MovilidadAcademicaId", Model.Id) %>
    <% Html.RenderPartial("_NewTipoActividad"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar Tipo Actividad", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="tipoactividad">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#tipoactividad_form').html(html);
$('#tipoactividad_new').hide();
$('#tipoactividad_form').show();
DateTimePicker.setup();