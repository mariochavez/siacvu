<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorInternoResenaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div class="sublista" id="coautorinterno_<%=Html.Encode(Model.Id) %>">
        <h6><%=Html.Encode(Model.NombreCoautor) %></h6>
	</div><!--end sublista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#coautorinterno_form').hide();
$('#coautorinterno_new').show();
$('#coautorinterno_form').html('');
$('#coautorinternoEmptyList_form').html('');
$('#coautorinternoList div:first').before(html);

$('#coautorinterno_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#coautorinterno_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');

setupSublistRows();