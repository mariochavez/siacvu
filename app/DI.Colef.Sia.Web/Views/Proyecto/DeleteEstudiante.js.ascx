<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EstudianteProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>


var html = '
    <div id="participaestudianteEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>No hay estudiantes registrados</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');
$('#participaestudiante_<%=Html.Encode(Model.Id)%>').remove();

deleteElement(html, '#participaestudianteList div[id^=participaestudiante_]', '#participaestudianteList');

setupSublistRows();