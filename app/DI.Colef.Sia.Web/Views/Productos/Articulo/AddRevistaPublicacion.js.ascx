<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<RevistaPublicacionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#RevistaPublicacionTitulo').val('<%=Model.Titulo%>');

$('#message').html('');
$('#message').removeClass('errormessage');

$('#revistapublicacion_form').hide();
$('#revistapublicacion_new').show();
$('#revistapublicacion_form').html('');