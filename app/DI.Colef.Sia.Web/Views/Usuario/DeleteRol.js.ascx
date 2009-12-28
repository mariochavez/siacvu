<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="rolEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>Este usuario no tiene roles asignados</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#rol_<%=Html.Encode(Model) %>').remove();

deleteElement(html, '#rolList div[id^=rol_]', '#rolList');

setupSublistRows();
