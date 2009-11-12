<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResponsableInternoProductoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter =  $('#responsableinternoList div[id^=responsableinterno_]').length;

var html = '
    <div class="sublista" id="responsableinterno_<%=Html.Encode(Model.InvestigadorId) %>">
        <h6>
            <a href="<%=Url.Action("deleteresponsableinterno", null, new{id = Model.ParentId, investigadorId = Model.InvestigadorId }) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.NombreResponsable) %>, 
            <%=Html.Hidden("ResponsableInterno[' + counter + '].InvestigadorId", Model.InvestigadorId)%>
            <span id="posicioninterno_<%=Html.Encode(Model.Posicion) %>">
                Posici&oacute;n <%=Html.Encode(Model.Posicion) %>
                <%=Html.Hidden("ResponsableInterno[' + counter + '].Posicion", Model.Posicion)%>
            </span>
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#responsableinternoForm').hide();
$('#responsableinternoNew').show();
$('#responsableinternoForm').html('');

if($('#responsableinterno_<%=Html.Encode(Model.InvestigadorId) %>').length == 0)
{
    $('#responsableinternoEmptyListForm').html('');
    $('#responsableinternoList div:first').before(html);

    $('#responsableinterno_' + <%=Html.Encode(Model.InvestigadorId)%> + ':first').hide();
    $('#responsableinterno_' + <%=Html.Encode(Model.InvestigadorId)%> + ':first').fadeIn('slow');

    var editores = ($('#responsableinternoList div[id^=responsableinterno_]').length) + ($('#responsableexternoList div[id^=responsableexterno_]').length);
    $('#totaleditores').text(editores);
}

setupSublistRows();