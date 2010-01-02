<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <h6>
        <span>No hay investigadores registrados</span>
    </h6>
';

$('#message').html('');
$('#message').removeClass('errormessage');
$('#coautorinterno_<%=Html.Encode(Model.InvestigadorId) %>').remove();

var coautores = ($('#coautorinternoList div[id^=coautorinterno_]').length) + ($('#coautorexternoList div[id^=coautorexterno_]').length)  + 1;
$('#totalcoautores').text(coautores);

var coautoresInternos = $('#coautorinternoList div[id^=coautorinterno_]').length;

deleteElementV2(html, '#coautorinternoList div[id^=coautorinterno_]', '#coautorEmptyListForm', coautores, coautoresInternos, '#coautorinternoList');

setupSublistRows();