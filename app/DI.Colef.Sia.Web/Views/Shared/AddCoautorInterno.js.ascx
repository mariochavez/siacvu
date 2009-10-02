<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorInternoProductoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter = $('#coautorinterno_<%=Html.Encode(Model.Id == 0 ? Model.InvestigadorId : Model.Id) %>').length;

var html = '
    <div class="sublista" id="coautorinterno_<%=Html.Encode(Model.Id == 0 ? Model.InvestigadorId : Model.Id) %>">
        <h6>
            <%=Html.Encode(Model.NombreCoautor) %>
            <%=Html.Hidden("CoautorInterno[' + counter + '].InvestigadorId", Model.InvestigadorId)%>
            <span>
                Posici&oacute;n <%=Html.Encode(Model.Posicion) %>
                <%=Html.Hidden("CoautorInterno[' + counter + '].Posicion", Model.Posicion)%>
            </span>
        </h6>
	</div><!--end sublista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#coautorinterno_form').hide();
$('#coautorinterno_new').show();
$('#coautorinterno_form').html('');

if($('#coautorinterno_<%=Html.Encode(Model.Id == 0 ? Model.InvestigadorId : Model.Id) %>').length == 0)
{
    $('#coautorinternoEmptyList_form').html('');
    $('#coautorinternoList div:first').before(html);

    $('#coautorinterno_' + <%=Html.Encode(Model.Id == 0 ? Model.InvestigadorId : Model.Id)%> + ':first').hide();
    $('#coautorinterno_' + <%=Html.Encode(Model.Id == 0 ? Model.InvestigadorId : Model.Id)%> + ':first').fadeIn('slow');

    var autores = parseInt($('#totalcoautores').text());
    $('#totalcoautores').text(autores + 1);
}

setupSublistRows();