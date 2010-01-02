<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorExternoProductoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter = $('#coautorexternoList div[id^=coautorexterno_]').length;

var html = '
    <div class="sublista" id="coautorexterno_<%=Html.Encode(Model.InvestigadorExternoId) %>">
        <h6>
            <a href="<%=Url.Action("deletecoautorexterno", null, new{ id = Model.ParentId, investigadorExternoId = Model.InvestigadorExternoId}) %>" class="remote delete"><img src="<%=ResolveUrl("~/Content/Images/eliminar-icon.png") %>" /></a>
            <%=Html.Encode(Model.NombreCompleto)%>
            <%=Html.Hidden("CoautorExterno['  + counter + '].InvestigadorExternoId", Model.InvestigadorExternoId)%>
            <span>
                <% if (Model.InstitucionId != 0) {%>
                    Instituci&oacute;n <%=Html.Encode(Model.InstitucionNombre)%>
                    <%=Html.Hidden("CoautorExterno[' + counter + '].InstitucionId", Model.InstitucionId)%>
                <% } %>
                <% if(!Model.CoautorSeOrdenaAlfabeticamente){ %>
                    Posici&oacute;n <%=Html.Encode(Model.Posicion) %>
                    <%=Html.Hidden("CoautorExterno[' + counter + '].Posicion", Model.Posicion)%>
                <% } %>
                <%=Html.Hidden("CoautorExterno[' + counter + '].CoautorSeOrdenaAlfabeticamente", Model.CoautorSeOrdenaAlfabeticamente)%>
            </span>
        </h6>
	</div><!--end sublista-->
';

$('#mensaje-error').html('');
$('#mensaje-error').removeClass('mensaje-error');

$('#coautorForm').hide();
$('#coautorNew').show();
$('#coautorForm').html('');

if($('#coautorexterno_<%=Html.Encode(Model.InvestigadorExternoId) %>').length == 0)
{
    $('#coautorEmptyListForm').html('');
    $('#coautorexternoList div:first').before(html);

    $('#coautorexterno_' + <%=Html.Encode(Model.InvestigadorExternoId)%> + ':first').hide();
    $('#coautorexterno_' + <%=Html.Encode(Model.InvestigadorExternoId)%> + ':first').fadeIn('slow');
    
    var coautores = ($('#coautorinternoList div[id^=coautorinterno_]').length) + ($('#coautorexternoList div[id^=coautorexterno_]').length)  + 1;
    $('#totalcoautores').text(coautores);
}

setupSublistRows();