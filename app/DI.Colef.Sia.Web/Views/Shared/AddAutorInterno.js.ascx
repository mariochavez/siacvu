<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<AutorInternoProductoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter =  $('#autorinternoList div[id^=autorinterno_]').length;

var html = '
    <div class="sublista" id="autorinterno_<%=Html.Encode(Model.InvestigadorId) %>">
        <h6>
            <a href="<%=Url.Action("DeleteAutorInterno", null, new{id = Model.ParentId, investigadorId = Model.InvestigadorId }) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.NombreAutor) %>
            <%=Html.Hidden("AutorInterno[' + counter + '].InvestigadorId", Model.InvestigadorId)%>
            <% if(!Model.AutorSeOrdenaAlfabeticamente){ %>
                <span>
                    Posici&oacute;n <%=Html.Encode(Model.Posicion) %>
                    <%=Html.Hidden("AutorInterno[' + counter + '].Posicion", Model.Posicion)%>
                </span>
            <% } %>
            <%=Html.Hidden("AutorInterno[' + counter + '].AutorSeOrdenaAlfabeticamente", Model.AutorSeOrdenaAlfabeticamente)%>
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#autorForm').hide();
$('#autorNew').show();
$('#autorForm').html('');

if($('#autorinterno_<%=Html.Encode(Model.InvestigadorId) %>').length == 0)
{
    $('#autorEmptyListForm').html('');
    $('#autorinternoList div:first').before(html);

    $('#autorinterno_' + <%=Html.Encode(Model.InvestigadorId)%> + ':first').hide();
    $('#autorinterno_' + <%=Html.Encode(Model.InvestigadorId)%> + ':first').fadeIn('slow');

    var autores = ($('#autorinternoList div[id^=autorinterno_]').length) + ($('#autorexternoList div[id^=autorexterno_]').length) + 1;
    $('#totalautores').text(autores);
}

setupSublistRows();