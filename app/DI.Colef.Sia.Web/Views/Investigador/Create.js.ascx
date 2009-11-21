<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

$('#mensaje-error').removeClass('mensaje-error');
$('#mensaje-error').text('');

$('span.field-validation-error').remove();
$('input').removeClass('input-validation-error');
$('select').removeClass('input-validation-error');

$('#id').val('<%=Model %>');

startUpload();