<%@ Control Language="C#" AutoEventWireup="true" Inherits="System.Web.Mvc.ViewUserControl<EditorialForm>" %>
<%@ Import Namespace="DecisionesInteligentes.Colef.Sia.Web.Controllers.Models"%>

var html = '
    <div id="editorialEmptyListForm" class="sublista sublista-dos">
        <h6>
            <span>No hay editoriales registradas</span>
        </h6>
    </div>
';

$('#message').html('');
$('#message').removeClass('errormessage');
$('#editorial_<%=Html.Encode(Model.EditorialId) %>').remove();

deleteElement(html, '#editorialList div[id^=editorial_]', '#editorialList');

setupSublistRows();