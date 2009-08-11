<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProyectoMovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <tr id="proyecto_<%=Html.Encode(Model.Id) %>">
        <td class="subform">
            <%=Html.Encode(Model.ProyectoNombre) %>
        </td>
    </tr>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#proyecto_form').hide();
$('#proyecto_new').show();
$('#proyecto_form').html('');
$('#proyectoEmptyList_form').html('');
$('#proyectoList tr:first').after(html);

$('#proyecto_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#proyecto_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');
