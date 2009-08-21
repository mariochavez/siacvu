<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#proyectoform';

<% if(Model.Id == 0) { %>
    cssclass = 'local';
    rel = '#ProyectoMovilidadAcademica.ProyectoId';
<% } %>

var html = '
    <% using (Html.BeginForm("AddProyecto", "MovilidadAcademica", FormMethod.Post, new { id = "proyectoform" })){ %>
    <%=Html.Hidden("MovilidadAcademicaId", Model.Id) %>
    <% Html.RenderPartial("_NewProyecto"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar Proyecto", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="proyecto">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#proyecto_form').html(html);
$('#proyecto_new').hide();
$('#proyecto_form').show();
DateTimePicker.setup();
