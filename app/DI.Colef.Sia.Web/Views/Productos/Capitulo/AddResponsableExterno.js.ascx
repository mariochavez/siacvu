<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResponsableExternoCapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div class="sublista" id="responsableexterno_<%=Html.Encode(Model.Id) %>">
        <h6><%=Html.Encode(Model.InvestigadorExternoNombre) %></h6>
	</div><!--end sublista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#responsableexterno_form').hide();
$('#responsableexterno_new').show();
$('#responsableexterno_form').html('');
$('#responsableexternoEmptyList_form').html('');
$('#responsableexternoList div:first').before(html);

$('#responsableexterno_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#responsableexterno_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');

setupSublistRows();