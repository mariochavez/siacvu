<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<AutorInternoProductoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter =  $('#autorinternoList div[id^=autorinterno_]').length;

var html = '
    <div class="sublista" id="autorinterno_<%=Html.Encode(Model.InvestigadorId) %>">
        <h6>
            <a href="<%=Url.Action("DeleteAutorInterno", null, new{id = Model.ParentId, investigadorId = Model.InvestigadorId }) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.NombreAutor) %>
            <%=Html.Hidden("AutorInterno[' + counter + '].InvestigadorId", Model.InvestigadorId)%>
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#autorinternoForm').hide();
$('#autorinternoNew').show();
$('#autorinternoForm').html('');

if($('#autorinterno_<%=Html.Encode(Model.InvestigadorId) %>').length == 0)
{
    $('#autorinternoEmptyListForm').html('');
    $('#autorinternoList div:first').before(html);

    $('#autorinterno_' + <%=Html.Encode(Model.InvestigadorId)%> + ':first').hide();
    $('#autorinterno_' + <%=Html.Encode(Model.InvestigadorId)%> + ':first').fadeIn('slow');

    var editores = ($('#autorinternoList div[id^=autorinterno_]').length) + ($('#autorexternoList div[id^=autorexterno_]').length);
    $('#totaleditores').text(editores);
}

setupSublistRows();