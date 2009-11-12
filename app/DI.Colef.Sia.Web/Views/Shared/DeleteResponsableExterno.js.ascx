<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<ResponsableForm>" %>
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

$('#responsableexterno_<%=Html.Encode(Model.InvestigadorExternoId) %>').remove();

deleteElement(html, '#responsableexternoList div[id^=responsableexterno_]', '#responsableexternoList', 'ResponsableExterno', 'InvestigadorExternoId', 'FormaParticipacionId');

var editores = ($('#responsableinternoList div[id^=responsableinterno_]').length) + ($('#responsableexternoList div[id^=responsableexterno_]').length);
$('#totaleditores').text(editores);

setupSublistRows();