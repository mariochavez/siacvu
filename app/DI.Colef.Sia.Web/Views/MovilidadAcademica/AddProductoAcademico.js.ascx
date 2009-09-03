<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ProductoAcademicoMovilidadAcademicaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="productoacademico_<%=Html.Encode(Model.Id) %>" class="sublista">
        <h6><%=Html.Encode(Model.ProductoAcademicoNombre)%></h6>
    </div><!--end productolista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#productoacademico_form').hide();
$('#productoacademico_new').show();
$('#productoacademico_form').html('');
$('#productoacademicoEmptyList_form').html('');
$('#productoacademicoList div:first').before(html);

$('#productoacademico_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#productoacademico_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');

setupSublistRows();