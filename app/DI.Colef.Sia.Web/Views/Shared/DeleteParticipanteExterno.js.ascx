<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipanteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="participanteexternoEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>No hay participantes externos registrados</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');
$('#participanteexterno_<%=Html.Encode(Model.InvestigadorExternoId) %>').remove();

deleteElement(html, '#participanteexternoList div[id^=participanteexterno_]', '#participanteexternoList');

setupSublistRows();