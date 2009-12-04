<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EditorialProductoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter = $('#editorialList div[id^=editorial_]').length;

var html = '
    <div class="sublista" id="editorial_<%=Html.Encode(Model.EditorialId) %>">
        <h6>
            <a href="<%=Url.Action("DeleteEditorial", null, new{ id = Model.ParentId, editorialId = Model.EditorialId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.EditorialNombre)%>
            <%=Html.Hidden("Editorial['  + counter + '].EditorialId", Model.EditorialId)%>
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#editorialForm').hide();
$('#editorialNew').show();
$('#editorialForm').html('');

if($('#editorial_<%=Html.Encode(Model.EditorialId) %>').length == 0)
{
    $('#editorialEmptyListForm').html('');
    $('#editorialList div:first').before(html);

    $('#editorial_' + <%=Html.Encode(Model.EditorialId)%> + ':first').hide();
    $('#editorial_' + <%=Html.Encode(Model.EditorialId)%> + ':first').fadeIn('slow');
}

setupSublistRows();