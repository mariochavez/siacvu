<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="institucioneventoEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>No hay instituciones registradas</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#institucionevento_<%=Html.Encode(Model) %>').remove();

if(<%=Html.Encode(Model) %> > 0)
{    
    if($('#institucioneventoList div[id^=institucionevento_]').length == 0) {
        $('#institucioneventoList div:first').before(html);
    }
}

setupSublistRows();