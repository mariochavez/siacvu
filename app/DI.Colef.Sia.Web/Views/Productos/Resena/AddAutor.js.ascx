<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<AutorResenaForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter = $('#autorresenaList div[id^=autorresena_]').length;

var html = '
    <div class="sublista" id="autorresena_<%=Html.Encode(Model.InvestigadorId) %>">
        <h6>
            <a href="<%=Url.Action("DeleteAutor", null, new{ id = Model.ParentId, autorId = Model.InvestigadorId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.NombreAutor)%>
            <%=Html.Hidden("AutorResena['  + counter + '].InvestigadorId", Model.InvestigadorId)%>
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#autorresenaForm').hide();
$('#autorresenaNew').show();
$('#autorresenaForm').html('');

if($('#autorresena_<%=Html.Encode(Model.InvestigadorId) %>').length == 0)
{
    $('#autorresenaEmptyListForm').html('');
    $('#autorresenaList div:first').before(html);

    $('#autorresena_' + <%=Html.Encode(Model.InvestigadorId)%> + ':first').hide();
    $('#autorresena_' + <%=Html.Encode(Model.InvestigadorId)%> + ':first').fadeIn('slow');
}

setupSublistRows();