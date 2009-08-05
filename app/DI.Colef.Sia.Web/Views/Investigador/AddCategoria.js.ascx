<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CategoriaInvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <tr id="categoria_<%=Html.Encode(Model.Id) %>">
        <td class="subform">
            <%=Html.Encode(Model.CategoriaNombre) %> <span class="meta_info"><%=Html.Encode(Model.Fecha) %></span>
        </td>
    </tr>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#categoria_form').hide();
$('#categoria_new').show();
$('#categoria_form').html('');
$('#categoriaList tr:first').after(html);

$('#categoria_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#categoria_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');
