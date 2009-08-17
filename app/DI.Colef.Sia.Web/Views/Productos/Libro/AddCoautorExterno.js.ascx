<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorExternoLibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div class="sublista" id="coautorexterno_<%=Html.Encode(Model.Id) %>">
        <h6><%=Html.Encode(Model.InvestigadorExternoNombre) %></h6>
	</div><!--end sublista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#coautorexterno_form').hide();
$('#coautorexterno_new').show();
$('#coautorexterno_form').html('');
$('#coautorexternoEmptyList_form').html('');
$('#coautorexternoList div:first').before(html);

$('#coautorexterno_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#coautorexterno_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');

setupSublistRows();