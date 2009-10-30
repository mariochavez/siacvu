<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InstitucionEventoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter = $('#institucioneventoList div[id^=institucionevento_]').length;

var html = '
    <div class="sublista" id="institucionevento_<%=Html.Encode(Model.InstitucionId) %>">
        <h6>
            <a href="<%=Url.Action("DeleteInstitucion", null, new{ id = Model.ParentId, institucionId = Model.InstitucionId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.InstitucionNombre)%>
            <%=Html.Hidden("InstitucionEvento['  + counter + '].InstitucionId", Model.InstitucionId)%>
             <span>
                Objetivo del evento <%=Html.Encode(Model.ObjetivoEvento) %>
                <%=Html.Hidden("InstitucionEvento[' + counter + '].ObjetivoEvento", Model.ObjetivoEvento)%>
            </span>
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#institucioneventoForm').hide();
$('#institucioneventoNew').show();
$('#institucioneventoForm').html('');

if($('#institucionevento_<%=Html.Encode(Model.InstitucionId)%>').length == 0)
{
    $('#institucioneventoEmptyListForm').html('');
    $('#institucioneventoList div:first').before(html);

    $('#institucionevento_' + <%=Html.Encode(Model.InstitucionId)%> + ':first').hide();
    $('#institucionevento_' + <%=Html.Encode(Model.InstitucionId)%> + ':first').fadeIn('slow');
}

setupSublistRows();