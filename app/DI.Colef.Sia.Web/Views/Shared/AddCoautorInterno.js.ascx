<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorInternoProductoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter =  $('#coautorinternoList div[id^=coautorinterno_]').length;

var html = '
    <div class="sublista" id="coautorinterno_<%=Html.Encode(Model.InvestigadorId) %>">
        <h6>
            <a href="<%=Url.Action("deletecoautorinterno", null, new{id = Model.ParentId, investigadorId = Model.InvestigadorId }) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.NombreCoautor) %>
            <%=Html.Hidden("CoautorInterno[' + counter + '].InvestigadorId", Model.InvestigadorId)%>
            <% if(!Model.EsAlfabeticamente){ %>
                <span>
                    Posici&oacute;n <%=Html.Encode(Model.Posicion) %>
                    <%=Html.Hidden("CoautorInterno[' + counter + '].Posicion", Model.Posicion)%>
                </span>
            <% } %>
            <%=Html.Hidden("CoautorInterno[' + counter + '].EsAlfabeticamente", Model.EsAlfabeticamente)%>
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#coautorForm').hide();
$('#coautorNew').show();
$('#coautorForm').html('');

if($('#coautorinterno_<%=Html.Encode(Model.InvestigadorId) %>').length == 0)
{
    $('#coautorEmptyListForm').html('');
    $('#coautorinternoList div:first').before(html);

    $('#coautorinterno_' + <%=Html.Encode(Model.InvestigadorId)%> + ':first').hide();
    $('#coautorinterno_' + <%=Html.Encode(Model.InvestigadorId)%> + ':first').fadeIn('slow');

    var autores = ($('#coautorinternoList div[id^=coautorinterno_]').length) + ($('#coautorexternoList div[id^=coautorexterno_]').length)  + 1;
    $('#totalcoautores').text(autores);
}

setupSublistRows();