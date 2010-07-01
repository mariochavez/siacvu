<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<TelefonoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="telefono_<%=Html.Encode(Model.Id) %>" class="sublista">
        <h6>
            <a href="<%=Url.Action("deletetelefono", null, new{id = Model.Id, usuarioId = Model.UsuarioId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.Numero)%></h6>
    </div><!--end estadolista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#telefonoForm').hide();
$('#telefonoNew').show();
$('#telefonoForm').html('');

if($('#telefono_<%=Html.Encode(Model.Id) %>').length == 0)
{
    $('#telefonoEmptyListForm').html('');
    $('#telefonoList div:first').before(html);

    $('#telefono_' + <%=Html.Encode(Model.Id) %> + ':first').hide();
    $('#telefono_' + <%=Html.Encode(Model.Id) %> + ':first').fadeIn('slow');
}
setupSublistRows();
