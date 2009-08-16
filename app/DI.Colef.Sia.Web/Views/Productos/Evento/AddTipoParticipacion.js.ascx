<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TipoParticipacionEventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <tr id="tipoparticipacion_<%=Html.Encode(Model.Id) %>">
        <td class="subform">
            <%=Html.Encode(Model.TipoParticipacionNombre) %>
        </td>
    </tr>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#tipoparticipacion_form').hide();
$('#tipoparticipacion_new').show();
$('#tipoparticipacion_form').html('');
$('#tipoparticipacionEmptyList_form').html('');
$('#tipoparticipacionList tr:first').after(html);

$('#tipoparticipacion_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#tipoparticipacion_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');
