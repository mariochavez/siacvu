<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<SNIInvestigadorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var deleteUrl = '<%=Url.Action("DeleteSni", null, new {id = Model.Id, investigadorId = 1000000 }) %>';
deleteUrl = deleteUrl.replace(/1000000/i, $('#Id').val());

var html = '
    <div id="sni_<%=Html.Encode(Model.Id) %>" class="sublista">
        <h6><a href="' + deleteUrl + '" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
        <%=Html.Encode(Model.SNINombre)%> <%if(Model.SNINombre != "No pertence") { %> <span><%=Html.Encode(Model.FechaInicial)%> <% if(Model.SNINombre != "Emerito") { %> a <%=Html.Encode(Model.FechaFinal)%><% } %></span> <% } %></h6>
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