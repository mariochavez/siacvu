<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TipoActividadMovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <tr id="tipoactividad_<%=Html.Encode(Model.Id) %>">
        <td class="subform">
            <%=Html.Encode(Model.TipoActividadNombre) %>
        </td>
    </tr>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#tipoactividad_form').hide();
$('#tipoactividad_new').show();
$('#tipoactividad_form').html('');
$('#tipoactividadEmptyList_form').html('');
$('#tipoactividadList tr:first').after(html);

$('#tipoactividad_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#tipoactividad_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');
