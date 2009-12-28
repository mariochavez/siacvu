<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<RolForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="rol_<%=Html.Encode(Model.Id) %>" class="sublista">
        <h6>
            <a href="<%=Url.Action("deleterol", null, new{id = Model.Id, usuarioId = Model.UsuarioId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.Nombre)%></h6>
    </div><!--end estadolista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#rolForm').hide();
$('#rolNew').show();
$('#rolForm').html('');

if($('#rol_<%=Html.Encode(Model.Id) %>').length == 0)
{
    $('#rolEmptyListForm').html('');
    $('#rolList div:first').before(html);

    $('#rol_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
    $('#rol_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');
}
setupSublistRows();
