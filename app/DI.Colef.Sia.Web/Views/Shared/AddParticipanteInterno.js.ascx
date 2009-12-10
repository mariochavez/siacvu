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
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#participanteinternoForm').hide();
$('#participanteinternoNew').show();
$('#participanteinternoForm').html('');

if($('#participanteinterno_<%=Html.Encode(Model.InvestigadorId) %>').length == 0)
{
    $('#participanteinternoEmptyListForm').html('');
    $('#participanteinternoList div:first').before(html);

    $('#participanteinterno_' + <%=Html.Encode(Model.InvestigadorId)%> + ':first').hide();
    $('#participanteinterno_' + <%=Html.Encode(Model.InvestigadorId)%> + ':first').fadeIn('slow');

    var editores = ($('#participanteinternoList div[id^=participanteinterno_]').length) + ($('#participanteexternoList div[id^=participanteexterno_]').length);
    $('#totaleditores').text(editores);
}

setupSublistRows();