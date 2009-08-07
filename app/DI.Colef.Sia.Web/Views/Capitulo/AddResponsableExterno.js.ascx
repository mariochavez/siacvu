<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResponsableExternoCapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <tr id="responsableexterno_<%=Html.Encode(Model.Id) %>">
        <td class="subform">
            <%=Html.Encode(Model.InvestigadorExternoNombre) %>
        </td>
    </tr>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#responsableexterno_form').hide();
$('#responsableexterno_new').show();
$('#responsableexterno_form').html('');
$('#responsableexternoList tr:first').after(html);

$('#responsableexterno_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#responsableexterno_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');
