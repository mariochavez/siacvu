<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="coautorinternoEmptyList_form" class="sublista sublista-dos">
        <h6>
            <span>No hay coautores internos registrados</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#coautorinterno_<%=Html.Encode(Model) %>').remove();

if(<%=Html.Encode(Model) %> > 0)
{
    var autores = ($('#coautorinternoList').length) + ($('#coautorexternoList').length - 1) + 1;
    $('#totalcoautores').text(autores - 1);
    
    if($('#coautorinternoList').length == 1) {
        $('#coautorinternoList div:first').before(html);
    }
}

setupSublistRows();