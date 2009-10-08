<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="coautorexternoEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>No hay coautores externos registrados</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#coautorexterno_<%=Html.Encode(Model) %>').remove();

if(<%=Html.Encode(Model) %> > 0)
{
    var autores = ($('#coautorinternoList div[id^=coautorinterno_]').length) + ($('#coautorexternoList div[id^=coautorexterno_]').length)  + 1;
    $('#totalcoautores').text(autores);
    
    if($('#coautorexternoList div[id^=coautorexterno_]').length == 0) {
        $('#coautorexternoList div:first').before(html);
    }
}

setupSublistRows();