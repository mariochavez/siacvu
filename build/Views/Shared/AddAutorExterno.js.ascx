<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<AutorExternoProductoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter = $('#autorexternoList div[id^=autorexterno_]').length;

var html = '
    <div class="sublista" id="autorexterno_<%=Html.Encode(Model.InvestigadorExternoId) %>">
        <h6>
            <a href="<%=Url.Action("DeleteAutorExterno", null, new{ id = Model.ParentId, investigadorExternoId = Model.InvestigadorExternoId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.NombreCompleto)%>
            <%=Html.Hidden("AutorExterno['  + counter + '].InvestigadorExternoId", Model.InvestigadorExternoId)%>
            <span>
                Instituci&oacute;n <%=Html.Encode(Model.InstitucionNombre)%>
                <%=Html.Hidden("AutorExterno['  + counter + '].InstitucionId", Model.InstitucionId)%>
            </span>
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#autorexternoForm').hide();
$('#autorexternoNew').show();
$('#autorexternoForm').html('');

if($('#autorexterno_<%=Html.Encode(Model.InvestigadorExternoId) %>').length == 0)
{
    $('#autorexternoEmptyListForm').html('');
    $('#autorexternoList div:first').before(html);

    $('#autorexterno_' + <%=Html.Encode(Model.InvestigadorExternoId)%> + ':first').hide();
    $('#autorexterno_' + <%=Html.Encode(Model.InvestigadorExternoId)%> + ':first').fadeIn('slow');
}

setupSublistRows();