<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CargoInvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <tr id="cargo_<%=Html.Encode(Model.Id) %>">
        <td class="subform">
            <%=Html.Encode(Model.CargoNombre) %> <span class="more_info"><%=Html.Encode(Model.Fecha)%>, <%=Html.Encode(Model.SedeNombre)%></span>
            <div class="meta_info"><%=Html.Encode(Model.DepartamentoNombre)%></div>
        </td>
    </tr>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#cargo_form').hide();
$('#cargo_new').show();
$('#cargo_form').html('');
$('#cargoList tr:first').after(html);

$('#cargo_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#cargo_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');
