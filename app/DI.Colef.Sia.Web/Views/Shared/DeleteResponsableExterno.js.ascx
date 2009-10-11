<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="responsableexternoEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>No hay responsables externos registrados</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');

$('#responsableexterno_<%=Html.Encode(Model) %>').remove();

if(<%=Html.Encode(Model) %> > 0)
{
    var editores = ($('#responsableinternoList div[id^=responsableinterno_]').length) + ($('#responsableexternoList div[id^=responsableexterno_]').length);
    $('#totaleditores').text(editores);
    
    if($('#responsableexternoList div[id^=responsableexterno_]').length == 0) {
        $('#responsableexternoList div:first').before(html);
    }
}

setupSublistRows();