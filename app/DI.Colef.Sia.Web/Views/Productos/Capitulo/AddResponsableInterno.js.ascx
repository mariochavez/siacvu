<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResponsableInternoCapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <tr id="responsableinterno_<%=Html.Encode(Model.Id) %>">
        <td class="subform">
            <%=Html.Encode(Model.InvestigadorUsuarioPersonaNombre) %>
        </td>
    </tr>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#responsableinterno_form').hide();
$('#responsableinterno_new').show();
$('#responsableinterno_form').html('');
$('#responsableinternoEmptyList_form').html('');
$('#responsableinternoList tr:first').after(html);

$('#responsableinterno_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#responsableinterno_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');
