<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorExternoReseñaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <tr id="coautorexterno_<%=Html.Encode(Model.Id) %>">
        <td class="subform">
            <%=Html.Encode(Model.InvestigadorExternoNombre) %>
        </td>
    </tr>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#coautorexterno_form').hide();
$('#coautorexterno_new').show();
$('#coautorexterno_form').html('');
$('#coautorexternoEmptyList_form').html('');
$('#coautorexternoList tr:first').after(html);

$('#coautorexterno_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#coautorexterno_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');
