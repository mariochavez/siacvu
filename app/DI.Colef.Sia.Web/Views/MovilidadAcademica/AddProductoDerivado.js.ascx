<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProductoDerivadoMovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="productoderivado_<%=Html.Encode(Model.Id) %>" class="sublista">
        <h6><%=Html.Encode(Model.ProductoDerivadoNombre) %></h6>
    </div><!--end productolista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#productoderivado_form').hide();
$('#productoderivado_new').show();
$('#productoderivado_form').html('');
$('#productoderivadoEmptyList_form').html('');
$('#productoderivadoList div:first').before(html);

$('#productoderivado_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#productoderivado_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');

setupSublistRows();