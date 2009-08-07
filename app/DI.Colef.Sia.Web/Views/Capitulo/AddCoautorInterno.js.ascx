<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorInternoCapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <tr id="coautorinterno_<%=Html.Encode(Model.Id) %>">
        <td class="subform">
            <%=Html.Encode(Model.InvestigadorUsuarioPersonaNombre) %>
        </td>
    </tr>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#coautorinterno_form').hide();
$('#coautorinterno_new').show();
$('#coautorinterno_form').html('');
$('#coautorinternoList tr:first').after(html);

$('#coautorinterno_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#coautorinterno_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');
