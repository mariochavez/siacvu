<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipanteInternoProductoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter =  $('#participanteinternoList div[id^=participanteinterno_]').length;

var html = '
    <div class="sublista" id="participanteinterno_<%=Html.Encode(Model.InvestigadorId) %>">
        <h6>
            <a href="<%=Url.Action("DeleteParticipanteInterno", null, new{id = Model.ParentId, investigadorId = Model.InvestigadorId }) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.NombreParticipante) %>
            <%=Html.Hidden("ParticipanteInterno[' + counter + '].InvestigadorId", Model.InvestigadorId)%>
            <% if(!Model.ParticipanteSeOrdenaAlfabeticamente){ %>
                <span>
                    Posici&oacute;n <%=Html.Encode(Model.Posicion) %>
                    <%=Html.Hidden("ParticipanteInterno[' + counter + '].Posicion", Model.Posicion)%>
                </span>
            <% } %>
            <%=Html.Hidden("ParticipanteInterno[' + counter + '].ParticipanteSeOrdenaAlfabeticamente", Model.ParticipanteSeOrdenaAlfabeticamente)%>
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#participanteForm').hide();
$('#participanteNew').show();
$('#participanteForm').html('');

if($('#participanteinterno_<%=Html.Encode(Model.InvestigadorId) %>').length == 0)
{
    $('#participanteEmptyListForm').html('');
    $('#participanteinternoList div:first').before(html);

    $('#participanteinterno_' + <%=Html.Encode(Model.InvestigadorId)%> + ':first').hide();
    $('#participanteinterno_' + <%=Html.Encode(Model.InvestigadorId)%> + ':first').fadeIn('slow');

    var participantes = ($('#participanteinternoList div[id^=participanteinterno_]').length) + ($('#participanteexternoList div[id^=participanteexterno_]').length) + 1;
    $('#totalparticipantes').text(participantes);
}

setupSublistRows();