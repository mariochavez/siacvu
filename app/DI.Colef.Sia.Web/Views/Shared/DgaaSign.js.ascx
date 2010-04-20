<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<FirmaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <% if(Model.Aceptacion2 == 1){ %>
		El <%=HumanizeHelper.GetNombreProducto(Model.TipoProducto) %> ha sido aceptado.
    <% } %>
    <% if(Model.Aceptacion2 == 2){ %>
        El <%=HumanizeHelper.GetNombreProducto(Model.TipoProducto) %> ha sido rechazado.
    <% } %>
';

$('#firmaform').html('');

$('#mensaje-error').removeClass('mensaje-error');
$('#mensaje-error').text('');

$('#mensaje-error').addClass('mensaje-acierto');
$('#mensaje-error').text(html);

$('span.field-validation-error').remove();
$('input').removeClass('input-validation-error');
$('textarea').removeClass('input-validation-error');
$('select').removeClass('input-validation-error');

window.scrollTo(0,0);