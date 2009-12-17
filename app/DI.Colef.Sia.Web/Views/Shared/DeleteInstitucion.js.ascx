<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<InstitucionForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="institucionEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>No hay instituciones registradas</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');
$('#institucion_<%=Html.Encode(Model.InstitucionId) %>').remove();

deleteElement(html, '#institucionList div[id^=institucion_]', '#institucionList');

setupSublistRows();