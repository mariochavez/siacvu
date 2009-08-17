<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TipoParticipacionEventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div class="sublista" id="tipoparticipacion_<%=Html.Encode(Model.Id) %>">
        <h6><%=Html.Encode(Model.TipoParticipacionNombre) %></h6>
	</div><!--end sublista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#tipoparticipacion_form').hide();
$('#tipoparticipacion_new').show();
$('#tipoparticipacion_form').html('');
$('#tipoparticipacionEmptyList_form').html('');
$('#tipoparticipacionList div:first').before(html);

$('#tipoparticipacion_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#tipoparticipacion_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');

setupSublistRows();