<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InstitucionProductoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter = $('#institucionList div[id^=institucion_]').length;
var modelId = <%=Html.Encode(Model.Id) %>;

if(modelId == 0)
    modelId = counter;

var html = '
    <div class="sublista" id="institucion_<%=Html.Encode("' + modelId + '")%>">
        <h6>
            <a href="<%=Url.Action("DeleteInstitucion", null, new{ id = Model.ParentId, institucionId = Model.Id == 0 ? -99999 : Model.Id}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.InstitucionNombre)%>
            <%if (!Model.InstitucionExists && !String.IsNullOrEmpty(Model.InstitucionNombre)) { %>
                <span class="field-alert-inline">Esta instituci&oacute;n no esta registrada en el cat&aacute;logo</span>
            <% } %>
            <%=Html.Hidden("Institucion['  + counter + '].InstitucionId", Model.InstitucionId)%>
            <%=Html.Hidden("Editorial['  + counter + '].EditorialNombre", Model.InstitucionNombre)%>
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#institucionForm').hide();
$('#institucionNew').show();
$('#institucionForm').html('');

if($('#institucion_'+ modelId + '').length == 0)
{
    $('#institucionEmptyListForm').html('');
    $('#institucionList div:first').before(html);

    if(<%=Html.Encode(Model.Id) %> == 0) {
        var url = $('#institucion_' + modelId + ':first > h6 > a').attr('href');
        url = url.replace("-99999", modelId);
        $('#institucion_' + modelId + ':first > h6 > a').attr('href', url);
    }

    $('#institucion_' + modelId + ':first').hide();
    $('#institucion_' + modelId + ':first').fadeIn('slow');

     $('#institucion_' + modelId + ':first').effect("highlight", {}, 1500);
}

setupSublistRows();