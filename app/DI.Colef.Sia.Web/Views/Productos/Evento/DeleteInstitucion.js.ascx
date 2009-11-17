<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InstitucionEventoForm>" %>
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
$('#institucionevento_<%=Html.Encode(Model.InstitucionId) %>').remove();

deleteElement(html, '#institucioneventoList div[id^=institucionevento_]', '#institucioneventoList');

setupSublistRows();