<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ParticipanteExternoProductoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter = $('#participanteexternoList div[id^=participanteexterno_]').length;

var html = '
    <div class="sublista" id="participanteexterno_<%=Html.Encode(Model.InvestigadorExternoId) %>">
        <h6>
            <a href="<%=Url.Action("DeleteParticipanteExterno", null, new{ id = Model.ParentId, investigadorExternoId = Model.InvestigadorExternoId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.NombreCompleto)%>
            <%=Html.Hidden("ParticipanteExterno['  + counter + '].InvestigadorExternoId", Model.InvestigadorExternoId)%>
            <span>
                <% if (Model.InstitucionId != 0) {%>
                    Instituci&oacute;n <%=Html.Encode(Model.InstitucionNombre)%>
                    <%=Html.Hidden("ParticipanteExterno[' + counter + '].InstitucionId", Model.InstitucionId)%>
                <% } %>
                <% if(!Model.ParticipanteSeOrdenaAlfabeticamente){ %>
                    Posici&oacute;n <%=Html.Encode(Model.Posicion) %>
                    <%=Html.Hidden("ParticipanteExterno[' + counter + '].Posicion", Model.Posicion)%>
                <% } %>
                <%=Html.Hidden("ParticipanteExterno[' + counter + '].ParticipanteSeOrdenaAlfabeticamente", Model.ParticipanteSeOrdenaAlfabeticamente)%>
            </span>
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#participanteForm').hide();
$('#participanteNew').show();
$('#participanteForm').html('');

if($('#participanteexterno_<%=Html.Encode(Model.InvestigadorExternoId) %>').length == 0)
{
    $('#participanteEmptyListForm').html('');
    $('#participanteexternoList div:first').before(html);

    $('#participanteexterno_' + <%=Html.Encode(Model.InvestigadorExternoId)%> + ':first').hide();
    $('#participanteexterno_' + <%=Html.Encode(Model.InvestigadorExternoId)%> + ':first').fadeIn('slow');
    
    var participantes = ($('#participanteinternoList div[id^=participanteinterno_]').length) + ($('#participanteexternoList div[id^=participanteexterno_]').length) + 1;
    $('#totalparticipantes').text(participantes);
}

setupSublistRows();