<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="responsableinternoEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>No hay responsables internos registrados</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#responsableinterno_<%=Html.Encode(Model) %>').remove();

if(<%=Html.Encode(Model) %> > 0)
{
    var editores = ($('#responsableinternoList div[id^=responsableinterno_]').length) + ($('#responsableexternoList div[id^=responsableexterno_]').length);
    $('#totaleditores').text(editores);
    
    if($('#responsableinternoList').length == 1) {
        $('#responsableinternoList div:first').before(html);
    }
}

setupSublistRows();