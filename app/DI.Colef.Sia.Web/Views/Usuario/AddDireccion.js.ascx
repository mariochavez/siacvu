<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<DireccionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="direccion_<%=Html.Encode(Model.Id) %>" class="sublista">
        <h6>
            <a href="<%=Url.Action("deletedireccion", null, new{id = Model.Id, usuarioId = Model.UsuarioId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.LineaDireccion)%></h6>
    </div><!--end estadolista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#direccionForm').hide();
$('#direccionNew').show();
$('#direccionForm').html('');

if($('#direccion_<%=Html.Encode(Model.Id) %>').length == 0)
{
    $('#direccionEmptyListForm').html('');
    $('#direccionList div:first').before(html);

    $('#direccion_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
    $('#direccion_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');
}
setupSublistRows();
