<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EstadoInvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="estado_<%=Html.Encode(Model.Id) %>" class="sublista">
        <h6><%=Html.Encode(Model.EstadoNombre) %> <span><%=Html.Encode(Model.Fecha) %></span></h6>
    </div><!--end estadolista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#estado_form').hide();
$('#estado_new').show();
$('#estado_form').html('');
$('#estadoList div:first').before(html);

$('#estado_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#estado_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');

setupSublistRows();
