<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#EventoNombre').val('<%=Model.Nombre%>');
$('#EventoId').val('<%=Model.Id%>');
var autocomplete = $('#EventoNombre')[0].autocompleter;
autocomplete.findValue();
 
$('#message').html('');
$('#message').removeClass('errormessage');

$('#eventoForm').hide();
$('#eventoNew').show();
$('#eventoForm').html('');