<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipanteForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
        <h6>
            <span>No hay investigadores registrados</span>
        </h6>
';

$('#message').html('');
$('#message').removeClass('errormessage');
$('#participanteexterno_<%=Html.Encode(Model.InvestigadorExternoId) %>').remove();

var participantes = ($('#participanteinternoList div[id^=participanteinterno_]').length) + ($('#participanteexternoList div[id^=participanteexterno_]').length) + 1;
$('#totalparticipantes').text(participantes);

var participantesExternos = $('#participanteexternoList div[id^=participanteexterno_]').length;

deleteElementV2(html, '#participanteexternoList div[id^=participanteexterno_]', '#participanteEmptyListForm', participantes, participantesExternos, '#participanteexternoList');

setupSublistRows();