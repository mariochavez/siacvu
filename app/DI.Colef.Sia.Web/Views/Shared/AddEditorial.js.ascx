<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EditorialProductoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter = $('#editorialList div[id^=editorial_]').length;
var modelId = <%=Html.Encode(Model.Id) %>;

if(modelId == 0)
    modelId = counter;

var html = '
    <div class="sublista" id="editorial_<%=Html.Encode("' + modelId + '")%>">
        <h6>
            <a href="<%=Url.Action("DeleteEditorial", null, new{ id = Model.ParentId, editorialId = Model.Id == 0 ? -99999 : Model.Id }) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.EditorialNombre)%>, <%=Html.Encode(Model.PaisNombre ) %>
            <%if (!Model.EditorialExists && !String.IsNullOrEmpty(Model.EditorialNombre)) { %>
                <span class="field-alert-inline">Esta editorial no esta registrada en el cat&aacute;logo</span>
            <% } %>
            <%=Html.Hidden("Editorial['  + counter + '].EditorialId", Model.EditorialId)%>
            <%=Html.Hidden("Editorial['  + counter + '].PaisId", Model.PaisId)%>
            <%=Html.Hidden("Editorial['  + counter + '].EditorialNombre", Model.EditorialNombre)%>
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#editorialForm').hide();
$('#editorialNew').show();
$('#editorialForm').html('');

if($('#editorial_' + modelId + '').length == 0)
{
    $('#editorialEmptyListForm').html('');
    $('#editorialList div:first').before(html);

    if(<%=Html.Encode(Model.Id) %> == 0) {
        var url = $('#editorial_' + modelId + ':first > h6 > a').attr('href');
        url = url.replace("-99999", modelId);
        $('#editorial_' + modelId + ':first > h6 > a').attr('href', url);
    }

    $('#editorial_' + modelId + ':first').hide();
    $('#editorial_' + modelId + ':first').fadeIn('slow');

    $('#editorial_' + modelId + ':first').effect("highlight", {}, 1500);
}

setupSublistRows();