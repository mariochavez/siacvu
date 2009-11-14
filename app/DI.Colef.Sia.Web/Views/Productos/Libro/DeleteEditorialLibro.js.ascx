<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EditorialLibroForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Extensions"%>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="editoriallibroEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>No hay editoriales registradas</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');
$('#editoriallibro_<%=Html.Encode(Model.EditorialId) %>').remove();

deleteElement(html, '#editoriallibroList div[id^=editoriallibro_]', '#editoriallibroList');

setupSublistRows();