<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<FirmaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Helpers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>


var html = '
    <% if(Model.Aceptacion2 == 1){ %>
        <p>
            El <%=HumanizeHelper.GetNombreProducto(Model.TipoProducto) %> ha sido aceptado.
        </p>
    <% } %>
    <% if(Model.Aceptacion2 == 2){ %>
        <p>
            El <%=HumanizeHelper.GetNombreProducto(Model.TipoProducto) %> ha sido rechazado.
        </p>
    <% } %>
';

$('#firmaform').html('');
$('#firmaform').html(html);


$('#mensaje-error').removeClass('mensaje-error');
$('#mensaje-error').text('');

$('span.field-validation-error').remove();
$('input').removeClass('input-validation-error');
$('textarea').removeClass('input-validation-error');
$('select').removeClass('input-validation-error');