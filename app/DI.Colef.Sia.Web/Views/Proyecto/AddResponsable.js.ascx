<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResponsableProyectoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter =  $('#responsableList div[id^=responsable_]').length;

var html = '
    <div class="sublista" id="responsable_<%=Html.Encode(Model.InvestigadorId) %>">
        <h6>
            <a href="<%=Url.Action("DeleteResponsable", null, new{id = Model.ParentId, investigadorId = Model.InvestigadorId }) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.NombreResponsable) %>
            <%=Html.Hidden("Responsable[' + counter + '].InvestigadorId", Model.InvestigadorId)%>
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#responsableForm').hide();
$('#responsableNew').show();
$('#responsableForm').html('');

if($('#responsable_<%=Html.Encode(Model.InvestigadorId) %>').length == 0)
{
    $('#responsableEmptyListForm').html('');
    $('#responsableList div:first').before(html);

    $('#responsable_' + <%=Html.Encode(Model.InvestigadorId)%> + ':first').hide();
    $('#responsable_' + <%=Html.Encode(Model.InvestigadorId)%> + ':first').fadeIn('slow');
}

setupSublistRows();