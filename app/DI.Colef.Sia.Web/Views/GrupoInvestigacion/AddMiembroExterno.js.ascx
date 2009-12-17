<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<MiembroExternoGrupoInvestigacionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter = $('#miembroexternoList div[id^=miembroexterno_]').length;

var html = '
    <div class="sublista" id="miembroexterno_<%=Html.Encode(Model.InvestigadorExternoId) %>">
        <h6>
            <a href="<%=Url.Action("DeleteMiembroExterno", null, new{ id = Model.ParentId, investigadorExternoId = Model.InvestigadorExternoId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.NombreCompleto)%>
            <%=Html.Hidden("MiembroExterno['  + counter + '].InvestigadorExternoId", Model.InvestigadorExternoId)%>
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#miembroexternoForm').hide();
$('#miembroexternoNew').show();
$('#miembroexternoForm').html('');

if($('#miembroexterno_<%=Html.Encode(Model.InvestigadorExternoId) %>').length == 0)
{
    $('#miembroexternoEmptyListForm').html('');
    $('#miembroexternoList div:first').before(html);

    $('#miembroexterno_' + <%=Html.Encode(Model.InvestigadorExternoId)%> + ':first').hide();
    $('#miembroexterno_' + <%=Html.Encode(Model.InvestigadorExternoId)%> + ':first').fadeIn('slow');
}

setupSublistRows();