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
$('#autorinterno_<%=Html.Encode(Model.InvestigadorId) %>').remove();

var autores = ($('#autorinternoList div[id^=autorinterno_]').length) + ($('#autorexternoList div[id^=autorexterno_]').length)  + 1;
$('#totalautores').text(autores);

var autoresInternos = $('#autorinternoList div[id^=autorinterno_]').length;

deleteElementV2(html, '#autorinternoList div[id^=autorinterno_]', '#autorEmptyListForm', autores, autoresInternos, '#autorinternoList');

setupSublistRows();