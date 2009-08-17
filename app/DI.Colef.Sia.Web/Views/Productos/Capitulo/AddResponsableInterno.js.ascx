<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResponsableInternoCapituloForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div class="sublista" id="responsableinterno_<%=Html.Encode(Model.Id) %>">
        <h6><%=Html.Encode(Model.InvestigadorUsuarioPersonaNombre) %></h6>
	</div><!--end sublista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#responsableinterno_form').hide();
$('#responsableinterno_new').show();
$('#responsableinterno_form').html('');
$('#responsableinternoEmptyList_form').html('');
$('#responsableinternoList div:first').before(html);

$('#responsableinterno_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#responsableinterno_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');

setupSublistRows();