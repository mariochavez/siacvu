<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipanteExternoProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div class="sublista" id="participanteexterno_<%=Html.Encode(Model.Id) %>">
        <h6><%=Html.Encode(Model.InvestigadorExternoNombre) %></h6>
	</div><!--end sublista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#participanteexterno_form').hide();
$('#participanteexterno_new').show();
$('#participanteexterno_form').html('');
$('#participanteexternoEmptyList_form').html('');
$('#participanteexternoList div:first').before(html);

$('#participanteexterno_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#participanteexterno_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');

setupSublistRows();