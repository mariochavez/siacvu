<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="autorresenaEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>No hay autores registrados</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#autorresena_<%=Html.Encode(Model) %>').remove();

if(<%=Html.Encode(Model) %> > 0)
{    
    if($('#autorresenaList div[id^=autorresena_]').length == 0) {
        $('#autorresenaList div:first').before(html);
    }
}

setupSublistRows();