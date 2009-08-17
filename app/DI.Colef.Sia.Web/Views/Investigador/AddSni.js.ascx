<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<SNIInvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="sni_<%=Html.Encode(Model.Id) %>" class="sublista">
        <h6><%=Html.Encode(Model.SNINombre) %> <span>De <%=Html.Encode(Model.FechaInicial) %> a <%=Html.Encode(Model.FechaFinal) %></span></h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#sni_form').hide();
$('#sni_new').show();
$('#sni_form').html('');
$('#sniList div:first').before(html);

$('#sni_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
$('#sni_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');

setupSublistRows();