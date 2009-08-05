<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<SNIInvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <tr id="sni_<%=Html.Encode(Model.Id) %>">
        <td class="subform">
            <%=Html.Encode(Model.SNINombre) %> <span class="meta_info">De <%=Html.Encode(Model.FechaInicial) %> a <%=Html.Encode(Model.FechaFinal) %></span>
        </td>
    </tr>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#sni_form').hide();
$('#sni_new').show();
$('#sni_form').html('');
$('#sniList tr:first').after(html);

$('#sni_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#sni_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');
