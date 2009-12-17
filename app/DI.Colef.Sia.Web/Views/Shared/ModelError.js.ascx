<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#mensaje-error').removeClass('mensaje-error');
$('#mensaje-error').text('');

$('span.field-validation-error').remove();
$('input').removeClass('input-validation-error');
$('textarea').removeClass('input-validation-error');
$('select').removeClass('input-validation-error');
        
<% foreach (var key in ViewData.ModelState.Keys) { %>
    <% for (int i = 0; i < ViewData.ModelState[key].Errors.Count; i++) { %> 
        var html = '<span class="field-validation-error"><%=Html.Encode(ViewData.ModelState[key].Errors[i].ErrorMessage) %></span>';
        
        var anchor = $('#<%=Html.Encode(key.Replace(".", "_"))%>').attr('id') == null ? $('#<%=Html.Encode(key.Replace(".", "_"))%>Id') : $('#<%=Html.Encode(key.Replace(".", "_"))%>');
        var parent = $(anchor).parent();

        if($(anchor).formElementType() === "hidden") {
            var field = $(anchor).attr('rel');
            $(field).addClass('input-validation-error');
        }
        else
            $(anchor).addClass('input-validation-error');
        
        $(parent).append(html);
    <% } %>      
<% } %>

$('#mensaje-error').addClass('mensaje-error');
$('#mensaje-error').text('Se han generado ' + $('span.field-validation-error').length + ' error(es) al realizar la operacion, por favor corrijalos.');

