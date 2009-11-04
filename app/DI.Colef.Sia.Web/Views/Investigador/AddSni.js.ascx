<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<SNIInvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="sni_<%=Html.Encode(Model.Id) %>" class="sublista">
        <h6><%=Html.Encode(Model.SNINombre) %> <span> <%=Html.Encode(Model.Fecha) %></span></h6>
        <span>Expediente <%=Html.Encode(Model.ExpedienteSNI) %></span>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#sniForm').hide();
$('#sniNew').show();
$('#sniForm').html('');
$('#sniList div:first').before(html);

$('#sni_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#sni_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');

setupSublistRows();