<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipanteInternoProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div class="sublista" id="participanteinterno_<%=Html.Encode(Model.Id) %>">
        <h6><%=Html.Encode(Model.NombreParticipante) %></h6>
	</div><!--end sublista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#participanteinterno_form').hide();
$('#participanteinterno_new').show();
$('#participanteinterno_form').html('');
$('#participanteinternoEmptyList_form').html('');
$('#participanteinternoList div:first').before(html);

$('#participanteinterno_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#participanteinterno_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');

setupSublistRows();