<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResponsableExternoProductoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter = $('#responsableexternoList div[id^=responsableexterno_]').length;

var html = '
    <div class="sublista" id="responsableexterno_<%=Html.Encode(Model.InvestigadorExternoId) %>">
        <h6>
            <a href="<%=Url.Action("deleteresponsableexterno", null, new{ id = Model.ParentId, investigadorExternoId = Model.InvestigadorExternoId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.InvestigadorExternoNombre)%>, 
            <%=Html.Hidden("ResponsableExterno['  + counter + '].InvestigadorExternoId", Model.InvestigadorExternoId)%>
            <span id="participacion_<%=Html.Encode(Model.FormaParticipacionId) %>">
                Forma de participaci&oacute;n <%=Html.Encode(Model.FormaParticipacionNombre)%>
                <%=Html.Hidden("ResponsableExterno['  + counter + '].FormaParticipacionId", Model.FormaParticipacionId)%>
            </span>
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#responsableexternoForm').hide();
$('#responsableexternoNew').show();
$('#responsableexternoForm').html('');

if($('#responsableexterno_<%=Html.Encode(Model.InvestigadorExternoId) %>').length == 0)
{
    $('#responsableexternoEmptyListForm').html('');
    $('#responsableexternoList div:first').before(html);

    $('#responsableexterno_' + <%=Html.Encode(Model.InvestigadorExternoId)%> + ':first').hide();
    $('#responsableexterno_' + <%=Html.Encode(Model.InvestigadorExternoId)%> + ':first').fadeIn('slow');
    
    var editores = ($('#responsableinternoList div[id^=responsableinterno_]').length) + ($('#responsableexternoList div[id^=responsableexterno_]').length);
    $('#totaleditores').text(editores);
}

setupSublistRows();