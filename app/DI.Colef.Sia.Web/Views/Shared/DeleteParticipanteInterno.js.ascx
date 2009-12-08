<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipanteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="participanteinternoEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>No hay participantes internos registrados</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');
$('#participanteinterno_<%=Html.Encode(Model.InvestigadorId) %>').remove();

deleteElement(html, '#participanteinternoList div[id^=participanteinterno_]', '#participanteinternoList');

var editores = ($('#participanteinternoList div[id^=participanteinterno_]').length) + ($('#participanteexternoList div[id^=participanteexterno_]').length);
$('#totaleditores').text(editores);

setupSublistRows();