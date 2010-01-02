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
$('#coautorexterno_<%=Html.Encode(Model.InvestigadorExternoId) %>').remove();

var autores = ($('#coautorinternoList div[id^=coautorinterno_]').length) + ($('#coautorexternoList div[id^=coautorexterno_]').length)  + 1;
$('#totalcoautores').text(autores);

deleteElementV2(html, '#coautorexternoList div[id^=coautorexterno_]', '#coautorEmptyListForm', autores);

setupSublistRows();