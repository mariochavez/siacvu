<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<AutorForm>" %>
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
$('#autorexterno_<%=Html.Encode(Model.InvestigadorExternoId) %>').remove();

var autores = ($('#autorinternoList div[id^=autorinterno_]').length) + ($('#autorexternoList div[id^=autorexterno_]').length)  + 1;
$('#totalautores').text(autores);

var autoresExternos = $('#autorexternoList div[id^=autorexterno_]').length;

deleteElementV2(html, '#autorexternoList div[id^=autorexterno_]', '#autorEmptyListForm', autores, autoresExternos, '#autorexternoList');

setupSublistRows();