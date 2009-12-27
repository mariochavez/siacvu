<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="coautorexternoEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>No hay investogadores externos registrados</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');
$('#coautorexterno_<%=Html.Encode(Model.InvestigadorExternoId) %>').remove();

deleteElement(html, '#coautorexternoList div[id^=coautorexterno_]', '#coautorexternoList');

var autores = ($('#coautorinternoList div[id^=coautorinterno_]').length) + ($('#coautorexternoList div[id^=coautorexterno_]').length)  + 1;
$('#totalcoautores').text(autores);


setupSublistRows();