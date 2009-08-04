<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#message').removeClass('errormessage');
$('#message').text('');

<% foreach (var key in ViewData.ModelState.Keys) { %>
    <% for (int i = 0; i < ViewData.ModelState[key].Errors.Count; i++) { %> 
        var html = '<span class="field-validation-error"><%=Html.Encode(ViewData.ModelState[key].Errors[i].ErrorMessage) %></span>';
        
        var parent = $('#<%=Html.Encode(key.Replace(".", "_"))%>').parent();
        $(parent).find('.field-validation-error').remove();
        $(parent).append(html);
    <% } %>        
<% } %>

$('#message').addClass('errormessage');
$('#message').text('Se ha generado un error al realizar la operacion, por favor corrija los siguientes errores.');

