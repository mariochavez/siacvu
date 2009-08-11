<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProductoDerivadoMovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <tr id="productoderivado_<%=Html.Encode(Model.Id) %>">
        <td class="subform">
            <%=Html.Encode(Model.ProductoDerivadoNombre) %>
        </td>
    </tr>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#productoderivado_form').hide();
$('#productoderivado_new').show();
$('#productoderivado_form').html('');
$('#productoderivadoEmptyList_form').html('');
$('#productoderivadoList tr:first').after(html);

$('#productoderivado_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#productoderivado_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');