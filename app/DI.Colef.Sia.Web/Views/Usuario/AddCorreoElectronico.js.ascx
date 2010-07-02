<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CorreoElectronicoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="correoElectronico_<%=Html.Encode(Model.Id) %>" class="sublista">
        <h6>
            <a href="<%=Url.Action("deletecorreoelectronico", null, new{id = Model.Id, usuarioId = Model.UsuarioId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.Direccion)%></h6>
    </div><!--end estadolista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#correoElectronicoForm').hide();
$('#correoElectronicoNew').show();
$('#correoElectronicoForm').html('');

if($('#correoElectronico_<%=Html.Encode(Model.Id) %>').length == 0)
{
    $('#correoElectronicoEmptyListForm').html('');
    $('#correoElectronicoList div:first').before(html);

    $('#correoElectronico_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
    $('#correoElectronico_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');
}
setupSublistRows();
