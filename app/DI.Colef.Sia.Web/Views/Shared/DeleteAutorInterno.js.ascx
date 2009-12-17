<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<AutorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="autorinternoEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>No hay autores internos registrados</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');
$('#autorinterno_<%=Html.Encode(Model.InvestigadorId) %>').remove();

deleteElement(html, '#autorinternoList div[id^=autorinterno_]', '#autorinternoList');

var editores = ($('#autorinternoList div[id^=autorinterno_]').length) + ($('#autorexternoList div[id^=autorexterno_]').length);
$('#totaleditores').text(editores);

setupSublistRows();