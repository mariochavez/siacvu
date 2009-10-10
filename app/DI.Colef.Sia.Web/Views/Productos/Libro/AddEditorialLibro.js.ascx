<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EditorialLibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter = $('#editoriallibroList div[id^=editoriallibro_]').length;

var html = '
    <div class="sublista" id="editoriallibro_<%=Html.Encode(Model.EditorialId) %>">
        <h6>
            <a href="<%=Url.Action("DeleteEditorial", null, new{ id = Model.ParentId, editorialId = Model.EditorialId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.EditorialNombre)%>
            <%=Html.Hidden("EditorialLibro['  + counter + '].Editorial", Model.EditorialId)%>
            <span>
                Instituci&oacute;n <%=Html.Encode(Model.EditorialInstitucionNombre)%>
                Pa&iacute;s <%=Html.Encode(Model.EditorialPaisNombre)%>
            </span>
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#editoriallibroForm').hide();
$('#editoriallibroNew').show();
$('#editoriallibroForm').html('');

if($('#editoriallibro_<%=Html.Encode(Model.EditorialId) %>').length == 0)
{
    $('#editoriallibroEmptyListForm').html('');
    $('#editoriallibroList div:first').before(html);

    $('#editoriallibro_' + <%=Html.Encode(Model.EditorialId)%> + ':first').hide();
    $('#editoriallibro_' + <%=Html.Encode(Model.EditorialId)%> + ':first').fadeIn('slow');
}

setupSublistRows();