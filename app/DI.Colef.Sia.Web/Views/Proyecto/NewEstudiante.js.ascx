<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var cssclass = 'remote';
var rel = '#participaestudianteform';

var html = '
    <% using (Html.BeginForm("AddEstudiante", "Proyecto", FormMethod.Post, new { id = "participaestudianteform" })){ %>
    <%=Html.Hidden("ProyectoId", Model.Id)%>
    <% Html.RenderPartial("_NewEstudiante"); %>
    <div class="minilistaboton">
        <p>
            <span>
                <%=Html.SubmitButton("Guardar", "Agregar estudiante", new { rel = "' + rel + '", @class = "' + cssclass + '", @style = "border: 0px none;" })%>
            </span> &oacute; <a href="#" class="cancel minilistacancelar" rel="participaestudiante">Cancelar</a>
        </p>
    </div>
    <% } %>
';

$('#participaestudianteForm').html(html);
$('#participaestudianteNew').hide();
$('#participaestudianteForm').show();
DateTimePicker.setup();
