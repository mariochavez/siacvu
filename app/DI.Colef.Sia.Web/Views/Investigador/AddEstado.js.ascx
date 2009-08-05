<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EstadoInvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <tr id="estado_<%=Html.Encode(Model.Id) %>">
        <td class="subform">
            <%=Html.Encode(Model.EstadoNombre) %> <span class="meta_info"><%=Html.Encode(Model.Fecha) %></span>
        </td>
    </tr>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#estado_form').hide();
$('#estado_new').show();
$('#estado_form').html('');
$('#estadoList tr:first').after(html);

$('#estado_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#estado_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');
