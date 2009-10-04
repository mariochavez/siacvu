<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<CoautorExternoProductoForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var counter = <%= CoautorExternoProductoForm.CoautoresExternos %>;

var html = '
    <div class="sublista" id="coautorexterno_<%=Html.Encode(Model.InvestigadorExternoId) %>">
        <h6>
            <%=Html.Encode(Model.InvestigadorExternoNombre) %>
            <%=Html.Hidden("CoautorExterno[' + counter + '].InvestigadorExternoId", Model.InvestigadorExternoId)%>
            <span>
                <strong>Posici&oacute;n</strong> <%=Html.Encode(Model.Posicion) %>
                <%=Html.Hidden("CoautorExterno[' + counter + '].Posicion", Model.Posicion)%>
                <strong>Instituci&oacute;n</strong> <%=Html.Encode(Model.InstitucionNombre) %>
                <%=Html.Hidden("CoautorExterno[' + counter + '].InstitucionId", Model.InstitucionId)%>
            </span>
        </h6>
	</div><!--end sublista-->
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#coautorexterno_form').hide();
$('#coautorexterno_new').show();
$('#coautorexterno_form').html('');

if($('#coautorexterno_<%=Html.Encode(Model.InvestigadorExternoId) %>').length == 0)
{
    $('#coautorexternoEmptyList_form').html('');
    $('#coautorexternoList div:first').before(html);

    $('#coautorexterno_' + <%=Html.Encode(Model.InvestigadorExternoId)%> + ':first').hide();
    $('#coautorexterno_' + <%=Html.Encode(Model.InvestigadorExternoId)%> + ':first').fadeIn('slow');

    var autores = parseInt($('#totalcoautores').text());
    $('#totalcoautores').text(autores + 1);
}

setupSublistRows();
<% CoautorExternoProductoForm.CoautoresExternos += 1; %>