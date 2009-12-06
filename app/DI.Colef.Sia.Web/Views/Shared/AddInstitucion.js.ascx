<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InstitucionProductoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter = $('#institucionList div[id^=institucion_]').length;

var html = '
    <div class="sublista" id="institucion_<%=Html.Encode(Model.InstitucionId) %>">
        <h6>
            <a href="<%=Url.Action("DeleteInstitucion", null, new{ id = Model.ParentId, institucionId = Model.InstitucionId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.InstitucionNombre)%>
            <%=Html.Hidden("Institucion['  + counter + '].InstitucionId", Model.InstitucionId)%>
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#institucionForm').hide();
$('#institucionNew').show();
$('#institucionForm').html('');

if($('#institucion_<%=Html.Encode(Model.InstitucionId)%>').length == 0)
{
    $('#institucionEmptyListForm').html('');
    $('#institucionList div:first').before(html);

    $('#institucion_' + <%=Html.Encode(Model.InstitucionId)%> + ':first').hide();
    $('#institucion_' + <%=Html.Encode(Model.InstitucionId)%> + ':first').fadeIn('slow');
}

setupSublistRows();