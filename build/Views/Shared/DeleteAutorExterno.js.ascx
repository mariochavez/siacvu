<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<AutorForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="autorexternoEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>No hay autores externos registrados</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');
$('#autorexterno_<%=Html.Encode(Model.InvestigadorExternoId) %>').remove();

deleteElement(html, '#autorexternoList div[id^=autorexterno_]', '#autorexternoList');

setupSublistRows();